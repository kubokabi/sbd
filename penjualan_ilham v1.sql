-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 03, 2024 at 06:18 AM
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
-- Database: `penjualan_ilham`
--

-- --------------------------------------------------------

--
-- Table structure for table `inisial`
--

CREATE TABLE `inisial` (
  `ins` char(3) DEFAULT NULL,
  `nama_pemilik` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inisial`
--

INSERT INTO `inisial` (`ins`, `nama_pemilik`) VALUES
('OO', 'BUDI'),
('P77', 'JOKO'),
('RT', 'BAGUS'),
('TRP', 'ALEX');

-- --------------------------------------------------------

--
-- Table structure for table `kode_pos`
--

CREATE TABLE `kode_pos` (
  `kodepos` char(5) NOT NULL,
  `nama_provinisi` varchar(25) NOT NULL,
  `kota` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kode_pos`
--

INSERT INTO `kode_pos` (`kodepos`, `nama_provinisi`, `kota`) VALUES
('12260', 'Banten', 'Tangerang'),
('52363', 'Jawa Tengah', 'Pemalang'),
('57139', 'Jawa Timur', 'Malang'),
('87865', 'Jawa Barat', 'Bandung');

-- --------------------------------------------------------

--
-- Table structure for table `obat_ilham`
--

CREATE TABLE `obat_ilham` (
  `inisial` char(3) NOT NULL,
  `kdobat` char(5) NOT NULL,
  `nmobat` char(20) DEFAULT NULL,
  `jenis` char(15) DEFAULT NULL,
  `berat` char(5) DEFAULT NULL,
  `satuan` char(15) DEFAULT NULL,
  `harga` smallint(5) UNSIGNED DEFAULT NULL,
  `kdsuppl` char(5) DEFAULT NULL,
  `kwalitas` enum('B','C','L') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `obat_ilham`
--

INSERT INTO `obat_ilham` (`inisial`, `kdobat`, `nmobat`, `jenis`, `berat`, `satuan`, `harga`, `kdsuppl`, `kwalitas`) VALUES
('OO', 'SS-01', 'OBH', 'CAIR', '150', 'GRAM', 150, 'SP-02', 'B'),
('P77', 'RR-01', 'PUYER 77', 'BUBUK', '15', 'ML', 60, 'SP-01', 'C'),
('RT', 'OB-02', 'SALEP', 'KRIM', '2', 'GRAM', 50, 'SP-01', 'B'),
('TRP', 'TR-02', 'TERAPI', 'TABLET', '7', 'GRAM', 70, 'SP-04', 'L');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `kodepos` char(5) DEFAULT NULL,
  `kdsuppl` char(5) NOT NULL,
  `nmsuppl` char(20) NOT NULL,
  `kotasuppl` char(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`kodepos`, `kdsuppl`, `nmsuppl`, `kotasuppl`) VALUES
(NULL, 'SP-01', 'PT. OBAT SAKIT KUAT', 'BANDUNG'),
(NULL, 'SP-02', 'PT. KALBE FARMA', 'JAKARTA'),
(NULL, 'SP-03', 'PT. SUSAH HIDUP', 'SEMARANG'),
(NULL, 'SP-04', 'PT. MADU RASA PAHIT', 'PEKALONGAN'),
(NULL, 'SP-05', 'PT. SEMARANG ANGKASA', 'SEMARANG'),
('12260', 'SP-06', 'PT. SEMARANG ANGKASA', 'Tangerang'),
('52363', 'SP-07', ' PT. KALBE FARMA', 'Pemalang'),
('57139', 'SP-08', 'PT. Malang ANGKASA', 'Malang'),
('87865', 'SP-09', 'PT.Bandung ANGKASA', 'Bandung');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `inisial`
--
ALTER TABLE `inisial`
  ADD KEY `ins` (`ins`);

--
-- Indexes for table `kode_pos`
--
ALTER TABLE `kode_pos`
  ADD PRIMARY KEY (`kodepos`);

--
-- Indexes for table `obat_ilham`
--
ALTER TABLE `obat_ilham`
  ADD PRIMARY KEY (`inisial`,`kdobat`),
  ADD KEY `kdsuppl` (`kdsuppl`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`kdsuppl`),
  ADD KEY `kodepos` (`kodepos`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `inisial`
--
ALTER TABLE `inisial`
  ADD CONSTRAINT `inisial_ibfk_1` FOREIGN KEY (`ins`) REFERENCES `obat_ilham` (`inisial`);

--
-- Constraints for table `obat_ilham`
--
ALTER TABLE `obat_ilham`
  ADD CONSTRAINT `obat_ilham_ibfk_1` FOREIGN KEY (`kdsuppl`) REFERENCES `supplier` (`kdsuppl`);

--
-- Constraints for table `supplier`
--
ALTER TABLE `supplier`
  ADD CONSTRAINT `supplier_ibfk_1` FOREIGN KEY (`kodepos`) REFERENCES `kode_pos` (`kodepos`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
