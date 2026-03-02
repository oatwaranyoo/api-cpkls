<?php
require_once '../../config/init.php';

try {
    $database = new Database();
    $db = $database->getConnection();

    // ดึงข้อมูลเรียงตามปีงบประมาณ
    $query = "SELECT month_code, month_abbr, month_name FROM cmonths ORDER BY fiscal_year_order ASC";
    $stmt = $db->prepare($query);
    $stmt->execute();

    $months = [];
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        $months[] = [
            'key' => $row['month_code'],
            'name' => $row['month_abbr'],
            'full' => $row['month_name']
        ];
    }

    echo json_encode([
        "status" => "success",
        "data" => $months
    ]);

} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(["status" => "error", "message" => $e->getMessage()]);
}
?>