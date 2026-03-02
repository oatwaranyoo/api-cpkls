<?php
// api/users/reset_password.php
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
    if (empty($data->id) || empty($data->new_password)) {
        throw new Exception('ข้อมูลไม่ครบถ้วน', 400);
    }

    // 3. อัปเดตรหัสผ่าน (Hash ใหม่)
    $stmt = $db->prepare("UPDATE users SET password = :pass WHERE id = :id");
    $stmt->execute([
        ':pass' => password_hash($data->new_password, PASSWORD_DEFAULT),
        ':id'   => $data->id
    ]);

    Response::success([], 'รีเซ็ตรหัสผ่านเรียบร้อยแล้ว');

} catch (Exception $e) {
    error_log("API Error (users/reset_password.php): " . $e->getMessage());
    $code = ($e->getCode() >= 100 && $e->getCode() <= 599) ? $e->getCode() : 500;
    $msg = ($code >= 500) ? 'เกิดข้อผิดพลาดภายในระบบ' : $e->getMessage();
    Response::error($msg, $code);
}
?>