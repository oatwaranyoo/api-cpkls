<?php
require_once '../../config/init.php';

try {
    // 1. ดึง Excellence หลัก
    $stmtEx = $db->query("SELECT id, name FROM cexcellence ORDER BY id ASC");
    $excellences = $stmtEx->fetchAll();

    // 2. ดึง Sub-Excellence ทั้งหมด
    $stmtSub = $db->query("SELECT id, ex_id, code, name FROM csub_excellence ORDER BY code ASC");
    $subExcellences = $stmtSub->fetchAll();

    // 3. จับคู่ลูกเข้ากับแม่
    foreach ($excellences as &$ex) {
        $ex['sub_excellence'] = array_values(array_filter($subExcellences, function ($sub) use ($ex) {
            return $sub['ex_id'] == $ex['id'];
        }));
    }

    Response::success($excellences);
} catch (Exception $e) {
    Response::error($e->getMessage());
}