<?php

try {

    $conexion = new PDO(
        "pgsql:host=127.0.0.1;port=5432;dbname=hospital",
        "postgres",
        "1234"
    );

    $conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

} catch (PDOException $e) {

    die("Error de conexión");

}

?>