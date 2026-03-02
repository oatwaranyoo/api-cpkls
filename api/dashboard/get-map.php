<?php
require_once '../../config/init.php';

try {
    // 1. ดึงข้อมูลจาก Database
    $sql = "
        SELECT 
            amp_code AS ampurcodefull,
            district_name AS ampurname,
            score
        FROM view_report_district
        ORDER BY ampurcodefull ASC
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
