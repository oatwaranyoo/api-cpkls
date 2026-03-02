<?php
require_once '../../config/init.php';

// 1. เช็ค Login
if (!isset($_COOKIE['auth_token'])) Response::error('Unauthorized', 401);
$user = JwtHelper::decode($_COOKIE['auth_token'])['data'];

$year = isset($_GET['year']) ? $_GET['year'] : '2569';
$round = isset($_GET['round']) ? $_GET['round'] : 'รอบที่ 1';

try {
    // Logic: ดึงตัวชี้วัดทั้งหมดที่ User ต้องรับผิดชอบ (หรือสังกัดกลุ่มงานนั้น)
    // แล้ว Join กับ kpi_results เพื่อดูว่าส่งหรือยัง
    // (ตัวอย่างนี้เลือกแบบง่าย: ดึงทั้งหมดแล้วมาเช็คฝั่ง Frontend หรือ Left Join เอา NULL)
    
    $sql = "SELECT i.id, i.name, i.unit, kr.status, kr.result_amount, kr.target_amount 
            FROM indicators i
            LEFT JOIN kpi_results kr ON i.id = kr.indicator_id 
                AND kr.hospcode = :hosp 
                AND kr.fiscal_year = :y 
                AND kr.eval_round = :r
            WHERE i.fiscal_year = :y 
            AND i.status = 'ACTIVE'
            AND (kr.status IS NULL OR kr.status = 'DRAFT' OR kr.status = 'REJECTED')
            ORDER BY i.id ASC";

    $stmt = $db->prepare($sql);
    $stmt->execute([
        ':hosp' => $user['hospcode'],
        ':y' => $year,
        ':r' => $round
    ]);
    
    Response::success($stmt->fetchAll());
} catch (Exception $e) {
    Response::error($e->getMessage());
}