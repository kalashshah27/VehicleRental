<?php
// Database connection for Vehicle Rental Project
$host = 'localhost';
$user = 'root';
$password = '';
$database = 'vehicle_rental';

$conn = new mysqli($host, $user, $password, $database);
if ($conn->connect_errno) {
    die('Database connection failed. Please import vehicle_rental.sql in phpMyAdmin first. Error: ' . htmlspecialchars($conn->connect_error));
}
$conn->set_charset('utf8mb4');
?>
