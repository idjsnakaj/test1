-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 07, 2023 at 09:07 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shoponline`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `personid` int(11) NOT NULL,
  `salary` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`personid`, `salary`) VALUES
(7, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `personid` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `cost` int(11) NOT NULL,
  `deliveryid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`personid`, `productid`, `quantity`, `cost`, `deliveryid`) VALUES
(8, 3, 1, 500, 6);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `personid` int(11) NOT NULL,
  `paymentPreference` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`personid`, `paymentPreference`) VALUES
(8, 'aaaaa');

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

CREATE TABLE `delivery` (
  `deliveryid` int(11) NOT NULL,
  `personid` int(11) NOT NULL,
  `deliveryStatus` varchar(50) NOT NULL DEFAULT 'Order Placed',
  `deliveryDate` date DEFAULT current_timestamp(),
  `totalCost` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `delivery`
--

INSERT INTO `delivery` (`deliveryid`, `personid`, `deliveryStatus`, `deliveryDate`, `totalCost`) VALUES
(6, 8, 'Order Placed', '2023-05-07', 500);

-- --------------------------------------------------------

--
-- Table structure for table `persons`
--

CREATE TABLE `persons` (
  `personid` int(11) NOT NULL,
  `fname` varchar(25) NOT NULL,
  `lname` varchar(25) NOT NULL,
  `accesslevel` varchar(15) NOT NULL,
  `accountpassword` varchar(50) NOT NULL,
  `dob` date NOT NULL,
  `phoneno` bigint(11) NOT NULL,
  `email` varchar(40) NOT NULL,
  `address` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `persons`
--

INSERT INTO `persons` (`personid`, `fname`, `lname`, `accesslevel`, `accountpassword`, `dob`, `phoneno`, `email`, `address`) VALUES
(7, 'Demo', 'Admin', 'admin', 'honey328', '2002-12-05', 1111111111, 'admin@gmail.com', 'NA'),
(8, 'Han Kai', 'Lim', 'customer', '#oL328Lo#', '2023-04-30', 1111111111, 'arhkaii789@gmail.com', 'NA');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `productID` int(11) NOT NULL,
  `productName` varchar(200) NOT NULL,
  `productPrice` int(11) NOT NULL,
  `productStock` int(11) NOT NULL,
  `productDescription` varchar(200) NOT NULL,
  `productCap` int(11) NOT NULL,
  `productPhoto` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`productID`, `productName`, `productPrice`, `productStock`, `productDescription`, `productCap`, `productPhoto`) VALUES
(1, 'MacBook Air M1', 100000, 300, 'Latest MacBook Air running on apple silicon M1 chip', 5, 'https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/macbook-air-space-gray-select-201810?wid=904&hei=840&fmt=jpeg&qlt=80&.v=1603332211000'),
(2, 'Iphone 13', 120000, 200, 'Iphone 13, 256gb storage', 3, 'https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-13-family-select-2021?wid=940&hei=1112&fmt=jpeg&qlt=80&.v=1629842667000'),
(3, 'Fart Spray', 500, 99, 'Play fart pranks for fun', 1, 'https://m.media-amazon.com/images/I/71jwVGVj+WL._SL1500_.jpg'),
(4, 'Himalayan Fresh Air', 1000, 100, 'Fresh air packed from the himalayan mountains, can be used after the fart spray', 1, 'https://m.media-amazon.com/images/I/61ORV-YEj1L._SL1500_.jpg'),
(5, 'Amazon Basics 4K LED TV', 25000, 250, '4K Ultra HD Smart LED Fire TV', 1, 'https://m.media-amazon.com/images/I/71AqQyCMmeL._SL1240_.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`personid`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`personid`,`productid`,`deliveryid`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`personid`);

--
-- Indexes for table `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`deliveryid`);

--
-- Indexes for table `persons`
--
ALTER TABLE `persons`
  ADD PRIMARY KEY (`personid`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`productID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `delivery`
--
ALTER TABLE `delivery`
  MODIFY `deliveryid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `persons`
--
ALTER TABLE `persons`
  MODIFY `personid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
