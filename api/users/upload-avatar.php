<?php
// api/users/upload-avatar.php
require_once '../../config/init.php';

// ตั้งค่า Header สำหรับ JSON Response
header('Content-Type: application/json; charset=utf-8');

try {
    // 1. ตรวจสอบสิทธิ์การเข้าใช้งาน (JWT)
    if (!isset($_COOKIE['auth_token'])) {
        throw new Exception('Unauthorized: ไม่พบสิทธิ์การเข้าถึง', 401);
    }

    $decoded = JwtHelper::decode($_COOKIE['auth_token']);
    $userId = $decoded['sub'] ?? $decoded['data']['id'] ?? null;

    if (!$userId) {
        throw new Exception('Invalid Token: ข้อมูลผู้ใช้ไม่ถูกต้อง', 401);
    }

    // 2. ตรวจสอบไฟล์ที่ส่งมาจาก FormData
    if (!isset($_FILES['avatar']) || $_FILES['avatar']['error'] !== UPLOAD_ERR_OK) {
        $errorCode = $_FILES['avatar']['error'] ?? 'No file';
        throw new Exception("กรุณาเลือกไฟล์รูปภาพ (Error Code: $errorCode)", 400);
    }

    $file = $_FILES['avatar'];
    $allowedTypes = ['image/jpeg', 'image/png', 'image/jpg', 'image/gif'];
    $maxSize = 5 * 1024 * 1024; // 5MB

    // ตรวจสอบ MIME Type จริงของไฟล์
    $finfo = new finfo(FILEINFO_MIME_TYPE);
    $mimeType = $finfo->file($file['tmp_name']);

    if (!in_array($mimeType, $allowedTypes)) {
        throw new Exception('รองรับเฉพาะไฟล์รูปภาพ (JPG, PNG, GIF) เท่านั้น', 400);
    }

    if ($file['size'] > $maxSize) {
        throw new Exception('ไฟล์มีขนาดใหญ่เกิน 5MB', 400);
    }

    // 3. กำหนดเส้นทางโฟลเดอร์ (Absolute Path)
    // ถอยกลับ 2 ระดับจาก api/users ไปที่รากของโปรเจกต์ แล้วเข้า uploads/avatars
    $uploadDir = dirname(__DIR__, 2) . DIRECTORY_SEPARATOR . 'uploads' . DIRECTORY_SEPARATOR . 'avatars' . DIRECTORY_SEPARATOR;

    // สร้าง Folder หากยังไม่มี
    if (!file_exists($uploadDir)) {
        if (!mkdir($uploadDir, 0777, true)) {
            throw new Exception("ไม่สามารถสร้างโฟลเดอร์เก็บไฟล์ได้ที่: $uploadDir", 500);
        }
    }

    // 4. ✅ ขั้นตอนการลบไฟล์เดิมก่อน (Cleanup)
    $stmt = $db->prepare("SELECT avatar_url FROM users WHERE id = :id");
    $stmt->execute([':id' => $userId]);
    $currentUser = $stmt->fetch(PDO::FETCH_ASSOC);

    // ถ้าใน DB มีชื่อไฟล์เดิมอยู่ ให้ทำการลบไฟล์ออกจาก Disk
    if (!empty($currentUser['avatar_url'])) {
        $oldFileName = $currentUser['avatar_url'];
        $oldFilePath = $uploadDir . $oldFileName;

        if (file_exists($oldFilePath)) {
            @unlink($oldFilePath); 
        }
    }

    // 5. ✅ ขั้นตอนการ Rename ชื่อไฟล์อัตโนมัติ
    $ext = pathinfo($file['name'], PATHINFO_EXTENSION);
    // รูปแบบ: avatar_IDผู้ใช้_เวลาปัจจุบัน_สุ่มตัวอักษร.นามสกุล
    $newFileName = sprintf(
        'avatar_%d_%d_%s.%s',
        $userId,
        time(),
        bin2hex(random_bytes(4)),
        $ext
    );
    
    $uploadPath = $uploadDir . $newFileName;

    // 6. ย้ายไฟล์จาก Temp ไปยังโฟลเดอร์ปลายทาง
    if (move_uploaded_file($file['tmp_name'], $uploadPath)) {
        
        // 7. ✅ อัปเดตเฉพาะ "ชื่อไฟล์" ลงใน Database
        $updateStmt = $db->prepare("UPDATE users SET avatar_url = :filename WHERE id = :id");
        $updateStmt->execute([
            ':filename' => $newFileName, 
            ':id' => $userId
        ]);

        // ส่ง Response กลับไปยัง Frontend
        echo json_encode([
            'status' => 'success',
            'message' => 'อัปโหลดรูปโปรไฟล์สำเร็จ',
            'data' => [
                'filename' => $newFileName
            ]
        ]);

    } else {
        throw new Exception('ไม่สามารถบันทึกไฟล์ลงในเซิร์ฟเวอร์ได้ (โปรดตรวจสอบ Permission 777)', 500);
    }

} catch (Exception $e) {
    // ตอบกลับกรณีเกิดข้อผิดพลาด
    $code = ($e->getCode() >= 100 && $e->getCode() <= 599) ? $e->getCode() : 500;
    http_response_code($code);
    echo json_encode([
        'status' => 'error',
        'message' => $e->getMessage()
    ]);
}