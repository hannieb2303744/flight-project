<p>Thêm chuyến bay mới</p>
<table border="1" width="50%" style="border-collapse: collapse;">
  <form method="POST" action="modules/quanlychuyenbay/xuly.php">
    <tr>
      <td>Hãng bay</td>
      <td>
        <select name="ma_hang" required>
          <option value="">--Chọn hãng bay--</option>
          <?php
          $sql_hang = "SELECT * FROM hang_hang_khong";
          $query_hang = mysqli_query($mysqli, $sql_hang);
          while($row = mysqli_fetch_array($query_hang)){
            echo '<option value="'.$row['ma_hang'].'">'.$row['ten_hang'].'</option>';
          }
          ?>
        </select>
      </td>
    </tr>
    <tr>
      <td>Máy bay</td>
      <td>
        <select name="ma_may_bay" required>
          <option value="">--Chọn máy bay--</option>
          <?php
          $sql_maybay = "SELECT * FROM may_bay";
          $query_maybay = mysqli_query($mysqli, $sql_maybay);
          while($row = mysqli_fetch_array($query_maybay)){
            echo '<option value="'.$row['ma_may_bay'].'">'.$row['ten_may_bay'].'</option>';
          }
          ?>
        </select>
      </td>
    </tr>
    <tr>
      <td>Số hiệu chuyến</td>
      <td><input type="text" name="so_hieu_chuyen" required></td>
    </tr>
    <tr>
      <td>Sân bay đi</td>
      <td>
        <select name="san_bay_di" required>
          <option value="">--Chọn sân bay đi--</option>
          <?php
            $query_sb = mysqli_query($mysqli, "SELECT * FROM san_bay");
            while($row = mysqli_fetch_array($query_sb)){
              echo '<option value="'.$row['ma_san_bay'].'">'.$row['ten_san_bay'].' ('.$row['ma_san_bay'].')</option>';
            }
          ?>
        </select>
      </td>
    </tr>
    <tr>
      <td>Sân bay đến</td>
      <td>
        <select name="san_bay_den" required>
          <option value="">--Chọn sân bay đến--</option>
          <?php
            $query_sb = mysqli_query($mysqli, "SELECT * FROM san_bay");
            while($row = mysqli_fetch_array($query_sb)){
              echo '<option value="'.$row['ma_san_bay'].'">'.$row['ten_san_bay'].' ('.$row['ma_san_bay'].')</option>';
            }
          ?>
        </select>
      </td>
    </tr>
    <tr>
      <td>Ngày giờ cất cánh</td>
      <td><input type="datetime-local" name="ngay_gio_cat_canh" required></td>
    </tr>
    <tr>
      <td>Ngày giờ hạ cánh</td>
      <td><input type="datetime-local" name="ngay_gio_ha_canh" required></td>
    </tr>
    <!-- <tr>
      <td>Thời gian bay (phút)</td>
      <td><input type="text" name="thoi_gian_bay_phut" required></td>
    </tr> -->
    <tr>
      <td colspan="2"><input type="submit" name="themchuyenbay" value="Xác nhận thêm chuyến bay"></td>
    </tr>
  </form>
</table>