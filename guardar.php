<?php

include("conexion.php");

$nombre = $_POST['nombre_paciente'];
$apellido = $_POST['apellido_paciente'];
$telefono = $_POST['telefono_paciente'];
$correo = $_POST['correo_paciente'];
$fecha = $_POST['fecha_nacimiento_paciente'];
$id_tipo_documento = $_POST['id_tipo_documento'];
$documento = $_POST['documento_paciente'];
$genero = $_POST['genero_paciente'];
$direccion = $_POST['direccion_paciente'];
$tipo_sangre = $_POST['tipo_sangre_paciente'];
$id_eps = $_POST['id_eps'];
$estado = $_POST['estado_paciente'];

$sql = "INSERT INTO paciente
(
nombre_paciente,
apellido_paciente,
telefono_paciente,
correo_paciente,
fecha_nacimiento_paciente,
id_tipo_documento,
documento_paciente,
genero_paciente,
direccion_paciente,
tipo_sangre_paciente,
id_eps,
estado_paciente
)

VALUES
(
'$nombre',
'$apellido',
'$telefono',
'$correo',
'$fecha',
'$id_tipo_documento',
'$documento',
'$genero',
'$direccion',
'$tipo_sangre',
'$id_eps',
'$estado'
)";

$query = $conexion->query($sql);

?>

<!DOCTYPE html>
<html lang="es">

<head>

<meta charset="UTF-8">

<title>Paciente registrado</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<style>

body{
    background:#f4f8fb;
    display:flex;
    justify-content:center;
    align-items:center;
    height:100vh;
    font-family:Arial;
}

.success-card{
    background:white;
    padding:50px;
    border-radius:25px;
    text-align:center;
    box-shadow:0px 5px 20px rgba(0,0,0,0.08);
    width:500px;
}

.icon-success{
    font-size:80px;
    color:#198754;
}

.btn-back{
    background:linear-gradient(90deg,#0d6efd,#0dcaf0);
    color:white;
    border:none;
    padding:14px 30px;
    border-radius:12px;
    text-decoration:none;
    display:inline-block;
    margin-top:25px;
    font-weight:bold;
}

</style>

</head>

<body>

<div class="success-card">

<div class="icon-success">

<i class="bi bi-check-circle-fill"></i>

</div>

<h2 class="mt-4">
Paciente registrado correctamente
</h2>

<p class="mt-3">
La información fue almacenada de manera segura en el sistema hospitalario.
</p>

<a href="pacientes.php" class="btn-back">

Volver al módulo pacientes

</a>

</div>

</body>
</html>