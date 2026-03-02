<?php
// ตั้งค่า Headers เพื่อให้ React เรียกเข้ามาได้ และรู้ว่าเป็น JSON
header("Access-Control-Allow-Origin: *"); // หรือระบุ http://localhost:5173
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET");

// แสดงข้อความต้อนรับ
echo json_encode([
    'status' => 'online',
    'message' => 'Welcome to KPI Cockpit 69 API',
    'version' => '1.0.0',
    'timestamp' => date('Y-m-d H:i:s')
], JSON_UNESCAPED_UNICODE);