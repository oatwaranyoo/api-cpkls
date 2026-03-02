<?php
require_once '../../config/init.php';

try {
    // 1. ตรวจสอบสิทธิ์
    if (!isset($_COOKIE['auth_token'])) {
        throw new Exception('กรุณาเข้าสู่ระบบก่อนใช้งาน', 401);
    }

    $decoded = JwtHelper::decode($_COOKIE['auth_token']);
    $userId = $decoded['sub'] ?? $decoded['data']['id'] ?? null;

    if (!$userId) {
        throw new Exception('Session expired', 401);
    }

    // 2. รับค่า Parameter
    $year = isset($_GET['year']) ? $_GET['year'] : (date('Y') + 543);

    // 3. Query ข้อมูล (ใช้ตัวแปร $db ได้เลย)
    $sql = "
        SELECT 
            i.id,
            CONCAT(
                i.fiscal_year,
                LPAD(i.eval_round, 2, '0'),
                LPAD(i.sub_ex_id, 2, '0'),
                LPAD(i.indicator_sequence, 2, '0')
            ) AS kpi_code,
            i.name AS kpi_name,
            i.unit,
            i.source_type,
            i.template_file,
            
            CASE WHEN i.unit = 'ระดับ' THEN 5 ELSE COALESCE(SUM(r.target_amount), 0) END AS total_target,
            CASE WHEN i.unit = 'ระดับ' THEN ROUND((COALESCE(SUM(r.result_amount), 0) / 18), 2) ELSE ROUND(COALESCE(SUM(r.result_amount), 0), 2) END AS total_result,

            CASE
                WHEN i.unit = 'ร้อยละ' THEN 
                    COALESCE(
                        ROUND(
                            COALESCE(SUM(r.result_amount), 0) * 100
                            / NULLIF(SUM(r.target_amount), 0)
                        , 2)
                    , 0)

                WHEN i.unit = 'อัตราต่อแสน' THEN 
                    COALESCE(
                        ROUND(
                            COALESCE(SUM(r.result_amount), 0) * 100000
                            / NULLIF(SUM(r.target_amount), 0)
                        , 2)
                    , 0)

                WHEN i.unit = 'อัตราต่อพัน' THEN 
                    COALESCE(
                        ROUND(
                            COALESCE(SUM(r.result_amount), 0) * 1000
                            / NULLIF(SUM(r.target_amount), 0)
                        , 2)
                    , 0)

                WHEN i.unit = 'ระดับ' 
                    AND COALESCE(SUM(r.result_amount), 0) = 0 THEN 
                    1

                WHEN i.unit = 'ระดับ' THEN 
                    FLOOR(
                        ROUND(
                            COALESCE(SUM(r.result_amount), 0) * 5 / 90
                        , 2)
                    )

                ELSE 0
            END AS calc_percent,
            
            MAX(r.updated_at) AS last_updated

        FROM indicators i
        INNER JOIN indicator_assignees ia 
            ON i.id = ia.indicator_id 
        AND ia.user_id = :uid 

        LEFT JOIN kpi_results r 
            ON i.id = r.indicator_id 
        AND r.fiscal_year = :year

        WHERE i.status = 'ACTIVE'
        GROUP BY i.id
        ORDER BY i.indicator_sequence ASC;
    ";

    // ตรวจสอบว่า $db มีค่าหรือไม่ก่อนเรียกใช้ (กันพลาด)
    if (!isset($db)) {
        throw new Exception("Database connection failed (variable \$db not found in init.php)", 500);
    }

    $stmt = $db->prepare($sql);
    $stmt->bindParam(':uid', $userId);
    $stmt->bindParam(':year', $year);
    $stmt->execute();

    $data = [];

    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {

        $target = (float) $row['total_target'];
        $result = (float) $row['total_result'];

        // ใช้ค่าจาก SQL เป็นหลัก
        $calcPercent = isset($row['calc_percent']) 
            ? (float) $row['calc_percent'] 
            : 1;

        // แสดงผล percentage
        if ($row['unit'] === 'ระดับ') {
            // ระดับ ไม่มีทศนิยม
            $row['percentage'] = (string) intval($calcPercent);
        } else {
            // อื่น ๆ แสดง 2 ตำแหน่ง
            $row['percentage'] = number_format($calcPercent, 2);
        }

        // format target / result
        $row['total_target'] = number_format($target);
        $row['total_result'] = $row['unit'] === 'ระดับ'
            ? number_format($result, 2)
            : number_format($result);

        $row['is_level_kpi'] = ($row['unit'] === 'ระดับ' || $row['unit'] === 'Level');

        $data[] = $row;
    }

    Response::success($data);


} catch (Exception $e) {
    error_log("API Error (kpi/my-list.php): " . $e->getMessage());
    $code = ($e->getCode() >= 100 && $e->getCode() <= 599) ? $e->getCode() : 500;
    Response::error($e->getMessage(), $code);
}
?>