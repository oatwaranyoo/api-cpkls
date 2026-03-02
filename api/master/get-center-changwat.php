<?php
header("Content-Type: application/json; charset=UTF-8");
require_once '../../config/init.php';

// รับค่ารหัสจังหวัดจาก ENV หรือ Config (ถ้าไม่มี Default เป็น 46 กาฬสินธุ์)
$province_code = $_ENV['PROVINCE_CODE'] ?? '46'; 

try {
    $data = null;

    // 1. ลองดึงจาก Database
    try {
        $sql = "SELECT changwatcode, changwatname, lat, lon, zoom_lv 
                FROM cchangwat 
                WHERE changwatcode = :code";
        
        $stmt = $db->prepare($sql);
        $stmt->execute([':code' => $province_code]);
        $data = $stmt->fetch(PDO::FETCH_ASSOC);
    } catch (Exception $dbEx) {
        // ถ้าไม่มีตาราง หรือ Query ผิดพลาด ให้ข้ามไปใช้ Mock
        $data = null;
    }

    // 2. ถ้าไม่เจอข้อมูล ให้ใช้ Default (กาฬสินธุ์)
    if (!$data) {
        $data = [
            'changwatcode' => '46',
            'changwatname' => 'กาฬสินธุ์',
            'lat' => 16.4322,
            'lon' => 103.5061,
            'zoom_lv' => 9
        ];
    }

    Response::success($data);

} catch (Exception $e) {
    Response::error($e->getMessage());
}
?>