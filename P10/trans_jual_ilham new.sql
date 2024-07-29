-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 14, 2024 at 09:11 AM
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
-- Database: `trans_jual_ilham`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `kdbrg` char(10) NOT NULL,
  `nmbrg` char(30) DEFAULT NULL,
  `satuan` char(25) DEFAULT NULL,
  `harga` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`kdbrg`, `nmbrg`, `satuan`, `harga`) VALUES
('BR-001', 'KERAMIK MULIA', 'KON. 60 FIT', 780000000),
('BR-002', 'GRANIT', 'KON. 90 FIT', 1200000000),
('BR-003', 'BERAS', 'KON. 40 FIT', 500000000);

-- --------------------------------------------------------

--
-- Table structure for table `cust`
--

CREATE TABLE `cust` (
  `kdcust` char(10) NOT NULL,
  `nmcust` char(25) DEFAULT NULL,
  `almtcust` char(10) DEFAULT NULL,
  `kotacust` char(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cust`
--

INSERT INTO `cust` (`kdcust`, `nmcust`, `almtcust`, `kotacust`) VALUES
('C001', 'TOKO KERAMIK SURYA', 'JL. MERPAT', 'K1'),
('C002', 'TOKO ALAT BANGUNAN', 'JL. MERAK', 'K2'),
('C003', 'TOKO SEMBAKO', 'JL. ANGGRE', 'K5');

-- --------------------------------------------------------

--
-- Stand-in structure for view `data_fak_sales_kota`
-- (See below for the actual view)
--
CREATE TABLE `data_fak_sales_kota` (
`transbeli` char(10)
,`supplier` char(35)
,`kota` char(20)
);

-- --------------------------------------------------------

--
-- Table structure for table `kota`
--

CREATE TABLE `kota` (
  `kota` char(2) NOT NULL,
  `namakota` char(20) DEFAULT NULL,
  `propinsi` char(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kota`
--

INSERT INTO `kota` (`kota`, `namakota`, `propinsi`) VALUES
('K1', 'PEKALONGAN', 'JAWA TENGAH'),
('K2', 'BATANG', 'JAWA TENGAH'),
('K3', 'JAKARTA', 'DKI JAKARTA'),
('K4', 'BANDUNG', 'JAWA BARAT'),
('K5', 'MALANG', 'JAWA TIMUR');

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `kdpeg` char(10) NOT NULL,
  `nmpeg` char(25) DEFAULT NULL,
  `almtpeg` char(35) DEFAULT NULL,
  `kotapeg` char(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`kdpeg`, `nmpeg`, `almtpeg`, `kotapeg`) VALUES
('P001', 'BUDIWALUYO', 'JL. PENI', 'K1'),
('P002', 'SARI PUSPA', 'JL. CERMAI', 'K2'),
('P003', 'ILHAM R', 'JL. ANGGREK', 'K5');

-- --------------------------------------------------------

--
-- Stand-in structure for view `qty_1000`
-- (See below for the actual view)
--
CREATE TABLE `qty_1000` (
`nofaktur` char(10)
,`nmbrg` char(30)
,`qty` int(8)
,`nmsuppl` char(35)
);

-- --------------------------------------------------------

--
-- Table structure for table `returbeli`
--

CREATE TABLE `returbeli` (
  `noretbeli` char(10) NOT NULL,
  `nofaktur` char(10) DEFAULT NULL,
  `tglretur` date DEFAULT NULL,
  `kdbrg` char(10) DEFAULT NULL,
  `qty` int(8) DEFAULT NULL,
  `ketbrg` char(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `returbeli`
--

INSERT INTO `returbeli` (`noretbeli`, `nofaktur`, `tglretur`, `kdbrg`, `qty`, `ketbrg`) VALUES
('RT-B-0001', 'NT-B-0001', '2019-03-12', 'BR-002', 15, 'PECAH'),
('RT-B-0002', 'NT-B-0004', '2019-03-15', 'BR-003', 20, 'RUSAK');

-- --------------------------------------------------------

--
-- Table structure for table `returjual`
--

CREATE TABLE `returjual` (
  `noreturjual` char(10) NOT NULL,
  `nota` char(10) DEFAULT NULL,
  `tglRetur` date DEFAULT NULL,
  `kdbrg` char(10) DEFAULT NULL,
  `qty` int(8) DEFAULT NULL,
  `ketbrg` char(20) DEFAULT NULL,
  `kdpeg` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `returjual`
--

INSERT INTO `returjual` (`noreturjual`, `nota`, `tglRetur`, `kdbrg`, `qty`, `ketbrg`, `kdpeg`) VALUES
('RT-J-0001', 'NT-J-0001', '2019-04-09', 'BR-002', 4, 'KARDUS DAN PECAH', 'P001'),
('RT-J-0002', 'NT-J-0002', '2019-04-20', 'BR-003', 5, 'BERASNYA JELEK', 'P003');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `kdsuppl` char(10) NOT NULL,
  `nmsuppl` char(35) DEFAULT NULL,
  `almtsuppl` char(35) DEFAULT NULL,
  `kotasuppl` char(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`kdsuppl`, `nmsuppl`, `almtsuppl`, `kotasuppl`) VALUES
('S001', 'AHMAT', 'JL. MERDEKA', 'K3'),
('S002', 'JOKO', 'JL. CI AMLAS', 'K4'),
('S003', 'BUDI', 'JL. A.YANI', 'K2');

-- --------------------------------------------------------

--
-- Table structure for table `transbeli`
--

CREATE TABLE `transbeli` (
  `nofaktur` char(10) NOT NULL,
  `tglbeli` date DEFAULT NULL,
  `kdsuppl` char(10) DEFAULT NULL,
  `kdbrg` char(10) DEFAULT NULL,
  `qty` int(8) DEFAULT NULL,
  `jml` int(10) DEFAULT NULL,
  `hargabeli` bigint(13) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transbeli`
--

INSERT INTO `transbeli` (`nofaktur`, `tglbeli`, `kdsuppl`, `kdbrg`, `qty`, `jml`, `hargabeli`) VALUES
('NT-B-0001', '2019-02-10', 'S001', 'BR-002', 3600, 2, 2400000000),
('NT-B-0002', '2019-02-16', 'S002', 'BR-002', 500, 3, 3600000000),
('NT-B-0003', '2019-02-20', 'S002', 'BR-002', 500, 2, 2400000000),
('NT-B-0004', '2019-02-28', 'S003', 'BR-003', 700, 5, 2500000000);

-- --------------------------------------------------------

--
-- Table structure for table `transjual`
--

CREATE TABLE `transjual` (
  `nota` char(10) NOT NULL,
  `tglnota` date DEFAULT NULL,
  `kdcust` char(10) DEFAULT NULL,
  `kdbrg` char(10) DEFAULT NULL,
  `qty` char(8) DEFAULT NULL,
  `jml` int(10) DEFAULT NULL,
  `hargajual` int(10) DEFAULT NULL,
  `kdpeg` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transjual`
--

INSERT INTO `transjual` (`nota`, `tglnota`, `kdcust`, `kdbrg`, `qty`, `jml`, `hargajual`, `kdpeg`) VALUES
('NT-J-0001', '2019-04-04', 'C001', 'BR-002', '1800', 1, 1200000000, 'P002'),
('NT-J-0002', '2019-04-07', 'C003', 'BR-003', '2000', 1, 500000000, 'P003');

-- --------------------------------------------------------

--
-- Structure for view `data_fak_sales_kota`
--
DROP TABLE IF EXISTS `data_fak_sales_kota`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `data_fak_sales_kota`  AS SELECT `transbeli`.`nofaktur` AS `transbeli`, `supplier`.`nmsuppl` AS `supplier`, `kota`.`namakota` AS `kota` FROM ((`transbeli` join `supplier`) join `kota`) ;

-- --------------------------------------------------------

--
-- Structure for view `qty_1000`
--
DROP TABLE IF EXISTS `qty_1000`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `qty_1000`  AS SELECT `transbeli`.`nofaktur` AS `nofaktur`, `barang`.`nmbrg` AS `nmbrg`, `transbeli`.`qty` AS `qty`, `supplier`.`nmsuppl` AS `nmsuppl` FROM ((`transbeli` join `barang`) join `supplier`) WHERE `transbeli`.`qty` < 1000 ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD UNIQUE KEY `kdbrg` (`kdbrg`);

--
-- Indexes for table `cust`
--
ALTER TABLE `cust`
  ADD UNIQUE KEY `kdcust` (`kdcust`),
  ADD KEY `kotacust` (`kotacust`),
  ADD KEY `nmcust_inx` (`nmcust`);

--
-- Indexes for table `kota`
--
ALTER TABLE `kota`
  ADD UNIQUE KEY `kota` (`kota`),
  ADD KEY `nmkota_inx` (`namakota`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD UNIQUE KEY `kdpeg` (`kdpeg`),
  ADD KEY `kotapeg` (`kotapeg`),
  ADD KEY `nminx` (`nmpeg`);

--
-- Indexes for table `returbeli`
--
ALTER TABLE `returbeli`
  ADD UNIQUE KEY `noretbeli` (`noretbeli`),
  ADD KEY `nofaktur` (`nofaktur`),
  ADD KEY `kdbrg` (`kdbrg`);

--
-- Indexes for table `returjual`
--
ALTER TABLE `returjual`
  ADD UNIQUE KEY `noreturjual` (`noreturjual`),
  ADD KEY `nota` (`nota`),
  ADD KEY `kdbrg` (`kdbrg`),
  ADD KEY `kdpeg` (`kdpeg`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD UNIQUE KEY `kdsuppl` (`kdsuppl`),
  ADD KEY `kotasuppl` (`kotasuppl`);

--
-- Indexes for table `transbeli`
--
ALTER TABLE `transbeli`
  ADD UNIQUE KEY `nofaktur` (`nofaktur`),
  ADD KEY `kdsuppl` (`kdsuppl`),
  ADD KEY `kdbrg` (`kdbrg`);

--
-- Indexes for table `transjual`
--
ALTER TABLE `transjual`
  ADD UNIQUE KEY `nota` (`nota`),
  ADD KEY `kdcust` (`kdcust`),
  ADD KEY `kdbrg` (`kdbrg`),
  ADD KEY `kdpeg` (`kdpeg`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cust`
--
ALTER TABLE `cust`
  ADD CONSTRAINT `cust_ibfk_1` FOREIGN KEY (`kotacust`) REFERENCES `kota` (`kota`) ON UPDATE NO ACTION;

--
-- Constraints for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD CONSTRAINT `pegawai_ibfk_1` FOREIGN KEY (`kotapeg`) REFERENCES `kota` (`kota`) ON UPDATE NO ACTION;

--
-- Constraints for table `returbeli`
--
ALTER TABLE `returbeli`
  ADD CONSTRAINT `returbeli_ibfk_1` FOREIGN KEY (`nofaktur`) REFERENCES `transbeli` (`nofaktur`),
  ADD CONSTRAINT `returbeli_ibfk_2` FOREIGN KEY (`kdbrg`) REFERENCES `barang` (`kdbrg`);

--
-- Constraints for table `returjual`
--
ALTER TABLE `returjual`
  ADD CONSTRAINT `returjual_ibfk_1` FOREIGN KEY (`nota`) REFERENCES `transjual` (`nota`),
  ADD CONSTRAINT `returjual_ibfk_2` FOREIGN KEY (`kdbrg`) REFERENCES `barang` (`kdbrg`),
  ADD CONSTRAINT `returjual_ibfk_3` FOREIGN KEY (`kdpeg`) REFERENCES `pegawai` (`kdpeg`);

--
-- Constraints for table `supplier`
--
ALTER TABLE `supplier`
  ADD CONSTRAINT `supplier_ibfk_1` FOREIGN KEY (`kotasuppl`) REFERENCES `kota` (`kota`) ON UPDATE NO ACTION;

--
-- Constraints for table `transbeli`
--
ALTER TABLE `transbeli`
  ADD CONSTRAINT `transbeli_ibfk_1` FOREIGN KEY (`kdsuppl`) REFERENCES `supplier` (`kdsuppl`),
  ADD CONSTRAINT `transbeli_ibfk_2` FOREIGN KEY (`kdbrg`) REFERENCES `barang` (`kdbrg`);

--
-- Constraints for table `transjual`
--
ALTER TABLE `transjual`
  ADD CONSTRAINT `transjual_ibfk_1` FOREIGN KEY (`kdcust`) REFERENCES `cust` (`kdcust`),
  ADD CONSTRAINT `transjual_ibfk_2` FOREIGN KEY (`kdbrg`) REFERENCES `barang` (`kdbrg`),
  ADD CONSTRAINT `transjual_ibfk_3` FOREIGN KEY (`kdpeg`) REFERENCES `pegawai` (`kdpeg`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
