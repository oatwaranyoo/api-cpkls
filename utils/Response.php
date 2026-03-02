<?php
// utils/Response.php

class Response
{
    // ฟังก์ชันพื้นฐานสำหรับส่ง JSON
    public static function json($data = [], $status = 200)
    {
        http_response_code($status);
        echo json_encode($data, JSON_UNESCAPED_UNICODE);
        exit;
    }

    // เรียกใช้เมื่อทำงานสำเร็จ
    public static function success($data = [], $message = 'ดำเนินการสำเร็จ')
    {
        self::json([
            'status' => 'success',
            'message' => $message,
            'data' => $data
        ], 200);
    }

    // เรียกใช้เมื่อเกิดข้อผิดพลาด
    public static function error($message, $status = 400)
    {
        self::json([
            'status' => 'error',
            'message' => $message
        ], $status);
    }
}