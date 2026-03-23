<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
require_once __DIR__ . "/db.php";

// hàm query chuyến bay dùng cả hai chiều
function getFlights($from, $to, $date) {
    $sql = "
    SELECT
        cb.MACHUYENBAY,
        hmb.TENHANG,
        sbdi.MASANBAY AS diem_di,
        sbden.MASANBAY AS diem_den,
        sbdi.TENSANBAY AS ten_san_bay_di,
        sbden.TENSANBAY AS ten_san_bay_den,
        cb.THOIGIANDI,
        cb.THOIGIANDEN,
        TIMESTAMPDIFF(MINUTE, cb.THOIGIANDI, cb.THOIGIANDEN) AS thoi_gian_bay_phut,
        MIN(g.GIAGHE) AS gia_tu,
        COUNT(DISTINCT g.MALOAIGHE) AS so_loai_ghe,
        COUNT(g.MAGHE) AS tong_so_ghe_trong
    FROM chuyenbay cb
    JOIN maybay mb ON mb.MAMAYBAY = cb.MAMAYBAY
    JOIN hangmaybay hmb ON hmb.MAHANG = mb.MAHANG
    JOIN sanbay sbdi ON sbdi.MASANBAY = cb.MASANBAYDI
    JOIN sanbay sbden ON sbden.MASANBAY = cb.MASANBAYDEN
    JOIN ghe g ON g.MAMAYBAY = cb.MAMAYBAY
    WHERE cb.MASANBAYDI = :from
      AND cb.MASANBAYDEN = :to
      AND DATE(cb.THOIGIANDI) = :departure_date
      AND g.TRANGTHAI = 'TRONG'
    GROUP BY
        cb.MACHUYENBAY, hmb.TENHANG,
        sbdi.MASANBAY, sbden.MASANBAY,
        sbdi.TENSANBAY, sbden.TENSANBAY,
        cb.THOIGIANDI, cb.THOIGIANDEN
    ORDER BY gia_tu ASC, cb.THOIGIANDI ASC
    ";

    $stmt = db()->prepare($sql);
    $stmt->execute([
        ":from" => $from,
        ":to" => $to,
        ":departure_date" => $date
    ]);

    return $stmt->fetchAll();
}

$from = strtoupper(trim($_GET["from"] ?? "SGN"));
$to   = strtoupper(trim($_GET["to"] ?? "HAN"));
$trip_type = $_GET["trip_type"] ?? "oneway";
$departure_date = $_GET["departure_date"] ?? date("Y-m-d");
$return_date = $_GET["return_date"] ?? null;
$pax  = max(1, (int)($_GET["pax"] ?? 1));

echo '<pre>';
print_r($_GET);
echo '</pre>';

echo '<pre>';
print_r($_GET);
exit;

$flash = $_SESSION["flash_error"] ?? null;
unset($_SESSION["flash_error"]);

if ($departure_date < date("Y-m-d")) {
    $_SESSION["flash_error"] = "Không thể tìm vé cho ngày trong quá khứ.";
    header("Location: homepage.php");
    exit;
}

if ($trip_type === "roundtrip") {
    if (empty($return_date)) {
        $_SESSION["flash_error"] = "Vui lòng chọn ngày về cho vé khứ hồi.";
        header("Location: homepage.php");
        exit;
    }

    if ($return_date < $departure_date) {
        $_SESSION["flash_error"] = "Ngày về phải lớn hơn hoặc bằng ngày đi.";
        header("Location: homepage.php");
        exit;
    }
}

// Query: danh sách chuyến bay + giá từ + số loại vé
$departure_flights = getFlights($from, $to, $departure_date);
$return_flights = [];
if ($trip_type === "roundtrip" && !empty($return_date)) {
    $return_flights = getFlights($to, $from, $return_date);
}

function phút_thành_giờ($m){
  $h = intdiv((int)$m, 60);
  $mi = (int)$m % 60;
  return $h . "h " . $mi . "m";
}

?>
<!doctype html>
<html lang="vi">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <title>Danh sách vé</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body{background:#f5f7fb;}
    .card{border-radius:16px;}
    .flight-card{border-radius:14px;}
    .price{font-weight:800;}
    .badge-soft{background:#eef2ff;color:#334155;}
  </style>
</head>
<body class="py-4">
<div class="container">

  <?php if ($flash): ?>
    <div class="alert alert-danger"><?= htmlspecialchars($flash) ?></div>
  <?php endif; ?>

  <div class="card shadow-sm mb-3">
    <div class="card-body">
      <div class="d-flex flex-wrap justify-content-between align-items-center gap-2">
        <div>
          <div class="h5 mb-1"><?= htmlspecialchars($from) ?> → <?= htmlspecialchars($to) ?></div>
          <div class="text-muted">Ngày <?= htmlspecialchars($departure_date ) ?> | <?= (int)$pax ?> hành khách</div>
        </div>
        <a class="btn btn-outline-primary" href="homepage.php">Đổi tìm kiếm</a>
      </div>
    </div>
  </div>

  <!-- lặp qua ds chuyến bay để hiện các chuyến -->

  <!--cart chiều đi -->
<h5>Chiều đi: <?= htmlspecialchars($from) ?> → <?= htmlspecialchars($to) ?></h5>

<?php if (!count($departure_flights)): ?>
  <div class="alert alert-warning">Không tìm thấy chuyến bay phù hợp.</div>
<?php endif; ?>

<?php foreach ($departure_flights as $f): ?>
  <div class="card flight-card shadow-sm mb-3">
    <div class="card-body">
      <div class="d-flex flex-wrap justify-content-between gap-3">
        <div>
          <div class="fw-semibold mb-1"><?= htmlspecialchars($f["TENHANG"]) ?></div>
          <div class="d-flex gap-3 align-items-center flex-wrap">
            <div>
              <div class="fw-semibold"><?= htmlspecialchars(date('H:i', strtotime($f["THOIGIANDI"]))) ?></div>
              <div class="text-muted small"><?= htmlspecialchars($f["diem_di"]) ?></div>
              <div class="text-muted small"><?= htmlspecialchars($f["ten_san_bay_di"]) ?></div>
            </div>
            <div class="text-center">
              <div class="small text-muted"><?= htmlspecialchars(phút_thành_giờ($f["thoi_gian_bay_phut"])) ?></div>
            </div>
            <div>
              <div class="fw-semibold"><?= htmlspecialchars(date('H:i', strtotime($f["THOIGIANDEN"]))) ?></div>
              <div class="text-muted small"><?= htmlspecialchars($f["diem_den"]) ?></div>
              <div class="text-muted small"><?= htmlspecialchars($f["ten_san_bay_den"]) ?></div>
            </div>
          </div>
        </div>

        <div class="text-end">
          <div class="text-muted small">Từ</div>
          <div class="price text-danger">
            <?= vnd($f["gia_tu"]) ?><span class="text-muted fw-normal">/người</span>
          </div>
          <div class="text-muted small"><?= (int)$f["so_loai_ghe"] ?> loại ghế</div>
          <div class="text-muted small">🪑 Còn <?= (int)$f["tong_so_ghe_trong"] ?> ghế</div>
          <button
            class="btn btn-primary mt-2"
            data-bs-toggle="modal"
            data-bs-target="#fareModal"
            data-flight-id="<?= (int)$f["MACHUYENBAY"] ?>"
            data-flight='<?= htmlspecialchars(json_encode([
              "ma_chuyen_bay" => (int)$f["MACHUYENBAY"],
              "ten_hang" => $f["TENHANG"],
              "diem_di" => $f["diem_di"],
              "diem_den" => $f["diem_den"],
              "ten_san_bay_di" => $f["ten_san_bay_di"],
              "ten_san_bay_den" => $f["ten_san_bay_den"],
              "gio_di" => date("H:i", strtotime($f["THOIGIANDI"])),
              "gio_den" => date("H:i", strtotime($f["THOIGIANDEN"])),
              "thoi_gian_bay_phut" => (int)$f["thoi_gian_bay_phut"],
              "ngay_di" => $departure_date,
              "pax" => $pax
            ], JSON_UNESCAPED_UNICODE), ENT_QUOTES, 'UTF-8') ?>'
          >
            Chọn
          </button>
        </div>
      </div>
    </div>
  </div>
<?php endforeach; ?>


<!--nếu có chiều về thì hiện cart chiều về-->
<?php if ($trip_type === "roundtrip"): ?>
  <h5 class="mt-4">Chiều về: <?= htmlspecialchars($to) ?> → <?= htmlspecialchars($from) ?></h5>

  <?php if (!count($return_flights)): ?>
    <div class="alert alert-warning">Không có chuyến về</div>
  <?php endif; ?>

  <?php foreach ($return_flights as $f): ?>
    <div class="card flight-card shadow-sm mb-3">
      <div class="card-body">
        <div class="d-flex flex-wrap justify-content-between gap-3">
          <div>
            <div class="fw-semibold mb-1"><?= htmlspecialchars($f["TENHANG"]) ?></div>
            <div class="d-flex gap-3 align-items-center flex-wrap">
              <div>
                <div class="fw-semibold"><?= htmlspecialchars(date('H:i', strtotime($f["THOIGIANDI"]))) ?></div>
                <div class="text-muted small"><?= htmlspecialchars($f["diem_di"]) ?></div>
                <div class="text-muted small"><?= htmlspecialchars($f["ten_san_bay_di"]) ?></div>
              </div>
              <div class="text-center">
                <div class="small text-muted"><?= htmlspecialchars(phút_thành_giờ($f["thoi_gian_bay_phut"])) ?></div>
              </div>
              <div>
                <div class="fw-semibold"><?= htmlspecialchars(date('H:i', strtotime($f["THOIGIANDEN"]))) ?></div>
                <div class="text-muted small"><?= htmlspecialchars($f["diem_den"]) ?></div>
                <div class="text-muted small"><?= htmlspecialchars($f["ten_san_bay_den"]) ?></div>
              </div>
            </div>
          </div>

          <div class="text-end">
            <div class="text-muted small">Từ</div>
            <div class="price text-danger">
              <?= vnd($f["gia_tu"]) ?><span class="text-muted fw-normal">/người</span>
            </div>
            <div class="text-muted small"><?= (int)$f["so_loai_ghe"] ?> loại ghế</div>
            <div class="text-muted small">🪑 Còn <?= (int)$f["tong_so_ghe_trong"] ?> ghế</div>
            <button
              class="btn btn-primary mt-2"
              data-bs-toggle="modal"
              data-bs-target="#fareModal"
              data-flight-id="<?= (int)$f["MACHUYENBAY"] ?>"
              data-flight='<?= htmlspecialchars(json_encode([
                "ma_chuyen_bay" => (int)$f["MACHUYENBAY"],
                "ten_hang" => $f["TENHANG"],
                "diem_di" => $f["diem_di"],
                "diem_den" => $f["diem_den"],
                "ten_san_bay_di" => $f["ten_san_bay_di"],
                "ten_san_bay_den" => $f["ten_san_bay_den"],
                "gio_di" => date("H:i", strtotime($f["THOIGIANDI"])),
                "gio_den" => date("H:i", strtotime($f["THOIGIANDEN"])),
                "thoi_gian_bay_phut" => (int)$f["thoi_gian_bay_phut"],
                "ngay_di" => $return_date,
                "pax" => $pax
              ], JSON_UNESCAPED_UNICODE), ENT_QUOTES, 'UTF-8') ?>'
            >
              Chọn
            </button>
          </div>
        </div>
      </div>
    </div>
  <?php endforeach; ?>
<?php endif; ?>

</div>

<!-- Modal chọn loại vé -->
<div class="modal fade" id="fareModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-xl modal-dialog-scrollable">
    <div class="modal-content" style="border-radius:16px;">
      <div class="modal-header">
        <h5 class="modal-title">Chọn loại vé</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <div class="modal-body">
        <div class="border rounded-3 p-3 mb-3" id="flightSummary"></div>
        <div class="row g-3" id="fareCards"></div>
      </div>
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
const fareModal = document.getElementById('fareModal');

function formatVND(n){
  return new Intl.NumberFormat('vi-VN').format(n) + ' VND';
}
function minutesToHM(m){
  const h = Math.floor(m/60);
  const mi = m%60;
  return `${h}h ${mi}m`;
}

fareModal.addEventListener('show.bs.modal', async (event) => {
  const btn = event.relatedTarget;
  const flight = JSON.parse(btn.getAttribute('data-flight'));
  const flightId = btn.getAttribute('data-flight-id');

  document.getElementById('flightSummary').innerHTML = `
  <div class="d-flex flex-wrap justify-content-between gap-2">
    <div>
      <div class="fw-semibold">${flight.ten_hang}</div>
      <div class="text-muted small">
        ${flight.diem_di} → ${flight.diem_den} | ${flight.ngay_di} | ${flight.pax} hành khách
      </div>
      <div class="text-muted small">
        ${flight.ten_san_bay_di} → ${flight.ten_san_bay_den}
      </div>
    </div>
    <div class="text-end">
      <div class="fw-semibold">${flight.gio_di} → ${flight.gio_den}</div>
      <div class="text-muted small">${minutesToHM(flight.thoi_gian_bay_phut)} • Bay thẳng</div>
    </div>
  </div>
`;

  const wrap = document.getElementById('fareCards');
  wrap.innerHTML = `<div class="col-12"><div class="alert alert-info">Đang tải loại vé...</div></div>`;

  const res = await fetch(`get_loai_ve.php?ma_chuyen_bay=${encodeURIComponent(flightId)}`);
  const fares = await res.json();

  wrap.innerHTML = '';
  if (!Array.isArray(fares) || fares.length === 0) {
    wrap.innerHTML = `<div class="col-12"><div class="alert alert-warning">Chưa có loại vé cho chuyến này.</div></div>`;
    return;
  }

  fares.forEach(f => {
  const col = document.createElement('div');
  col.className = 'col-12 col-md-6 col-lg-4';
  col.innerHTML = `
    <div class="card h-100 shadow-sm" style="border-radius:16px;">
      <div class="card-body d-flex flex-column">
        <div class="fw-semibold mb-1">${f.ten_loai_ve}</div>
        <div class="fs-5 fw-bold text-primary mb-2">
          ${formatVND(f.gia_ve)}<span class="text-muted fw-normal">/người</span>
        </div>

        <ul class="list-unstyled small mb-3">
          <li>🎟️ Loại ghế: <b>${f.ten_loai_ve}</b></li>
          <li>💺 Còn chỗ: <b>${f.so_cho_con}</b></li>
        </ul>

        <form method="post" action="select_fare.php" class="mt-auto">
          <input type="hidden" name="ma_chuyen_bay" value="${flightId}">
          <input type="hidden" name="ma_loai_ve" value="${f.ma_loai_ve}">
          <input type="hidden" name="date" value="${flight.ngay_di}">
          <input type="hidden" name="pax" value="${flight.pax}">
          <button class="btn btn-primary w-100" ${Number(f.so_cho_con) <= 0 ? 'disabled' : ''}>Chọn</button>
        </form>
      </div>
    </div>
  `;
  wrap.appendChild(col);
});
});
</script>
</body>
</html>