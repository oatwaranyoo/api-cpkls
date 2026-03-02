<?php
// api/kpi/toggle-assignment.php
require_once '../../config/init.php';

try {
    // 1. ตรวจสอบสิทธิ์ (รองรับ Token แบบใหม่)
    if (!isset($_COOKIE['auth_token'])) {
        throw new Exception('กรุณาเข้าสู่ระบบก่อนใช้งาน', 401);
    }

    $decoded = JwtHelper::decode($_COOKIE['auth_token']);
    // ดึง ID จาก 'sub' (แบบใหม่) หรือ 'data'->'id' (แบบเก่า)
    $userId = $decoded['sub'] ?? $decoded['data']['id'] ?? null;

    if (!$userId) {
        throw new Exception('Session expired', 401);
    }

    // 2. รับข้อมูล
    $data = json_decode(file_get_contents("php://input"));
    if (empty($data->kpi_id)) {
        throw new Exception('KPI ID is required', 400);
    }

    $kpiId = $data->kpi_id;

    // 3. ตรวจสอบและสลับสถานะ (Toggle)
    // ✅ ใช้ตาราง indicator_assignees (ตามที่แก้ใน list-for-assign.php)
    $check = $db->prepare("SELECT id FROM indicator_assignees WHERE user_id = :uid AND indicator_id = :kid");
    $check->execute([':uid' => $userId, ':kid' => $kpiId]);

    if ($check->rowCount() > 0) {
        // มีแล้ว -> ลบออก (Unassign)
        $delete = $db->prepare("DELETE FROM indicator_assignees WHERE user_id = :uid AND indicator_id = :kid");
        $delete->execute([':uid' => $userId, ':kid' => $kpiId]);
        $action = 'removed';
    } else {
        // ยังไม่มี -> เพิ่มใหม่ (Assign)
        $insert = $db->prepare("INSERT INTO indicator_assignees (user_id, indicator_id, created_at) VALUES (:uid, :kid, NOW())");
        $insert->execute([':uid' => $userId, ':kid' => $kpiId]);
        $action = 'added';
    }

    Response::success(['action' => $action], 'บันทึกเรียบร้อย');

} catch (Exception $e) {
    // ✅ Security: Log Error จริง แต่ส่งข้อความทั่วไปกลับไป
    error_log("API Error (kpi/toggle-assignment.php): " . $e->getMessage());
    
    $code = ($e->getCode() >= 100 && $e->getCode() <= 599) ? $e->getCode() : 500;
    Response::error('เกิดข้อผิดพลาดภายในระบบ', $code);
}
?>