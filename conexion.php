<?php

try {

    $conexion = new PDO(
        "pgsql:host=" . getenv('DB_HOST') .
        ";port=" . getenv('DB_PORT') .
        ";dbname=" . getenv('DB_DATABASE') .
        ";sslmode=require",
        getenv('DB_USERNAME'),
        getenv('DB_PASSWORD')
    );

    $conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

} catch (PDOException $e) {

    die("Error de conexión: " . $e->getMessage());

}

?>