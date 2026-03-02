<?php
require_once '../../config/init.php';

// ดึงรายชื่อจังหวัดทั้งหมด
try {
    $stmt = $db->query("SELECT changwatcode, changwatname FROM cchangwat ORDER BY changwatname ASC");
    $data = $stmt->fetchAll();
    Response::success($data);
} catch (Exception $e) {
    Response::error($e->getMessage());
}