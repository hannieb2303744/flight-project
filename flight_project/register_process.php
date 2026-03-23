<?php

include "db_connect.php"; 

// Lấy dữ liệu từ FORM (Lưu ý: name trong thẻ <input> phải khớp ở đây)
$username         = trim($_POST['username']);
$email            = trim($_POST['email']);
$password         = $_POST['password'];
$confirm_password = $_POST['confirm_password'];

// 1. Kiểm tra mật khẩu nhập lại
if ($password !== $confirm_password) {
    die("Mật khẩu xác nhận không khớp!");
}

// 2. Kiểm tra Username hoặc Email đã tồn tại chưa (Dùng Prepared Statement)

$sql_check = "SELECT ID_USER FROM users WHERE USERNAME = ? OR EMAIL = ?";
$stmt_check = $conn->prepare($sql_check);
$stmt_check->bind_param("ss", $username, $email);
$stmt_check->execute();
$result_check = $stmt_check->get_result();

if ($result_check->num_rows > 0) {
    die("Username hoặc Email đã tồn tại!");
}

// 3. Mã hóa mật khẩu
$hashed_password = password_hash($password, PASSWORD_DEFAULT);

// 4. Lưu vào database (Phân quyền mặc định là 'user')
// Các cột MAHANHKHACH, MANHANVIEN để NULL nếu bạn chưa xử lý phần đó
$role_default = 'user';

$sql_insert = "INSERT INTO users (USERNAME, EMAIL, PASSWORD, ROLE) VALUES (?, ?, ?, ?)";
$stmt_insert = $conn->prepare($sql_insert);
$stmt_insert->bind_param("ssss", $username, $email, $hashed_password, $role_default);

if ($stmt_insert->execute()) {
    echo "Đăng ký thành công! <a href='login.php'>Đăng nhập ngay</a>";
} else {
    echo "Lỗi: " . $conn->error;
}

$stmt_insert->close();
$conn->close();
?>