        <div id="main">
            <?php
                include("sidebar/sidebar.php");
            ?>
        </div>
        <?php
if (isset($_GET['action'])) {
    $action = $_GET['action'];
} else {
    $action = '';
}

// Đường dẫn cơ sở để code gọn hơn
$path = "modules/quanlychuyenbay/";

if ($action == 'them') {
    include($path . "them.php");
} 
elseif ($action == 'sua') {
    include($path . "sua.php");
} 
elseif ($action == 'xuly') {
    include($path . "xuly.php");
} 
elseif ($action == 'lietke') {
    include($path . "lietke.php");
} 
else {
    // Nếu không khớp cái nào hoặc action trống thì vào trang chủ
    include("modules/dashboard.php");
}
?>