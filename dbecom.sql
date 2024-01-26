-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 24, 2024 at 10:40 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbecom`
--

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(15) NOT NULL,
  `product_code` varchar(255) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_desc` varchar(255) NOT NULL,
  `price` int(10) NOT NULL,
  `units` int(5) NOT NULL,
  `total` int(15) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `email` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `product_code`, `product_name`, `product_desc`, `price`, `units`, `total`, `date`, `email`) VALUES
(12, 'J1', 'Jaypuri Necklace', '100% original Jaypuri Necklace Exclusive Manci Collection You Never find these Anywhere. Grab your exclusive one now.', 4500, 1, 4500, '2024-01-24 20:36:20', '2020000000121@seu.edu.bd'),
(13, 'J2', 'Pendent Pearl ', '100% original Jaypuri Pendent Pearl Necklace Exclusive Manci Collection You Never find these Anywhere. Grab your exclusive one now.', 3500, 1, 3500, '2024-01-24 20:36:20', '2020000000121@seu.edu.bd'),
(14, 'J3', 'Jaypuri Pendent ', '100% original Jaypuri Pendent Necklace Exclusive Manci Collection You Never find these Anywhere. Grab your exclusive one now.', 3000, 1, 3000, '2024-01-24 20:36:20', '2020000000121@seu.edu.bd');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `product_code` varchar(60) NOT NULL,
  `product_name` varchar(60) NOT NULL,
  `product_desc` tinytext NOT NULL,
  `product_img_name` varchar(60) NOT NULL,
  `qty` int(5) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_code`, `product_name`, `product_desc`, `product_img_name`, `qty`, `price`) VALUES
(1, 'J1', 'Jaypuri Necklace', '100% original Jaypuri Necklace Exclusive Manci Collection You Never find these Anywhere. Grab your exclusive one now.', 'm1.jpg', 19, 4500.00),
(2, 'J2', 'Pendent Pearl ', '100% original Jaypuri Pendent Pearl Necklace Exclusive Manci Collection You Never find these Anywhere. Grab your exclusive one now.', 'm2.jpg', 19, 3500.00),
(3, 'J3', 'Jaypuri Pendent ', '100% original Jaypuri Pendent Necklace Exclusive Manci Collection You Never find these Anywhere. Grab your exclusive one now.', 'm3.jpg', 19, 3000.00),
(4, 'C1', 'Eveline Red', '100% Original Products\r\nPay on delivery might be available\r\nEasy 15 days returns and exchanges', 'c1.jpeg', 20, 500.00),
(5, 'C2', 'Eveline Light Red', '100% Original Products\r\nPay on delivery might be available\r\nEasy 15 days returns and exchanges', 'c2.jpeg', 20, 500.00),
(6, 'C3', 'Eveline Pink', '100% Original Products\r\nPay on delivery might be available\r\nEasy 15 days returns and exchanges', 'c3.jpeg', 20, 500.00),
(7, 'R1', 'Bangles Gold Plated', '#Exclusive_Bangles_Collection\r\n* Every Product is Unique, You never find 2nd piece anywhere.\r\n* 100% Color Guarantee', 'r1.jpeg', 30, 2300.00);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(100) NOT NULL,
  `pin` int(6) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(15) NOT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fname`, `lname`, `address`, `city`, `pin`, `email`, `password`, `type`) VALUES
(1, 'Southeast', 'University', 'Tejgaon', 'Dhaka', 1208, 'seu@seu.edu.bd', '369852', 'admin'),
(3, 'MD', 'Rajin', 'Nabisco', 'Dhaka', 1208, '2020000000121@seu.edu.bd', '369852', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_code` (`product_code`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
