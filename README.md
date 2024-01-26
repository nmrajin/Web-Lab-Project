E-Commerce website for CSE 472 & Web and Internet Programming  Lab  
==================================================================

#A PHP E-Commerce Web Application.


This repository contains the code for a E-Commerce Website, a web-based application for managing various aspects of a E-Commerce.

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Introduction

The E-Commerce Website is a web application that provides an interface for managing sales data, fuel inventory, and employee management. It is built using PHP, HTML, CSS, and JavaScript.

## Features

- **Product ADD**: Admin can add new product in the website from his account.
- **Product Delete**: Admin can add delete product in the website from his account.
- **Quantity Edit**: Admin can add edit product quantity in the website from his account.
- **Shopping Cart**: Users can add product and manage their shopping cart by inresing quantity or deleting product.
- **Order Tracking**: Users can track their orders from MY Order tab.

## Installation

To install and run the E-Commerce Application on your System locally, follow these steps:


1. To set this web application, make sure PHP and PHPMyAdmin or XAMPP is installed on your PC.
2. Next open PHPMyAdmin, create a database and import the dbecom.sql file. This will generate tables in your database on your server.
3. The admin user which I have made has an email id seu@seu.edu.bd / admin@admin.com and the password is 369852. (Please confirm this in db or create one manually.
4. Open config.php file and add the details of your PHPMyAdmin's id and password to access the database.
5. Once this is done, You can run this website.

## Usage

To use the E-Commerce Web Application, follow these steps:

1. Open the the website in a web browser.
2. As a customer Register a account.
3. Add product to your cart from the products menu. Go to your cart and procced to check out or delete the product from your cart.
4. As a admin you can add a new product by going to My account menu after signing in as admin.
5. To delete you have to enter product id. You can also edit stock of a product by adding or substracting from the choosen product.

## Contributing

Contributions are welcome! If you want to contribute to the E-Commerce Web Application, please follow these steps:

1. Fork the repository.
2. Create a new branch: `git checkout -b feature/your-feature`
3. Make your changes and commit them: `git commit -m 'Add some feature'`
4. Push to the branch: `git push origin feature/your-feature`
5. Submit a pull request.

Please ensure that your contributions adhere to the coding standards and include relevant documentation and tests.

## License

The E-Commerce Web Application is licensed under the [MIT License](LICENSE).
