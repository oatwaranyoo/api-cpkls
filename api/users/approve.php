<?php
// api/users/approve.php
require_once '../../config/init.php';

try {
    // 1. ตรวจสอบสิทธิ์ Admin
    if (!isset($_COOKIE['auth_token'])) throw new Exception('Unauthorized', 401);
    $currentUserId = JwtHelper::decode($_COOKIE['auth_token'])['sub'] ?? null;

    $stmtAuth = $db->prepare("SELECT role_id, status FROM users WHERE id = :id LIMIT 1");
    $stmtAuth->execute([':id' => $currentUserId]);
    $currentUser = $stmtAuth->fetch(PDO::FETCH_ASSOC);

    if (!$currentUser || $currentUser['status'] !== 'active' || !in_array((int)$currentUser['role_id'], [1,2], true)) {
        throw new Exception('Access Denied', 403);
    }

    // 2. รับข้อมูล
    $data = json_decode(file_get_contents("php://input"));
    if (empty($data->id) || empty($data->status)) {
        throw new Exception('ข้อมูลไม่ครบถ้วน', 400);
    }

    // 3. อัปเดตสถานะ
    $stmt = $db->prepare("UPDATE users SET status = :s WHERE id = :id");
    $stmt->execute([':s' => $data->status, ':id' => $data->id]);

    Response::success([], 'อัปเดตสถานะเรียบร้อย');

} catch (Exception $e) {
    error_log("API Error (users/approve.php): " . $e->getMessage());
    $code = ($e->getCode() >= 100 && $e->getCode() <= 599) ? $e->getCode() : 500;
    $msg = ($code >= 500) ? 'เกิดข้อผิดพลาดภายในระบบ' : $e->getMessage();
    Response::error($msg, $code);
}
?>