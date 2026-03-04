
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admincp</title>
    <link rel="stylesheet" type="text/css" href="css/styleadmincp.css">
</head>
<body>
    <h3 class="title_admin">Welcome to AdminCP</h3>
      <?php include("modules/header.php"); ?>
    <div class="wrapper">
        <div></div>
        <?php
            include("config/config.php");
            include("modules/menu.php");
            include("modules/main.php");
        ?>
     </div>    
     <?php include("modules/footer.php"); ?>
</body>
</html>