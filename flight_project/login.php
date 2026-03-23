<?php
session_start();
include 'db_connect.php'; 

$error = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $email = trim($_POST["email"]);
    $password = $_POST["password"];

    $stmt = $conn->prepare("SELECT * FROM users WHERE EMAIL = ?");
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows == 1) {
        $user = $result->fetch_assoc();

        if (password_verify($password, $user["PASSWORD"])) {

            // Lưu session
            $_SESSION["user_id"]  = $user["ID_USER"];
            $_SESSION["username"] = $user["USERNAME"];
            $_SESSION["role"]     = $user["ROLE"];

            // Điều hướng theo role
if ($user["ROLE"] == 1) {
    header("Location: admincp/index.php");
} else {
    header("Location: homepage.php");
}
        }
    }

    $error = "Email hoặc mật khẩu không đúng!";
    $stmt->close();
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
            <div class="auth-error"><?php echo htmlspecialchars($error); ?></div>
        <?php endif; ?>

        <form method="POST" action="">
            <input type="email" name="email" placeholder="Email" required>

            <div class="password-field">
                <input type="password" 
                       name="password" 
                       id="login_password" 
                       placeholder="Mật khẩu" 
                       required>
                <span class="toggle-eye" onclick="togglePassword('login_password', this)">👁</span>
            </div>

            <button type="submit" class="auth-btn">Đăng nhập</button>
        </form>

        <p>Chưa có tài khoản? <a href="register.php">Đăng ký ngay</a></p>
    </div>
</div>

<script>
function togglePassword(id, el) {
    var input = document.getElementById(id);

    if (input.type === "password") {
        input.type = "text";
        el.innerText = "🔒";
    } else {
        input.type = "password";
        el.innerText = "👁";
    }
}
</script>

</body>
</html>