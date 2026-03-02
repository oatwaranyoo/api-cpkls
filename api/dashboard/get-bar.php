<?php
require_once '../../config/init.php';

$year = $_GET['year'] ?? (date('Y') + 543);
$round = $_GET['round'] ?? 1;

try {
    // 1. ดึงข้อมูลจาก Database
    $sql = "
        SELECT 
            amp_code,
            district_name,
            score
        FROM view_report_district
        ORDER BY amp_code ASC
    ";

    $stmt = $db->prepare($sql);
    $stmt->execute();

    $data = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // 2. ถ้าไม่พบข้อมูล → ส่ง error
    if (empty($data)) {
        Response::error("ไม่พบข้อมูลรายงานระดับอำเภอ");
        exit;
    }

    // 3. พบข้อมูล → success
    Response::success($data);

} catch (Exception $e) {
    Response::error($e->getMessage());
}
