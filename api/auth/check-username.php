<?php
// api/auth/check-username.php
require_once '../../config/init.php';

$data = json_decode(file_get_contents("php://input"));

if (empty($data->username)) {
    Response::success(['available' => false]);
    exit;
}

try {
    $stmt = $db->prepare("SELECT id FROM users WHERE username = ?");
    $stmt->execute([$data->username]);
    
    if ($stmt->rowCount() > 0) {
        // มีคนใช้แล้ว
        Response::success(['available' => false]);
    } else {
        // ว่างอยู่
        Response::success(['available' => true]);
    }
} catch (Exception $e) {
    Response::error($e->getMessage(), 500);
}
?>