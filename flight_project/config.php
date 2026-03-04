<?php
$servername = "localhost";
$username = "root";
$password = "";
$database = "quan_ly_ve_may_bay";

$conn = new mysqli($servername, $username, $password, $database);

if ($conn->connect_error) {
    die("Kết nối thất bại: " . $conn->connect_error);
}
?>