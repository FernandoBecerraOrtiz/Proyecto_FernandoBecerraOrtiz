<?php
header("Content-Type: application/json");
include "database.php";

$sql = "SELECT * FROM courses";
$result = $conn->query($sql);

$data = [];

while ($row = $result->fetch_assoc()) {
    $data[] = $row;
}

echo json_encode($data);
$conn->close();
?>
