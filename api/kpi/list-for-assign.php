<?php
// api/kpi/list-for-assign.php
require_once '../../config/init.php';

try {
    // 1. ตรวจสอบสิทธิ์ (รองรับ Token แบบใหม่)
    if (!isset($_COOKIE['auth_token'])) {
        throw new Exception('กรุณาเข้าสู่ระบบก่อนใช้งาน', 401);
    }

    $decoded = JwtHelper::decode($_COOKIE['auth_token']);
    // ✅ แก้ไข: ดึง ID จาก 'sub' (แบบใหม่) หรือ 'data'->'id' (แบบเก่า)
    $userId = $decoded['sub'] ?? $decoded['data']['id'] ?? null;

    if (!$userId) {
        throw new Exception('Session expired', 401);
    }

    // 2. Query ข้อมูล
    $sql = "SELECT 
                k.id,
                CONCAT(
                    k.fiscal_year,
                    LPAD(k.eval_round, 2, '0'),
                    LPAD(k.sub_ex_id, 2, '0'),
                    LPAD(k.indicator_sequence, 2, '0')
                ) AS kpi_id,
                k.name AS kpi_name,
                k.source_type,
                k.template_file,

                COUNT(CASE WHEN a.user_id NOT IN (1,2) THEN a.user_id END) AS assignee_count,

                GROUP_CONCAT(
                    DISTINCT u.firstname
                    ORDER BY u.id
                    SEPARATOR ', '
                ) AS assignees,

                SUM(a.user_id = :uid) AS is_assigned

            FROM indicators k
            LEFT JOIN indicator_assignees a 
                ON a.indicator_id = k.id
            LEFT JOIN users u 
                ON u.id = a.user_id
                AND u.id NOT IN (1, 2)

            GROUP BY k.id
            ORDER BY k.id ASC";

    $stmt = $db->prepare($sql);
    $stmt->execute([':uid' => $userId]);
    $kpis = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // 3. แปลง is_assigned เป็น boolean
    foreach ($kpis as &$row) {
        $row['is_assigned'] = $row['is_assigned'] > 0;
    }

    Response::success($kpis);

} catch (Exception $e) {
    // ✅ Security: ไม่ส่ง Raw Error ออกไป
    error_log("API Error (kpi/list-assign.php): " . $e->getMessage());
    $code = ($e->getCode() >= 100 && $e->getCode() <= 599) ? $e->getCode() : 500;
    Response::error('เกิดข้อผิดพลาดภายในระบบ', $code);
}
?>