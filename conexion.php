<?php

try {

    $conexion = new PDO(
        "pgsql:host=ep-winter-river-aqgey8xw-pooler.c-8.us-east-1.aws.neon.tech;port=5432;dbname=neondb;sslmode=require",
        "neondb_owner",
        "npg_J6yPiCRBqUL5"
    );

    $conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    echo "Conectado a Neon";

} catch (PDOException $e) {

    die("Error de conexión: " . $e->getMessage());

}

?>