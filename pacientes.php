<?php
include("conexion.php");
?>

<!DOCTYPE html>
<html lang="es">

<head>

<meta charset="UTF-8">

<title>Pacientes</title>

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

.form-card{
    background:white;
    padding:30px;
    border-radius:20px;
    box-shadow:0px 5px 20px rgba(0,0,0,0.08);
}

.form-control{
    border-radius:12px;
    padding:12px;
}

.btn-custom{
    background:linear-gradient(90deg,#0d6efd,#0dcaf0);
    color:white;
    border:none;
    padding:14px;
    border-radius:12px;
    font-weight:bold;
    transition:0.3s;
}

.btn-custom:hover{
    transform:scale(1.02);
    box-shadow:0px 5px 15px rgba(13,110,253,0.3);
}

.title-card{
    background:linear-gradient(90deg,#0d6efd,#0dcaf0);
    color:white;
    padding:40px;
    border-radius:25px;
    margin-bottom:30px;
    box-shadow:0px 5px 20px rgba(0,0,0,0.1);
}

</style>

</head>

<body>

<?php include("sidebar.php"); ?>

<div class="content">

<div class="title-card">

<h1>
Gestión de Pacientes
</h1>

<p>
Registro y administración segura de pacientes del hospital.
</p>

</div>

<div class="form-card">

<form action="guardar.php" method="POST">

<div class="row">

<div class="col-md-6 mb-4">

<label>Nombre</label>

<input type="text" name="nombre_paciente" class="form-control" required>

</div>

<div class="col-md-6 mb-4">

<label>Apellido</label>

<input type="text" name="apellido_paciente" class="form-control" required>

</div>

<div class="col-md-6 mb-4">

<label>Teléfono</label>

<input type="text" name="telefono_paciente" class="form-control">

</div>

<div class="col-md-6 mb-4">

<label>Correo</label>

<input type="email" name="correo_paciente" class="form-control">

</div>

<div class="col-md-6 mb-4">

<label>Fecha nacimiento</label>

<input type="date" name="fecha_nacimiento_paciente" class="form-control">

</div>

<div class="col-md-6 mb-4">

<label>Tipo documento</label>

<select name="id_tipo_documento" class="form-control">

<option value="1">Cédula</option>
<option value="2">Tarjeta de identidad</option>
<option value="3">Pasaporte</option>

</select>

</div>

<div class="col-md-6 mb-4">

<label>Documento</label>

<input type="text" name="documento_paciente" class="form-control">

</div>

<div class="col-md-6 mb-4">

<label>Género</label>

<select name="genero_paciente" class="form-control">

<option value="Masculino">Masculino</option>
<option value="Femenino">Femenino</option>
<option value="Otro">Otro</option>

</select>

</div>

<div class="col-md-6 mb-4">

<label>Dirección</label>

<input type="text" name="direccion_paciente" class="form-control">

</div>

<div class="col-md-6 mb-4">

<label>Tipo sangre</label>

<select name="tipo_sangre_paciente" class="form-control">

<option value="A+">A+</option>
<option value="A-">A-</option>
<option value="B+">B+</option>
<option value="B-">B-</option>
<option value="AB+">AB+</option>
<option value="AB-">AB-</option>
<option value="O+">O+</option>
<option value="O-">O-</option>

</select>

</div>

<div class="col-md-6 mb-4">

<label>EPS</label>

<select name="id_eps" class="form-control">

<option value="1">Sura</option>
<option value="2">Sanitas</option>
<option value="3">Nueva EPS</option>

</select>

</div>

<div class="col-md-6 mb-4">

<label>Estado paciente</label>

<select name="estado_paciente" class="form-control">

<option value="Activo">Activo</option>
<option value="Inactivo">Inactivo</option>

</select>

</div>

</div>

<button type="submit" class="btn-custom w-100">

<i class="bi bi-save"></i>

Guardar Paciente

</button>

</form>

<br><br>

<div class="form-card text-center">

<i class="bi bi-shield-lock-fill" style="font-size:70px; color:#0d6efd;"></i>

<h3 class="mt-4">
Información protegida
</h3>

<p class="mt-3">
Los datos clínicos y administrativos de pacientes son gestionados de manera segura y confidencial.
</p>

</div>

</div>

</div>

</body>
</html>