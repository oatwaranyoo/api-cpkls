<?php
require_once '../../config/init.php';

// --- Helper Functions ---

function checkCondition($value, $condition)
{
    if ($condition === null || $condition === '' || $condition === '-')
        return false;

    // 1. ทำความสะอาดข้อมูล
    $condition = trim($condition);
    $condition = str_replace(['–', '—', '≥', '≤'], ['-', '-', '>=', '<='], $condition);
    $condition = str_replace(' ', '', $condition);

    // 2. กรณีช่วงคะแนน "80-89"
    if (strpos($condition, '-') !== false && strpos($condition, '-') > 0) {
        $parts = explode('-', $condition);
        if (count($parts) == 2) {
            return $value >= floatval($parts[0]) && $value <= floatval($parts[1]);
        }
    }

    // 3. กรณีมีเครื่องหมายเปรียบเทียบ
    if (preg_match('/^([<>]=?)(.*)$/', $condition, $matches)) {
        $operator = $matches[1];
        $target = floatval($matches[2]);

        switch ($operator) {
            case '>=':
                return $value >= $target;
            case '>':
                return $value > $target;
            case '<=':
                return $value <= $target;
            case '<':
                return $value < $target;
        }
    }

    // 4. กรณีตัวเลขโดดๆ
    return $value == floatval($condition);
}

function calculateScore($rate, $row)
{
    $t = floatval($row['total_target']);
    $r = floatval($row['total_result']);

    // เช็คว่ามีการบันทึกข้อมูลมาจริงหรือไม่
    $has_data = isset($row['entries_count']) && $row['entries_count'] > 0;

    // เงื่อนไขพิเศษ: ต้องมีการบันทึกแล้ว และ เป้า=0, ผล=0 ถึงจะได้ 5
    if ($has_data && $t == 0 && $r == 0) {
        return 5;
    }

    // กรณีทั่วไป (หรือยังไม่บันทึก)
    if ($row['unit'] !== 'ระดับ' && $t == 0) return 1;
    if ($row['unit'] === 'ระดับ' && $r == 0) return 1;

    $val = floatval($rate);
    $levels = [
        5 => $row['criteria_5'],
        4 => $row['criteria_4'],
        3 => $row['criteria_3'],
        2 => $row['criteria_2'],
        1 => $row['criteria_1']
    ];

    foreach ($levels as $score => $criteria) {
        if (checkCondition($val, $criteria))
            return $score;
    }
    return 1;
}

// ------------------------

try {
    $year = $_GET['year'] ?? (date("Y") + 543);
    $round = $_GET['round'] ?? '1';

    // รับค่า amp_code (ถ้าเป็นค่าว่างหรือ null ถือว่าเป็นภาพรวมจังหวัด)
    $amp_code = isset($_GET['amp_code']) && $_GET['amp_code'] !== '' ? $_GET['amp_code'] : null;

    // SQL Query
    $sql = "SELECT * FROM (
        /* LEVEL 1: Excellence Header */
        SELECT 
            CONCAT(CAST(ex.id AS UNSIGNED), '. ', ex.name) AS excellence_name,
            NULL AS sub_name, NULL AS indicator_id, NULL AS indicator_name, NULL AS unit,
            SUM(i.weight) AS weight, NULL AS total_target, NULL AS total_result,
            NULL AS criteria_1, NULL AS criteria_2, NULL AS criteria_3, NULL AS criteria_4, NULL AS criteria_5,
            NULL AS scoring_type, ex.id AS sort_ex, NULL AS sort_sub, NULL AS sort_ind, 1 AS row_type,
            0 AS entries_count
        FROM indicators i
        JOIN csub_excellence sub ON i.sub_ex_id = sub.id
        JOIN cexcellence ex ON sub.ex_id = ex.id
        WHERE i.status = 'ACTIVE'
        GROUP BY ex.id, ex.name

        UNION ALL

        /* LEVEL 2: Sub Excellence Header */
        SELECT 
            CONCAT(CAST(ex.id AS UNSIGNED), '. ', ex.name), CONCAT(sub.code, '. ', sub.name),
            NULL, NULL, NULL, SUM(i.weight), NULL, NULL,
            NULL, NULL, NULL, NULL, NULL, NULL, ex.id, sub.code, NULL, 2,
            0
        FROM indicators i
        JOIN csub_excellence sub ON i.sub_ex_id = sub.id
        JOIN cexcellence ex ON sub.ex_id = ex.id
        WHERE i.status = 'ACTIVE'
        GROUP BY ex.id, ex.name, sub.code, sub.name

        UNION ALL

        /* LEVEL 3: Indicators */
        SELECT 
            CONCAT(CAST(ex.id AS UNSIGNED), '. ', ex.name), CONCAT(sub.code, '. ', sub.name),
            i.id, CONCAT(i.id, '. ', i.name), i.unit, i.weight,
            CASE WHEN i.unit = 'ระดับ' THEN 5 ELSE COALESCE(SUM(kr.target_amount),0) END,
            CASE 
                WHEN i.unit = 'ระดับ' AND (:amp_code IS NOT NULL) THEN COALESCE(SUM(kr.result_amount),0)
                WHEN i.unit = 'ระดับ' THEN ROUND((COALESCE(SUM(kr.result_amount),0)*5)/90,2)
                ELSE COALESCE(SUM(kr.result_amount),0)
            END,
            MAX(ic.criteria_1), MAX(ic.criteria_2), MAX(ic.criteria_3), MAX(ic.criteria_4), MAX(ic.criteria_5),
            MAX(ic.scoring_type), ex.id, sub.code, i.indicator_sequence, 3,
            COUNT(kr.id) AS entries_count
        FROM indicators i
        JOIN csub_excellence sub ON i.sub_ex_id = sub.id
        JOIN cexcellence ex ON sub.ex_id = ex.id
        LEFT JOIN kpi_results kr ON i.id = kr.indicator_id AND kr.fiscal_year = :year AND kr.eval_round = :round
            AND (:amp_code IS NULL OR kr.amp_code = :amp_code)
        LEFT JOIN indicator_criteria ic ON i.id = ic.indicator_id AND ic.fiscal_year = :year AND ic.eval_round = :round
        WHERE i.status = 'ACTIVE'
        GROUP BY i.id, i.name, i.unit, i.weight, i.indicator_sequence, ex.id, ex.name, sub.code, sub.name
    ) t ORDER BY sort_ex, sort_sub, row_type, sort_ind";

    $stmt = $db->prepare($sql);
    $stmt->execute([':year' => $year, ':round' => $round, ':amp_code' => $amp_code]);
    $data = $stmt->fetchAll(PDO::FETCH_ASSOC);

    $agg_sub = [];
    $agg_ex = [];

    // Loop 1: คำนวณรายตัว (Normalization)
    foreach ($data as $key => &$row) {
        if ($row['row_type'] == 3) {
            $t = (float) $row['total_target'];
            $r = (float) $row['total_result'];
            $rate = 0;

            if ($row['unit'] === 'ระดับ') {
                $rate = floor($r);
            } elseif ($row['unit'] === 'คะแนนเต็ม 10') {
                // ปกติเต็ม 10 ก็คูณ 10 (ระวัง Division by Zero)
                $rate = ($t > 0) ? ($r / $t) * 10 : 0;
            } elseif ($row['unit'] === 'คะแนนเต็ม 50') {
                // ✅ LOGIC UPDATED: ตรวจสอบ amp_code
                // ถ้ามี amp_code (รายอำเภอ) ใช้สูตร * 50
                // ถ้าไม่มี (ภาพรวมจังหวัด) ใช้สูตร * 100
                $multiplier = ($amp_code !== null) ? 50 : 100;
                $rate = ($t > 0) ? ($r / $t) * $multiplier : 0;
            } elseif ($t > 0) {
                switch ($row['unit']) {
                    case 'อัตราต่อแสน':
                        $rate = ($r / $t) * 100000;
                        break;
                    case 'อัตราต่อพัน':
                        $rate = ($r / $t) * 1000;
                        break;
                    case 'ร้อยละ':
                        $rate = ($r / $t) * 100;
                        break;
                    case 'คะแนนเต็ม 10':
                        $rate = ($r / $t) * 10;
                        break;
                    case 'คะแนนเต็ม 50':
                        // ✅ LOGIC UPDATED: ใน Switch Case ด้วย
                        $multiplier = ($amp_code !== null) ? 50 : 100;
                        $rate = ($r / $t) * $multiplier;
                        break;
                    case 'อัตราลดลง':
                        $rate = (($t - $r) / $t) * 100;
                        break;
                    default:
                        $rate = ($r / $t) * 100;
                }
            }

            $row['calculated_rate'] = number_format($rate, 2, '.', '');

            // คำนวณระดับคะแนน (1-5)
            $score = calculateScore($rate, $row);
            $weight = (float) $row['weight'];

            // Normalize Weighted Score (เต็ม 1) -> (score * weight) / 5
            $weighted_score = ($score * $weight) / 5;

            $row['score'] = $score;
            $row['weighted_score'] = number_format($weighted_score, 2, '.', '');

            // รวมผลสำหรับ Level 2 และ Level 1
            $sub_code = $row['sort_sub'];
            $ex_id = $row['sort_ex'];

            if (!isset($agg_sub[$sub_code]))
                $agg_sub[$sub_code] = ['sum_weighted' => 0];
            if (!isset($agg_ex[$ex_id]))
                $agg_ex[$ex_id] = ['sum_weighted' => 0, 'sum_weight' => 0];

            $agg_sub[$sub_code]['sum_weighted'] += $weighted_score;
            $agg_ex[$ex_id]['sum_weighted'] += $weighted_score;
            $agg_ex[$ex_id]['sum_weight'] += $weight;
        }
    }
    unset($row);

    // Loop 2: สรุปผล Level 2 และ Level 1
    foreach ($data as &$row) {
        if ($row['row_type'] == 2) {
            $sub_code = $row['sort_sub'];
            $row['weighted_score'] = number_format($agg_sub[$sub_code]['sum_weighted'] ?? 0, 2, '.', '');
        } elseif ($row['row_type'] == 1) {
            $ex_id = $row['sort_ex'];
            if (isset($agg_ex[$ex_id]) && $agg_ex[$ex_id]['sum_weight'] > 0) {
                // คำนวณ % ความสำเร็จของ Excellence
                $percentage = ($agg_ex[$ex_id]['sum_weighted'] / $agg_ex[$ex_id]['sum_weight']) * 100;
                $row['weighted_score'] = number_format($percentage, 2, '.', '') . '%';
            } else {
                $row['weighted_score'] = '0.00%';
            }
        }
    }

    Response::success($data);
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(['status' => 'error', 'message' => $e->getMessage()]);
}
