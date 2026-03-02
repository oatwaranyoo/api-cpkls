<?php
require_once '../../config/init.php';

try {

    $sql = "
        SELECT * FROM (
        SELECT 
            amp_code, 
            ampurname, 
            '1' AS kpi_group,
            CONCAT(ex_id, '00') AS kpi_code, 
            ROUND((SUM(weighted_score) * 100)/SUM(weight),2) AS score  
        FROM vw_indicator_district 
        GROUP BY amp_code, ampurname, ex_id

        UNION ALL

        SELECT 
            amp_code, 
            ampurname, 
            '2' AS kpi_group,
            CONCAT(ex_id, LPAD(IFNULL(indicator_sequence, 0), 2, '0')) AS kpi_code, 
            CASE WHEN score IS NULL THEN 1 ELSE score END AS score 
        FROM vw_indicator_district
        WHERE indicator_sequence IS NOT NULL -- กรองข้อมูลที่ไม่มีลำดับออก
    ) AS final_data

    ORDER BY amp_code, kpi_code;
    ";

    $stmt = $db->prepare($sql);
    $stmt->execute();
    $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);

    $result = [];

    foreach ($rows as $row) {
        $code = $row['amp_code'];

        // ถ้ายังไม่มีอำเภอนี้ ให้สร้างก่อน
        if (!isset($result[$code])) {
            $result[$code] = [
                'district' => $row['ampurname']
            ];
        }

        // ใส่ kpi แบบ dynamic
        $result[$code][$row['kpi_code']] = number_format($row['score'], 2);
    }

    // reset key ให้เป็น array ธรรมดา
    $data = array_values($result);

    Response::success($data);

} catch (Exception $e) {
    Response::error($e->getMessage());
}
