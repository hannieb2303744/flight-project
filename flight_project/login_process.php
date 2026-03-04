<?php
session_start();
include "config.php";

$username = $_POST['username'];
$password = $_POST['password'];

$sql = "SELECT * FROM users WHERE username='$username'";
$result = mysqli_query($conn, $sql);

if (mysqli_num_rows($result) == 1) {
    $row = mysqli_fetch_assoc($result);
    
    if (password_verify($password, $row['password'])) {
        $_SESSION['username'] = $username;
        $_SESSION['fullname'] = $row['fullname'];
        header("Location: homepage.php");
    } else {
        echo "Sai mật khẩu!";
    }
} else {
    echo "Tài khoản không tồn tại!";
}
?>