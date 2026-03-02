<?php
require_once '../../config/init.php';

try {
    $stmt = $db->query("SELECT id, name, display_name FROM croles WHERE id !=1 ORDER BY id ASC");
    Response::success($stmt->fetchAll());
} catch (Exception $e) {
    Response::error($e->getMessage());
}