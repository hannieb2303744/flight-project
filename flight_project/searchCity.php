<?php

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "quan_ly_ve_may_bay_new";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: ". $conn->connect_error);
}

function Vietnamese($str) {
    $str = iconv('UTF-8', 'ASCII//TRANSLIT//IGNORE', $str);
    return strtolower($str);
}

$q = $_GET['q'] ?? '';
$q = Vietnamese($q);

$sql = $conn->prepare("
    SELECT *
    FROM diadiem a
    JOIN sanbay b ON a.MADIADIEM = b.MADIADIEM 
    WHERE LOWER(a.TENDIADIEM) LIKE CONCAT('%', ?, '%')
");

$sql->bind_param("s", $q);
$sql->execute();
$result = $sql->get_result();

$data = [];
while($row = $result->fetch_assoc()){
    $data[] = $row;
}

echo json_encode($data);

$sql->close();
$conn->close();
?>