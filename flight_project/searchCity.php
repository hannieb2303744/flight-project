<?php
require_once __DIR__ . "/db.php";

header("Content-Type: application/json; charset=utf-8");

$q = trim($_GET['q'] ?? '');

if ($q === '') {
    echo json_encode([], JSON_UNESCAPED_UNICODE);
    exit;
}

$pdo = db();

$sql = "
    SELECT 
        sb.MASANBAY,
        sb.TENSANBAY,
        dd.TENDIADIEM
    FROM sanbay sb
    JOIN diadiem dd ON dd.MADIADIEM = sb.MADIADIEM
    WHERE sb.MASANBAY LIKE :q
       OR sb.TENSANBAY LIKE :q
       OR dd.TENDIADIEM LIKE :q
    ORDER BY sb.MASANBAY ASC
    LIMIT 10
";

$stmt = $pdo->prepare($sql);
$stmt->execute([
    ':q' => '%' . $q . '%'
]);

$rows = $stmt->fetchAll();

$data = [];

foreach ($rows as $row) {
    $data[] = [
        'value' => $row['MASANBAY'],
        'label' => $row['MASANBAY'] . ' - ' . $row['TENSANBAY'] . ' (' . $row['TENDIADIEM'] . ')',
        'ma_san_bay' => $row['MASANBAY'],
        'ten_san_bay' => $row['TENSANBAY'],
        'ten_dia_diem' => $row['TENDIADIEM']
    ];
}

echo json_encode($data, JSON_UNESCAPED_UNICODE);
?>