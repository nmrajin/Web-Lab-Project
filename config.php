<?php
$currency = '৳';
$db_username = 'root';
$db_password = '';
$db_name = 'dbecom';
$db_host = 'localhost';
$mysqli = new mysqli($db_host, $db_username, $db_password,$db_name);
if ($mysqli->connect_error)
die ("<br>Connection FAILED WITH ERROR" .$mysqli->connect_error);


?>
