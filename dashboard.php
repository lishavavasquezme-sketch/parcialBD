<?php
include("conexion.php");

$sql_pacientes = "SELECT COUNT(*) as total FROM paciente";
$query_pacientes = $conexion->query($sql_pacientes);
$total_pacientes = $query_pacientes->fetch();

$sql_eps = "SELECT COUNT(*) as total FROM eps";
$query_eps = $conexion->query($sql_eps);
$total_eps = $query_eps->fetch();

$sql_activos = "SELECT COUNT(*) as total FROM paciente WHERE estado_paciente = 'Activo'";
$query_activos = $conexion->query($sql_activos);
$total_activos = $query_activos->fetch();
?>

<div class="content">

<div class="welcome-card">

<h1>
Bienvenido al Portal Hospitalario
</h1>

<p>
Sistema moderno de gestión médica y administración clínica.
</p>

</div>

<div class="cards">

<div class="card-box">

<i class="bi bi-people-fill"></i>

<h3>

<?php echo $total_pacientes['total']; ?>

</h3>

<p>
Pacientes registrados
</p>

</div>

<div class="card-box">

<i class="bi bi-heart-pulse-fill"></i>

<h3>

<?php echo $total_eps['total']; ?>

</h3>

<p>
EPS aliadas
</p>

</div>

<div class="card-box">

<i class="bi bi-person-check-fill"></i>

<h3>

<?php echo $total_activos['total']; ?>

</h3>

<p>
Pacientes activos
</p>

</div>

</div>

<br><br>

<div class="card-box">

<h3>
Información Institucional
</h3>

<p class="mt-3">
Nuestro hospital brinda atención médica segura, moderna y profesional, garantizando confidencialidad y excelencia en cada proceso clínico y administrativo.
</p>

</div>

</div>
<br><br>

<h3 class="mb-4">
Accesos rápidos
</h3>

<div class="row">

<div class="col-md-3 mb-4">

<a href="pacientes.php" style="text-decoration:none;">

<div class="card-box text-center">

<i class="bi bi-people-fill"></i>

<h4 class="mt-3">
Pacientes
</h4>

<p>
Gestión de pacientes
</p>

</div>

</a>

</div>

<div class="col-md-3 mb-4">

<a href="eps.php" style="text-decoration:none;">

<div class="card-box text-center">

<i class="bi bi-heart-pulse-fill"></i>

<h4 class="mt-3">
EPS
</h4>

<p>
Entidades médicas
</p>

</div>

</a>

</div>

<div class="col-md-3 mb-4">

<div class="card-box text-center">

<i class="bi bi-file-earmark-text-fill"></i>

<h4 class="mt-3">
Documentos
</h4>

<p>
Tipos documentales
</p>

</div>

</div>

<div class="col-md-3 mb-4">

<div class="card-box text-center">

<i class="bi bi-bar-chart-fill"></i>

<h4 class="mt-3">
Reportes
</h4>

<p>
Panel administrativo
</p>

</div>

</div>

</div>