<?php
require_once '../../config/init.php';

$year = isset($_GET['year']) ? $_GET['year'] : null;

try {
    $sql = "SELECT id, fiscal_year, period_name, eval_round, is_active FROM system_periods";
    if ($year) {
        $sql .= " WHERE fiscal_year = :y";
    }
    $sql .= " ORDER BY id DESC";

    $stmt = $db->prepare($sql);
    if ($year)
        $stmt->bindParam(':y', $year);
    $stmt->execute();

    Response::success($stmt->fetchAll());
} catch (Exception $e) {
    Response::error($e->getMessage());
}