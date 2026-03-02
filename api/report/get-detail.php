<?php
require_once '../../config/init.php';

try {
    // ❌ ตัดส่วน Check Auth Token ออก
    // ❌ ตัดส่วน Check User Assignee ออก

    // 1. รับค่า Parameter
    $kpiId = isset($_GET['kpi_id']) ? $_GET['kpi_id'] : null;
    if (!$kpiId) throw new Exception('Invalid KPI ID', 400);

    // 3. ดึงรายละเอียด KPI (Join Workgroup)
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

    // 4. ดึงเกณฑ์คะแนน (Criteria)
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
            $rawDesc = $criteriaRow["criteria_$i"] ?? '-';

            // ✅ ส่วนที่แก้ไข: ทำความสะอาด String เพื่อป้องกันปัญหาคำนวณคะแนนผิดพลาด
            // เปลี่ยน En Dash (–), Em Dash (—) เป็น Hyphen (-) 
            // และเปลี่ยนเครื่องหมายทางคณิตศาสตร์พิเศษให้เป็นมาตรฐาน
            $cleanDesc = str_replace(
                ['–', '—', '≥', '≤'], 
                ['-', '-', '>=', '<='], 
                trim($rawDesc)
            );

            $criteriaList[] = [
                'level' => $i,
                'desc' => $cleanDesc
            ];
        }
    }

    // 5. ส่ง Response กลับ
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