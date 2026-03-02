<?php
require_once '../../config/init.php';

if (!isset($_GET['id']) || !isset($_GET['round'])) {
    Response::error('กรุณาระบุ ID และ รอบการประเมิน');
}

$ind_id = $_GET['id'];
$round = $_GET['round']; // เช่น 'รอบที่ 1'

try {
    $sql = "SELECT * FROM indicator_criteria 
            WHERE indicator_id = :id AND eval_round = :r";

    $stmt = $db->prepare($sql);
    $stmt->execute([':id' => $ind_id, ':r' => $round]);
    $criteria = $stmt->fetch();

    if ($criteria) {
        Response::success($criteria);
    } else {
        Response::error('ไม่พบเกณฑ์คะแนนของรอบนี้', 404);
    }
} catch (Exception $e) {
    Response::error($e->getMessage());
}