<?php
include "config.php";

$username = $_POST['username'];
$password = $_POST['password'];
$confirm_password = $_POST['confirm_password'];

// 1. Kiểm tra mật khẩu nhập lại
if ($password !== $confirm_password) {
    die("Mật khẩu xác nhận không khớp!");
}

// 2. Kiểm tra username đã tồn tại chưa
$sql_check = "SELECT * FROM users WHERE username='$username'";
$result = mysqli_query($conn, $sql_check);

if (mysqli_num_rows($result) > 0) {
    die("Username đã tồn tại!");
}

// 3. Mã hóa mật khẩu
$hashed_password = password_hash($password, PASSWORD_DEFAULT);

// 4. Lưu vào database
$sql_insert = "INSERT INTO users (username, password) 
               VALUES ('$username', '$hashed_password')";

if (mysqli_query($conn, $sql_insert)) {
    echo "Đăng ký thành công! <a href='login.php'>Đăng nhập ngay</a>";
} else {
    echo "Lỗi: " . mysqli_error($conn);
}
?>