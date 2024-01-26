<?php

//if (session_status() !== PHP_SESSION_ACTIVE) {session_start();}
if(session_id() == '' || !isset($_SESSION)){session_start();}

if(!isset($_SESSION["username"])) {
  header("location:index.php");
}

if($_SESSION["type"]!="admin") {
  header("location:index.php");
}

include 'config.php';

// Check if the form for adding a new product is submitted
if(isset($_POST['add_product'])) {
    $product_code = $_POST['product_code'];
    $product_name = $_POST['product_name'];
    $product_desc = $_POST['product_desc'];
    $product_img_name = $_POST['product_img_name'];
    $qty = $_POST['qty'];
    $price = $_POST['price'];

    // Add new product to the database
    $insert_query = "INSERT INTO products (product_code, product_name, product_desc, product_img_name, qty, price) VALUES ('$product_code', '$product_name', '$product_desc', '$product_img_name', $qty, $price)";
    $mysqli->query($insert_query);
}

// Check if the form for deleting a product is submitted
if(isset($_POST['delete_product'])) {
    $product_id = $_POST['product_id'];

    // Delete product from the database
    $delete_query = "DELETE FROM products WHERE id = $product_id";
    $mysqli->query($delete_query);
}

?>

<!doctype html>
<html class="no-js" lang="en">
  <head>
  <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin ||  Manci </title>
    <link rel="stylesheet" href="css/foundation.css" />
    <script src="js/vendor/modernizr.js"></script>
  </head>
  <body>

  <nav class="top-bar" data-topbar role="navigation">
      <ul class="title-area">
        <li class="name">
          <h1><a href="index.php">Manci Jewellery & Cosmetics</a></h1>
        </li>
        <li class="toggle-topbar menu-icon"><a href="#"><span></span></a></li>
      </ul>

      <section class="top-bar-section">
      <!-- Right Nav Section -->
        <ul class="right">
          <li><a href="about.php">About</a></li>
          <li><a href="products.php">Products</a></li>
          <li><a href="cart.php">View Cart</a></li>
          <li><a href="orders.php">My Orders</a></li>
          <li><a href="contact.php">Contact</a></li>
          <?php

          if(isset($_SESSION['username'])){
            echo '<li><a href="account.php">My Account</a></li>';
            echo '<li><a href="logout.php">Log Out</a></li>';
          }
          else{
            echo '<li><a href="login.php">Log In</a></li>';
            echo '<li><a href="register.php">Register</a></li>';
          }
          ?>
        </ul>
      </section>
    </nav>

    <div class="row" style="margin-top:10px;">
      <div class="large-12">
        <h3>Hey Admin!</h3>
        
        <!-- Form for adding a new product -->
        <form method="post" action="admin.php">
          <h4>Add New Product:</h4>
          <label>Product Code:</label>
          <input type="text" name="product_code" required>
          <label>Product Name:</label>
          <input type="text" name="product_name" required>
          <label>Description:</label>
          <textarea name="product_desc" required></textarea>
          <label>Image Name:</label>
          <input type="text" name="product_img_name" required>
          <label>Quantity:</label>
          <input type="number" name="qty" required>
          <label>Price:</label>
          <input type="number" name="price" step="0.01" required>
          <input type="submit" class="button" name="add_product" value="Add Product">
        </form>

        <!-- Form for deleting a product -->
        <form method="post" action="admin.php">
          <h4>Delete Product:</h4>
          <label>Product ID:</label>
          <input type="number" name="product_id" required>
          <input type="submit" class="button" name="delete_product" value="Delete Product">
        </form>

        <!-- Display existing products -->
        <?php
          $result = $mysqli->query("SELECT * from products order by id asc");
          if($result) {
            while($obj = $result->fetch_object()) {
                echo '<div class="large-4 columns">';
                echo '<p><h3>'.$obj->product_name.'</h3></p>';
                echo '<p><strong>Product ID</strong>: ' . $obj->id . '</p>';
                echo '<img src="images/products/'.$obj->product_img_name.'"/>';
                echo '<p><strong>Product Code</strong>: '.$obj->product_code.'</p>';
                echo '<p><strong>Description</strong>: '.$obj->product_desc.'</p>';
                echo '<p><strong>Units Available</strong>: '.$obj->qty.'</p>';
                echo '<p><strong>Price (Per Unit)</strong>: '.$currency.$obj->price.'</p>';
                echo '<div class="large-6 columns" style="padding-left:0;">';
                echo '<form method="post" name="update-quantity" action="admin-update.php">';
                echo '<p><strong>New Qty</strong>:</p>';
                echo '</div>';
                echo '<div class="large-6 columns">';
                echo '<input type="number" name="quantity[]"/>';
  
                echo '</div>';
                echo '</div>';
            }
          }
        ?>
      </div>
    </div>

    <div class="row" style="margin-top:10px;">
      <div class="small-12">
        <center><p><input style="clear:both;" type="submit" class="button" value="Update"></p></center>
        </form>
        <footer style="margin-top:10px;">
           <p style="text-align:center; font-size:0.8em;">&copy; S&R. All Rights Reserved.</p>
        </footer>

      </div>
    </div>





    <script src="js/vendor/jquery.js"></script>
    <script src="js/foundation.min.js"></script>
    <script>
      $(document).foundation();
    </script>

  </body>
</html>
