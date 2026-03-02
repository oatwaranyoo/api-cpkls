<?php
require_once '../../config/init.php';

try {
    // ❌ ไม่ต้อง Check Auth

    $kpiId = $_GET['kpi_id'] ?? null;
    $year = $_GET['year'] ?? null;
    $round = $_GET['round'] ?? '1'; // Default รอบที่ 1 ถ้าไม่ส่งมา (หรือจะรับจาก Frontend ก็ได้)

    if (!$kpiId || !$year) throw new Exception('ข้อมูลไม่ครบถ้วน', 400);

    // ดึงข้อมูลผลงานรายอำเภอ
    $sql = "SELECT 
                amp_code, 
                target_amount, 
                result_amount, 
                result_rate, 
                score, 
                updated_at 
            FROM kpi_results 
            WHERE indicator_id = :id 
              AND fiscal_year = :year 
              /* AND eval_round = :round */ -- (เปิด Comment ถ้าต้องการกรองรอบด้วย)
            ";

    $stmt = $db->prepare($sql);
    $stmt->execute([
        ':id' => $kpiId,
        ':year' => $year
    ]);
    
    $results = $stmt->fetchAll(PDO::FETCH_ASSOC);
    
    // จัดรูปแบบข้อมูลให้ Frontend ใช้ง่าย (Key = amp_code)
    $data = [];
    foreach ($results as $row) {
        $data[$row['amp_code']] = [
            'target' => $row['target_amount'],
            'result' => $row['result_amount'],
            'rate' => $row['result_rate'],
            'score' => $row['score'],
            'updated_at' => $row['updated_at']
        ];
    }

    Response::success($data);

} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(['status' => 'error', 'message' => $e->getMessage()]);
}
?>