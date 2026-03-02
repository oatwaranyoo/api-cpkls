<?php
require_once '../../config/init.php';

try {
    // รับค่าจาก Query Params
    $year = $_GET['year'] ?? null;
    $round = $_GET['round'] ?? null;

    if (!$year || !$round) {
        throw new Exception("ข้อมูลปีหรือรอบการประเมินไม่ครบถ้วน", 400);
    }

    // Query ตามที่คุณต้องการ
    $sql = "SELECT 
            CASE WHEN is_keyin = 'Y' THEN 1 ELSE 0 END AS is_keyin
            FROM system_periods
            WHERE fiscal_year = :year AND eval_round = :round
            LIMIT 1";
    
    $stmt = $db->prepare($sql);
    $stmt->execute([
        ':year' => $year, 
        ':round' => $round
    ]);
    
    $result = $stmt->fetch(PDO::FETCH_ASSOC);

    // ถ้าเจอข้อมูล ให้ส่งค่า is_keyin กลับไป (แปลงเป็น Boolean หรือ Int)
    // ถ้าไม่เจอ ให้ถือว่าปิด (false/0)
    $isKeyIn = $result ? (int)$result['is_keyin'] : 0;

    Response::success([
        'fiscal_year' => $year,
        'eval_round' => $round,
        'is_keyin' => $isKeyIn === 1 // ส่งกลับเป็น true/false
    ]);

} catch (Exception $e) {
    $code = ($e->getCode() >= 100 && $e->getCode() <= 599) ? $e->getCode() : 500;
    http_response_code($code);
    echo json_encode(['status' => 'error', 'message' => $e->getMessage()]);
}
?>