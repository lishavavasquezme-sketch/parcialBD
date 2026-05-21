<!DOCTYPE html>
<html lang="es">

<head>

<meta charset="UTF-8">

<title>Dashboard</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<style>

body{
    margin:0;
    background:#f4f8fb;
    font-family:Arial;
}

.sidebar{
    width:260px;
    height:100vh;
    background:white;
    position:fixed;
    padding:30px;
    box-shadow:0px 0px 20px rgba(0,0,0,0.08);
}

.logo{
    color:#0d6efd;
    margin-bottom:40px;
}

.sidebar a{
    display:block;
    padding:15px;
    text-decoration:none;
    color:#333;
    border-radius:12px;
    margin-bottom:10px;
    transition:0.3s;
}

.sidebar a:hover{
    background:#0d6efd;
    color:white;
}

.content{
    margin-left:290px;
    margin-top:30px;
    padding:40px;
}

.welcome-card{
    background:linear-gradient(90deg,#0d6efd,#0dcaf0);
    color:white;
    padding:50px;
    border-radius:25px;
    box-shadow:0px 5px 20px rgba(0,0,0,0.1);
}

.cards{
    display:flex;
    gap:20px;
    margin-top:30px;
}

.card-box{
    background:white;
    padding:30px;
    border-radius:20px;
    flex:1;
    box-shadow:0px 5px 20px rgba(0,0,0,0.08);
}

.card-box i{
    font-size:40px;
    color:#0d6efd;
}
.topbar{
    height:80px;
    background:white;
    margin-left:260px;
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:0px 40px;
    box-shadow:0px 2px 10px rgba(0,0,0,0.05);
}

.search-input{
    border:none;
    background:#f4f8fb;
    padding:12px 20px;
    border-radius:12px;
    width:280px;
}

.top-right{
    display:flex;
    align-items:center;
    gap:20px;
}

.notification{
    font-size:22px;
    color:#0d6efd;
    cursor:pointer;
}

.admin-box{
    background:#f4f8fb;
    padding:10px 18px;
    border-radius:12px;
    font-weight:bold;
}
</style>

</head>

<body>

<?php include("sidebar.php"); ?>
<?php include("topbar.php"); ?>

<?php include("dashboard.php"); ?>

</body>
</html>