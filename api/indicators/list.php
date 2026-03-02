<?php
require_once '../../config/init.php';

$year = isset($_GET['year']) ? $_GET['year'] : '2569'; // ค่า Default ปี 2569

try {
    $sql = "SELECT i.id, i.indicator_sequence, i.name, i.unit, i.weight, 
                   w.name as workgroup_name, 
                   s.name as sub_excellence_name
            FROM indicators i
            LEFT JOIN cworkgroups w ON i.workgroup_id = w.id
            LEFT JOIN csub_excellence s ON i.sub_ex_id = s.id
            WHERE i.fiscal_year = :y AND i.status = 'ACTIVE'
            ORDER BY i.indicator_sequence ASC";

    $stmt = $db->prepare($sql);
    $stmt->execute([':y' => $year]);
    $indicators = $stmt->fetchAll();

    Response::success($indicators);
} catch (Exception $e) {
    Response::error($e->getMessage());
}