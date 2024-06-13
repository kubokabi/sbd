-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 13, 2024 at 02:47 PM
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
  `ketbrg` char(15) DEFAULT NULL,
  `kdpeg` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `hargabeli` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
