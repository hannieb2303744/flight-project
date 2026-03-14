<?php
session_start();
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
    <link rel="stylesheet" href="style.css" />
    <title>CaMeoSky.com</title>
  </head>
  <body>
    <header>
      <div class="header">
        <div class="navbar">
          <a href="#" class="logo">
            <h1><i class="fa-solid fa-cloud"></i></h1>
            <h1 class="title">CaMeoSky.com</h1>
          </a>
          <div class="menu">
            <a href="#" class="icon" title="Thông tin liên hệ">
              <i class="fa-solid fa-question"></i>
            </a>
            <a href="#" class="icon">
              <i class="fa-solid fa-ticket" title="Vé đã đặt"></i>
            </a>
            <a href="#" class="icon" title="Lịch sử bay">
              <i class="fa-solid fa-heart"></i>
            </a>
            <?php if (isset($_SESSION['fullname'])): ?>

            <div class="user-dropdown">
              <div class="user user-btn">
                <i class="fa-solid fa-user"></i>
                <span
                  ><b><?php echo $_SESSION['fullname']; ?></b></span
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
    </header>
    <div class="search-box">
      <div class="trip-type">
        <div onclick="showSearchBox()">
          <input type="radio" name="trip" value="oneway" id="oneway" checked />
          <label for="oneway">Khứ hồi</label>
        </div>
        <div onclick="showSearchBox()">
          <input type="radio" name="trip" value="return" id="return" />
          <label for="return">Một chiều</label>
        </div>
      </div>
      <form action="flights.php" method="get">
        <div class="search">
          <div class="text-box">
            <span>Từ</span>
            <input
              type="text"
              name="from"
              placeholder="Nhập tên quốc gia, thành phố"
              class="searchInput"
              required
            />
            <input type="hidden" name="from" class="iata-value" />
            <div class="suggestion"></div>
          </div>

          <div class="text-box">
            <span>Đến</span>
            <input
              type="text"
              name="to"
              placeholder="Nhập tên quốc gia, thành phố"
              class="searchInput"
              required
            />
            <input type="hidden" name="to" class="iata-value" />
            <div class="suggestion"></div>
          </div>
          <div class="text-box">
            <span>Ngày đi</span>
            <input type="date" name="date" required />
          </div>
          <div class="text-box" id="return-date">
            <span>Ngày về</span>
            <input type="date" name="" />
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
    <div class="why-choose-us">
      <h1 class="title-choose">Vì sao nên chọn CaMeoSky ?</h1>
      <div class="choose-container">
        <div class="choose-box">
          <div class="icon-choose">
            <i class="fa-solid fa-chart-column"></i>
          </div>
          <h3>So sánh <br />thông minh</h3>
          <small
            >Hệ thống tự động tổng hợp và so sánh giá vé từ nhiều hãng hàng
            không khác nhau, giúp bạn dễ dàng tìm ra chuyến bay phù hợp nhất với
            mức giá tối ưu chỉ trong vài giây.</small
          >
        </div>
        <div class="choose-box">
          <div class="icon-choose">
            <i class="fa-solid fa-lightbulb"></i>
          </div>
          <h3>Giá vé công khai, minh bạch</h3>
          <small
            >Mọi thông tin về giá vé, thuế và phụ phí đều được hiển thị rõ ràng
            ngay từ đầu. Bạn biết chính xác số tiền cần thanh toán, không có chi
            phí ẩn hay bất ngờ vào phút cuối.</small
          >
        </div>
        <div class="choose-box">
          <div class="icon-choose">
            <i class="fa-solid fa-bolt"></i>
          </div>
          <h3>
            Đặt vé <br />
            nhanh chóng
          </h3>
          <small
            >Chỉ với vài bước đơn giản, bạn có thể hoàn tất việc đặt vé trong
            thời gian ngắn. Giao diện thân thiện giúp việc tìm chuyến bay, chọn
            vé và thanh toán trở nên dễ dàng.</small
          >
        </div>
        <div class="choose-box">
          <div class="icon-choose">
            <i class="fa-solid fa-dollar-sign"></i>
          </div>
          <h3>Thanh toán <br />an toàn</h3>
          <small
            >Hệ thống thanh toán được bảo vệ bằng công nghệ bảo mật hiện đại,
            đảm bảo mọi thông tin cá nhân và giao dịch của bạn luôn được giữ an
            toàn tuyệt đối.</small
          >
        </div>
        <div class="choose-box">
          <div class="icon-choose">
            <i class="fa-solid fa-tags"></i>
          </div>
          <h3>Siêu ưu đãi <br />mỗi ngày</h3>
          <small
            >Liên tục cập nhật các chương trình khuyến mãi và giá vé hấp dẫn từ
            nhiều hãng hàng không, giúp bạn có thêm cơ hội săn được vé rẻ cho
            mọi hành trình.</small
          >
        </div>
      </div>
    </div>
    <div class="discover">
      <div class="discover-box">
        <h3>Bạn vẫn chưa lựa chọn được điểm đến?</h3>
        <a href="" class="btn-discover">
          <h2>Khám Phá Ngay</h2>
        </a>
      </div>
    </div>
<div class="question">
  <h1>Đặt vé máy bay với CaMeoSky</h1>
  <div class="question-box">
    <div class="question-item">
      <div class="question-title">
        <span><b>Làm thế nào để tìm chuyến bay phù hợp với tôi?</b></span>
        <div class="question-arrow-item"><i class="fa-solid fa-caret-down"></i></div>
      </div>
      <div class="question-answer">Bạn chỉ cần nhập điểm đi, điểm đến, ngày bay và số lượng hành khách. Hệ thống sẽ tự động so sánh giá vé từ nhiều hãng hàng không khác nhau để giúp bạn chọn chuyến bay phù hợp nhất.</div>
    </div>
    <div class="question-item">
      <div class="question-title">
        <span><b>Làm thế nào để tìm chuyến bay phù hợp với tôi?</b></span>
        <div class="question-arrow-item"><i class="fa-solid fa-caret-down"></i></div>
      </div>
      <div class="question-answer">Bạn chỉ cần nhập điểm đi, điểm đến, ngày bay và số lượng hành khách. Hệ thống sẽ tự động so sánh giá vé từ nhiều hãng hàng không khác nhau để giúp bạn chọn chuyến bay phù hợp nhất.</div>
    </div>
    <div class="question-item">
      <div class="question-title">
        <span><b>Làm thế nào để tìm chuyến bay phù hợp với tôi?</b></span>
        <div class="question-arrow-item"><i class="fa-solid fa-caret-down"></i></div>
      </div>
      <div class="question-answer">Bạn chỉ cần nhập điểm đi, điểm đến, ngày bay và số lượng hành khách. Hệ thống sẽ tự động so sánh giá vé từ nhiều hãng hàng không khác nhau để giúp bạn chọn chuyến bay phù hợp nhất.</div>
    </div>
    <div class="question-item">
      <div class="question-title">
        <span><b>Làm thế nào để tìm chuyến bay phù hợp với tôi?</b></span>
        <div class="question-arrow-item"><i class="fa-solid fa-caret-down"></i></div>
      </div>
      <div class="question-answer">Bạn chỉ cần nhập điểm đi, điểm đến, ngày bay và số lượng hành khách. Hệ thống sẽ tự động so sánh giá vé từ nhiều hãng hàng không khác nhau để giúp bạn chọn chuyến bay phù hợp nhất.</div>
    </div>
    <div class="question-item">
      <div class="question-title">
        <span><b>Làm thế nào để tìm chuyến bay phù hợp với tôi?</b></span>
        <div class="question-arrow-item"><i class="fa-solid fa-caret-down"></i></div>
      </div>
      <div class="question-answer">Bạn chỉ cần nhập điểm đi, điểm đến, ngày bay và số lượng hành khách. Hệ thống sẽ tự động so sánh giá vé từ nhiều hãng hàng không khác nhau để giúp bạn chọn chuyến bay phù hợp nhất.</div>
    </div>
    <div class="question-item">
      <div class="question-title">
        <span><b>Làm thế nào để tìm chuyến bay phù hợp với tôi?</b></span>
        <div class="question-arrow-item"><i class="fa-solid fa-caret-down"></i></div>
      </div>
      <div class="question-answer">Bạn chỉ cần nhập điểm đi, điểm đến, ngày bay và số lượng hành khách. Hệ thống sẽ tự động so sánh giá vé từ nhiều hãng hàng không khác nhau để giúp bạn chọn chuyến bay phù hợp nhất.</div>
    </div>
    <div class="question-item">
      <div class="question-title">
        <span><b>Làm thế nào để tìm chuyến bay phù hợp với tôi?</b></span>
        <div class="question-arrow-item"><i class="fa-solid fa-caret-down"></i></div>
      </div>
      <div class="question-answer">Bạn chỉ cần nhập điểm đi, điểm đến, ngày bay và số lượng hành khách. Hệ thống sẽ tự động so sánh giá vé từ nhiều hãng hàng không khác nhau để giúp bạn chọn chuyến bay phù hợp nhất.</div>
    </div>
  </div>
</div>
    <footer></footer>
    <script src="js.js"></script>
  </body>
</html>
