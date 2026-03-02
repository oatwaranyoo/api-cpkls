<?php
require_once '../../config/init.php';

// ดึงปีงบประมาณทั้งหมด เรียงจากปีล่าสุด
try {
    $stmt = $db->query("SELECT id, CONCAT('ปีงบประมาณ ', id) AS yname, is_active FROM fiscal_years ORDER BY id DESC");
    $years = $stmt->fetchAll();
    Response::success($years);
} catch (Exception $e) {
    Response::error($e->getMessage());
}