<?php
include('../../config/config.php');
$ma_hang = $_POST['ma_hang'];
$ma_may_bay = $_POST['ma_may_bay'];
$so_hieu_chuyen = $_POST['so_hieu_chuyen'];
$san_bay_di = $_POST['san_bay_di'];
$san_bay_den = $_POST['san_bay_den'];
$ngay_gio_cat_canh = $_POST['ngay_gio_cat_canh'];
$ngay_gio_ha_canh = $_POST['ngay_gio_ha_canh'];
//$thoi_gian_bay_phut = $_POST['thoi_gian_bay_phut'];
$thoigian1 = new DateTime($ngay_gio_cat_canh);
$thoigian2 = new DateTime($ngay_gio_ha_canh);
$thoigianend = $thoigian1->diff($thoigian2);
$thoi_gian_bay_phut = ($thoigianend->days * 24 * 60) 
                    + ($thoigianend->h * 60) 
                    + $thoigianend->i;

if(isset($_POST['themchuyenbay'])){
    //them
    if($thoigian2 <= $thoigian1){
    echo "<script>alert('Giờ hạ cánh phải lớn hơn giờ cất cánh');</script>";
    exit();
    }
    $sql_them = "INSERT INTO chuyen_bay(ma_hang, ma_may_bay, so_hieu_chuyen, san_bay_di, san_bay_den, ngay_gio_cat_canh, ngay_gio_ha_canh) 
    VALUE ('".$ma_hang."','".$ma_may_bay."', '".$so_hieu_chuyen."', '".$san_bay_di."', '".$san_bay_den."', '".$ngay_gio_cat_canh."', '".$ngay_gio_ha_canh."')";
    mysqli_query($mysqli,$sql_them);
    header('Location:../../index.php?action=quanlychuyenbay&query=them');
}elseif(isset($_POST['suachuyenbay'])){
    //sua
    $sql_update = "UPDATE chuyen_bay 
    SET 
    ma_hang='".$ma_hang."',
    ma_may_bay = '".$ma_may_bay."',
    so_hieu_chuyen='".$so_hieu_chuyen."', 
    san_bay_di='".$san_bay_di."', 
    san_bay_den='".$san_bay_den."', 
    ngay_gio_cat_canh='".$ngay_gio_cat_canh."', 
    ngay_gio_ha_canh='".$ngay_gio_ha_canh."', 
    thoi_gian_bay_phut='".$thoi_gian_bay_phut."'
    WHERE ma_chuyen_bay='$_GET[ma_chuyen_bay]'";
    mysqli_query($mysqli,$sql_update);
    header('Location: index.php?action=quanlychuyenbay&query=them');
}else{
    // xoa
    $ma_chuyen_bay=$_GET['ma_chuyen_bay'];
    $sql_xoa = "DELETE FROM chuyen_bay WHERE ma_chuyen_bay='".$ma_chuyen_bay."'";
    mysqli_query($mysqli,$sql_xoa);
    header('Location:../../index.php?action=quanlychuyenbay&query=them');
}
?>