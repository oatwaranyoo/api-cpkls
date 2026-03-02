<?php
require_once '../../config/init.php';

try {
    // 1. ตรวจสอบ Token
    if (!isset($_COOKIE['auth_token'])) {
        throw new Exception('กรุณาเข้าสู่ระบบก่อนใช้งาน', 401);
    }
    $decoded = JwtHelper::decode($_COOKIE['auth_token']);
    $userId = $decoded['sub'] ?? $decoded['data']['id'] ?? null;

    if (!$userId) throw new Exception('Session expired', 401);

    // 2. รับค่า Parameter
    $kpiId = isset($_GET['kpi_id']) ? $_GET['kpi_id'] : null;
    if (!$kpiId) throw new Exception('Invalid KPI ID', 400);

    // -------------------------------------------------------------------------
    // ✅ 3. Security Check: ตรวจสอบว่า User นี้ได้รับมอบหมายตัวชี้วัดนี้หรือไม่
    // -------------------------------------------------------------------------
    $sqlAuth = "SELECT 1 FROM indicator_assignees WHERE indicator_id = :kpi_id AND user_id = :user_id LIMIT 1";
    $stmtAuth = $db->prepare($sqlAuth);
    $stmtAuth->execute([':kpi_id' => $kpiId, ':user_id' => $userId]);
    
    if (!$stmtAuth->fetchColumn()) {
        // เพิ่ม: อนุญาตถ้าเป็น Admin (role_id = 1) เพื่อความยืดหยุ่น (Optional)
        $stmtAdmin = $db->prepare("SELECT role_id FROM users WHERE id = :uid");
        $stmtAdmin->execute([':uid' => $userId]);
        $role = $stmtAdmin->fetchColumn();
        if ($role != 1) { 
            throw new Exception('คุณไม่มีสิทธิ์เข้าถึงข้อมูลตัวชี้วัดนี้', 403);
        }
    }
    // -------------------------------------------------------------------------

    // 4. ดึงรายละเอียด KPI
    $sql = "SELECT 
                i.*, 
                w.name AS workgroup_name
            FROM indicators i
            LEFT JOIN cworkgroups w ON i.workgroup_id = w.id
            WHERE i.id = :id AND i.status = 'ACTIVE'";
    
    $stmt = $db->prepare($sql);
    $stmt->execute([':id' => $kpiId]);
    $kpi = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$kpi) throw new Exception('ไม่พบข้อมูลตัวชี้วัด', 404);

    // 5. ดึงเกณฑ์คะแนน
    $sqlCriteria = "SELECT * FROM indicator_criteria 
                    WHERE indicator_id = :id 
                    AND fiscal_year = :year 
                    AND eval_round = :round 
                    LIMIT 1";
    
    $stmtC = $db->prepare($sqlCriteria);
    $stmtC->execute([
        ':id' => $kpiId,
        ':year' => $kpi['fiscal_year'],
        ':round' => $kpi['eval_round']
    ]);
    $criteriaRow = $stmtC->fetch(PDO::FETCH_ASSOC);

    $criteriaList = [];
    if ($criteriaRow) {
        for ($i = 1; $i <= 5; $i++) {
            $criteriaList[] = [
                'level' => $i,
                'desc' => $criteriaRow["criteria_$i"] ?? '-'
            ];
        }
    }

    $response = [
        'id' => $kpi['id'],
        'kpi_code' => $kpi['indicator_sequence'],
        'kpi_name' => $kpi['name'],
        'fiscal_year' => $kpi['fiscal_year'],
        'eval_round' => $kpi['eval_round'],
        'unit' => $kpi['unit'],
        'formula' => $kpi['formula_desc'] ?? '-',
        'workgroup' => $kpi['workgroup_name'] ?? '-',
        'template_file' => $kpi['template_file'],
        'target_detail' => $kpi['target_detail'] ?? '',
        'result_detail' => $kpi['result_detail'] ?? '',
        'scoring_type' => $criteriaRow['scoring_type'] ?? 'MORE_IS_BETTER',
        'criterias' => $criteriaList
    ];

    Response::success($response);

} catch (Exception $e) {
    $code = ($e->getCode() >= 100 && $e->getCode() <= 599) ? $e->getCode() : 500;
    http_response_code($code);
    echo json_encode(['status' => 'error', 'message' => $e->getMessage()]);
}
?>