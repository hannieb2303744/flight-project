<?php
session_start();
include 'db_connect.php';

$error = "";
$success = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $fullname = trim($_POST["fullname"]);
    $email = trim($_POST["email"]);
    $password = $_POST["password"];
    $confirm_password = $_POST["confirm_password"];

    // Kiểm tra mật khẩu khớp nhau
    if ($password !== $confirm_password) {
        $error = "Mật khẩu xác nhận không khớp!";
    } else {
        // Kiểm tra email đã tồn tại chưa
        $stmt = $conn->prepare("SELECT id FROM users WHERE email = ?");
        $stmt->bind_param("s", $email);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows > 0) {
            $error = "Email này đã được đăng ký!";
        } else {
            // Mã hóa mật khẩu và lưu vào DB
            $hashed_password = password_hash($password, PASSWORD_DEFAULT);
            $stmt = $conn->prepare("INSERT INTO users (fullname, email, password) VALUES (?, ?, ?)");
            $stmt->bind_param("sss", $fullname, $email, $hashed_password);
            
            if ($stmt->execute()) {
                $success = "Đăng ký thành công! <a href='login.php'>Đăng nhập ngay</a>";
            } else {
                $error = "Có lỗi xảy ra, vui lòng thử lại.";
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
            <input type="text" name="fullname" placeholder="Họ và tên" required>
            
            <input type="email" name="email" placeholder="Email" required>

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