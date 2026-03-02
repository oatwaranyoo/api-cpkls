<?php
// api/users/update.php
require_once '../../config/init.php';

try {
    // ... (ส่วนเช็คสิทธิ์ Admin เหมือน create.php) ...
    if (!isset($_COOKIE['auth_token'])) throw new Exception('Unauthorized', 401);
    $currentUserId = JwtHelper::decode($_COOKIE['auth_token'])['sub'] ?? null;
    $stmtAuth = $db->prepare("SELECT role_id FROM users WHERE id = :id LIMIT 1");
    $stmtAuth->execute([':id' => $currentUserId]);
    $currentUser = $stmtAuth->fetch(PDO::FETCH_ASSOC);
    if (!$currentUser || !in_array((int)$currentUser['role_id'], [1,2], true)) throw new Exception('Access Denied', 403);

    $data = json_decode(file_get_contents("php://input"));
    if (empty($data->id)) throw new Exception('ID required', 400);

    // ✅ Update position, ตัด hospcode
    $sql = "UPDATE users SET 
            firstname = :fname,
            lastname = :lname,
            position = :pos,
            email = :email,
            phone = :phone,
            role_id = :role,
            workgroup_id = :wg,
            status = :status";
    
    $params = [
        ':fname' => $data->firstname,
        ':lname' => $data->lastname,
        ':pos'   => $data->position, // ✅ เพิ่ม
        ':email' => $data->email,
        ':phone' => $data->phone,
        ':role'  => $data->role_id,
        ':wg'    => !empty($data->workgroup_id) ? $data->workgroup_id : null,
        ':status'=> $data->status,
        ':id'    => $data->id
    ];

    if (!empty($data->password)) {
        $sql .= ", password = :pass"; // หรือ hash_password ตาม DB คุณ
        $params[':pass'] = password_hash($data->password, PASSWORD_DEFAULT);
    }

    $sql .= " WHERE id = :id";
    $stmt = $db->prepare($sql);
    $stmt->execute($params);

    Response::success([], 'อัปเดตข้อมูลเรียบร้อย');

} catch (Exception $e) {
    Response::error($e->getMessage(), 500);
}
?>