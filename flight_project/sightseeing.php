<?php
session_start();
$conn = new mysqli("localhost", "root", "", "quan_ly_ve_may_bay");
if ($conn->connect_error) {
    die("Kết nối thất bại");
}
if (isset($_GET['madiemdulich'])) {
    $madiemdulich = $_GET['madiemdulich'];
}
$sql1 = "SELECT * FROM diemdulich WHERE MADIEMDULICH = '$madiemdulich'";
$result1 = $conn->query($sql1);
$diemdulich = $result1->fetch_assoc();

$diemthamquan = [];
$sql2 = "SELECT * FROM diemthamquan WHERE MADIEMDULICH = '$madiemdulich'";
$result2 = $conn->query($sql2);
while ($row2 = $result2->fetch_assoc()) {
    $diemthamquan[] = $row2;
}

$sql = "SELECT a.MADIADIEM, a.TENDIADIEM, b.TENSANBAY, a.QUOC_GIA
        FROM diadiem a
        JOIN sanbay b ON a.MADIADIEM = b.MADIADIEM
        ORDER BY a.TENDIADIEM ASC";
$result = $conn->query($sql);
$diadiem_list = [];
while($row = $result->fetch_assoc()){
    $diadiem_list[] = $row;
}
?>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"
    />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap"
      rel="stylesheet"
    />

    <title>CaMeoSky.com</title>
    <link rel="stylesheet" href="style.css" />
  </head>
  <body>
    <header>
      <div class="header">
        <div class="navbar">
          <a href="homepage.php" class="logo">
            <h1><i class="fa-solid fa-cloud"></i></h1>
            <h1 class="title">CaMeoSky.com</h1>
          </a>
          <div class="menu">
            <!-- <a href="#" class="icon" title="Thông tin liên hệ">
              <i class="fa-solid fa-question"></i>
            </a> -->
            <a href="<?php 
                        if(isset($_SESSION['user'])) {
                            echo 'destination.php';
                        } else {
                            echo 'login.php'; 
                        }
                    ?>" class="icon">
              <i class="fa-solid fa-ticket" title="Vé đã đặt"></i>
            </a>
            <!-- <a href="#" class="icon" title="Lịch sử bay">
              <i class="fa-solid fa-heart"></i>
            </a> -->
            <?php if (isset($_SESSION['username'])): ?>

            <div class="user-dropdown">
              <div class="user user-btn">
                <i class="fa-solid fa-user"></i>
                <span
                  ><b><?php echo $_SESSION['username']; ?></b></span
                >
              </div>

              <div class="dropdown-menu" id="dropdownMenu">
                <a href="profile.php">Thông tin cá nhân</a>
                <a href="logout.php">Đăng xuất</a>
              </div>
            </div>

            <?php else: ?>

            <a href="login.php" class="user">
              <i class="fa-solid fa-user"></i>
              <span><b>Đăng nhập</b></span>
            </a>

            <?php endif; ?>
          </div>
        </div>
        <h2 class="title">So sánh thông minh - Bay xa giá tốt</h2>
      </div>
      <div class="search-box" >
      <div class="trip-type">
        <div onclick="showSearchBox()">
          <input type="radio" name="trip" value="return" id="return" checked />
          <label for="return">Khứ hồi</label>
        </div>
        <div onclick="showSearchBox()">
          <input type="radio" name="trip" value="oneway" id="oneway" />
          <label for="oneway">Một chiều</label>
        </div>
      </div>
      <form action="flights.php" method="get">
        <div class="search">
          <div class="text-box">
          <span>Từ</span>
          <input type="text" name="from" list="from-list" placeholder="Nhập tên quốc gia, thành phố" required>
          <input type="hidden" name="from_code">
          <datalist id="from-list">
            <?php foreach($diadiem_list as $d): ?>
              <option value="<?= $d['TENDIADIEM'] ?> (<?= $d['MADIADIEM'] ?>)" data-code="<?= $d['MADIADIEM'] ?>">
                <?= $d['TENSANBAY'] ?> - <?= $d['QUOC_GIA'] ?>
              </option>
            <?php endforeach; ?>
          </datalist>
        </div>

          <div class="text-box">
            <span>Đến</span>
            <input type="text" name="to" list="to-list" placeholder="Nhập tên quốc gia, thành phố" required>
            <input type="hidden" name="to_code" class="iata-value">
            <datalist id="to-list">
              <?php foreach($diadiem_list as $d): ?>
                <option value="<?php echo $d['TENDIADIEM'] . ' (' . $d['MADIADIEM'] . ')'; ?>" data-code="<?php echo $d['MADIADIEM']; ?>">
                  <?php echo $d['TENSANBAY'] . ' - ' . $d['QUOC_GIA']; ?>
                </option>
              <?php endforeach; ?>
            </datalist>
          </div>
          <div class="text-box" id="departure-date">
            <span>Ngày đi</span>
            <input
              type="date"
              name="departure-date"
              id="departure-date-input"
              required
            />
          </div>
          <div class="text-box" id="return-date">
            <span>Ngày về</span>
            <input type="date" name="return-date" id="return-date-input" />
          </div>
          <div class="text-box">
            <span>Số lượng khách</span>
            <input type="number" name="pax" min="1" value="1" required />
          </div>
        </div>
        <div class="btn-search">
          <input type="submit" id="btn-search" />
          <label for="btn-search"><b>Tìm kiếm vé</b></label>
        </div>
      </form>
    </div>
    </header>
    <div class="destination-title">
        <h1><?php echo $diemdulich['TENDIEMDULICH']; ?></h1>
        <div class="destination-title-img">
          <div class="destination-title-img-main">
            <img src="<?php echo $diemdulich['HINHANH'] ;?>" >
          </div>
          <?php
            $count = 0;
            foreach($diemthamquan as $row2){
                if($count == 4) break;
          ?>
          <div class="destination-title-img-item">
              <img src="<?php echo $row2['HINHANH']; ?>">
          </div>
          <?php $count++; }?>
        </div>
    </div>
    <div class="destination-main">
        <div class="destination-left">
            <h1>Tổng quan</h1>
            <p><?php echo $diemdulich['MOTA1'] ?></p>
            <a href="#" class="book-now" 
              data-to="<?= htmlspecialchars($diemdulich['TENDIEMDULICH'] . ' (' . $diemdulich['MADIEMDULICH'] . ')') ?>">
              <b>Đặt vé ngay</b>
            </a>
        </div>
        <div class="destination-right">
            <div class="destination-infor">
                <img src="https://vja-travel.useleadr.com/uploads/icon-danso-2.svg" alt="">              
                <div class="destination-infor-title">
                    <span><b>Dân số</b></span>
                    <span><?php echo $diemdulich['DANSO'] ;?></span>
                </div>
            </div>
            <div class="destination-infor">
                <img src="https://vja-travel.useleadr.com/uploads/icon-dientich-5.svg" alt="">
                <div class="destination-infor-title">
                    <span><b>Diện tích</b></span>
                    <span><?php echo $diemdulich['DIENTICH'] ;?></span>
                </div>
            </div>
            <div class="destination-infor">
                <img src="https://vja-travel.useleadr.com/uploads/icon-muigio-3.svg" alt="">
                <div class="destination-infor-title">
                    <span><b>Múi giờ</b></span>
                    <span><?php echo $diemdulich['MUIGIO'] ;?></span>
                </div>
            </div>
            <div class="destination-infor">
                <img src="https://vja-travel.useleadr.com/uploads/icon-ngonngu-6.svg" alt="">
                <div class="destination-infor-title">
                    <span><b>Ngôn ngữ</b></span>
                    <span><?php echo $diemdulich['NGONNGU'] ;?></span>
                </div>
            </div>
            <div class="destination-infor">
                <img src="https://vja-travel.useleadr.com/uploads/icon-quocgia-1.svg" alt="">
                <div class="destination-infor-title">
                    <span><b>Quốc gia</b></span>
                    <span><?php echo $diemdulich['QUOCGIA'] ;?></span>
                </div>
            </div>
            <div class="destination-infor">
                <img src="https://vja-travel.useleadr.com/uploads/icon-sanbay-4.svg" alt="">
                <div class="destination-infor-title">
                    <span><b>Sân bay</b></span>
                    <span><?php echo $diemdulich['SANBAY'] ;?></span>
                </div>
            </div>
            <div class="destination-infor">
                <img src="https://vja-travel.useleadr.com/uploads/icon-tiente-7.svg" alt="">
                <div class="destination-infor-title">
                    <span><b>Tiền tệ</b></span>
                    <span><?php echo $diemdulich['TIENTE'] ;?></span>
                </div>
            </div>
        </div>
    </div>
    <div class="sight-seeing">
      <div class="sight-seeing-title">
          <h1>Tham quan</h1>
          <p><?php echo $diemdulich['MOTA2'] ?></p>
      </div>
      <div class="destination-group">
        <?php
          foreach ($diemthamquan as $row) {
          ?>
              <a href="#" class="destination-box" 
                  style="background-image: url('<?php echo $row['HINHANH']; ?>');">
                  <h3><?php echo $row['TENDIEMTHAMQUAN']; ?></h3>
              </a>
          <?php } ?>
      </div>
    </div>
    <footer class="footer">
      <div class="footer-container">
        <div class="footer-item">
        <div class="footer-title">
          <a href="#" class="logo">
          <h1><i class="fa-solid fa-cloud"></i></h1>
          <h1 class="title">CaMeoSky.com</h1>
        </a>
        <h3>So sánh thông minh - Bay xa giá tốt</h3>
        </div>
        <span>Hãng bay đã hợp tác với chúng tôi:</span>
        <div class="flight-list">
          <div><img src="https://thuvienvector.vn/wp-content/uploads/2025/04/hoa-sen-vang-logo-vietnam-airlines.jpg" alt="VietNam Airlines" ></div>
          <div><img src="https://ibrand.vn/wp-content/uploads/2024/10/Logo-vietjet-1.jpg" alt="VietjetAir"></div>
          <div><img src="https://i.pinimg.com/736x/33/24/f4/3324f40c4aea5b0a5a999e3d16d678c1.jpg" alt="Bamboo Airways"></div>
          <div><img src="https://diemdenantoan.sgtiepthi.vn/wp-content/uploads/2021/12/Untitled-design-5.png" alt="VietTravel"></div>
        </div>
      </div>
      <div class="footer-item">
        <h2>Liên hệ với chúng tôi:</h2>
        <span><i class="fa-solid fa-at"></i> dhct@ctu.edu.vn</span>
        <span><i class="fa-solid fa-phone"></i> +84292 3831 530; 3838 237; 3832 663</span>
        <span><i class="fa-solid fa-location-dot"></i>    Khu 2, Đ. 3/2, P. Ninh Kiều, TP. Cần Thơ</span>
      </div>
      <div class="footer-item">
        <h2>Theo dõi chúng tôi tại:</h2>
        <div class="social">
          <a href="https://www.facebook.com/CTUDHCT/?locale=vi_VN"><i class="fa-brands fa-facebook"></i></a>
          <a href="https://www.instagram.com/ctudhct?fbclid=IwY2xjawQnRU1leHRuA2FlbQIxMABicmlkETFneVZyendWVHZORlFxM3BJc3J0YwZhcHBfaWQQMjIyMDM5MTc4ODIwMDg5MgABHkuIuwIA69lMBUr8NwBoUApBtFiOzyXh0-V857F5Vw87DPIOPRClMz4PRP0Q_aem_-F-lXNYP_QuXXdtHw1K-Ig"><i class="fa-brands fa-instagram"></i></a>
          <a href="https://x.com/CTUDHCT"><i class="fa-brands fa-twitter"></i></a>
        </div>
      </div>
      </div>
      <div class="footer-last">
        <h3>© 2026 CaMeoSky. All rights reserved.</h2>
      </div>
    </footer>
    <script src="js.js"></script>
  </body>
</html>
