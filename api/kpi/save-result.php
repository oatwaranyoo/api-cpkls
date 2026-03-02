<?php
require_once '../../config/init.php';

try {
    if (!isset($_COOKIE['auth_token'])) throw new Exception('กรุณาเข้าสู่ระบบก่อนใช้งาน', 401);
    $decoded = JwtHelper::decode($_COOKIE['auth_token']);
    $userId = $decoded['sub'] ?? $decoded['data']['id'] ?? null;

    if (!$userId) throw new Exception('Session expired', 401);

    $input = json_decode(file_get_contents('php://input'), true);
    
    $kpiId = $input['kpi_id'] ?? null;
    $year = $input['year'] ?? null;
    $period = $input['period'] ?? null;
    $type = $input['type'] ?? 'ampur';
    $data = $input['data'] ?? [];

    if (empty($data)) {
        throw new Exception('ไม่พบข้อมูลที่จะบันทึก', 400);
    }        

    if (!$kpiId || !$year || !$period) {
        throw new Exception('ข้อมูลไม่ครบถ้วน', 400);
    }

    // ✅ Security Check
    $sqlAuth = "SELECT 1 FROM indicator_assignees WHERE indicator_id = :kpi_id AND user_id = :user_id LIMIT 1";
    $stmtAuth = $db->prepare($sqlAuth);
    $stmtAuth->execute([':kpi_id' => $kpiId, ':user_id' => $userId]);
    
    if (!$stmtAuth->fetchColumn()) {
        throw new Exception('คุณไม่มีสิทธิ์บันทึกข้อมูลตัวชี้วัดนี้', 403);
    }
    
    $db->beginTransaction();

    if ($type === 'ampur') {
        $checkSql = "SELECT id FROM kpi_results 
                     WHERE indicator_id = :kpi_id 
                       AND fiscal_year = :year 
                       AND eval_round = :round
                       AND amp_code = :amp_code 
                     LIMIT 1";
        
        $insertSql = "INSERT INTO kpi_results 
                        (fiscal_year, eval_round, indicator_id, amp_code, target_amount, result_amount, result_rate, score, updated_by, updated_at) 
                      VALUES 
                        (:year, :round, :kpi_id, :amp_code, :target, :result, :p, :score, :uid, NOW())";

        $updateSql = "UPDATE kpi_results 
                      SET target_amount = :target, 
                          result_amount = :result, 
                          result_rate = :p,
                          score = :score,
                          updated_by = :uid, 
                          updated_at = NOW()
                      WHERE id = :id";

        $stmtCheck = $db->prepare($checkSql);
        $stmtInsert = $db->prepare($insertSql);
        $stmtUpdate = $db->prepare($updateSql);

        foreach ($data as $ampCode => $values) {
            $target = isset($values['target']) && $values['target'] !== '' ? floatval($values['target']) : 0;
            $result = isset($values['result']) && $values['result'] !== '' ? floatval($values['result']) : 0;
            
            // ✅ รับค่าที่ Frontend คำนวณมาส่งให้
            $p = isset($values['p']) ? floatval($values['p']) : 0;
            $score = isset($values['score']) ? intval($values['score']) : 0;

            $stmtCheck->execute([
                ':kpi_id' => $kpiId,
                ':year' => $year,
                ':round' => $period,
                ':amp_code' => $ampCode
            ]);
            $existing = $stmtCheck->fetch(PDO::FETCH_ASSOC);

            if ($existing) {
                // Update (เพิ่ม :p และ :score)
                $stmtUpdate->execute([
                    ':target' => $target,
                    ':result' => $result,
                    ':p' => $p,
                    ':score' => $score,
                    ':uid' => $userId,
                    ':id' => $existing['id']
                ]);
            } else {
                $stmtInsert->execute([
                    ':year' => $year,
                    ':round' => $period,
                    ':kpi_id' => $kpiId,
                    ':amp_code' => $ampCode,
                    ':target' => $target,
                    ':result' => $result,
                    ':p' => $p,
                    ':score' => $score,
                    ':uid' => $userId
                ]);
            }
        }
    } 

    $db->commit();
    Response::success(['message' => 'บันทึกข้อมูลเรียบร้อยแล้ว']);

} catch (Exception $e) {
    if (isset($db) && $db->inTransaction()) {
        $db->rollBack();
    }
    $code = ($e->getCode() >= 100 && $e->getCode() <= 599) ? $e->getCode() : 500;
    http_response_code($code);
    echo json_encode(['status' => 'error', 'message' => $e->getMessage()]);
}
?>