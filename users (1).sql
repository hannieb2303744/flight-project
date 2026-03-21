-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 21, 2026 at 04:19 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quan_ly_ve_may_bay`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `ID_USER` int(20) NOT NULL,
  `USERNAME` varchar(50) NOT NULL,
  `MAHANHKHACH` varchar(20) DEFAULT NULL,
  `MANHANVIEN` varchar(20) DEFAULT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `ROLE` tinyint(1) DEFAULT NULL,
  `FULLNAME` varchar(100) DEFAULT NULL,
  `PHONE` varchar(15) DEFAULT NULL,
  `BIRTHDAY` date DEFAULT NULL,
  `GENDER` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`ID_USER`, `USERNAME`, `MAHANHKHACH`, `MANHANVIEN`, `EMAIL`, `PASSWORD`, `ROLE`, `FULLNAME`, `PHONE`, `BIRTHDAY`, `GENDER`) VALUES
(3, 'Nguyen B', NULL, NULL, 'nvb123@gmail.com', '$2y$10$EnRk1G3RBKhtIg40ldJ8m.rJJiSeKY8Jywo362d3eK0PcSXu7/GRi', NULL, 'Nguyễn Văn B', '01122334455', '2005-04-08', 'Nam'),
(4, 'admin', NULL, 'NV001', 'admin@gmail.com', '$2y$10$1N6CjhJ2vCg6jqejxZUwn.m5WPmw3saEO40KHX73.zMHW4mPhdCQa', 1, 'Nguyen Van C', '0123456789', '1999-09-22', 'Nam');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID_USER`),
  ADD KEY `MANHANVIEN2` (`MANHANVIEN`),
  ADD KEY `MAHANHKHACH` (`MAHANHKHACH`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `ID_USER` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`MANHANVIEN`) REFERENCES `nhanvien` (`MANHANVIEN`),
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`MAHANHKHACH`) REFERENCES `hanhkhach` (`MAHANHKHACH`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
