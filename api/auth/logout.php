<?php
// api/auth/logout.php
require_once '../../config/init.php';

// ลบ Cookie
setcookie('auth_token', '', time() - 3600, '/', '', false, true);

Response::success([], 'ออกจากระบบสำเร็จ');