<?php
require_once '../../config/init.php';

// เช็คสิทธิ์ (ต้องเป็นจังหวัดหรือ Admin)
if (!isset($_COOKIE['auth_token'])) Response::error('Unauthorized', 401);
$user = JwtHelper::decode($_COOKIE['auth_token'])['data'];

if ($user['role_id'] > 2) { // สมมติ 1=Admin, 2=Province, 3=District, 4=Hospital
    Response::error('ไม่มีสิทธิ์เข้าถึง (Access Denied)', 403);
}

try {
    $sql = "SELECT kr.*, i.name as indicator_name, h.hosname 
            FROM kpi_results kr
            JOIN indicators i ON kr.indicator_id = i.id
            JOIN chospital h ON kr.hospcode = h.hoscode
            WHERE kr.status = 'WAITING_PROVINCE'
            ORDER BY kr.updated_at DESC";

    $stmt = $db->query($sql);
    Response::success($stmt->fetchAll());
} catch (Exception $e) {
    Response::error($e->getMessage());
}