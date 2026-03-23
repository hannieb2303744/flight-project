<!-- <ul class="admincp_list">
    <li><a href="index.php?action=quanlychuyenbay&query=them">Quản lý chuyến bay</a></li>
</ul> -->
<?php if (isset($_SESSION["role"]) && strtolower($_SESSION["role"]) == "admin"): ?>
    <li><a href="admincp/index.php">Quản trị</a></li>
<?php endif; ?>