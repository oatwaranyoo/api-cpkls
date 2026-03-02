<?php
require_once '../../config/init.php';

try {
    // 1. ดึงข้อมูลแค่ 1 แถว (LIMIT 1)
    // ⚠️ เช็คใน DB ว่า is_active เป็น '1' หรือ 'Y' แล้วแก้ตรงนี้ให้ตรงกันครับ
    $stmt = $db->query("SELECT fiscal_year, eval_round FROM system_periods WHERE is_active = 'Y' LIMIT 1");
    
    // 2. ใช้ fetch() เพื่อให้ได้ Object เดียว ไม่ใช่ Array
    $period = $stmt->fetch();

    if ($period) {
        Response::success($period);
    } else {
        // Fallback กรณีไม่พบ Active Period
        Response::success([
            'fiscal_year' => (string)(date('Y') + 543),
            'eval_round' => '1'
        ]);
    }

} catch (Exception $e) {
    Response::error($e->getMessage());
}
?>