-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 23, 2026 at 09:01 PM
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
-- Database: `quan_ly_ve_may_bay`
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
  `THOIGIANDI` datetime DEFAULT NULL,
  `THOIGIANDEN` datetime DEFAULT NULL,
  `MASANBAYDI` varchar(20) DEFAULT NULL,
  `MASANBAYDEN` varchar(20) DEFAULT NULL,
  `TRANGTHAI_CB` tinyint(4) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `chuyenbay`
--

INSERT INTO `chuyenbay` (`MACHUYENBAY`, `MAMAYBAY`, `THOIGIANDI`, `THOIGIANDEN`, `MASANBAYDI`, `MASANBAYDEN`, `TRANGTHAI_CB`) VALUES
('BL301', 'BL-A320', '2026-03-21 06:30:00', '2026-03-21 07:50:00', 'DAD', 'SGN', 1),
('BL302', 'BL-A320', '2026-03-19 08:00:00', '2026-03-20 00:10:00', 'SGN', 'DAD', 4),
('BL303', 'BL-A320', '2026-03-18 06:30:00', '2026-03-19 00:25:00', 'PQC', 'SGN', 4),
('Cb001', 'MB123', '2026-03-21 08:35:00', '2026-03-21 11:35:00', 'CDG', 'HAN', 1),
('QH201', 'QH-B787', '2026-03-20 01:00:00', '2026-03-20 02:10:00', 'SGN', 'HAN', 4),
('QH202', 'QH-B787', '2026-03-26 14:00:00', '2026-03-26 16:10:00', 'HAN', 'SGN', 1),
('QH203', 'QH-B787', '2026-03-28 08:00:00', '2026-03-28 10:10:00', 'SGN', 'HAN', 1),
('VJ101', 'VJ-A320', '2026-03-26 07:30:00', '2026-03-26 09:20:00', 'HAN', 'SGN', 1),
('VN123', 'VN-A321', '2026-03-25 08:00:00', '2026-03-25 10:10:00', 'HAN', 'SGN', 1),
('VN124', 'VN-A321', '2026-03-25 11:00:00', '2026-03-25 13:10:00', 'SGN', 'PQC', 1),
('VN125', 'VN-A321', '2026-03-29 06:00:00', '2026-03-29 08:10:00', 'HAN', 'DAD', 1),
('VN456', 'VN-A350', '2026-03-25 09:30:00', '2026-03-25 10:50:00', 'SGN', 'DAD', 1),
('VN457', 'VN-A350', '2026-03-25 12:30:00', '2026-03-25 14:00:00', 'DAD', 'SGN', 1),
('VN458', 'VN-A350', '2026-03-11 09:00:00', '2026-03-29 10:30:00', 'DAD', 'HAN', 3);

-- --------------------------------------------------------

--
-- Table structure for table `diadiem`
--

CREATE TABLE `diadiem` (
  `MADIADIEM` varchar(20) NOT NULL,
  `TENDIADIEM` varchar(100) DEFAULT NULL,
  `QUOC_GIA` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `diadiem`
--

INSERT INTO `diadiem` (`MADIADIEM`, `TENDIADIEM`, `QUOC_GIA`) VALUES
('BKK', 'Bangkok', 'Thái Lan'),
('CDG', 'Paris', 'Pháp'),
('CTO', 'Cần Thơ', ''),
('CXR', 'Nha Trang', 'Việt Nam'),
('DAD', 'Đà Nẵng', ''),
('DLI', 'Đà Lạt', 'Việt Nam'),
('DMK', 'Bangkok', 'Thái Lan'),
('DXB', 'Dubai', 'UAE'),
('FRA', 'Frankfurt', 'Đức'),
('GMP', 'Seoul', 'Hàn Quốc'),
('HAN', 'Hà Nội', ''),
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
('PQC', 'Phú Quốc', ''),
('PVG', 'Thượng Hải', 'Trung Quốc'),
('SGN', 'TP Hồ Chí Minh', ''),
('SIN', 'Singapore', 'Singapore'),
('SYD', 'Sydney', 'Úc'),
('THD', 'Thanh Hóa', 'Việt Nam'),
('VCL', 'Quảng Nam', 'Việt Nam'),
('VDH', 'Điện Biên', 'Việt Nam'),
('VII', 'Vinh', 'Việt Nam');

-- --------------------------------------------------------

--
-- Table structure for table `diemdulich`
--

CREATE TABLE `diemdulich` (
  `MADIEMDULICH` varchar(8) NOT NULL,
  `TENDIEMDULICH` varchar(100) NOT NULL,
  `MOTA1` text NOT NULL,
  `MOTA2` text NOT NULL,
  `HINHANH` varchar(255) NOT NULL,
  `DULICHTRONGNUOC` tinyint(1) NOT NULL DEFAULT 1,
  `DANSO` float NOT NULL,
  `DIENTICH` float NOT NULL,
  `MUIGIO` varchar(50) NOT NULL DEFAULT 'GMT +7',
  `NGONNGU` varchar(100) NOT NULL DEFAULT 'Tiếng Việt',
  `QUOCGIA` varchar(100) NOT NULL DEFAULT 'Việt Nam',
  `SANBAY` int(11) NOT NULL DEFAULT 1,
  `TIENTE` varchar(20) NOT NULL DEFAULT 'VND'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `diemdulich`
--

INSERT INTO `diemdulich` (`MADIEMDULICH`, `TENDIEMDULICH`, `MOTA1`, `MOTA2`, `HINHANH`, `DULICHTRONGNUOC`, `DANSO`, `DIENTICH`, `MUIGIO`, `NGONNGU`, `QUOCGIA`, `SANBAY`, `TIENTE`) VALUES
('DL001', 'Quảng Bình', 'Quảng Bình là tỉnh miền Trung nổi bật với những thắng cảnh thiên nhiên tuyệt đẹp như động Phong Nha, vườn quốc gia Phong Nha - Kẻ Bàng và các bãi biển nổi tiếng. Đây là điểm đến lý tưởng cho những ai yêu thích khám phá động, hang, rừng và các khu di tích lịch sử.', 'Quảng Bình nổi bật với động Phong Nha, Thiên Đường, các khu di tích lịch sử và các bãi biển tuyệt đẹp. Các hoạt động du lịch khám phá hệ thống hang động, trekking trong vườn quốc gia Phong Nha – Kẻ Bàng luôn hấp dẫn du khách yêu thích thiên nhiên.', 'https://vja-travel.useleadr.com/uploads/qbbbbb.jpg', 1, 0.91, 8.065, 'GMT +7', 'Tiếng Việt', 'Việt Nam', 1, 'VND'),
('DL002', 'Gia Lai', 'Gia Lai là tỉnh nằm ở khu vực Tây Nguyên của Việt Nam, nổi bật với cao nguyên rộng lớn, núi non hùng vĩ và khí hậu trong lành. Tỉnh này thu hút du khách bởi thiên nhiên còn nguyên sơ, những thác nước đẹp, hồ T’Nung yên bình và bản sắc văn hóa đặc trưng của các cộng đồng dân tộc địa phương. Gia Lai là điểm đến lý tưởng cho những ai yêu thích du lịch thiên nhiên và tìm hiểu văn hóa.', 'Gia Lai có các điểm tham quan nổi bật như biển Hồ Chè, hồ T\'nưng, các làng dân tộc thiểu số và khu du lịch sinh thái. Du khách có thể tham gia các chuyến đi bộ đường dài, tìm hiểu về các di tích văn hóa và tham gia các hoạt động khám phá thiên nhiên.', 'https://vja-travel.useleadr.com/uploads/glllll.png', 1, 1.63, 15.51, 'GMT +7', 'Tiếng Việt', 'Việt Nam', 1, 'VND'),
('DL003', 'Nghệ An', 'Nghệ An là tỉnh miền Trung nổi bật với những cánh đồng lúa bạt ngàn, những bãi biển đẹp và các di tích lịch sử quan trọng. Thành phố Vinh là trung tâm của tỉnh, không chỉ là nơi có nền kinh tế phát triển mà còn là nơi lưu giữ nhiều di tích lịch sử và văn hóa của miền Bắc.', 'Nghệ An là tỉnh miền Trung nổi bật với những cánh đồng lúa bạt ngàn, những bãi biển đẹp và các di tích lịch sử quan trọng. Thành phố Vinh là trung tâm của tỉnh, không chỉ là nơi có nền kinh tế phát triển mà còn là nơi lưu giữ nhiều di tích lịch sử và văn hóa của miền Bắc.', 'https://vja-travel.useleadr.com/uploads/naa.jpeg', 1, 3.2, 16.49, 'GMT +7', 'Tiếng Việt', 'Việt Nam', 1, 'VND'),
('DL004', 'Hà Nội', 'Hà Nội là thủ đô của Việt Nam, nổi bật với vẻ đẹp cổ kính pha lẫn hiện đại. Thành phố này lưu giữ nhiều di sản văn hóa lâu đời, với những con phố cổ, hồ Hoàn Kiếm và các đền, chùa lịch sử. Hà Nội không chỉ là trung tâm chính trị, mà còn là nơi hội tụ các giá trị văn hóa truyền thống và sự phát triển của xã hội hiện đại.', 'Tham quan ở Hà Nội mang đến nhiều cơ hội khám phá văn hóa và lịch sử, với các địa danh nổi tiếng như Lăng Chủ tịch Hồ Chí Minh, khu phố cổ, và các di tích lịch sử quan trọng. Ngoài ra, thành phố còn có các công viên, bảo tàng và những khu vực du lịch sinh thái để du khách thư giãn và tìm hiểu về văn hóa Việt Nam.\r\n', 'https://vja-travel.useleadr.com/uploads/DemHaNoi.jpg', 1, 8.71, 3.359, 'GMT +7', 'Tiếng Việt', 'Việt Nam', 1, 'VN'),
('DL005', 'Thành phố Hồ Chí Minh', 'TP.HCM, hay còn gọi là Sài Gòn, là thành phố năng động và phát triển bậc nhất Việt Nam. Nơi đây nổi bật với sự kết hợp giữa kiến trúc hiện đại và những di sản lịch sử, tạo nên một không gian đầy ấn tượng. TP.HCM là trung tâm kinh tế, văn hóa và du lịch, thu hút hàng triệu du khách mỗi năm bởi nhịp sống sôi động, ẩm thực phong phú và con người thân thiện.', 'TP.HCM, hay còn gọi là Sài Gòn, là một điểm đến du lịch tuyệt vời với sự pha trộn giữa nét hiện đại và truyền thống. Du khách có thể khám phá các công trình lịch sử như Dinh Độc Lập, Nhà thờ Đức Bà và Chợ Bến Thành. Thành phố cũng nổi bật với các khu mua sắm sầm uất, những món ăn đường phố đặc trưng và nền văn hóa đa dạng. Với những trải nghiệm thú vị này, TP.HCM chắc chắn là địa điểm không thể bỏ qua.', 'https://vja-travel.useleadr.com/uploads/shutterstock1965804106-1640951934873.png', 1, 9.46, 2.095, 'GMT +7', 'Tiếng Việt', 'Việt Nam', 1, ''),
('DL006', 'Phú Quốc', 'Phú Quốc, hay còn được mệnh danh là “đảo ngọc”, là một trong những điểm du lịch nổi tiếng nhất Việt Nam. Nơi đây nổi bật với những bãi biển trong xanh, bờ cát trắng mịn cùng hệ sinh thái rừng và biển phong phú, tạo nên khung cảnh thiên nhiên tuyệt đẹp. Phú Quốc không chỉ thu hút du khách bởi vẻ đẹp hoang sơ mà còn bởi các khu nghỉ dưỡng hiện đại, khu vui chơi giải trí và nền ẩm thực hải sản đa dạng.', 'Phú Quốc là một điểm đến du lịch nổi tiếng với vẻ đẹp tự nhiên hoang sơ và biển xanh trong vắt. Du khách có thể tham quan các bãi biển tuyệt đẹp như Bãi Sao, Bãi Dài, khám phá những khu chợ địa phương nhộn nhịp như Chợ Dương Đông, hoặc ghé thăm các điểm tham quan nổi bật như VinWonders Phú Quốc, Vườn Quốc gia Phú Quốc và các làng chài truyền thống. Hòn đảo cũng nổi bật với các món hải sản tươi ngon, trải nghiệm lặn biển ngắm san hô và không gian thư giãn yên bình. Với những trải nghiệm độc đáo này, Phú Quốc chắc chắn là điểm đến không thể bỏ qua.', 'https://vja-travel.useleadr.com/uploads/depositphotos45998325xl-1724809601556.jpg', 1, 0.1576, 575, 'GMT +7', 'Tiếng Việt', 'Việt Nam', 1, 'VND'),
('DL007', 'Nhật Bản', 'Nhật Bản là một quốc gia phát triển nổi tiếng với sự kết hợp hài hòa giữa truyền thống và hiện đại. Nơi đây có những ngôi đền cổ kính, hoa anh đào tuyệt đẹp cùng các thành phố hiện đại bậc nhất thế giới. Nhật Bản còn thu hút du khách bởi văn hóa đặc sắc, ẩm thực tinh tế và con người lịch sự, thân thiện.', '', 'https://encrypted-tbn0.gstatic.com/licensed-image?q=tbn:ANd9GcS1Se-_5NSMgmwF_KpETRWQg6Pta2M5JtTAiGaBLw65TUyDLmgJRP0PKk6mbCiT2DoqH-Ew0LFMSHLCA2RTVOLKdgE&s=19', 0, 0, 0, '', '', '', 0, '0'),
('DL008', 'Hàn Quốc', 'Hàn Quốc là quốc gia năng động và hiện đại tại châu Á. Đất nước này nổi bật với nền công nghệ tiên tiến, văn hóa K-pop, phim ảnh và ẩm thực đặc trưng. Hàn Quốc thu hút du khách bởi các thành phố sôi động, cung điện cổ kính và cảnh đẹp thiên nhiên theo bốn mùa rõ rệt.', '', 'https://lh3.googleusercontent.com/gps-cs-s/AHVAwep5vGgJrBbi7ZmKa8EpPvtY9zGgCPZeXOULDi9Bs7-WPiiEc3YORCslYFnRg6UNXKchovxSIoS9U57fuap03R5SAClPgniFFgrZYkbQAZ-jjdvleNSPL3NZwx-j8thw20z55A5eDA=w675-h390-n-k-no', 0, 0, 0, '', '', '', 0, '0'),
('DL009', 'Thái Lan', 'Thái Lan là điểm du lịch nổi tiếng với những bãi biển đẹp, chùa chiền lộng lẫy và nền văn hóa đặc sắc. Thái Lan còn được biết đến với ẩm thực đường phố phong phú, các khu chợ đêm nhộn nhịp và con người thân thiện, hiếu khách.', '', 'https://lh3.googleusercontent.com/gps-cs-s/AHVAwer1bFWl2AYEAHDSHCmRd36NPbDeTIiGkdapkbWiGuip6fiT2ObSDWDCR4ea3T-uCss7MCOQ0W9JVXAD-ZsSb3FpmouORQCm_sCViLsme25HBxpv9K72ZfMKir18k5QXGHZrb_pM=w675-h390-n-k-no', 0, 0, 0, '', '', '', 0, '0'),
('DL010', 'Pháp', 'Pháp là một trong những quốc gia nổi tiếng nhất châu Âu với kiến trúc cổ kính, nghệ thuật và thời trang. Nơi đây thu hút du khách bởi những công trình lịch sử nổi tiếng, nền ẩm thực tinh tế và không gian lãng mạn, đặc biệt là tại thủ đô Paris.', '', 'https://encrypted-tbn0.gstatic.com/licensed-image?q=tbn:ANd9GcS-oup94Pnik51hWCcFhPJ3lSGnHN2G453bLyxI2hUa995zWELSmzgvEiWB1ggcXChdFRcNCQkX9i1l1svK6HqR_dg&s=19', 0, 0, 0, '', '', '', 0, '0'),
('DL011', 'Mỹ', 'Mỹ là quốc gia phát triển hàng đầu thế giới với nền kinh tế, khoa học và công nghệ hiện đại. Mỹ nổi bật với các thành phố lớn, các công trình biểu tượng, nền văn hóa đa dạng và nhiều địa điểm du lịch nổi tiếng thu hút hàng triệu du khách mỗi năm.', '', 'https://duhocinec.com/wp-content/uploads/2024/09/dat-nuoc-my-01.jpg', 0, 0, 0, '', '', '', 0, '0'),
('DL012', 'Úc', 'Úc là quốc gia nổi tiếng với thiên nhiên hoang sơ, bãi biển đẹp và các thành phố đáng sống. Úc thu hút du khách bởi hệ động vật đặc trưng, các công trình kiến trúc nổi tiếng và môi trường sống trong lành, hiện đại.', '', 'https://vj-prod-website-cms.s3.ap-southeast-1.amazonaws.com/1178445745-copy-1674668916271.jpg', 0, 0, 0, '', '', '', 0, '0');

-- --------------------------------------------------------

--
-- Table structure for table `diemthamquan`
--

CREATE TABLE `diemthamquan` (
  `MADIEMTHAMQUAN` varchar(8) NOT NULL,
  `MADIEMDULICH` varchar(8) NOT NULL,
  `TENDIEMTHAMQUAN` varchar(100) NOT NULL,
  `HINHANH` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `diemthamquan`
--

INSERT INTO `diemthamquan` (`MADIEMTHAMQUAN`, `MADIEMDULICH`, `TENDIEMTHAMQUAN`, `HINHANH`) VALUES
('TQ001', 'DL001', 'Động Thiên Đường Paradise Cave', 'https://upload.wikimedia.org/wikipedia/commons/8/88/Grotte_Thien_Duong.jpg'),
('TQ0010', 'DL002', 'Hồ thủy điện Ia Ly', 'https://cdn.xanhsm.com/2025/03/2c924d67-dap-thuy-dien-ialy-thumb.jpg'),
('TQ0011', 'DL002', 'Quảng trường Đại Đoàn Kết', 'https://images.vietnamtourism.gov.vn/vn//images/2025/thang_2/qt-ddk-1-img_5562.jpg'),
('TQ002', 'DL001', 'Hang Sơn Đoòng', 'https://thanhnien.mediacdn.vn/Uploaded/phucndh/2022_04_14/a4-5211.jpg'),
('TQ003', 'DL001', 'Suối Nước Mooc', 'https://statics.vinpearl.com/suoi-nuoc-mooc--_1629695174.jpg'),
('TQ004', 'DL001', 'Vườn quốc gia Phong Nha – Kẻ Bàng', 'https://api.sovaba.travel/uploads/duoc_cong_nhan_la_di_san_thien_nhien_the_gioi_07d303cce9.jpg'),
('TQ005', 'DL001', 'Chùa Hoằng Phúc', 'https://dulichnewtour.vn/ckfinder/images/Tours/chuahoangphucquangbinh/chua-hoang-phuc-quang-binh%20(8).jpg'),
('TQ006', 'DL002', 'Biển Hồ hè', 'https://images.vietnamtourism.gov.vn/vn/images/2021/Thang_6/bien_ho_che__gia_lai_1221370027_resize.jpeg'),
('TQ007', 'DL002', 'Chùa Bửu Minh Cổ Tự', 'https://mia.vn/media/uploads/blog-du-lich/chua-buu-minh-va-net-dep-co-kinh-ton-tai-cung-thang-nam-01-1660238403.jpeg'),
('TQ008', 'DL002', 'Biển Hồ Pleiku', 'https://vja-travel.useleadr.com/uploads/shutterstock1089464021huge-1679553135450.jpg'),
('TQ009', 'DL002', 'Đường hàng thông cổ thụ', 'https://thanhnien.mediacdn.vn/Uploaded/trantam/2022_11_15/img-20221115-101509-1832.jpg'),
('TQ012', 'DL003', 'Quê Bác Hồ - Làng Sen', 'https://images.baodantoc.vn/uploads/2021/Th%C3%A1ng%205/Ng%C3%A0y_19/lang-sen-nghe-an-vitravel-2.jpg'),
('TQ013', 'DL003', 'Biển Cửa Lò', 'https://bizweb.dktcdn.net/100/006/093/files/kinh-nghiem-du-lich-cua-lo-11.jpg?v=1579138150073'),
('TQ014', 'DL003', 'Khu Di tích Kim Liên - Quê Nội Bác Hồ ', 'https://baotanghochiminh.vn/pic/News/images/Que%20noi.jpg'),
('TQ015', 'DL003', 'Vườn quốc gia Pù Mát', 'https://vcdn1-dulich.vnecdn.net/2025/03/09/thackem2-1741497134-1741497212-1855-1741498170.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=GizmZemJ0294BILblf6FKg'),
('TQ016', 'DL003', 'Thác Khe Kèm', 'https://zoomtravel.vn/upload/images/thac-khe-kem-1-min.jpg'),
('TQ017', 'DL003', 'Đền Cuông', 'https://static.vinwonders.com/production/den-cuong-nghe-an-banner-1.jpg'),
('TQ018', 'DL003', 'Cánh đồng hoa hướng dương Nghĩa Đàn', 'https://truyenhinhnghean.vn/file/4028eaa46735a26101673a4df345003c/4028eaa467f477c80167f4aa053f0c68/122020/hoa5_20201218155117.jpg'),
('TQ019', 'DL004', 'Hồ Hoàn Kiếm', 'https://xesaoviet.com.vn/wp-content/uploads/2025/08/c.jpg'),
('TQ020', 'DL004', 'Lăng Chủ tịch Hồ Chí Minh', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsUR0UFEEwgWCuSogetZZWziHIqR3bQSIniA&s'),
('TQ021', 'DL004', 'Văn Miếu - Quốc Tử Giám', 'https://upload.wikimedia.org/wikipedia/commons/3/39/Hanoi_Temple_of_Literature_%28cropped%29.jpg'),
('TQ022', 'DL004', 'Chùa Một Cột', 'https://motogo.vn/wp-content/uploads/2023/10/Chua-Mot-Cot-16.jpg'),
('TQ023', 'DL004', 'Hồ Tây', 'https://static.vinwonders.com/production/ho-tay-o-dau-1.jpg'),
('TQ024', 'DL004', 'Nhà thờ Lớn Hà Nội', 'https://cdn.justfly.vn/2560x1926/media/202310/27/1698394704-z4823032161533_e07e28448b7b178547a6d60548c3ed83.jpg'),
('TQ025', 'DL004', 'Phố cổ Hà Nội', 'https://static.vinwonders.com/production/pho-co-ha-noi-1.jpg'),
('TQ026', 'DL004', 'Hoàng thành Thăng Long', 'https://upload.wikimedia.org/wikipedia/commons/4/4a/Thang_Long_Imperial_Citadel.jpg'),
('TQ027', 'DL005', 'Chợ Bến Thành', 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/Ben_Thanh_market_2.jpg/330px-Ben_Thanh_market_2.jpg'),
('TQ028', 'DL005', 'Nhà thờ Đức Bà Sài Gòn', 'https://mia.vn/media/uploads/blog-du-lich/nha-tho-duc-ba-sai-gon-ruc-ro-1692570394.jpg'),
('TQ029', 'DL005', 'Bưu điện Trung tâm Sài Gòn', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQakYZFyM0bDfTd2WwiEohRlr0KW6ugUVLjUw&s'),
('TQ030', 'DL005', 'Dinh Độc Lập', 'https://upload.wikimedia.org/wikipedia/commons/d/d0/Dinh_%C4%90%E1%BB%99c_L%E1%BA%ADp_v%C3%A0o_n%C3%A0m_2024.jpg'),
('TQ031', 'DL005', 'Phố đi bộ Nguyễn Huệ', 'https://www.themystdongkhoihotel.com/wp-content/uploads/2025/07/nguyen-hue-walking-street.jpg'),
('TQ032', 'DL005', 'Tòa nhà Bitexco', 'https://upload.wikimedia.org/wikipedia/commons/4/46/Bitexco_Financial_Tower_20022012_cropped.JPG'),
('TQ033', 'DL005', 'Thảo Cầm Viên Sài Gòn', 'https://cdn.tgdd.vn/Files/2022/02/21/1416530/tham-quan-thao-cam-vien-sai-gon-cuc-ly-tuong-vao-cuoi-tuan-202202211016241834.jpg'),
('TQ034', 'DL005', 'Địa đạo Củ Chi', 'https://tuotz.com/wp-content/uploads/2025/07/dia-dao-cu-chi-1.png'),
('TQ035', 'DL006', 'Bãi Sao', 'https://ik.imagekit.io/tvlk/blog/2022/07/dHj0gcod-bai-sao-8.jpg'),
('TQ036', 'DL006', 'Bãi Dài', 'https://letsflytravel.vn/wp-content/uploads/2024/04/bai-dai-letsflytravel.jpg'),
('TQ037', 'DL006', 'VinWonders Phú Quốc', 'https://phuquoctrip.com/files/images/vui-choi-phu-quoc/phu-quoc-united-center/vinwonders/vinwonder.jpg'),
('TQ038', 'DL006', 'Vinpearl Safari Phú Quốc', 'https://cassiacottage.com/wp-content/uploads/2025/10/Vinpearl-Phu-Quoc-Cassia-Cottage-Resort-and-Spa-4.jpg'),
('TQ039', 'DL006', 'Dinh Cậu', 'https://salindaresort.com/uploads/articles/48/dinh-cau-phu-quoc-net-dep-tam-linh-cua-dao-ngoc.jpg'),
('TQ040', 'DL006', 'Hòn Thơm', 'https://phuquoctrip.com/files/images/vui-choi-phu-quoc/cap-treo-hon-thom/Sun%20World%20Hon%20Thom%20Nature%20Park_1200x675.jpg'),
('TQ041', 'DL006', 'Cáp treo Hòn Thơm', 'https://ik.imagekit.io/tvlk/blog/2023/01/cap-treo-hon-thom-1.jpg?tr=q-70,c-at_max,w-1000,h-600'),
('TQ042', 'DL006', 'Nhà tù Phú Quốc', 'https://booking.muongthanh.com/upload_images/images/toan-canh-nha-tu-phu-quoc.jpg');

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
('HK004', 'Nguyễn Thị Ngọc Hân', '0938456789', '075556677889', 'P. An Khánh - Q. Ninh Kiều - TP. Cần Thơ'),
('HK1774020572', 'Huỳnh Phước Thanh', '0338206408', '0123456789', NULL),
('HK1774020712', 'Huỳnh Phước Thanh', '0338206408', '0123456789', NULL),
('HK1774021215', 'Huỳnh Phước Thanh', '0338206408', '0123456789', NULL),
('HK1774022820', 'Huỳnh Phước Thanh', '0338206408', '0123456789', NULL);

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
('HD008', 'HK001', 'NV001', '2026-03-18 09:05:00', NULL, 'Chưa thanh toán', 'Có hiệu lực'),
('HD1774020572', 'HK1774020572', 'NV001', '2026-03-20 16:29:32', NULL, 'Đã thanh toán', NULL),
('HD1774020712', 'HK1774020712', 'NV001', '2026-03-20 16:31:52', NULL, 'Đã thanh toán', NULL),
('HD1774021215', 'HK1774021215', 'NV001', '2026-03-20 16:40:15', NULL, 'Đã thanh toán', NULL),
('HD1774022820', 'HK1774022820', 'NV001', '2026-03-20 17:07:00', NULL, 'Đã thanh toán', NULL);

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
  `TENMAYBAY` varchar(100) DEFAULT NULL,
  `TONGSOGHE` int(11) DEFAULT NULL,
  `SOGHE_THUONGGIA` int(11) DEFAULT NULL,
  `SOGHE_PHOTHONG` int(11) DEFAULT NULL,
  `SOGHE_HANGNHAT` int(11) DEFAULT NULL,
  `TRANGTHAI` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `maybay`
--

INSERT INTO `maybay` (`MAMAYBAY`, `MAHANG`, `TENMAYBAY`, `TONGSOGHE`, `SOGHE_THUONGGIA`, `SOGHE_PHOTHONG`, `SOGHE_HANGNHAT`, `TRANGTHAI`) VALUES
('BL-A320', 'BL', 'Airbus A320', NULL, 2, 18, 0, '1'),
('MB123', 'VJ', 'Airbus A321', NULL, 0, 0, 0, '1'),
('QH-B787', 'QH', 'Boeing 787', NULL, 6, 10, 4, '1'),
('VJ-A320', 'VJ', 'Airbus A320', NULL, 2, 18, 0, '1'),
('VN-A321', 'VN', 'Airbus A321', NULL, 6, 10, 4, '1'),
('VN-A350', 'VN', 'Airbus A350', NULL, 6, 10, 4, '1');

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
(4, 'admin', NULL, 'NV001', 'admin@gmail.com', '$2y$10$1N6CjhJ2vCg6jqejxZUwn.m5WPmw3saEO40KHX73.zMHW4mPhdCQa', 1, 'Nguyen Van C', '0123456789', '1999-09-22', 'Nam'),
(5, 'b2303744', NULL, NULL, 'hanb2303744@student.ctu.edu.vn', '$2y$10$w4Y8gjEGI/etwBDVCbw1eekx5PZ57lCArdp1f2j6bJhhMfGqZYiEy', NULL, 'Nguyen Thi Ngoc Han ', '0775812920', '0000-00-00', '');

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
  `NGAYDATVE` datetime DEFAULT NULL,
  `MAHOADON` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `ve`
--

INSERT INTO `ve` (`MAVE`, `MACHUYENBAY`, `MAGHE`, `MAHANHKHACH`, `GIAVE`, `NGAYDATVE`, `MAHOADON`) VALUES
('VE001', 'VN123', '1A', 'HK001', 600000.00, '2026-03-18 08:00:00', NULL),
('VE002', 'VN123', '1B', 'HK002', 15000000.00, '2026-03-18 08:05:00', NULL),
('VE003', 'VN123', '1D', 'HK004', 15000000.00, '2026-03-18 08:15:00', NULL),
('VE004', 'VN123', '2B', 'HK001', 8000000.00, '2026-03-18 08:25:00', NULL),
('VE005', 'VN123', '2C', 'HK002', 8000000.00, '2026-03-18 08:30:00', NULL),
('VE006', 'VN123', '2E', 'HK004', 8000000.00, '2026-03-18 08:40:00', NULL),
('VE009', 'BL302', '1A-BL', 'HK001', 6000000.00, '2026-03-18 09:00:00', NULL),
('VE1774020572', 'VJ101', '1A-VJ', 'HK1774020572', 7000000.00, '2026-03-20 16:29:32', NULL),
('VE1774020712', 'QH202', '1A-QH', 'HK1774020712', 18000000.00, '2026-03-20 16:31:52', NULL),
('VE1774021215', 'QH202', '1B-QH', 'HK1774021215', 18000000.00, '2026-03-20 16:40:15', NULL),
('VE1774022820', 'VJ101', '1A-VJ', 'HK1774022820', 7000000.00, '2026-03-20 17:07:00', NULL);

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
  ADD KEY `fk_chuyenbay_sanbay_di` (`MASANBAYDI`),
  ADD KEY `fk_chuyenbay_sanbay_den` (`MASANBAYDEN`);

--
-- Indexes for table `diadiem`
--
ALTER TABLE `diadiem`
  ADD PRIMARY KEY (`MADIADIEM`);

--
-- Indexes for table `diemdulich`
--
ALTER TABLE `diemdulich`
  ADD PRIMARY KEY (`MADIEMDULICH`);

--
-- Indexes for table `diemthamquan`
--
ALTER TABLE `diemthamquan`
  ADD PRIMARY KEY (`MADIEMTHAMQUAN`),
  ADD KEY `fk_ddl_dtq` (`MADIEMDULICH`);

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `ID_USER` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  ADD CONSTRAINT `fk_chuyenbay_sanbay_den` FOREIGN KEY (`MASANBAYDEN`) REFERENCES `sanbay` (`MASANBAY`),
  ADD CONSTRAINT `fk_chuyenbay_sanbay_di` FOREIGN KEY (`MASANBAYDI`) REFERENCES `sanbay` (`MASANBAY`);

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
