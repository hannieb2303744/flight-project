-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 16, 2026 at 05:46 AM
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
-- Database: `quan_ly_ve_may_bay_thanh`
--

-- --------------------------------------------------------

--
-- Table structure for table `chuyen_bay`
--

CREATE TABLE `chuyen_bay` (
  `ma_chuyen_bay` int(11) NOT NULL,
  `ma_hang` int(11) NOT NULL,
  `ma_may_bay` int(11) DEFAULT NULL,
  `so_hieu_chuyen` varchar(20) NOT NULL,
  `san_bay_di` int(11) NOT NULL,
  `san_bay_den` int(11) NOT NULL,
  `ngay_gio_cat_canh` datetime NOT NULL,
  `ngay_gio_ha_canh` datetime NOT NULL,
  `thoi_gian_bay_phut` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `chuyen_bay`
--

INSERT INTO `chuyen_bay` (`ma_chuyen_bay`, `ma_hang`, `ma_may_bay`, `so_hieu_chuyen`, `san_bay_di`, `san_bay_den`, `ngay_gio_cat_canh`, `ngay_gio_ha_canh`, `thoi_gian_bay_phut`) VALUES
(1, 2, 1, 'VJ121', 1, 2, '2026-02-01 17:35:00', '2026-02-02 19:05:00', 1530),
(2, 2, NULL, 'VN607', 1, 4, '2026-03-03 21:35:00', '2026-03-03 23:10:00', 95),
(3, 3, NULL, 'QH210', 1, 2, '2026-03-03 09:10:00', '2026-03-03 11:15:00', 125),
(4, 1, NULL, 'VJ200', 1, 4, '2026-03-03 08:00:00', '2026-03-03 09:30:00', 90),
(5, 2, NULL, 'VN700', 1, 4, '2026-03-03 18:00:00', '2026-03-03 19:35:00', 95),
(6, 1, NULL, 'VJ201', 1, 4, '2026-03-03 08:00:00', '2026-03-03 09:30:00', 90),
(7, 2, NULL, 'VN701', 1, 4, '2026-03-03 18:00:00', '2026-03-03 19:35:00', 95),
(8, 1, NULL, 'VJ202', 1, 4, '2026-03-03 08:00:00', '2026-03-03 09:30:00', 90),
(9, 2, NULL, 'VN702', 1, 4, '2026-03-03 18:00:00', '2026-03-03 19:35:00', 95),
(10, 1, 2, 'VJ203', 1, 4, '2026-03-03 08:00:00', '2026-03-03 09:30:00', 90),
(11, 2, NULL, 'VN703', 1, 4, '2026-03-03 18:00:00', '2026-03-03 19:35:00', 95),
(12, 1, NULL, 'VJ204', 1, 4, '2026-03-03 08:00:00', '2026-03-03 09:30:00', 90),
(13, 2, NULL, 'VN704', 1, 4, '2026-03-03 18:00:00', '2026-03-03 19:35:00', 95),
(14, 1, NULL, 'VJ205', 1, 4, '2026-03-03 08:00:00', '2026-03-03 09:30:00', 90),
(15, 2, NULL, 'VN705', 1, 4, '2026-03-03 18:00:00', '2026-03-03 19:35:00', 95),
(16, 1, NULL, 'VJ206', 1, 4, '2026-03-03 08:00:00', '2026-03-03 09:30:00', 90),
(17, 2, NULL, 'VN706', 1, 4, '2026-03-03 18:00:00', '2026-03-03 19:35:00', 95),
(18, 1, NULL, 'VJ207', 1, 4, '2026-03-03 08:00:00', '2026-03-03 09:30:00', 90),
(19, 2, NULL, 'VN707', 1, 4, '2026-03-03 18:00:00', '2026-03-03 19:35:00', 95),
(21, 1, NULL, 'CB120', 2, 3, '2026-03-03 20:21:00', '2026-03-04 20:22:00', 0),
(23, 1, 3, 'CB111', 3, 38, '2026-03-03 21:08:00', '2026-03-04 21:08:00', 110),
(25, 1, 1, 'AB123', 1, 37, '2026-03-03 21:52:00', '2026-03-04 21:52:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `don_dat_ve`
--

CREATE TABLE `don_dat_ve` (
  `ma_don` int(11) NOT NULL,
  `ma_dat_cho` varchar(50) NOT NULL,
  `ma_loai_ve` int(11) NOT NULL,
  `so_hanh_khach` int(11) NOT NULL,
  `tong_tien` int(11) NOT NULL,
  `trang_thai` enum('CHO_THANH_TOAN','DA_THANH_TOAN','HUY') NOT NULL DEFAULT 'CHO_THANH_TOAN',
  `thoi_gian_tao` datetime NOT NULL DEFAULT current_timestamp(),
  `ho_ten_lien_he` varchar(100) NOT NULL,
  `email_lien_he` varchar(120) NOT NULL,
  `sdt_lien_he` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `don_dat_ve`
--

INSERT INTO `don_dat_ve` (`ma_don`, `ma_dat_cho`, `ma_loai_ve`, `so_hanh_khach`, `tong_tien`, `trang_thai`, `thoi_gian_tao`, `ho_ten_lien_he`, `email_lien_he`, `sdt_lien_he`) VALUES
(1, '', 4, 0, 8317980, 'CHO_THANH_TOAN', '2026-02-21 16:36:38', 'Nguyễn Văn A', 'a@gmail.com', '0901234567'),
(2, '', 2, 0, 4720714, 'DA_THANH_TOAN', '2026-02-21 16:36:38', 'Lê Minh C', 'c@gmail.com', '0912345678'),
(3, '', 5, 0, 10626720, 'CHO_THANH_TOAN', '2026-02-21 18:16:08', 'Huy', 'huy@gmail.com', '0938775628'),
(4, '', 5, 0, 10626720, 'DA_THANH_TOAN', '2026-02-21 18:16:17', 'Huy', 'huy@gmail.com', '0938775628'),
(5, '', 11, 0, 5000000, 'CHO_THANH_TOAN', '2026-02-21 19:50:59', 'Huy', 'huy@gmail.com', '0834448848'),
(6, '', 18, 0, 6400000, 'DA_THANH_TOAN', '2026-02-21 19:57:23', 'Hân', 'han@gmail.com', '09746256447'),
(7, '', 10, 0, 5000000, 'DA_THANH_TOAN', '2026-02-24 23:48:05', 'Nguyen Thi Ngoc Han B2303744', 'hanb2303744@student.ctu.edu.vn', '0775812920'),
(8, 'BK20260304031039396', 39, 1, 2900000, 'DA_THANH_TOAN', '2026-03-04 09:10:39', 'Nguyen Thi Ngoc Han B2303744', 'hanb2303744@student.ctu.edu.vn', '0775812920'),
(9, 'BK20260304031642573', 39, 1, 2900000, 'CHO_THANH_TOAN', '2026-03-04 09:16:42', 'Nguyen Thi Ngoc Han B2303744', 'hanb2303744@student.ctu.edu.vn', '0775812920'),
(10, 'BK20260316054027692', 43, 1, 2900000, 'CHO_THANH_TOAN', '2026-03-16 11:40:27', 'Nguyen Thi Ngoc Han B2303744', 'hanb2303744@student.ctu.edu.vn', '0775812920');

-- --------------------------------------------------------

--
-- Table structure for table `ghe`
--

CREATE TABLE `ghe` (
  `maghe` int(11) NOT NULL,
  `mamaybay` int(11) DEFAULT NULL,
  `soghe` varchar(10) DEFAULT NULL,
  `loaighe` varchar(50) DEFAULT NULL,
  `trangthai` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hang_hang_khong`
--

CREATE TABLE `hang_hang_khong` (
  `ma_hang` int(11) NOT NULL,
  `ma_hang_code` varchar(10) NOT NULL,
  `ten_hang` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `hang_hang_khong`
--

INSERT INTO `hang_hang_khong` (`ma_hang`, `ma_hang_code`, `ten_hang`) VALUES
(1, 'VJ', 'VietJet Air'),
(2, 'VN', 'Vietnam Airlines'),
(3, 'QH', 'Bamboo Airways');

-- --------------------------------------------------------

--
-- Table structure for table `hanh_khach`
--

CREATE TABLE `hanh_khach` (
  `ma_hanh_khach` int(11) NOT NULL,
  `ma_don` int(11) NOT NULL,
  `ho_ten` varchar(100) NOT NULL,
  `so_ho_chieu` varchar(30) DEFAULT NULL,
  `ngay_het_han_ho_chieu` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `hanh_khach`
--

INSERT INTO `hanh_khach` (`ma_hanh_khach`, `ma_don`, `ho_ten`, `so_ho_chieu`, `ngay_het_han_ho_chieu`) VALUES
(1, 1, 'Nguyễn Văn A', 'B1234567', '2027-12-31'),
(2, 1, 'Trần Thị B', 'C7654321', '2028-05-20'),
(3, 2, 'Lê Minh C', 'P9988776', '2029-01-01'),
(4, 3, 'Huy', '0977473622', NULL),
(5, 4, 'Huy', '0977473622', NULL),
(8, 6, 'khach1', '098746555', NULL),
(9, 6, 'khach2', '098274744', NULL),
(10, 7, 'Ngoc Han', '123', NULL),
(11, 7, 'Nani', NULL, NULL),
(12, 8, 'Ngoc Han', NULL, NULL),
(13, 9, 'Ngoc Han', NULL, NULL),
(14, 10, 'Ngoc Han', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `loai_ve`
--

CREATE TABLE `loai_ve` (
  `ma_loai_ve` int(11) NOT NULL,
  `ma_chuyen_bay` int(11) NOT NULL,
  `ten_loai_ve` varchar(100) NOT NULL,
  `gia_ve` int(11) NOT NULL,
  `hanh_ly_xach_tay_kg` int(11) NOT NULL DEFAULT 7,
  `hanh_ly_ky_gui_kg` int(11) NOT NULL DEFAULT 0,
  `chinh_sach_doi` varchar(120) NOT NULL,
  `chinh_sach_hoan` varchar(120) NOT NULL,
  `so_cho_con` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `loai_ve`
--

INSERT INTO `loai_ve` (`ma_loai_ve`, `ma_chuyen_bay`, `ten_loai_ve`, `gia_ve`, `hanh_ly_xach_tay_kg`, `hanh_ly_ky_gui_kg`, `chinh_sach_doi`, `chinh_sach_hoan`, `so_cho_con`) VALUES
(1, 1, 'Kinh tế', 4628114, 7, 0, 'Không hỗ trợ', 'Không hoàn/đổi', 20),
(2, 1, 'Kinh tế | An toàn', 4720714, 7, 20, 'Đổi có phí', 'Hoàn có phí', 9),
(3, 1, 'Tiết kiệm | Gói eSIM', 4755293, 7, 20, 'Đổi có phí', 'Hoàn có phí', 5),
(4, 2, 'Phổ thông', 4158990, 10, 0, 'Đổi có phí', 'Hoàn có phí', 30),
(5, 2, 'Thương gia', 10626720, 12, 30, 'Đổi linh hoạt', 'Hoàn linh hoạt', 6),
(6, 3, 'Phổ thông tiết kiệm', 1450000, 7, 0, 'Không hỗ trợ', 'Không hoàn/đổi', 40),
(7, 3, 'Phổ thông linh hoạt', 1750000, 7, 20, 'Đổi có phí', 'Hoàn có phí', 25),
(8, 4, 'Phổ thông', 2500000, 7, 20, 'Đổi có phí', 'Hoàn có phí', 30),
(9, 6, 'Phổ thông', 2500000, 7, 20, 'Đổi có phí', 'Hoàn có phí', 30),
(10, 8, 'Phổ thông', 2500000, 7, 20, 'Đổi có phí', 'Hoàn có phí', 28),
(11, 10, 'Phổ thông', 2500000, 7, 20, 'Đổi có phí', 'Hoàn có phí', 28),
(12, 12, 'Phổ thông', 2500000, 7, 20, 'Đổi có phí', 'Hoàn có phí', 30),
(13, 14, 'Phổ thông', 2500000, 7, 20, 'Đổi có phí', 'Hoàn có phí', 30),
(14, 16, 'Phổ thông', 2500000, 7, 20, 'Đổi có phí', 'Hoàn có phí', 30),
(15, 18, 'Phổ thông', 2500000, 7, 20, 'Đổi có phí', 'Hoàn có phí', 30),
(16, 5, 'Phổ thông', 3200000, 7, 20, 'Đổi có phí', 'Hoàn có phí', 30),
(17, 7, 'Phổ thông', 3200000, 7, 20, 'Đổi có phí', 'Hoàn có phí', 30),
(18, 9, 'Phổ thông', 3200000, 7, 20, 'Đổi có phí', 'Hoàn có phí', 28),
(19, 11, 'Phổ thông', 3200000, 7, 20, 'Đổi có phí', 'Hoàn có phí', 30),
(20, 13, 'Phổ thông', 3200000, 7, 20, 'Đổi có phí', 'Hoàn có phí', 30),
(21, 15, 'Phổ thông', 3200000, 7, 20, 'Đổi có phí', 'Hoàn có phí', 30),
(22, 17, 'Phổ thông', 3200000, 7, 20, 'Đổi có phí', 'Hoàn có phí', 30),
(23, 19, 'Phổ thông', 3200000, 7, 20, 'Đổi có phí', 'Hoàn có phí', 30),
(39, 4, 'Linh hoạt', 2900000, 10, 30, 'Đổi linh hoạt', 'Hoàn linh hoạt', 18),
(40, 6, 'Linh hoạt', 2900000, 10, 30, 'Đổi linh hoạt', 'Hoàn linh hoạt', 20),
(41, 8, 'Linh hoạt', 2900000, 10, 30, 'Đổi linh hoạt', 'Hoàn linh hoạt', 20),
(42, 10, 'Linh hoạt', 2900000, 10, 30, 'Đổi linh hoạt', 'Hoàn linh hoạt', 20),
(43, 12, 'Linh hoạt', 2900000, 10, 30, 'Đổi linh hoạt', 'Hoàn linh hoạt', 19),
(44, 14, 'Linh hoạt', 2900000, 10, 30, 'Đổi linh hoạt', 'Hoàn linh hoạt', 20),
(45, 16, 'Linh hoạt', 2900000, 10, 30, 'Đổi linh hoạt', 'Hoàn linh hoạt', 20),
(46, 18, 'Linh hoạt', 2900000, 10, 30, 'Đổi linh hoạt', 'Hoàn linh hoạt', 20),
(47, 5, 'Linh hoạt', 3800000, 10, 30, 'Đổi linh hoạt', 'Hoàn linh hoạt', 20),
(48, 7, 'Linh hoạt', 3800000, 10, 30, 'Đổi linh hoạt', 'Hoàn linh hoạt', 20),
(49, 9, 'Linh hoạt', 3800000, 10, 30, 'Đổi linh hoạt', 'Hoàn linh hoạt', 20),
(50, 11, 'Linh hoạt', 3800000, 10, 30, 'Đổi linh hoạt', 'Hoàn linh hoạt', 20),
(51, 13, 'Linh hoạt', 3800000, 10, 30, 'Đổi linh hoạt', 'Hoàn linh hoạt', 20),
(52, 15, 'Linh hoạt', 3800000, 10, 30, 'Đổi linh hoạt', 'Hoàn linh hoạt', 20),
(53, 17, 'Linh hoạt', 3800000, 10, 30, 'Đổi linh hoạt', 'Hoàn linh hoạt', 20),
(54, 19, 'Linh hoạt', 3800000, 10, 30, 'Đổi linh hoạt', 'Hoàn linh hoạt', 20);

-- --------------------------------------------------------

--
-- Table structure for table `may_bay`
--

CREATE TABLE `may_bay` (
  `ma_may_bay` int(11) NOT NULL,
  `ten_may_bay` varchar(50) NOT NULL,
  `soghe` int(11) NOT NULL,
  `trangthai` tinyint(4) NOT NULL DEFAULT 1,
  `ma_hang` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `may_bay`
--

INSERT INTO `may_bay` (`ma_may_bay`, `ten_may_bay`, `soghe`, `trangthai`, `ma_hang`) VALUES
(1, 'Airbus A320', 180, 0, 1),
(2, 'Airbus A321', 220, 0, 1),
(3, 'Boeing 787', 250, 0, 2),
(4, 'Airbus A350', 300, 0, 2),
(5, 'Embraer E190', 100, 0, 3),
(6, 'Boeing 737', 160, 0, 3);

-- --------------------------------------------------------

--
-- Table structure for table `san_bay`
--

CREATE TABLE `san_bay` (
  `ma_san_bay` int(11) NOT NULL,
  `ma_iata` varchar(10) NOT NULL,
  `ten_san_bay` varchar(150) NOT NULL,
  `thanh_pho` varchar(100) DEFAULT NULL,
  `unsigned_city` varchar(255) DEFAULT NULL,
  `quoc_gia` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `san_bay`
--

INSERT INTO `san_bay` (`ma_san_bay`, `ma_iata`, `ten_san_bay`, `thanh_pho`, `unsigned_city`, `quoc_gia`) VALUES
(1, 'SGN', 'Sân bay Tân Sơn Nhất', 'TP. Hồ Chí Minh', 'Ho Chi Minh', 'Việt Nam'),
(2, 'HAN', 'Sân bay Nội Bài', 'Hà Nội', 'Ha Noi', 'Việt Nam'),
(3, 'DAD', 'Sân bay Đà Nẵng', 'Đà Nẵng', 'Da Nang', 'Việt Nam'),
(4, 'BKK', 'Suvarnabhumi Airport', 'Bangkok', 'Bangkok', 'Thái Lan'),
(5, 'DMK', 'Don Mueang International Airport', 'Bangkok', 'Bangkok', 'Thái Lan'),
(27, 'SIN', 'Changi Airport', 'Singapore', 'Singapore', 'Singapore'),
(28, 'ICN', 'Incheon International Airport', 'Seoul', 'Seoul', 'South Korea'),
(29, 'NRT', 'Narita International Airport', 'Tokyo', 'Tokyo', 'Japan'),
(30, 'KIX', 'Kansai International Airport', 'Osaka', 'Osaka', 'Japan'),
(31, 'CDG', 'Charles de Gaulle Airport', 'Paris', 'Paris', 'France'),
(32, 'LHR', 'Heathrow Airport', 'London', 'London', 'United Kingdom'),
(33, 'JFK', 'John F Kennedy International Airport', 'New York', 'New York', 'United States'),
(34, 'SYD', 'Sydney Kingsford Smith Airport', 'Sydney', 'Sydney', 'Australia'),
(35, 'KUL', 'Kuala Lumpur International Airport', 'Kuala Lumpur', 'Kuala Lumpur', 'Malaysia'),
(36, 'CXR', 'Cam Ranh International Airport', 'Nha Trang', 'Nha Trang', 'Việt Nam'),
(37, 'PQC', 'Phu Quoc International Airport', 'Phú Quốc', 'Phu Quoc', 'Việt Nam'),
(38, 'HPH', 'Cat Bi International Airport', 'Hải Phòng', 'Hai Phong', 'Việt Nam'),
(39, 'HUI', 'Phu Bai International Airport', 'Huế', 'Hue', 'Việt Nam'),
(40, 'VII', 'Vinh International Airport', 'Vinh', 'Vinh', 'Việt Nam'),
(41, 'VDH', 'Dong Hoi Airport', 'Đồng Hới', 'Dong Hoi', 'Việt Nam'),
(42, 'VCA', 'Can Tho International Airport', 'Cần Thơ', 'Can Tho', 'Việt Nam');

-- --------------------------------------------------------

--
-- Table structure for table `thanh_toan`
--

CREATE TABLE `thanh_toan` (
  `ma_thanh_toan` int(11) NOT NULL,
  `ma_don` int(11) NOT NULL,
  `phuong_thuc` enum('THE','VI_DIEN_TU','CHUYEN_KHOAN','TIEN_MAT') NOT NULL,
  `so_tien` int(11) NOT NULL,
  `trang_thai` enum('CHO_XU_LY','THANH_CONG','THAT_BAI') NOT NULL DEFAULT 'CHO_XU_LY',
  `thoi_gian` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `thanh_toan`
--

INSERT INTO `thanh_toan` (`ma_thanh_toan`, `ma_don`, `phuong_thuc`, `so_tien`, `trang_thai`, `thoi_gian`) VALUES
(1, 2, 'VI_DIEN_TU', 4720714, 'THANH_CONG', '2026-02-21 16:36:38'),
(2, 4, 'VI_DIEN_TU', 10626720, 'THANH_CONG', '2026-02-21 18:16:17'),
(3, 6, 'VI_DIEN_TU', 6400000, 'THANH_CONG', '2026-02-21 19:57:35'),
(4, 7, 'VI_DIEN_TU', 5000000, 'THANH_CONG', '2026-02-24 23:48:12'),
(5, 8, 'VI_DIEN_TU', 2900000, 'THANH_CONG', '2026-03-04 09:10:42');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `fullname`, `email`, `password`, `role`) VALUES
(1, 'B2306653', 'A Mách Sa Phi Y', 'yb2306653@gmail.com', '$2y$10$fDFLym1boPQZLFSjNtm.v.AUMjjfpntKEvY6u1fZrGQHNJdziBz2C', 0),
(2, 'B2306654', 'Nguyễn Đinh Thế Anh', 'ndta1111@gmail.com', '$2y$10$2eqJtic0OP78CNKyv0NXq.cLzjqq7OwaNHEBd4vRxHF325EmiO3hG', 0),
(3, 'HongNgoc', 'HongNgoc', 'angela@gmail.com', '$2y$10$xF3th501PlU0r4ynunVW0O9nvLDRPfNMgs.A9UoDrVTKe8bMbufE6', 0),
(4, 'QuangHuy', 'QuangHuy', 'huy@gmail.com', '$2y$10$Lcs87tYIkKjUjxk3GDrZEeyfeLtbz4hZyZlX7QneqeB0S0RQzGlry', 0),
(5, '', 'Nguyen Thi Ngoc Han', 'hanb2303744@student.ctu.edu.vn', '$2y$10$P3YX00TgksWPFc43UVfXieqqDNxZbUJ9iZ7CGXx6kdZGUa4M9fMb2', 0),
(6, '', 'Huynh Phuoc Thanh', 'thanh@gmail.com', '$2y$10$mOzRHB7xRhqMfzpI2CFJduBpDg.3g0ebO6thbRHqVeaqV7gxfsTSy', 0),
(7, 'bethanhadmin', 'Huynh Phuoc Thanh', 'thanhadmin@gmail.com', '123', 1),
(8, '', 'Nguyen Van A', 'a@gmail.com', '$2y$10$yudiZf/6MUl9guRMerQRFueXXBxeAUiAm4i6zlf50yk/VyCMKn.7u', 0),
(9, '', 'Nguyen Thi Ngoc Han', 'hanb2303@stude.ctu.edu.vn', '$2y$10$lRKc84WoDNPtSmGDIKsq1ugD/B.jO2eWKHoEkrLUnXBUXlgi.jLES', 0),
(10, '', 'hannieng', 'han123@gmail.com', '$2y$10$Lj1YiEAjhIua.gyVWvsNUuGwWSHJminKJPQt3k9xRYCs1NZFz1uua', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chuyen_bay`
--
ALTER TABLE `chuyen_bay`
  ADD PRIMARY KEY (`ma_chuyen_bay`),
  ADD KEY `fk_cb_hang` (`ma_hang`),
  ADD KEY `fk_cb_den` (`san_bay_den`),
  ADD KEY `idx_cb_timkiem` (`san_bay_di`,`san_bay_den`),
  ADD KEY `fk_chuyenbay_maybay` (`ma_may_bay`);

--
-- Indexes for table `don_dat_ve`
--
ALTER TABLE `don_dat_ve`
  ADD PRIMARY KEY (`ma_don`),
  ADD KEY `fk_ddv_lv` (`ma_loai_ve`),
  ADD KEY `idx_ddv_tt` (`trang_thai`),
  ADD KEY `idx_ddv_email` (`email_lien_he`);

--
-- Indexes for table `ghe`
--
ALTER TABLE `ghe`
  ADD PRIMARY KEY (`maghe`),
  ADD KEY `mamaybay` (`mamaybay`);

--
-- Indexes for table `hang_hang_khong`
--
ALTER TABLE `hang_hang_khong`
  ADD PRIMARY KEY (`ma_hang`),
  ADD UNIQUE KEY `ma_hang_code` (`ma_hang_code`);

--
-- Indexes for table `hanh_khach`
--
ALTER TABLE `hanh_khach`
  ADD PRIMARY KEY (`ma_hanh_khach`),
  ADD KEY `idx_hk_don` (`ma_don`);

--
-- Indexes for table `loai_ve`
--
ALTER TABLE `loai_ve`
  ADD PRIMARY KEY (`ma_loai_ve`),
  ADD KEY `fk_lv_cb` (`ma_chuyen_bay`);

--
-- Indexes for table `may_bay`
--
ALTER TABLE `may_bay`
  ADD PRIMARY KEY (`ma_may_bay`),
  ADD KEY `fk_maybay_hangbay` (`ma_hang`);

--
-- Indexes for table `san_bay`
--
ALTER TABLE `san_bay`
  ADD PRIMARY KEY (`ma_san_bay`),
  ADD UNIQUE KEY `ma_iata` (`ma_iata`);

--
-- Indexes for table `thanh_toan`
--
ALTER TABLE `thanh_toan`
  ADD PRIMARY KEY (`ma_thanh_toan`),
  ADD KEY `idx_tt_don` (`ma_don`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chuyen_bay`
--
ALTER TABLE `chuyen_bay`
  MODIFY `ma_chuyen_bay` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `don_dat_ve`
--
ALTER TABLE `don_dat_ve`
  MODIFY `ma_don` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `ghe`
--
ALTER TABLE `ghe`
  MODIFY `maghe` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hang_hang_khong`
--
ALTER TABLE `hang_hang_khong`
  MODIFY `ma_hang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `hanh_khach`
--
ALTER TABLE `hanh_khach`
  MODIFY `ma_hanh_khach` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `loai_ve`
--
ALTER TABLE `loai_ve`
  MODIFY `ma_loai_ve` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `may_bay`
--
ALTER TABLE `may_bay`
  MODIFY `ma_may_bay` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `san_bay`
--
ALTER TABLE `san_bay`
  MODIFY `ma_san_bay` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `thanh_toan`
--
ALTER TABLE `thanh_toan`
  MODIFY `ma_thanh_toan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chuyen_bay`
--
ALTER TABLE `chuyen_bay`
  ADD CONSTRAINT `fk_cb_den` FOREIGN KEY (`san_bay_den`) REFERENCES `san_bay` (`ma_san_bay`),
  ADD CONSTRAINT `fk_cb_di` FOREIGN KEY (`san_bay_di`) REFERENCES `san_bay` (`ma_san_bay`),
  ADD CONSTRAINT `fk_cb_hang` FOREIGN KEY (`ma_hang`) REFERENCES `hang_hang_khong` (`ma_hang`),
  ADD CONSTRAINT `fk_chuyenbay_maybay` FOREIGN KEY (`ma_may_bay`) REFERENCES `may_bay` (`ma_may_bay`),
  ADD CONSTRAINT `fk_sanbay_den` FOREIGN KEY (`san_bay_den`) REFERENCES `san_bay` (`ma_san_bay`),
  ADD CONSTRAINT `fk_sanbay_di` FOREIGN KEY (`san_bay_di`) REFERENCES `san_bay` (`ma_san_bay`);

--
-- Constraints for table `don_dat_ve`
--
ALTER TABLE `don_dat_ve`
  ADD CONSTRAINT `fk_ddv_lv` FOREIGN KEY (`ma_loai_ve`) REFERENCES `loai_ve` (`ma_loai_ve`);

--
-- Constraints for table `ghe`
--
ALTER TABLE `ghe`
  ADD CONSTRAINT `ghe_ibfk_1` FOREIGN KEY (`mamaybay`) REFERENCES `may_bay` (`ma_may_bay`);

--
-- Constraints for table `hanh_khach`
--
ALTER TABLE `hanh_khach`
  ADD CONSTRAINT `fk_hk_ddv` FOREIGN KEY (`ma_don`) REFERENCES `don_dat_ve` (`ma_don`);

--
-- Constraints for table `loai_ve`
--
ALTER TABLE `loai_ve`
  ADD CONSTRAINT `fk_lv_cb` FOREIGN KEY (`ma_chuyen_bay`) REFERENCES `chuyen_bay` (`ma_chuyen_bay`);

--
-- Constraints for table `may_bay`
--
ALTER TABLE `may_bay`
  ADD CONSTRAINT `fk_maybay_hangbay` FOREIGN KEY (`ma_hang`) REFERENCES `hang_hang_khong` (`ma_hang`);

--
-- Constraints for table `thanh_toan`
--
ALTER TABLE `thanh_toan`
  ADD CONSTRAINT `fk_tt_ddv` FOREIGN KEY (`ma_don`) REFERENCES `don_dat_ve` (`ma_don`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
