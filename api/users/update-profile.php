<?php
// api/users/update-profile.php
require_once '../../config/init.php';

try {
    if (!isset($_COOKIE['auth_token'])) throw new Exception('Unauthorized', 401);
    $decoded = JwtHelper::decode($_COOKIE['auth_token']);
    $userId = $decoded['sub'] ?? null;
    if (!$userId) throw new Exception('Session expired', 401);

    $data = json_decode(file_get_contents("php://input"));
    if (empty($data->firstname) || empty($data->lastname)) throw new Exception('กรุณาระบุชื่อ', 400);

    // ✅ User แก้ Position ตัวเองได้ (หรือจะปิดก็ได้แล้วแต่ Policy)
    $sql = "UPDATE users SET 
            firstname = :fname,
            lastname = :lname,
            position = :pos,
            email = :email,
            phone = :phone
            WHERE id = :id";
            
    $stmt = $db->prepare($sql);
    $stmt->execute([
        ':fname' => $data->firstname,
        ':lname' => $data->lastname,
        ':pos'   => $data->position ?? '', // ✅ เพิ่ม
        ':email' => $data->email ?? '',
        ':phone' => $data->phone ?? '',
        ':id'    => $userId
    ]);

    Response::success([], 'บันทึกข้อมูลเรียบร้อยแล้ว');

} catch (Exception $e) {
    Response::error($e->getMessage(), 500);
}
?>