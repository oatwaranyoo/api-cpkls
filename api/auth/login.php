<?php
// api/auth/login.php
require_once '../../config/init.php';

// ป้องกันการยิง Request เปล่า
$input = file_get_contents("php://input");
if (!$input) {
    Response::error('Bad Request', 400);
}
$data = json_decode($input);

if (empty($data->username) || empty($data->password)) {
    Response::error('กรุณาระบุชื่อผู้ใช้และรหัสผ่าน', 400);
}

try {
    // 1. ดึงข้อมูล User (เอาแค่ที่จำเป็นสำหรับตรวจสอบ)
    $sql = "SELECT id, password, status FROM users WHERE username = :u LIMIT 1";
    $stmt = $db->prepare($sql);
    $stmt->execute([':u' => $data->username]);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    // 2. Security: เช็ค Password & ป้องกัน Timing Attack
    if (!$user || !password_verify($data->password, $user['password'])) {
        usleep(rand(500000, 1000000)); // หน่วงเวลาสุ่ม 0.5-1 วินาที
        Response::error('ชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง', 401);
    }

    // 3. Security: เช็คสถานะ
    if ($user['status'] === 'pending') {
        Response::error('บัญชีของท่านอยู่ระหว่างรอการอนุมัติจากผู้ดูแลระบบ', 403);
    }
    if ($user['status'] !== 'active') {
        Response::error('บัญชีถูกระงับการใช้งาน กรุณาติดต่อผู้ดูแลระบบ', 403);
    }

    // 4. สร้าง Token (Minimal Payload)
    $payload = [
        'iat' => time(),
        // 'exp' => time() + 10, // ทดสอบระบบ
        'exp' => time() + (2 * 60 * 60), // หมดอายุ 2 ชม.
        'sub' => $user['id'] // เก็บแค่ ID ใน Subject
    ];

    $token = JwtHelper::encode($payload);

    // 5. ฝัง HttpOnly Cookie
    $isSecure = isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on';
    setcookie('auth_token', $token, [
        // 'expires' => time() + 10, // ทดสอบระบบ
        'expires' => time() + (2 * 60 * 60), // หมดอายุ 2 ชม.
        'path' => '/',
        'secure' => $isSecure,
        'httponly' => true,
        'samesite' => 'Strict'
    ]);

    Response::success([], 'เข้าสู่ระบบสำเร็จ');

} catch (Exception $e) {
    error_log("Login Error: " . $e->getMessage());
    Response::error('เกิดข้อผิดพลาดภายในระบบ', 500);
}
?>