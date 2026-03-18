-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 18, 2026 at 03:21 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quan_ly_ve_may_bay_new`
--

-- --------------------------------------------------------

--
-- Table structure for table `chitiethoadon`
--

CREATE TABLE `chitiethoadon` (
  `MAVE` varchar(20) NOT NULL,
  `MAHOADON` varchar(20) NOT NULL,
  `DONGIA` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `chitiethoadon`
--

INSERT INTO `chitiethoadon` (`MAVE`, `MAHOADON`, `DONGIA`) VALUES
('VE001', 'HD001', 15000000.00),
('VE002', 'HD002', 15000000.00),
('VE003', 'HD003', 15000000.00);

-- --------------------------------------------------------

--
-- Table structure for table `chuyenbay`
--

CREATE TABLE `chuyenbay` (
  `MACHUYENBAY` varchar(20) NOT NULL,
  `MAMAYBAY` varchar(20) NOT NULL,
  `MASANBAY` varchar(20) DEFAULT NULL,
  `THOIGIANDI` datetime DEFAULT NULL,
  `THOIGIANDEN` datetime DEFAULT NULL,
  `MASANBAYDI` varchar(20) DEFAULT NULL,
  `MASANBAYDEN` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `chuyenbay`
--

INSERT INTO `chuyenbay` (`MACHUYENBAY`, `MAMAYBAY`, `MASANBAY`, `THOIGIANDI`, `THOIGIANDEN`, `MASANBAYDI`, `MASANBAYDEN`) VALUES
('BL301', 'BL-A320', 'DAD', '2026-03-27 06:30:00', '2026-03-27 07:50:00', 'DAD', 'SGN'),
('BL302', 'BL-A320', 'SGN', '2026-03-27 08:00:00', '2026-03-27 09:20:00', 'SGN', 'DAD'),
('BL303', 'BL-A320', 'PQC', '2026-03-28 06:30:00', '2026-03-28 07:50:00', 'PQC', 'SGN'),
('QH201', 'QH-B787', 'SGN', '2026-03-26 13:00:00', '2026-03-26 15:10:00', 'SGN', 'HAN'),
('QH202', 'QH-B787', 'HAN', '2026-03-26 14:00:00', '2026-03-26 16:10:00', 'HAN', 'SGN'),
('QH203', 'QH-B787', 'SGN', '2026-03-28 08:00:00', '2026-03-28 10:10:00', 'SGN', 'VCA'),
('VJ101', 'VJ-A320', 'HAN', '2026-03-26 07:30:00', '2026-03-26 09:20:00', 'HAN', 'CXR'),
('VN123', 'VN-A321', 'HAN', '2026-03-25 08:00:00', '2026-03-25 10:10:00', 'HAN', 'SGN'),
('VN124', 'VN-A321', 'SGN', '2026-03-25 11:00:00', '2026-03-25 13:10:00', 'SGN', 'PQC'),
('VN125', 'VN-A321', 'HAN', '2026-03-29 06:00:00', '2026-03-29 08:10:00', 'HAN', 'DAD'),
('VN456', 'VN-A350', 'SGN', '2026-03-25 09:30:00', '2026-03-25 10:50:00', 'SGN', 'DAD'),
('VN457', 'VN-A350', 'DAD', '2026-03-25 12:30:00', '2026-03-25 14:00:00', 'DAD', 'SGN'),
('VN458', 'VN-A350', 'DAD', '2026-03-29 09:00:00', '2026-03-29 10:30:00', 'DAD', 'HAN');

-- --------------------------------------------------------

--
-- Table structure for table `diadiem`
--

CREATE TABLE `diadiem` (
  `MADIADIEM` varchar(20) NOT NULL,
  `TENDIADIEM` varchar(100) DEFAULT NULL,
  `QUOC_GIA` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `diadiem`
--

INSERT INTO `diadiem` (`MADIADIEM`, `TENDIADIEM`, `QUOC_GIA`) VALUES
('BKK', 'Bangkok', 'Thái Lan'),
('CDG', 'Paris', 'Pháp'),
('CTO', 'Cần Thơ', 'Việt Nam'),
('CXR', 'Nha Trang', 'Việt Nam'),
('DAD', 'Đà Nẵng', 'Việt Nam'),
('DLI', 'Đà Lạt', 'Việt Nam'),
('DMK', 'Bangkok', 'Thái Lan'),
('DXB', 'Dubai', 'UAE'),
('FRA', 'Frankfurt', 'Đức'),
('GMP', 'Seoul', 'Hàn Quốc'),
('HAN', 'Hà Nội', 'Việt Nam'),
('HKG', 'Hong Kong', 'Trung Quốc'),
('HND', 'Tokyo', 'Nhật Bản'),
('HPH', 'Hải Phòng', 'Việt Nam'),
('HUI', 'Huế', 'Việt Nam'),
('ICN', 'Seoul', 'Hàn Quốc'),
('JFK', 'New York', 'Mỹ'),
('KUL', 'Kuala Lumpur', 'Malaysia'),
('LAX', 'Los Angeles', 'Mỹ'),
('LGK', 'Langkawi', 'Malaysia'),
('MEL', 'Melbourne', 'Úc'),
('MUC', 'Munich', 'Đức'),
('NRT', 'Tokyo', 'Nhật Bản'),
('ORY', 'Paris', 'Pháp'),
('PEK', 'Bắc Kinh', 'Trung Quốc'),
('PQC', 'Phú Quốc', 'Việt Nam'),
('PVG', 'Thượng Hải', 'Trung Quốc'),
('SGN', 'TP Hồ Chí Minh', 'Việt Nam'),
('SIN', 'Singapore', 'Singapore'),
('SYD', 'Sydney', 'Úc'),
('THD', 'Thanh Hóa', 'Việt Nam'),
('VCL', 'Quảng Nam', 'Việt Nam'),
('VDH', 'Điện Biên', 'Việt Nam'),
('VII', 'Vinh', 'Việt Nam');

-- --------------------------------------------------------

--
-- Table structure for table `ghe`
--

CREATE TABLE `ghe` (
  `MAGHE` varchar(20) NOT NULL,
  `MAMAYBAY` varchar(20) NOT NULL,
  `MALOAIGHE` varchar(20) NOT NULL,
  `SOGHE` int(11) DEFAULT NULL,
  `GIAGHE` decimal(10,2) DEFAULT NULL,
  `TRANGTHAI` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `ghe`
--

INSERT INTO `ghe` (`MAGHE`, `MAMAYBAY`, `MALOAIGHE`, `SOGHE`, `GIAGHE`, `TRANGTHAI`) VALUES
('1A', 'VN-A321', 'FC', 1, 15000000.00, 'TRONG'),
('1A-350', 'VN-A350', 'FC', 1, 16000000.00, 'TRONG'),
('1A-BL', 'BL-A320', 'BC', 1, 6000000.00, 'TRONG'),
('1A-QH', 'QH-B787', 'FC', 1, 18000000.00, 'TRONG'),
('1A-VJ', 'VJ-A320', 'BC', 1, 7000000.00, 'TRONG'),
('1B', 'VN-A321', 'FC', 2, 15000000.00, 'TRONG'),
('1B-350', 'VN-A350', 'FC', 2, 16000000.00, 'TRONG'),
('1B-BL', 'BL-A320', 'BC', 2, 6000000.00, 'TRONG'),
('1B-QH', 'QH-B787', 'FC', 2, 18000000.00, 'TRONG'),
('1B-VJ', 'VJ-A320', 'BC', 2, 7000000.00, 'TRONG'),
('1C', 'VN-A321', 'FC', 3, 15000000.00, 'TRONG'),
('1C-350', 'VN-A350', 'FC', 3, 16000000.00, 'TRONG'),
('1C-QH', 'QH-B787', 'FC', 3, 18000000.00, 'TRONG'),
('1D', 'VN-A321', 'FC', 4, 15000000.00, 'TRONG'),
('1D-350', 'VN-A350', 'FC', 4, 16000000.00, 'TRONG'),
('1D-QH', 'QH-B787', 'FC', 4, 18000000.00, 'TRONG'),
('2A', 'VN-A321', 'BC', 5, 8000000.00, 'TRONG'),
('2A-350', 'VN-A350', 'BC', 5, 9000000.00, 'TRONG'),
('2A-BL', 'BL-A320', 'EC', 3, 2000000.00, 'TRONG'),
('2A-QH', 'QH-B787', 'BC', 5, 10000000.00, 'TRONG'),
('2A-VJ', 'VJ-A320', 'EC', 3, 2500000.00, 'TRONG'),
('2B', 'VN-A321', 'BC', 6, 8000000.00, 'TRONG'),
('2B-350', 'VN-A350', 'BC', 6, 9000000.00, 'TRONG'),
('2B-BL', 'BL-A320', 'EC', 4, 2000000.00, 'TRONG'),
('2B-QH', 'QH-B787', 'BC', 6, 10000000.00, 'TRONG'),
('2B-VJ', 'VJ-A320', 'EC', 4, 2500000.00, 'TRONG'),
('2C', 'VN-A321', 'BC', 7, 8000000.00, 'TRONG'),
('2C-350', 'VN-A350', 'BC', 7, 9000000.00, 'TRONG'),
('2C-BL', 'BL-A320', 'EC', 5, 2000000.00, 'TRONG'),
('2C-QH', 'QH-B787', 'BC', 7, 10000000.00, 'TRONG'),
('2C-VJ', 'VJ-A320', 'EC', 5, 2500000.00, 'TRONG'),
('2D', 'VN-A321', 'BC', 8, 8000000.00, 'TRONG'),
('2D-350', 'VN-A350', 'BC', 8, 9000000.00, 'TRONG'),
('2D-BL', 'BL-A320', 'EC', 6, 2000000.00, 'TRONG'),
('2D-QH', 'QH-B787', 'BC', 8, 10000000.00, 'TRONG'),
('2D-VJ', 'VJ-A320', 'EC', 6, 2500000.00, 'TRONG'),
('2E', 'VN-A321', 'BC', 9, 8000000.00, 'TRONG'),
('2E-350', 'VN-A350', 'BC', 9, 9000000.00, 'TRONG'),
('2E-QH', 'QH-B787', 'BC', 9, 10000000.00, 'TRONG'),
('2F', 'VN-A321', 'BC', 10, 8000000.00, 'TRONG'),
('2F-350', 'VN-A350', 'BC', 10, 9000000.00, 'TRONG'),
('2F-QH', 'QH-B787', 'BC', 10, 10000000.00, 'TRONG'),
('3A', 'VN-A321', 'EC', 11, 3000000.00, 'TRONG'),
('3A-350', 'VN-A350', 'EC', 11, 4000000.00, 'TRONG'),
('3A-BL', 'BL-A320', 'EC', 7, 2000000.00, 'TRONG'),
('3A-QH', 'QH-B787', 'EC', 11, 4000000.00, 'TRONG'),
('3A-VJ', 'VJ-A320', 'EC', 7, 2500000.00, 'TRONG'),
('3B', 'VN-A321', 'EC', 12, 3000000.00, 'TRONG'),
('3B-350', 'VN-A350', 'EC', 12, 4000000.00, 'TRONG'),
('3B-BL', 'BL-A320', 'EC', 8, 2000000.00, 'TRONG'),
('3B-QH', 'QH-B787', 'EC', 12, 4000000.00, 'TRONG'),
('3B-VJ', 'VJ-A320', 'EC', 8, 2500000.00, 'TRONG'),
('3C', 'VN-A321', 'EC', 13, 3000000.00, 'TRONG'),
('3C-350', 'VN-A350', 'EC', 13, 4000000.00, 'TRONG'),
('3C-BL', 'BL-A320', 'EC', 9, 2000000.00, 'TRONG'),
('3C-QH', 'QH-B787', 'EC', 13, 4000000.00, 'TRONG'),
('3C-VJ', 'VJ-A320', 'EC', 9, 2500000.00, 'TRONG'),
('3D', 'VN-A321', 'EC', 14, 3000000.00, 'TRONG'),
('3D-350', 'VN-A350', 'EC', 14, 4000000.00, 'TRONG'),
('3D-BL', 'BL-A320', 'EC', 10, 2000000.00, 'TRONG'),
('3D-QH', 'QH-B787', 'EC', 14, 4000000.00, 'TRONG'),
('3D-VJ', 'VJ-A320', 'EC', 10, 2500000.00, 'TRONG'),
('3E', 'VN-A321', 'EC', 15, 3000000.00, 'TRONG'),
('3E-350', 'VN-A350', 'EC', 15, 4000000.00, 'TRONG'),
('3E-BL', 'BL-A320', 'EC', 11, 2000000.00, 'TRONG'),
('3E-QH', 'QH-B787', 'EC', 15, 4000000.00, 'TRONG'),
('3E-VJ', 'VJ-A320', 'EC', 11, 2500000.00, 'TRONG'),
('3F', 'VN-A321', 'EC', 16, 3000000.00, 'TRONG'),
('3F-350', 'VN-A350', 'EC', 16, 4000000.00, 'TRONG'),
('3F-BL', 'BL-A320', 'EC', 12, 2000000.00, 'TRONG'),
('3F-QH', 'QH-B787', 'EC', 16, 4000000.00, 'TRONG'),
('3F-VJ', 'VJ-A320', 'EC', 12, 2500000.00, 'TRONG'),
('4A', 'VN-A321', 'EC', 17, 3000000.00, 'TRONG'),
('4A-350', 'VN-A350', 'EC', 17, 4000000.00, 'TRONG'),
('4A-BL', 'BL-A320', 'EC', 13, 2000000.00, 'TRONG'),
('4A-QH', 'QH-B787', 'EC', 17, 4000000.00, 'TRONG'),
('4A-VJ', 'VJ-A320', 'EC', 13, 2500000.00, 'TRONG'),
('4B', 'VN-A321', 'EC', 18, 3000000.00, 'TRONG'),
('4B-350', 'VN-A350', 'EC', 18, 4000000.00, 'TRONG'),
('4B-BL', 'BL-A320', 'EC', 14, 2000000.00, 'TRONG'),
('4B-QH', 'QH-B787', 'EC', 18, 4000000.00, 'TRONG'),
('4B-VJ', 'VJ-A320', 'EC', 14, 2500000.00, 'TRONG'),
('4C', 'VN-A321', 'EC', 19, 3000000.00, 'TRONG'),
('4C-350', 'VN-A350', 'EC', 19, 4000000.00, 'TRONG'),
('4C-BL', 'BL-A320', 'EC', 15, 2000000.00, 'TRONG'),
('4C-QH', 'QH-B787', 'EC', 19, 4000000.00, 'TRONG'),
('4C-VJ', 'VJ-A320', 'EC', 15, 2500000.00, 'TRONG'),
('4D', 'VN-A321', 'EC', 20, 3000000.00, 'TRONG'),
('4D-350', 'VN-A350', 'EC', 20, 4000000.00, 'TRONG'),
('4D-BL', 'BL-A320', 'EC', 16, 2000000.00, 'TRONG'),
('4D-QH', 'QH-B787', 'EC', 20, 4000000.00, 'TRONG'),
('4D-VJ', 'VJ-A320', 'EC', 16, 2500000.00, 'TRONG'),
('5A-BL', 'BL-A320', 'EC', 17, 2000000.00, 'TRONG'),
('5A-VJ', 'VJ-A320', 'EC', 17, 2500000.00, 'TRONG'),
('5B-BL', 'BL-A320', 'EC', 18, 2000000.00, 'TRONG'),
('5B-VJ', 'VJ-A320', 'EC', 18, 2500000.00, 'TRONG'),
('5C-BL', 'BL-A320', 'EC', 19, 2000000.00, 'TRONG'),
('5C-VJ', 'VJ-A320', 'EC', 19, 2500000.00, 'TRONG'),
('5D-BL', 'BL-A320', 'EC', 20, 2000000.00, 'TRONG'),
('5D-VJ', 'VJ-A320', 'EC', 20, 2500000.00, 'TRONG');

-- --------------------------------------------------------

--
-- Table structure for table `hangmaybay`
--

CREATE TABLE `hangmaybay` (
  `MAHANG` varchar(20) NOT NULL,
  `TENHANG` varchar(100) DEFAULT NULL,
  `LOGO` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `hangmaybay`
--

INSERT INTO `hangmaybay` (`MAHANG`, `TENHANG`, `LOGO`) VALUES
('BL', 'Pacific Airlines', 'pacific.png'),
('QH', 'Bamboo Airways', 'bamboo.png'),
('VJ', 'VietJet Air', 'vietjet.png'),
('VN', 'Vietnam Airlines', 'vietnam_airlines.png'),
('VU', 'Vietravel Airlines', 'vietravel.png');

-- --------------------------------------------------------

--
-- Table structure for table `hanhkhach`
--

CREATE TABLE `hanhkhach` (
  `MAHANHKHACH` varchar(20) NOT NULL,
  `HOTEN` varchar(100) DEFAULT NULL,
  `SDT` varchar(15) DEFAULT NULL,
  `SOCCCD` varchar(20) DEFAULT NULL,
  `DIACHI` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `hanhkhach`
--

INSERT INTO `hanhkhach` (`MAHANHKHACH`, `HOTEN`, `SDT`, `SOCCCD`, `DIACHI`) VALUES
('HK001', 'Huỳnh Phước Thanh', '0912345678', '079123456789', 'X. Vĩnh An - H. Châu Thành - Tỉnh An Giang'),
('HK002', 'Trương Quốc Huy', '0987654321', '048987654321', 'TT. Chợ Mới - H. Chợ Mới - Tỉnh An Giang'),
('HK004', 'Nguyễn Thị Ngọc Hân', '0938456789', '075556677889', 'P. An Khánh - Q. Ninh Kiều - TP. Cần Thơ');

-- --------------------------------------------------------

--
-- Table structure for table `hanhly`
--

CREATE TABLE `hanhly` (
  `MAHANHLY` varchar(20) NOT NULL,
  `MAVE` varchar(20) NOT NULL,
  `MALOAIHANHLY` char(10) NOT NULL,
  `TRONGLUONG` float DEFAULT NULL,
  `PHIHANHLY` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `hanhly`
--

INSERT INTO `hanhly` (`MAHANHLY`, `MAVE`, `MALOAIHANHLY`, `TRONGLUONG`, `PHIHANHLY`) VALUES
('HL001', 'VE001', 'LHL02', 10, 0.00),
('HL002', 'VE002', 'LHL01', 7, 0.00),
('HL003', 'VE003', 'LHL01', 7, 0.00),
('HL004', 'VE004', 'LHL01', 7, 0.00),
('HL005', 'VE005', 'LHL02', 20, 2000000.00),
('HL006', 'VE006', 'LHL02', 25, 2500000.00);

-- --------------------------------------------------------

--
-- Table structure for table `hoadon`
--

CREATE TABLE `hoadon` (
  `MAHOADON` varchar(20) NOT NULL,
  `MAHANHKHACH` varchar(20) NOT NULL,
  `MANHANVIEN` varchar(20) NOT NULL,
  `NGAYLAPHOADON` datetime DEFAULT NULL,
  `TONGTIEN` decimal(10,2) DEFAULT NULL,
  `TRANGTHAIHOADON` varchar(50) DEFAULT NULL,
  `LOAIVE_HOADON` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `hoadon`
--

INSERT INTO `hoadon` (`MAHOADON`, `MAHANHKHACH`, `MANHANVIEN`, `NGAYLAPHOADON`, `TONGTIEN`, `TRANGTHAIHOADON`, `LOAIVE_HOADON`) VALUES
('HD001', 'HK001', 'NV001', '2026-03-18 08:50:00', 15000000.00, 'CHUA_THANH_TOAN', 'KHU_HOI'),
('HD002', 'HK002', 'NV002', '2026-03-18 09:00:00', 15000000.00, 'CHUA_THANH_TOAN', 'KHU_HOI'),
('HD003', 'HK004', 'NV002', '2026-03-18 09:20:00', 15000000.00, 'CHUA_THANH_TOAN', 'KHU_HOI'),
('HD007', 'HK001', 'NV001', '2026-03-18 09:05:00', NULL, 'Chưa thanh toán', 'Có hiệu lực'),
('HD008', 'HK001', 'NV001', '2026-03-18 09:05:00', NULL, 'Chưa thanh toán', 'Có hiệu lực');

-- --------------------------------------------------------

--
-- Table structure for table `loaighe`
--

CREATE TABLE `loaighe` (
  `MALOAIGHE` varchar(20) NOT NULL,
  `TENLOAIGHE` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `loaighe`
--

INSERT INTO `loaighe` (`MALOAIGHE`, `TENLOAIGHE`) VALUES
('BC', 'Thương gia'),
('EC', 'Phổ thông'),
('FC', 'Hạng nhất');

-- --------------------------------------------------------

--
-- Table structure for table `loaihanhly`
--

CREATE TABLE `loaihanhly` (
  `MALOAIHANHLY` char(10) NOT NULL,
  `TENLOAIHANHLY` varchar(50) NOT NULL,
  `PHIGOC` decimal(8,0) DEFAULT 0,
  `PHI_MOI_KG` decimal(8,0) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `loaihanhly`
--

INSERT INTO `loaihanhly` (`MALOAIHANHLY`, `TENLOAIHANHLY`, `PHIGOC`, `PHI_MOI_KG`) VALUES
('LHL01', 'Xách tay', 0, 0),
('LHL02', 'Ký gửi', 0, 100000);

-- --------------------------------------------------------

--
-- Table structure for table `maybay`
--

CREATE TABLE `maybay` (
  `MAMAYBAY` varchar(20) NOT NULL,
  `MAHANG` varchar(20) NOT NULL,
  `TENMAYBAY` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `maybay`
--

INSERT INTO `maybay` (`MAMAYBAY`, `MAHANG`, `TENMAYBAY`) VALUES
('BL-A320', 'BL', 'Airbus A320'),
('QH-B787', 'QH', 'Boeing 787'),
('VJ-A320', 'VJ', 'Airbus A320'),
('VN-A321', 'VN', 'Airbus A321'),
('VN-A350', 'VN', 'Airbus A350');

-- --------------------------------------------------------

--
-- Table structure for table `nhanvien`
--

CREATE TABLE `nhanvien` (
  `MANHANVIEN` varchar(20) NOT NULL,
  `HOTEN` varchar(256) NOT NULL,
  `NGAYSINH` date DEFAULT NULL,
  `GIOITINH` tinyint(1) DEFAULT NULL,
  `SOCCCD` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `nhanvien`
--

INSERT INTO `nhanvien` (`MANHANVIEN`, `HOTEN`, `NGAYSINH`, `GIOITINH`, `SOCCCD`) VALUES
('NV001', 'Nguyễn Ngọc Ánh', '1985-06-12', 1, '123456789012'),
('NV002', 'Trần Thanh Huy', '1990-08-21', 0, '234567890123'),
('NV003', 'Lê Minh Tuấn', '1987-01-15', 1, '345678901234'),
('NV004', 'Phạm Quỳnh Như', '1992-04-30', 0, '456789012345'),
('NV005', 'Hoàng Văn Hùng', '1989-11-05', 1, '567890123456');

-- --------------------------------------------------------

--
-- Table structure for table `sanbay`
--

CREATE TABLE `sanbay` (
  `MASANBAY` varchar(20) NOT NULL,
  `MADIADIEM` varchar(20) NOT NULL,
  `TENSANBAY` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `sanbay`
--

INSERT INTO `sanbay` (`MASANBAY`, `MADIADIEM`, `TENSANBAY`) VALUES
('BKK', 'BKK', 'Suvarnabhumi Airport'),
('CDG', 'CDG', 'Charles de Gaulle Airport'),
('CTO', 'CTO', 'Can Tho International Airport'),
('CXR', 'CXR', 'Cam Ranh International Airport'),
('DAD', 'DAD', 'Da Nang International Airport'),
('DLI', 'DLI', 'Liên Khương Airport'),
('DMK', 'DMK', 'Don Mueang Airport'),
('DXB', 'DXB', 'Dubai International Airport'),
('FRA', 'FRA', 'Frankfurt Airport'),
('GMP', 'GMP', 'Gimpo Airport'),
('HAN', 'HAN', 'Noi Bai International Airport'),
('HKG', 'HKG', 'Hong Kong International Airport'),
('HND', 'HND', 'Haneda Airport'),
('HPH', 'HPH', 'Cát Bi International Airport'),
('HUI', 'HUI', 'Phú Bài Airport'),
('ICN', 'ICN', 'Incheon International Airport'),
('JFK', 'JFK', 'John F. Kennedy International Airport'),
('KUL', 'KUL', 'Kuala Lumpur International Airport'),
('LAX', 'LAX', 'Los Angeles International Airport'),
('LGK', 'LGK', 'Langkawi Airport'),
('MEL', 'MEL', 'Melbourne Airport'),
('MUC', 'MUC', 'Munich Airport'),
('NRT', 'NRT', 'Narita International Airport'),
('ORY', 'ORY', 'Orly Airport'),
('PEK', 'PEK', 'Beijing Capital International Airport'),
('PQC', 'PQC', 'Phu Quoc International Airport'),
('PVG', 'PVG', 'Shanghai Pudong International Airport'),
('SGN', 'SGN', 'Tan Son Nhat International Airport'),
('SIN', 'SIN', 'Changi Airport'),
('SYD', 'SYD', 'Sydney Airport'),
('THD', 'THD', 'Thọ Xuân Airport'),
('VCL', 'VCL', 'Chu Lai Airport'),
('VDH', 'VDH', 'Điện Biên Airport'),
('VII', 'VII', 'Vinh Airport');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `ID_USER` varchar(20) NOT NULL,
  `USERNAME` varchar(50) NOT NULL,
  `MAHANHKHACH` varchar(20) DEFAULT NULL,
  `MANHANVIEN` varchar(20) DEFAULT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `ROLE` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ve`
--

CREATE TABLE `ve` (
  `MAVE` varchar(20) NOT NULL,
  `MACHUYENBAY` varchar(20) NOT NULL,
  `MAGHE` varchar(20) NOT NULL,
  `MAHANHKHACH` varchar(20) NOT NULL,
  `GIAVE` decimal(10,2) DEFAULT NULL,
  `NGAYDATVE` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `ve`
--

INSERT INTO `ve` (`MAVE`, `MACHUYENBAY`, `MAGHE`, `MAHANHKHACH`, `GIAVE`, `NGAYDATVE`) VALUES
('VE001', 'VN123', '1A', 'HK001', 600000.00, '2026-03-18 08:00:00'),
('VE002', 'VN123', '1B', 'HK002', 15000000.00, '2026-03-18 08:05:00'),
('VE003', 'VN123', '1D', 'HK004', 15000000.00, '2026-03-18 08:15:00'),
('VE004', 'VN123', '2B', 'HK001', 8000000.00, '2026-03-18 08:25:00'),
('VE005', 'VN123', '2C', 'HK002', 8000000.00, '2026-03-18 08:30:00'),
('VE006', 'VN123', '2E', 'HK004', 8000000.00, '2026-03-18 08:40:00'),
('VE009', 'BL302', '1A-BL', 'HK001', 6000000.00, '2026-03-18 09:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chitiethoadon`
--
ALTER TABLE `chitiethoadon`
  ADD PRIMARY KEY (`MAVE`,`MAHOADON`),
  ADD KEY `MAHOADON` (`MAHOADON`);

--
-- Indexes for table `chuyenbay`
--
ALTER TABLE `chuyenbay`
  ADD PRIMARY KEY (`MACHUYENBAY`),
  ADD KEY `MAMAYBAY` (`MAMAYBAY`),
  ADD KEY `MASANBAY` (`MASANBAY`);

--
-- Indexes for table `diadiem`
--
ALTER TABLE `diadiem`
  ADD PRIMARY KEY (`MADIADIEM`);

--
-- Indexes for table `ghe`
--
ALTER TABLE `ghe`
  ADD PRIMARY KEY (`MAGHE`),
  ADD KEY `MAMAYBAY` (`MAMAYBAY`),
  ADD KEY `MALOAIGHE` (`MALOAIGHE`);

--
-- Indexes for table `hangmaybay`
--
ALTER TABLE `hangmaybay`
  ADD PRIMARY KEY (`MAHANG`);

--
-- Indexes for table `hanhkhach`
--
ALTER TABLE `hanhkhach`
  ADD PRIMARY KEY (`MAHANHKHACH`);

--
-- Indexes for table `hanhly`
--
ALTER TABLE `hanhly`
  ADD PRIMARY KEY (`MAHANHLY`),
  ADD KEY `MAVE` (`MAVE`),
  ADD KEY `fk_hanhly_loai` (`MALOAIHANHLY`);

--
-- Indexes for table `hoadon`
--
ALTER TABLE `hoadon`
  ADD PRIMARY KEY (`MAHOADON`),
  ADD KEY `MANHANVIEN2` (`MANHANVIEN`),
  ADD KEY `MAHANHKHACH` (`MAHANHKHACH`);

--
-- Indexes for table `loaighe`
--
ALTER TABLE `loaighe`
  ADD PRIMARY KEY (`MALOAIGHE`);

--
-- Indexes for table `loaihanhly`
--
ALTER TABLE `loaihanhly`
  ADD PRIMARY KEY (`MALOAIHANHLY`);

--
-- Indexes for table `maybay`
--
ALTER TABLE `maybay`
  ADD PRIMARY KEY (`MAMAYBAY`),
  ADD KEY `MAHANG` (`MAHANG`);

--
-- Indexes for table `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD PRIMARY KEY (`MANHANVIEN`);

--
-- Indexes for table `sanbay`
--
ALTER TABLE `sanbay`
  ADD PRIMARY KEY (`MASANBAY`),
  ADD KEY `MADIADIEM` (`MADIADIEM`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID_USER`),
  ADD KEY `MANHANVIEN2` (`MANHANVIEN`),
  ADD KEY `MAHANHKHACH` (`MAHANHKHACH`);

--
-- Indexes for table `ve`
--
ALTER TABLE `ve`
  ADD PRIMARY KEY (`MAVE`),
  ADD KEY `MACHUYENBAY` (`MACHUYENBAY`),
  ADD KEY `MAGHE` (`MAGHE`),
  ADD KEY `MAHANHKHACH` (`MAHANHKHACH`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chitiethoadon`
--
ALTER TABLE `chitiethoadon`
  ADD CONSTRAINT `chitiethoadon_ibfk_1` FOREIGN KEY (`MAHOADON`) REFERENCES `hoadon` (`MAHOADON`),
  ADD CONSTRAINT `chitiethoadon_ibfk_2` FOREIGN KEY (`MAVE`) REFERENCES `ve` (`MAVE`);

--
-- Constraints for table `chuyenbay`
--
ALTER TABLE `chuyenbay`
  ADD CONSTRAINT `chuyenbay_ibfk_1` FOREIGN KEY (`MAMAYBAY`) REFERENCES `maybay` (`MAMAYBAY`),
  ADD CONSTRAINT `chuyenbay_ibfk_2` FOREIGN KEY (`MASANBAY`) REFERENCES `sanbay` (`MASANBAY`);

--
-- Constraints for table `ghe`
--
ALTER TABLE `ghe`
  ADD CONSTRAINT `ghe_ibfk_1` FOREIGN KEY (`MAMAYBAY`) REFERENCES `maybay` (`MAMAYBAY`),
  ADD CONSTRAINT `ghe_ibfk_2` FOREIGN KEY (`MALOAIGHE`) REFERENCES `loaighe` (`MALOAIGHE`);

--
-- Constraints for table `hanhly`
--
ALTER TABLE `hanhly`
  ADD CONSTRAINT `fk_hanhly_loai` FOREIGN KEY (`MALOAIHANHLY`) REFERENCES `loaihanhly` (`MALOAIHANHLY`),
  ADD CONSTRAINT `hanhly_ibfk_1` FOREIGN KEY (`MAVE`) REFERENCES `ve` (`MAVE`);

--
-- Constraints for table `hoadon`
--
ALTER TABLE `hoadon`
  ADD CONSTRAINT `hoadon_ibfk_1` FOREIGN KEY (`MANHANVIEN`) REFERENCES `nhanvien` (`MANHANVIEN`),
  ADD CONSTRAINT `hoadon_ibfk_2` FOREIGN KEY (`MAHANHKHACH`) REFERENCES `hanhkhach` (`MAHANHKHACH`);

--
-- Constraints for table `maybay`
--
ALTER TABLE `maybay`
  ADD CONSTRAINT `maybay_ibfk_1` FOREIGN KEY (`MAHANG`) REFERENCES `hangmaybay` (`MAHANG`);

--
-- Constraints for table `sanbay`
--
ALTER TABLE `sanbay`
  ADD CONSTRAINT `sanbay_ibfk_1` FOREIGN KEY (`MADIADIEM`) REFERENCES `diadiem` (`MADIADIEM`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`MANHANVIEN`) REFERENCES `nhanvien` (`MANHANVIEN`),
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`MAHANHKHACH`) REFERENCES `hanhkhach` (`MAHANHKHACH`);

--
-- Constraints for table `ve`
--
ALTER TABLE `ve`
  ADD CONSTRAINT `ve_ibfk_1` FOREIGN KEY (`MACHUYENBAY`) REFERENCES `chuyenbay` (`MACHUYENBAY`),
  ADD CONSTRAINT `ve_ibfk_2` FOREIGN KEY (`MAGHE`) REFERENCES `ghe` (`MAGHE`),
  ADD CONSTRAINT `ve_ibfk_4` FOREIGN KEY (`MAHANHKHACH`) REFERENCES `hanhkhach` (`MAHANHKHACH`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
