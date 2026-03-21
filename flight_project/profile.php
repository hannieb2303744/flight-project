<?php
session_start();
include 'db_connect.php'; // 👈 THIẾU CÁI NÀY

// nếu chưa login thì đá về login
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit();
}

$user_id = $_SESSION["user_id"];

$stmt = $conn->prepare("SELECT * FROM users WHERE ID_USER = ?");
$stmt->bind_param("i", $user_id);
$stmt->execute();
$result = $stmt->get_result();
$user = $result->fetch_assoc();
?>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Thông tin cá nhân</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<div class="auth-wrapper">
  <div class="auth-box">
    <h2>Thông tin cá nhân</h2>

 <div class="profile-item">
  <label>Họ tên</label>
  <span><?php echo $user["FULLNAME"]; ?></span>
</div>

<div class="profile-item">
  <label>Email</label>
  <span><?php echo $user["EMAIL"]; ?></span>
</div>

<div class="profile-item">
  <label>Số điện thoại</label>
  <span><?php echo $user["PHONE"]; ?></span>
</div>

<div class="profile-item">
  <label>Ngày sinh</label>
  <span><?php echo $user["BIRTHDAY"]; ?></span>
</div>

<div class="profile-item">
  <label>Giới tính</label>
  <span><?php echo $user["GENDER"]; ?></span>
</div>
    <a href="homepage.php" class="auth-btn">Quay về trang chủ</a>
  </div>
</div>

</body>
</html>