<?php
include("conexion.php");
?>

<!DOCTYPE html>
<html lang="es">

<head>

<meta charset="UTF-8">

<title>EPS</title>

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
    padding:40px;
}

.title-card{
    background:linear-gradient(90deg,#0d6efd,#0dcaf0);
    color:white;
    padding:40px;
    border-radius:25px;
    margin-bottom:30px;
    box-shadow:0px 5px 20px rgba(0,0,0,0.1);
}

.eps-card{
    background:white;
    border-radius:20px;
    padding:30px;
    box-shadow:0px 5px 20px rgba(0,0,0,0.08);
    transition:0.3s;
    height:100%;
}

.eps-card:hover{
    transform:translateY(-5px);
}

.eps-icon{
    font-size:50px;
    color:#0d6efd;
    margin-bottom:15px;
}

</style>

</head>

<body>

<?php include("sidebar.php"); ?>

<div class="content">

<div class="title-card">

<h1>
EPS Aliadas
</h1>

<p>
Entidades prestadoras de salud vinculadas al hospital.
</p>

</div>

<div class="row">

<?php

$sql = "SELECT * FROM eps ORDER BY nombre ASC";

$query = $conexion->query($sql);

while($eps = $query->fetch()) {

?>

<div class="col-md-4 mb-4">

<div class="eps-card text-center">

<div class="eps-icon">

<i class="bi bi-heart-pulse-fill"></i>

</div>

<h3>

<?php echo $eps['nombre']; ?>

</h3>

<p class="mt-3">

<i class="bi bi-telephone-fill"></i>

<?php echo $eps['telefono']; ?>

</p>

</div>

</div>

<?php
}
?>

</div>

</div>

</body>
</html>