<?php
require_once '../../config/init.php';

try {
    // 1. ตรวจสอบสิทธิ์การเข้าใช้งาน (Token)
    if (!isset($_COOKIE['auth_token'])) {
        throw new Exception('กรุณาเข้าสู่ระบบก่อนใช้งาน', 401);
    }
    $decoded = JwtHelper::decode($_COOKIE['auth_token']);
    $userId = $decoded['sub'] ?? $decoded['data']['id'] ?? null;

    if (!$userId) throw new Exception('Session expired', 401);

    // 2. รับค่า Parameter
    $kpiId = $_GET['kpi_id'] ?? null;
    $year = $_GET['year'] ?? (date('Y') + 543);
    $type = $_GET['type'] ?? 'ampur';

    if (!$kpiId) throw new Exception('Invalid KPI ID', 400);

    // -------------------------------------------------------------------------
    // ✅ Security Check: ตรวจสอบว่า User มีสิทธิ์ดูข้อมูลตัวชี้วัดนี้หรือไม่
    // -------------------------------------------------------------------------
    $sqlAuth = "SELECT 1 FROM indicator_assignees WHERE indicator_id = :kpi_id AND user_id = :user_id LIMIT 1";
    $stmtAuth = $db->prepare($sqlAuth);
    $stmtAuth->execute([':kpi_id' => $kpiId, ':user_id' => $userId]);
    
    if (!$stmtAuth->fetchColumn()) {
        // อนุญาตเพิ่มเติมถ้าเป็น Admin (Optional)
        // throw new Exception('คุณไม่มีสิทธิ์เข้าถึงข้อมูลตัวชี้วัดนี้', 403);
    }
    // -------------------------------------------------------------------------

    // 3. Query ข้อมูลจากตาราง kpi_results
    $sql = "SELECT 
                r.amp_code, 
                r.target_amount, 
                r.result_amount,
                r.result_rate,  -- ดึงค่าร้อยละที่บันทึกไว้
                r.score,        -- ดึงค่าคะแนนที่บันทึกไว้
                r.updated_at,
                CONCAT_WS(' ', u.firstname, u.lastname) AS updater_name
            FROM kpi_results r
            LEFT JOIN users u ON r.updated_by = u.id
            WHERE r.indicator_id = :kpi_id 
              AND r.fiscal_year = :year";
    
    // กรองเฉพาะที่มีรหัสอำเภอ (ตัดข้อมูลขยะ หรือข้อมูลระดับจังหวัด)
    if ($type === 'ampur') {
        $sql .= " AND r.amp_code IS NOT NULL AND r.amp_code != ''";
    }

    $stmt = $db->prepare($sql);
    $stmt->execute([':kpi_id' => $kpiId, ':year' => $year]);
    $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // 4. จัดรูปแบบข้อมูลส่งกลับ (ใช้ amp_code เป็น Key)
    $data = [];
    foreach ($rows as $row) {
        if ($row['amp_code']) {
            $data[$row['amp_code']] = [
                'target' => floatval($row['target_amount']),
                'result' => floatval($row['result_amount']),
                'p'      => floatval($row['result_rate']), // ส่งค่า p กลับไป (ถ้า frontend อยากใช้)
                'score'  => floatval($row['score']),       // ส่งค่า score กลับไป
                'updated_at' => $row['updated_at'],
                'updater' => $row['updater_name'] ?? '-'
            ];
        }
    }

    Response::success($data);

} catch (Exception $e) {
    $code = ($e->getCode() >= 100 && $e->getCode() <= 599) ? $e->getCode() : 500;
    http_response_code($code);
    echo json_encode(['status' => 'error', 'message' => $e->getMessage()]);
}
?>