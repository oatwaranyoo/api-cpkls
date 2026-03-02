<?php
require_once '../../config/init.php';

// 1. รับค่าปีงบประมาณ
$year = $_GET['year'] ?? null;

try {
    $params = [];
    
    $sql = "SELECT 
                b.ex_id,
                e.name
            FROM bexcellence b
            INNER JOIN cexcellence e 
                ON b.ex_id = e.id
            WHERE b.byear = (SELECT id FROM fiscal_years WHERE id = :year LIMIT 1)
            ORDER BY b.ex_id ASC";

    $params[':year'] = $year;    

    $stmtEx = $db->prepare($sql);
    $stmtEx->execute($params);
    $excellences = $stmtEx->fetchAll(PDO::FETCH_ASSOC);

    // ✅ ถ้าไม่เจอข้อมูล (Array ว่าง) ให้ค่าเป็น null
    if (empty($excellences)) {
        $excellences = null;
    }

    Response::success($excellences);

} catch (Exception $e) {
    Response::error($e->getMessage());
}
?>