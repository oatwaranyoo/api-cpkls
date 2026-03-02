<?php
// api/users/change-password.php
require_once '../../config/init.php';

try {
    // 1. ตรวจสอบสิทธิ์
    if (!isset($_COOKIE['auth_token'])) {
        throw new Exception('Unauthorized', 401);
    }
    
    $decoded = JwtHelper::decode($_COOKIE['auth_token']);
    $userId = $decoded['sub'] ?? $decoded['data']['id'] ?? null;

    if (!$userId) {
        throw new Exception('Session expired', 401);
    }

    // 2. รับข้อมูล
    $data = json_decode(file_get_contents("php://input"));

    if (empty($data->current_password) || empty($data->new_password) || empty($data->confirm_password)) {
        throw new Exception('กรุณาระบุข้อมูลให้ครบถ้วน', 400);
    }

    if ($data->new_password !== $data->confirm_password) {
        throw new Exception('รหัสผ่านใหม่และการยืนยันรหัสผ่านไม่ตรงกัน', 400);
    }

    if (strlen($data->new_password) < 8) {
        throw new Exception('รหัสผ่านใหม่ต้องมีความยาวอย่างน้อย 8 ตัวอักษร', 400);
    }

    // 3. ดึงรหัสผ่านเดิม (ใช้ password ตามที่ขอ)
    $stmt = $db->prepare("SELECT password FROM users WHERE id = :id");
    $stmt->execute([':id' => $userId]);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$user) {
        throw new Exception('ไม่พบผู้ใช้งานในระบบ', 404);
    }

    // 4. ตรวจสอบรหัสผ่านเดิม
    if (!password_verify($data->current_password, $user['password'])) {
        throw new Exception('รหัสผ่านปัจจุบันไม่ถูกต้อง', 400);
    }

    // 5. บันทึกรหัสผ่านใหม่
    $newHash = password_hash($data->new_password, PASSWORD_DEFAULT);
    
    $updateStmt = $db->prepare("UPDATE users SET password = :p WHERE id = :id");
    $updateStmt->execute([
        ':p' => $newHash,
        ':id' => $userId
    ]);

    Response::success([], 'เปลี่ยนรหัสผ่านสำเร็จ กรุณาเข้าสู่ระบบใหม่');

} catch (Exception $e) {
    $code = ($e->getCode() >= 100 && $e->getCode() <= 599) ? $e->getCode() : 500;
    Response::error($e->getMessage(), $code);
}
?>