<?php
$sql_sua_chuyenbay = "SELECT * FROM chuyen_bay 
WHERE ma_chuyen_bay='".$_GET['ma_chuyen_bay']."' LIMIT 1";
$query_sua_chuyenbay = mysqli_query($mysqli,$sql_sua_chuyenbay);
$dong = mysqli_fetch_array($query_sua_chuyenbay);
?>

<p>Sửa chuyến bay</p>

<form method="POST" action="index.php?action=xuly&ma_chuyen_bay=<?php echo $dong['ma_chuyen_bay']; ?>">
<table border="1" width="50%" style="border-collapse: collapse;">
<tr>
<td>Mã chuyến bay</td>
<td>
    <input type="text" value="<?php echo $dong['ma_chuyen_bay']; ?>" readonly>
</td>
</tr>
<tr>
<td>Hãng bay</td>
<td>
<select name="ma_hang">
<?php
$query_hang = mysqli_query($mysqli,"SELECT * FROM hang_hang_khong");
while($row = mysqli_fetch_array($query_hang)){
    $selected = ($row['ma_hang'] == $dong['ma_hang']) ? "selected" : "";
    echo "<option value='".$row['ma_hang']."' $selected>".$row['ten_hang']."</option>";
}
?>
</select>
</td>
</tr>

<tr>
<td>Máy bay</td>
<td>
<select name="ma_may_bay">
<?php
$query_mb = mysqli_query($mysqli,"SELECT * FROM may_bay");
while($row = mysqli_fetch_array($query_mb)){
    $selected = ($row['ma_may_bay'] == $dong['ma_may_bay']) ? "selected" : "";
    echo "<option value='".$row['ma_may_bay']."' $selected>".$row['ten_may_bay']."</option>";
}
?>
</select>
</td>
</tr>

<tr>
<td>Số hiệu chuyến</td>
<td>
<input type="text" name="so_hieu_chuyen"
value="<?php echo $dong['so_hieu_chuyen']; ?>">
</td>
</tr>

<tr>
<td>Sân bay đi</td>
<td>
<select name="san_bay_di">
<?php
$query_sb = mysqli_query($mysqli,"SELECT * FROM san_bay");
while($row = mysqli_fetch_array($query_sb)){
    $selected = ($row['ma_san_bay'] == $dong['san_bay_di']) ? "selected" : "";
    echo "<option value='".$row['ma_san_bay']."' $selected>".$row['ten_san_bay']."</option>";
}
?>
</select>
</td>
</tr>

<tr>
<td>Sân bay đến</td>
<td>
<select name="san_bay_den">
<?php
$query_sb = mysqli_query($mysqli,"SELECT * FROM san_bay");
while($row = mysqli_fetch_array($query_sb)){
    $selected = ($row['ma_san_bay'] == $dong['san_bay_den']) ? "selected" : "";
    echo "<option value='".$row['ma_san_bay']."' $selected>".$row['ten_san_bay']."</option>";
}
?>
</select>
</td>
</tr>

<tr>
<td>Ngày giờ cất cánh</td>
<td>
<input type="datetime-local" name="ngay_gio_cat_canh"
value="<?php echo date('Y-m-d\TH:i', strtotime($dong['ngay_gio_cat_canh'])); ?>">
</td>
</tr>

<tr>
<td>Ngày giờ hạ cánh</td>
<td>
<input type="datetime-local" name="ngay_gio_ha_canh"
value="<?php echo date('Y-m-d\TH:i', strtotime($dong['ngay_gio_ha_canh'])); ?>">
</td>
</tr>

<tr>
<td colspan="2">
<input type="submit" name="suachuyenbay" value="Xác nhận sửa">
</td>
</tr>

</table>
</form>