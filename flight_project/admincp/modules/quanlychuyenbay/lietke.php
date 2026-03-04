<?php
    $sql_lietke_chuyenbay = "SELECT chuyen_bay.*, hang_hang_khong.ten_hang as ten_hang, may_bay.ten_may_bay, sb_di.ten_san_bay AS ten_san_bay_di, sb_den.ten_san_bay AS ten_san_bay_den,
                                CASE
                                    WHEN TIMESTAMPDIFF(MINUTE, ngay_gio_cat_canh, ngay_gio_ha_canh) < 60
                                        THEN CONCAT(
                                            TIMESTAMPDIFF(MINUTE, ngay_gio_cat_canh, ngay_gio_ha_canh),
                                            ' phút'
                                        )
                                    WHEN MOD(TIMESTAMPDIFF(MINUTE, ngay_gio_cat_canh, ngay_gio_ha_canh), 60) = 0
                                        THEN CONCAT(
                                            FLOOR(TIMESTAMPDIFF(MINUTE, ngay_gio_cat_canh, ngay_gio_ha_canh)/60),
                                            ' giờ'
                                        )
                                    ELSE CONCAT(
                                            FLOOR(TIMESTAMPDIFF(MINUTE, ngay_gio_cat_canh, ngay_gio_ha_canh)/60),
                                            ' giờ ',
                                            MOD(TIMESTAMPDIFF(MINUTE, ngay_gio_cat_canh, ngay_gio_ha_canh),60),
                                            ' phút'
                                        )
                                END AS thoi_gian_bay_phut
                            FROM chuyen_bay
                            LEFT JOIN hang_hang_khong ON chuyen_bay.ma_hang = hang_hang_khong.ma_hang
                            LEFT JOIN may_bay ON chuyen_bay.ma_may_bay = may_bay.ma_may_bay
                            LEFT JOIN san_bay sb_di ON chuyen_bay.san_bay_di = sb_di.ma_san_bay
                            LEFT JOIN san_bay sb_den ON chuyen_bay.san_bay_den = sb_den.ma_san_bay
                            ORDER BY chuyen_bay.ma_chuyen_bay ASC";
    $query_lietke_chuyenbay = mysqli_query($mysqli,$sql_lietke_chuyenbay);
?>
<table style="width:100%" border="1" style="border-collapse: collapse;">
  <tr>
    <th>STT</th>
    <th>Mã chuyến bay</th>
    <th>Hãng bay</th>
    <th>Máy bay</th>
    <th>Số hiệu chuyến</th>
    <th>Sân bay đi</th>
    <th>Sân bay đến</th>
    <th>Ngày giờ cất cánh</th>
    <th>Ngày giờ hạ cánh</th>
    <th>Thời gian bay (phút)</th>
    <th>Cập nhật</th>
  </tr>
  <?php
  $i = 0;
  while($row = mysqli_fetch_array($query_lietke_chuyenbay)){
    $i++;
  ?>
  <tr>
    <td><?php echo $i ?></td>
    <td><?php echo "CB" . str_pad($row['ma_chuyen_bay'], 3, "0", STR_PAD_LEFT); ?></td>
    <td><?php echo $row['ten_hang'] ?></td>
    <td><?php echo $row['ten_may_bay'] ?></td>
    <td><?php echo $row['so_hieu_chuyen'] ?></td>
    <td><?php echo $row['ten_san_bay_di'] ?></td>
    <td><?php echo $row['ten_san_bay_den'] ?></td>
    <td><?php echo $row['ngay_gio_cat_canh'] ?></td>
    <td><?php echo $row['ngay_gio_ha_canh'] ?></td>
    <td><?php echo $row['thoi_gian_bay_phut'] ?></td>
    <td>
        <a href="modules/quanlychuyenbay/xuly.php?ma_chuyen_bay=<?php echo $row['ma_chuyen_bay'] ?>">Xóa</a> | <a href="index.php?action=sua&ma_chuyen_bay=<?php echo $row['ma_chuyen_bay'] ?>">Sửa</a>
    </td>
  </tr>
  <?php
  }
  ?>
</table>