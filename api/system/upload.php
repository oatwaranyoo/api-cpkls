<?php
require_once '../../config/init.php';

// 1. เช็ค Login (ใครก็ได้ที่ Login แล้วอัปโหลดได้)
if (!isset($_COOKIE['auth_token'])) Response::error('Unauthorized', 401);

// 2. เช็คไฟล์
if (!isset($_FILES['file'])) {
    Response::error('ไม่พบไฟล์ที่อัปโหลด');
}

$file = $_FILES['file'];
$fileName = $file['name'];
$fileTmp = $file['tmp_name'];
$fileSize = $file['size'];
$fileError = $file['error'];

// 3. ตรวจสอบนามสกุล
$fileExt = strtolower(pathinfo($fileName, PATHINFO_EXTENSION));
$allowed = ['pdf', 'jpg', 'jpeg', 'png', 'doc', 'docx', 'xls', 'xlsx', 'zip', 'rar'];

if (!in_array($fileExt, $allowed)) {
    Response::error('ไม่อนุญาตให้อัปโหลดไฟล์นามสกุลนี้');
}

// 4. ตรวจสอบ Error
if ($fileError !== 0) {
    Response::error('เกิดข้อผิดพลาดในการอัปโหลด (' . $fileError . ')');
}

// 5. ตั้งชื่อไฟล์ใหม่ (กันซ้ำ)
$newFileName = uniqid('', true) . "." . $fileExt;

// 6. ย้ายไฟล์ไปยังโฟลเดอร์ uploads
// (โฟลเดอร์ uploads อยู่ที่ backend/uploads)
$uploadDir = '../../uploads/';
if (!is_dir($uploadDir)) {
    mkdir($uploadDir, 0777, true); // สร้างโฟลเดอร์ถ้ายังไม่มี
}

$destination = $uploadDir . $newFileName;

if (move_uploaded_file($fileTmp, $destination)) {
    // 7. สร้าง URL สำหรับเรียกดูไฟล์
    // สมมติวาง backend ไว้ที่ http://localhost/backend
    // URL จะเป็น http://localhost/backend/uploads/xxxx.pdf
    
    // วิธีหา Base URL อัตโนมัติ
    $protocol = isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on' ? "https" : "http";
    $host = $_SERVER['HTTP_HOST'];
    // ตัด /api/system/upload.php ออกจาก Path เพื่อหา root
    $scriptDir = dirname(dirname(dirname($_SERVER['SCRIPT_NAME']))); 
    $baseUrl = $protocol . "://" . $host . $scriptDir;
    
    $fileUrl = $baseUrl . '/uploads/' . $newFileName;

    Response::success(['url' => $fileUrl]);
} else {
    Response::error('ไม่สามารถบันทึกไฟล์ได้ (Permission Denied?)');
}