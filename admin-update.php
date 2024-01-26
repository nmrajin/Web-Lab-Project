<?php
//if (session_status() !== PHP_SESSION_ACTIVE) {session_start();}
if (session_id() == '' || !isset($_SESSION)) {
    session_start();
}

if ($_SESSION["type"] != "admin") {
    header("location:index.php");
}

include 'config.php';

$_SESSION["products_id"] = array();
$_SESSION["products_id"] = $_REQUEST['quantity'];

$result = $mysqli->query("SELECT * FROM products ORDER BY id ASC");
$i = 0;
$x = 1;

if ($result) {
    while ($obj = $result->fetch_object()) {
        if (empty($_SESSION["products_id"][$i])) {
            $i++;
            $x++;
        } else {
            $newqty = $obj->qty + $_SESSION["products_id"][$i];
            if ($newqty < 0) $newqty = 0; //So, Qty will not be negative.
            $update = $mysqli->query("UPDATE products SET qty = $newqty WHERE id = " . $obj->id);
            if ($update) {
                echo 'Data Updated';
            }

            $i++;
            $x++;
        }
    }
}

if ($update) {
    echo 'Task Completed Successfully';
} else {
    echo 'Failed to complete the task'; // You can add an error message if the update fails
}
header("location:success.php");
?>