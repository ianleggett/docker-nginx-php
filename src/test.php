<?php
$servername = "a912f60d3273";
$username = "app";
$password = "app-pwd";
$db = "ppa";

try {
// // Create connection
    $conn = mysqli_connect($servername, $username, $password, $db);
    // Check connection
    if (!$conn) {
        die("Connection failed: " . mysqli_connect_error());
    }
    echo "Connected successfully";
  }catch(Exception $e) {
    echo 'Message: ' .$e->getMessage();
  }

?>