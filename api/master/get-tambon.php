<?php
require_once '../../config/init.php';

// รับ ampurcode (จำเป็นต้องส่งมาเพื่อไม่ให้ข้อมูลเยอะเกินไป)
$amp = isset($_GET['ampurcode']) ? $_GET['ampurcode'] : null;

try {
    if (!$amp) {
        // ถ้าไม่ระบุอำเภอ ให้ดึงมาแค่ 100 รายการแรกกัน Server ค้าง
        $stmt = $db->query("SELECT tamboncodefull, tambonname, ampurcode FROM ctambon LIMIT 100");
    } else {
        $stmt = $db->prepare("SELECT tamboncodefull, tambonname, ampurcode FROM ctambon WHERE ampurcode = :amp ORDER BY tambonname ASC");
        $stmt->execute([':amp' => $amp]);
    }

    Response::success($stmt->fetchAll());
} catch (Exception $e) {
    Response::error($e->getMessage());
}