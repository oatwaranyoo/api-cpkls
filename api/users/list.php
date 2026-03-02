<?php
// api/users/list.php
require_once '../../config/init.php';

try {
    // 1. ตรวจสอบ Token
    if (!isset($_COOKIE['auth_token'])) throw new Exception('กรุณาเข้าสู่ระบบ', 401);
    $payload = JwtHelper::decode($_COOKIE['auth_token']);
    $currentUserId = $payload['sub'] ?? null;
    if (!$currentUserId) throw new Exception('Token ไม่ถูกต้อง', 401);

    // 2. ตรวจสอบสิทธิ์ Admin จาก DB
    $stmtAuth = $db->prepare("SELECT role_id, status FROM users WHERE id = :id LIMIT 1");
    $stmtAuth->execute([':id' => $currentUserId]);
    $currentUser = $stmtAuth->fetch(PDO::FETCH_ASSOC);

    if (!$currentUser || $currentUser['status'] !== 'active' || !in_array((int)$currentUser['role_id'], [1,2], true)) {
        throw new Exception('Access Denied: คุณไม่มีสิทธิ์เข้าถึงส่วนนี้', 403);
    }

    // 3. ดึงข้อมูล Users (กรอง Admin ออกตาม Logic เดิม)
    $sql = "SELECT u.id, u.username, u.firstname, u.lastname, u.position, u.email, 
                   u.position, u.role_id, r.display_name as role_name, 
                   u.workgroup_id, w.name as workgroup_name, u.phone,
                   u.status, u.registered_at
            FROM users u
            LEFT JOIN croles r ON u.role_id = r.id
            LEFT JOIN cworkgroups w ON u.workgroup_id = w.id
            WHERE u.role_id != 1
            ORDER BY FIELD(u.status, 'pending', 'active', 'inactive'), u.id DESC";

    $stmt = $db->query($sql);
    Response::success($stmt->fetchAll());

} catch (Exception $e) {
    error_log("API Error (users/list.php): " . $e->getMessage());
    $code = ($e->getCode() >= 100 && $e->getCode() <= 599) ? $e->getCode() : 500;
    $msg = ($code >= 500) ? 'เกิดข้อผิดพลาดภายในระบบ' : $e->getMessage();
    Response::error($msg, $code);
}
?>