<?php

//Configurar conexión a Base de Datos
$host = "localhost";
$username = "root";
$password = "";
$database = "proyectofbodb";
$conn = mysqli_connect($host, $username, $password, $database);

// Verificar conexión
if (!$conn) {
    echo json_encode(["error" => "Error de conexión: " . mysqli_connect_error()]);
    exit();
}

//Coger todas las filas
$sql = "SELECT * FROM users";
$stmt = $conn->prepare($sql);

// Ejecutar la consulta
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    $users = $result->fetch_all(MYSQLI_ASSOC);
    //JSON_UNESCAPED_UNICODE para que muestre correctamente los caracteres especiales como la Ñ
    echo json_encode(["success" => $users], JSON_UNESCAPED_UNICODE);
} else {
    echo json_encode(["error" => []]);
}

// Cerrar la declaración preparada y la conexión
$stmt->close();
$conn->close();

?>