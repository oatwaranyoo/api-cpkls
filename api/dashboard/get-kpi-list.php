<?php
require_once '../../config/init.php';

try {

    $sql = "
        SELECT * FROM (
            SELECT DISTINCT
                CONCAT(ex_id, '00') AS kpi_code,
                '1' AS kpi_group,
                ex_name AS kpi_name,
                ex_id,
                NULL AS sub_ex_id,
                0 AS indicator_sequence
            FROM vw_indicator_district

            UNION ALL

            SELECT DISTINCT
                CONCAT(ex_id, LPAD(IFNULL(indicator_sequence, 0), 2, '0')) AS kpi_code,
                '2' AS kpi_group,       -- 2 = Item
                indicator_name AS kpi_name,
                ex_id,
                sub_ex_id,
                indicator_sequence
            FROM vw_indicator_district
            WHERE indicator_sequence IS NOT NULL
        ) AS combined_kpi
        ORDER BY kpi_code;
    ";

    $stmt = $db->prepare($sql);
    $stmt->execute();
    $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // reset key ให้เป็น array ธรรมดา
    $data = array_values($rows);

    Response::success($data);

} catch (Exception $e) {
    Response::error($e->getMessage());
}
