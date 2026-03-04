<?php
session_start(); // BẮT BUỘC có để dùng $_SESSION
include 'db_connect.php'; // Đảm bảo bạn đã tạo file này

$error = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = trim($_POST["email"]);
    $password = $_POST["password"];

    // Sử dụng Prepared Statement để chống SQL Injection
    $stmt = $conn->prepare("SELECT * FROM users WHERE email = ?");
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows == 1) {
        $user = $result->fetch_assoc();
        if (password_verify($password, $user["password"])) {
            $_SESSION["fullname"] = $user["fullname"];
            header("Location: homepage.php");
            exit();
        }
    }
    $error = "Email hoặc mật khẩu không đúng!";
}
?>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng nhập - Flight Project</title>
    <link rel="stylesheet" href="style.css?v=1.1">
</head>
<body>

<div class="auth-wrapper">
    <div class="auth-box">
        <h2>ĐĂNG NHẬP</h2>

        <?php if ($error != ""): ?>
            <div class="auth-error"><?php echo $error; ?></div>
        <?php endif; ?>

        <form method="POST">
            <input type="email" name="email" placeholder="Email" required>

            <div class="password-field">
                <input type="password" 
                       name="password" 
                       id="login_password" 
                       placeholder="Mật khẩu" 
                       required>
                <span class="toggle-eye" onclick="togglePassword('login_password')">👁</span>
            </div>

            <button type="submit" class="auth-btn">Đăng nhập</button>
        </form>

        <p>Chưa có tài khoản? <a href="register.php">Đăng ký ngay</a></p>
    </div>
</div>

<script>
function togglePassword(id) {
    var input = document.getElementById(id);
    var icon = event.target;
    if (input.type === "password") {
        input.type = "text";
        icon.innerText = "🔒"; // Đổi icon khi hiện mật khẩu nếu muốn
    } else {
        input.type = "password";
        icon.innerText = "👁";
    }
}
</script>

</body>
</html>