<?php
// api/dashboard/get-spider.php
header("Content-Type: application/json; charset=UTF-8");
require_once '../../config/init.php';

$year = $_GET['year'] ?? (date('Y') + 543);
$round = $_GET['round'] ?? 1;

try {
    $data = [];

    // 1. ลองดึงข้อมูลจาก Database จริง
    try {
        // แก้ชื่อ Table และ Column ให้ตรงกับ Database ของคุณ
        $sql = "SELECT ex_name AS dimension_name, weighted_score, score 
                FROM view_report_spider 
                WHERE fiscal_year = :year AND eval_round = :round
                ORDER BY ex_id ASC";

        $stmt = $db->prepare($sql);
        $stmt->execute([':year' => $year, ':round' => $round]);
        $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    } catch (Exception $dbEx) {
        // ถ้า Query ไม่ผ่าน ให้ข้ามไปใช้ Mock Data
        $data = [];
    }

    // ส่งค่ากลับ
    Response::success($data);

} catch (Exception $e) {
    Response::error($e->getMessage());
}
?>