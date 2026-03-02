<?php
// api/users/create.php
require_once '../../config/init.php';

try {
    // Check Admin
    if (!isset($_COOKIE['auth_token'])) throw new Exception('Unauthorized', 401);
    $currentUserId = JwtHelper::decode($_COOKIE['auth_token'])['sub'] ?? null;
    $stmtAuth = $db->prepare("SELECT role_id FROM users WHERE id = :id LIMIT 1");
    $stmtAuth->execute([':id' => $currentUserId]);
    $currentUser = $stmtAuth->fetch(PDO::FETCH_ASSOC);
    if (!$currentUser || !in_array((int)$currentUser['role_id'], [1,2], true)) throw new Exception('Access Denied', 403);

    $data = json_decode(file_get_contents("php://input"));
    // ✅ ตัด hospcode ออกจากการ validate
    if (empty($data->username) || empty($data->password) || empty($data->firstname)) {
        throw new Exception('กรุณากรอกข้อมูลจำเป็นให้ครบ', 400);
    }

    $check = $db->prepare("SELECT id FROM users WHERE username = ?");
    $check->execute([$data->username]);
    if ($check->rowCount() > 0) throw new Exception('ชื่อผู้ใช้งานซ้ำ', 400);

    // ✅ Insert position, ตัด hospcode
    $sql = "INSERT INTO users (username, password, firstname, lastname, position, email, phone, role_id, workgroup_id, status, registered_at) 
            VALUES (:user, :pass, :fname, :lname, :pos, :email, :phone, :role, :wg, :status, NOW())";
    
    $stmt = $db->prepare($sql);
    $stmt->execute([
        ':user'  => $data->username,
        ':pass'  => password_hash($data->password, PASSWORD_DEFAULT),
        ':fname' => $data->firstname,
        ':lname' => $data->lastname ?? '',
        ':pos'   => $data->position ?? '', // ✅ เพิ่ม
        ':email' => $data->email ?? '',
        ':phone' => $data->phone ?? '',
        ':role'  => $data->role_id ?? 3,
        ':wg'    => !empty($data->workgroup_id) ? $data->workgroup_id : null,
        ':status'=> $data->status ?? 'active'
    ]);

    Response::success([], 'เพิ่มผู้ใช้งานสำเร็จ');

} catch (Exception $e) {
    error_log("API Error: " . $e->getMessage());
    $code = ($e->getCode() >= 100 && $e->getCode() <= 599) ? $e->getCode() : 500;
    Response::error($e->getMessage(), $code);
}
?>