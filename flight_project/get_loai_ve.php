<?php
require_once __DIR__ . "/db.php";

$ma_chuyen_bay = (int)($_GET["ma_chuyen_bay"] ?? 0);

if ($ma_chuyen_bay <= 0) {
    http_response_code(400);
    header("Content-Type: application/json; charset=utf-8");
    echo json_encode([]);
    exit;
}

$sql = "
SELECT
    lg.MALOAIGHE AS ma_loai_ve,
    lg.TENLOAIGHE AS ten_loai_ve,
    MIN(g.GIAGHE) AS gia_ve,
    COUNT(g.MAGHE) AS so_cho_con
FROM chuyenbay cb
JOIN ghe g ON g.MAMAYBAY = cb.MAMAYBAY
JOIN loaighe lg ON lg.MALOAIGHE = g.MALOAIGHE
WHERE cb.MACHUYENBAY = :id
  AND g.TRANGTHAI = 'TRONG'
GROUP BY lg.MALOAIGHE, lg.TENLOAIGHE
ORDER BY gia_ve ASC
";

$stmt = db()->prepare($sql);
$stmt->execute([":id" => $ma_chuyen_bay]);

header("Content-Type: application/json; charset=utf-8");
echo json_encode($stmt->fetchAll(), JSON_UNESCAPED_UNICODE);
?>