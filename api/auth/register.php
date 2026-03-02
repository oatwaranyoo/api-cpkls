<?php
// api/auth/register.php
require_once '../../config/init.php';

// รับข้อมูล JSON
$data = json_decode(file_get_contents("php://input"));

// 1. Validate: ตัด hospcode ออก, เพิ่ม position และ workgroup_id
if (empty($data->username) || empty($data->password) || empty($data->firstname) || empty($data->lastname) || empty($data->position) || empty($data->workgroup_id)) {
    Response::error('กรุณากรอกข้อมูลจำเป็นให้ครบถ้วน', 400);
}

try {
    // 2. เช็ค Username ซ้ำ
    $check = $db->prepare("SELECT id FROM users WHERE username = ?");
    $check->execute([$data->username]);
    
    if ($check->rowCount() > 0) {
        Response::error('ชื่อผู้ใช้งานนี้มีในระบบแล้ว', 400);
    }

    // 3. Insert ข้อมูล (ตัด hospcode ออก)
    $sql = "INSERT INTO users (
                username, password, firstname, lastname, position, 
                email, phone, role_id, workgroup_id, status, registered_at
            ) VALUES (
                :user, :pass, :fname, :lname, :pos, 
                :email, :phone, :role, :wg, :status, NOW()
            )";
    
    $stmt = $db->prepare($sql);
    $stmt->execute([
        ':user'  => $data->username,
        ':pass'  => password_hash($data->password, PASSWORD_DEFAULT),
        ':fname' => $data->firstname,
        ':lname' => $data->lastname,
        ':pos'   => $data->position,
        ':email' => $data->email ?? '',
        ':phone' => $data->phone ?? '',
        ':role'  => $data->role_id ?? 3,
        ':wg'    => $data->workgroup_id,
        ':status'=> 'pending' // สมัครเองต้องรออนุมัติเสมอ
    ]);

    Response::success([], 'ลงทะเบียนสำเร็จ');

} catch (Exception $e) {
    error_log("Register Error: " . $e->getMessage());
    Response::error('เกิดข้อผิดพลาดภายในระบบ', 500);
}
?>