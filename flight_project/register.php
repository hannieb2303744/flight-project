<?php
session_start();
include 'db_connect.php';

$error = "";
$success = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Lấy dữ liệu từ Form (Đảm bảo các name trong thẻ <input> là 'username', 'email', 'password'...)
    $username = trim($_POST["username"]); 
    $email = trim($_POST["email"]);
    $password = $_POST["password"];
    $confirm_password = $_POST["confirm_password"];
    
    $fullname = $_POST["fullname"];
    $phone    = $_POST["phone"];
    $birthday = $_POST["birthday"];
    $gender   = $_POST["gender"];

    if ($password !== $confirm_password) {
        $error = "Mật khẩu xác nhận không khớp!";
    } else {
        // 1. SỬA LỖI: Đổi 'id' thành 'ID_USER' để khớp với DB
        $stmt = $conn->prepare("SELECT ID_USER FROM users WHERE EMAIL = ?");
        $stmt->bind_param("s", $email);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows > 0) {
            $error = "Email này đã được đăng ký!";
        } else {
            // Mã hóa mật khẩu
            $hashed_password = password_hash($password, PASSWORD_DEFAULT);
            
            // 2. SỬA LỖI: Đổi 'fullname' thành 'USERNAME' và 'password' thành 'PASSWORD'
            // Vì bạn chưa phân quyền, mình sẽ để ROLE mặc định là 'customer' hoặc 'user'
            $default_role = 'user';
            
            $stmt = $conn->prepare("
INSERT INTO users (USERNAME, EMAIL, PASSWORD, ROLE, FULLNAME, PHONE, BIRTHDAY, GENDER) 
VALUES (?, ?, ?, ?, ?, ?, ?, ?)
");
            $stmt->bind_param("ssssssss",
    $username,
    $email,
    $hashed_password,
    $role,
    $fullname,
    $phone,
    $birthday,
    $gender
);
            
            if ($stmt->execute()) {
                $success = "Đăng ký thành công! <a href='login.php'>Đăng nhập ngay</a>";
            } else {
                $error = "Có lỗi xảy ra: " . $conn->error;
            }
        }
    }
}
?>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng ký tài khoản - Flight Project</title>
    <link rel="stylesheet" href="style.css?v=1.1">
</head>
<body>

<div class="auth-wrapper">
    <div class="auth-box">
        <h2>ĐĂNG KÝ</h2>

        <?php if ($error != ""): ?>
            <div class="auth-error"><?php echo $error; ?></div>
        <?php endif; ?>

        <?php if ($success != ""): ?>
            <div style="background: #d4edda; color: #155724; padding: 10px; border-radius: 8px; margin-bottom: 1.5rem; font-size: 14px; border: 1px solid #c3e6cb;">
                <?php echo $success; ?>
            </div>
        <?php endif; ?>
        <form method="POST">
        <input type="text" name="fullname" placeholder="Họ và tên">

    <input type="text" name="username" placeholder="Tên đăng nhập" required>
    
    <input type="email" name="email" placeholder="Email" required>
    <input type="text" name="phone" placeholder="Số điện thoại">
<div class="form-row">
  
  <div class="form-group">
    <input type="date" name="birthday">
  </div>

  <div class="form-group">
    <select name="gender">
      <option value="">Giới tính</option>
      <option value="Nam">Nam</option>
      <option value="Nữ">Nữ</option>
      <option value="Khác">Khác</option>
    </select>
  </div>

</div>

    <div class="password-field">
        <input type="password" name="password" id="reg_password" placeholder="Mật khẩu" required>
        <span class="toggle-eye" onclick="togglePassword('reg_password')">👁</span>
    </div>

    <div class="password-field">
        <input type="password" name="confirm_password" id="confirm_password" placeholder="Xác nhận mật khẩu" required>
        <span class="toggle-eye" onclick="togglePassword('confirm_password')">👁</span>
    </div>

    <button type="submit" class="auth-btn">Đăng ký tài khoản</button>
</form>

        <p>Đã có tài khoản? <a href="login.php">Đăng nhập</a></p>
    </div>
</div>

<script>
function togglePassword(id) {
    var input = document.getElementById(id);
    if (input.type === "password") {
        input.type = "text";
    } else {
        input.type = "password";
    }
}
</script>

</body>
</html>