<?php
// config/Database.php

class Database
{
    private $conn;

    public function connect()
    {
        $this->conn = null;
        try {
            // ดึงค่าจาก .env ที่โหลดโดย vlucas/phpdotenv
            $host = $_ENV['DB_HOST'];
            $db_name = $_ENV['DB_NAME'];
            $username = $_ENV['DB_USER'];
            $password = $_ENV['DB_PASS'];
            $charset = $_ENV['DB_CHARSET'];

            $dsn = "mysql:host=" . $host . ";dbname=" . $db_name . ";charset=" . $charset;

            $this->conn = new PDO($dsn, $username, $password);
            $this->conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            $this->conn->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);

        } catch (PDOException $e) {
            // ส่ง JSON Error กลับทันทีถ้าต่อ DB ไม่ได้
            header("Content-Type: application/json");
            http_response_code(500);
            echo json_encode(['status' => 'error', 'message' => "Database Connection Error: " . $e->getMessage()]);
            exit;
        }
        return $this->conn;
    }
}