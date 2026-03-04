<?php
$servername = "localhost";
$username = "root"; // Mặc định của XAMPP
$password = "";     // Mặc định của XAMPP là để trống
$dbname = "quan_ly_ve_may_bay_thanh"; // THAY ĐỔI TÊN NÀY CHO ĐÚNG VỚI DB CỦA BẠN

// Tạo kết nối
$conn = new mysqli($servername, $username, $password, $dbname);

// Kiểm tra kết nối
if ($conn->connect_error) {
    die("Kết nối thất bại: " . $conn->connect_error);
}

// Thiết lập tiếng Việt (hữu ích cho fullname)
$conn->set_charset("utf8mb4");
?>