<?php
require_once '../../config/init.php';

try {
    // ดึงเฉพาะที่สถานะเปิดใช้งาน (status = 1)
    $stmt = $db->query("SELECT hoscode, hosname, hostype FROM chospital WHERE status = 1 ORDER BY hoscode ASC");
    $hospitals = $stmt->fetchAll();
    Response::success($hospitals);
} catch (Exception $e) {
    Response::error($e->getMessage());
}