<?php
// Khởi động session (dùng cho login, booking, thanh toán)
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

// Timezone Việt Nam
date_default_timezone_set('Asia/Ho_Chi_Minh');

// Hàm kết nối DB bằng PDO
function db(): PDO {
    static $pdo = null;
    if ($pdo !== null) return $pdo;

    $host = "localhost";
    $dbname = "quan_ly_ve_may_bay_new";
    $user = "root";
    $pass = "";
    $charset = "utf8mb4";

    $dsn = "mysql:host=$host;dbname=$dbname;charset=$charset";

    try {
        $pdo = new PDO($dsn, $user, $pass, [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
        ]);
    } catch (PDOException $e) {
        die("Kết nối thất bại: " . $e->getMessage());
    }

    return $pdo;
}

// Hàm format tiền VND
function vnd($n): string {
    return number_format((int)$n, 0, ",", ".") . " VND";
}
?>