<?php
// api/auth/me.php
require_once '../../config/init.php';

try {
    if (!isset($_COOKIE['auth_token'])) throw new Exception('Unauthorized', 401);
    $payload = JwtHelper::decode($_COOKIE['auth_token']);
    $userId = $payload['sub'] ?? null;
    if (!$userId) throw new Exception('Invalid Token', 401);

    // ✅ เพิ่ม position, ตัด hospcode
    $sql = "SELECT u.id, u.username, u.firstname, u.lastname, u.position, u.email, u.phone,
                   u.role_id, r.display_name as role_name,
                   u.workgroup_id, w.name as workgroup_name,
                   u.status, u.avatar_url, u.registered_at
            FROM users u
            LEFT JOIN croles r ON u.role_id = r.id
            LEFT JOIN cworkgroups w ON u.workgroup_id = w.id
            WHERE u.id = :id AND u.status = 'active' 
            LIMIT 1";

    $stmt = $db->prepare($sql);
    $stmt->execute([':id' => $userId]);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$user) throw new Exception('User not found', 401);

    Response::success($user);

} catch (Exception $e) {
    http_response_code(401);
    echo json_encode(['status' => 'error', 'message' => $e->getMessage()]);
}
?>