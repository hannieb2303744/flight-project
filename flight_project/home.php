<?php
session_start();
if (!isset($_SESSION["fullname"])) {
    header("Location: login.php");
    exit();
}
?>

<h2>Xin chào <?php echo $_SESSION["fullname"]; ?> 👋</h2>
<a href="logout.php">Đăng xuất</a>