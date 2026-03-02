<?php
header('Content-Type: application/json; charset=utf-8');
require_once '../../config/init.php';

// ===================================================================================
// 🛠️ FUNCTION: คำนวณคะแนนจากเกณฑ์ (Helper Function)
// ===================================================================================
function getScoreFromCriteria($rate, $row)
{
    // วนลูปเช็คจากคะแนนเต็ม 5 ลงไปหา 1
    // เพื่อให้ถ้าผ่านเกณฑ์สูงสุด ก็ได้ 5 ไปเลย ไม่ต้องเช็คต่อ
    for ($s = 5; $s >= 1; $s--) {
        $criteriaString = trim($row['criteria_' . $s] ?? '');

        // ถ้าไม่มีเกณฑ์ในช่องนี้ ข้ามไป
        if ($criteriaString === '')
            continue;

        // แปลง $rate เป็น float เพื่อความชัวร์ในการเปรียบเทียบ
        $val = (float) $rate;

        // --- 1. กรณีเป็นช่วง (Range) เช่น "1.50-1.99" ---
        if (strpos($criteriaString, '-') !== false) {
            $parts = explode('-', $criteriaString);
            if (count($parts) == 2) {
                $min = (float) $parts[0];
                $max = (float) $parts[1];
                // เช็คว่าค่าอยู่ในช่วงไหม
                if ($val >= $min && $val <= $max)
                    return $s;
            }
        }

        // --- 2. กรณีมีเครื่องหมาย ≥, >=, >, ≤, <=, < ---
        // ใช้ Regex จับคู่ตัวเลขและเครื่องหมาย
        elseif (preg_match('/(≥|>=|<=|≤|>|<|=)\s*([\d\.]+)/u', $criteriaString, $matches)) {
            $operator = $matches[1];
            $targetVal = (float) $matches[2];

            switch ($operator) {
                case '≥':
                case '>=':
                    if ($val >= $targetVal)
                        return $s;
                    break;
                case '>':
                    if ($val > $targetVal)
                        return $s;
                    break;
                case '≤':
                case '<=':
                    if ($val <= $targetVal)
                        return $s;
                    break;
                case '<':
                    if ($val < $targetVal)
                        return $s;
                    break;
                case '=':
                    if (abs($val - $targetVal) < 0.00001)
                        return $s; // เทียบเท่ากับแบบ float
                    break;
            }
        }

        // --- 3. กรณีเป็นตัวเลขโดดๆ (Exact Match) ---
        elseif (is_numeric($criteriaString)) {
            if (abs($val - (float) $criteriaString) < 0.00001)
                return $s;
        }
    }

    // หากไม่เข้าเกณฑ์ใดเลย (หลุดเกณฑ์) คืนค่า 1 (หรือ 0 ตาม Business Logic ของคุณ)
    return 1;
}

// ===================================================================================
// 🚀 MAIN PROCESS
// ===================================================================================

try {
    // รับค่า Parameter
    $ex_id = $_GET['ex_id'] ?? '01';
    $year = $_GET['year'] ?? (date("Y") + 543);
    $round = $_GET['round'] ?? '1';
    $amp_code = isset($_GET['amp_code']) && $_GET['amp_code'] !== '' ? $_GET['amp_code'] : null;

    // SQL Query
    $sql = "SELECT 
        i.id AS indicator_id,
        i.name AS indicator_name,
        i.unit,
        i.weight,
        i.multiplier,

        /* ✅ 1. เช็คว่ามีข้อมูลหรือไม่ */
        COUNT(kr.id) AS record_count,

        /* ---------- TARGET ---------- */
        CASE 
            WHEN i.unit = 'ระดับ' THEN 5
            ELSE COALESCE(SUM(kr.target_amount), 0)
        END AS total_target,

        /* ---------- RESULT ---------- */
        CASE 
            WHEN i.unit = 'ระดับ' THEN 
                 CASE WHEN :amp_code IS NOT NULL THEN COALESCE(SUM(kr.result_amount), 0)
                      ELSE ROUND((COALESCE(SUM(kr.result_amount),0) * 5) / 90, 2)
                 END
            ELSE 
                COALESCE(SUM(kr.result_amount), 0)
        END AS total_result,

        /* เกณฑ์คะแนน */
        ic.criteria_1, ic.criteria_2, ic.criteria_3, ic.criteria_4, ic.criteria_5, ic.scoring_type

    FROM indicators i
    JOIN csub_excellence sub ON i.sub_ex_id = sub.id
    JOIN cexcellence ex ON sub.ex_id = ex.id

    LEFT JOIN kpi_results kr ON i.id = kr.indicator_id
        AND kr.fiscal_year = :year
        AND kr.eval_round = :round
        AND (:amp_code IS NULL OR kr.amp_code = :amp_code)

    LEFT JOIN indicator_criteria ic ON i.id = ic.indicator_id
        AND ic.fiscal_year = :year
        AND ic.eval_round = :round

    WHERE ex.id = :ex_id

    GROUP BY 
        i.id, i.name, i.unit, i.weight, i.multiplier,
        ic.criteria_1, ic.criteria_2, ic.criteria_3, ic.criteria_4, ic.criteria_5, ic.scoring_type

    ORDER BY i.indicator_sequence ASC";

    $stmt = $db->prepare($sql);
    $stmt->execute([
        ':ex_id' => $ex_id,
        ':year' => $year,
        ':round' => $round,
        ':amp_code' => $amp_code
    ]);

    $data = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // --- Processing Data ---
    foreach ($data as &$row) {
        $t = (float) $row['total_target'];
        $r = (float) $row['total_result'];
        $has_record = $row['record_count'] > 0;

        $rate = 0;
        $score = 1;

        // ---------------------------------------------------------
        // 1. ยังไม่บันทึกข้อมูล
        // ---------------------------------------------------------
        if (!$has_record) {
            $rate = 0;
            $score = 1;
        }

        // ---------------------------------------------------------
        // 2. เงื่อนไขพิเศษ เป้า 0 ผล 0 -> ได้ 5
        // ---------------------------------------------------------
        elseif ($row['unit'] !== 'ระดับ' && $t == 0 && $r == 0) {
            $rate = 0;
            $score = 5;
        }

        // ---------------------------------------------------------
        // 3. คำนวณปกติ
        // ---------------------------------------------------------
        else {
            // 3.1 คำนวณ Rate (ผลงาน)
            if ($row['unit'] === 'ระดับ') {
                $rate = $r;
            } elseif ($t > 0) {
                switch ($row['unit']) {
                    case 'อัตราต่อแสน':
                        $rate = ($r / $t) * 100000;
                        break;
                    case 'อัตราต่อพัน':
                        $rate = ($r / $t) * 1000;
                        break;
                    case 'อัตราลดลง':
                        // สูตร: (เป้า - ผล) / เป้า * 100
                        $rate = (($t - $r) / $t) * 100;
                        break;
                    default: // ร้อยละ หรือ อื่นๆ
                        $mul = (float) ($row['multiplier'] ?? 100);
                        $rate = ($r / $t) * ($mul == 0 ? 100 : $mul);
                }
            } else {
                // เป้าเป็น 0 แต่มีผลงาน (อาจจะเป็นตัวหารเป็น 0)
                $rate = 0;
            }

            // 3.2 คำนวณ Score (ตัดเกรด) โดยเรียกฟังก์ชันด้านบน
            $score = getScoreFromCriteria($rate, $row);
        }

        // Format ข้อมูลกลับไปให้สวยงาม
        $row['calculated_rate'] = number_format($rate, 2, '.', '');
        $row['calculated_score'] = (int) $score;
    }

    // Response Success
    echo json_encode([
        'status' => 'success',
        'data' => $data
    ]);

} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(['status' => 'error', 'message' => $e->getMessage()]);
}
?>