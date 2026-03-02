<?php
require_once '../../config/init.php';

// รับ changwatcode (ถ้าไม่ส่งมาจะดึงทั้งหมด)
$chw = isset($_GET['changwatcode']) ? $_GET['changwatcode'] : null;

try {
    $sql = "SELECT ampurcodefull, ampurname, changwatcode FROM campur";
    if ($chw) {
        $sql .= " WHERE changwatcode = :chw";
    }
    $sql .= " ORDER BY ampurcodefull ASC";

    $stmt = $db->prepare($sql);
    if ($chw)
        $stmt->bindParam(':chw', $chw);
    $stmt->execute();

    Response::success($stmt->fetchAll());
} catch (Exception $e) {
    Response::error($e->getMessage());
}