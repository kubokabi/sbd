-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 29, 2024 at 06:20 AM
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
-- Database: `otomotif_ilham`
--

-- --------------------------------------------------------

--
-- Table structure for table `diskon`
--

CREATE TABLE `diskon` (
  `kd_parts` char(15) DEFAULT NULL,
  `diskon` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `diskon`
--

INSERT INTO `diskon` (`kd_parts`, `diskon`) VALUES
('20W501000CC', 1000),
('SERV001', 2000);

-- --------------------------------------------------------

--
-- Table structure for table `faktur_transaksi`
--

CREATE TABLE `faktur_transaksi` (
  `no_faktur` char(10) NOT NULL,
  `tgl_faktur` date DEFAULT NULL,
  `no_polisi` char(10) DEFAULT NULL,
  `id_mekanik` char(8) DEFAULT NULL,
  `grand_total` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faktur_transaksi`
--

INSERT INTO `faktur_transaksi` (`no_faktur`, `tgl_faktur`, `no_polisi`, `id_mekanik`, `grand_total`) VALUES
('05103214', '2005-10-25', 'B3117LB', 'DDE', 73000);

-- --------------------------------------------------------

--
-- Table structure for table `header`
--

CREATE TABLE `header` (
  `kd_perusahaan` char(15) DEFAULT NULL,
  `nm_perusahaan` char(20) DEFAULT NULL,
  `alamat` char(35) DEFAULT NULL,
  `telp` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `header`
--

INSERT INTO `header` (`kd_perusahaan`, `nm_perusahaan`, `alamat`, `telp`) VALUES
('HONDA JAYA RAYA', 'AHASS 06488', 'Jatimulya - Bekasi Timur', '021-824321');

-- --------------------------------------------------------

--
-- Table structure for table `kendaraan`
--

CREATE TABLE `kendaraan` (
  `no_polisi` char(10) NOT NULL,
  `warna` char(10) DEFAULT NULL,
  `merek` char(15) DEFAULT NULL,
  `tahun` year(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kendaraan`
--

INSERT INTO `kendaraan` (`no_polisi`, `warna`, `merek`, `tahun`) VALUES
('B3117LB', 'Biru', 'Supra X', '2005');

-- --------------------------------------------------------

--
-- Table structure for table `mekanik`
--

CREATE TABLE `mekanik` (
  `id_mekanik` char(8) NOT NULL,
  `nm_mekanik` char(15) DEFAULT NULL,
  `alamat` char(35) DEFAULT NULL,
  `telp` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mekanik`
--

INSERT INTO `mekanik` (`id_mekanik`, `nm_mekanik`, `alamat`, `telp`) VALUES
('DDE', 'Djoko Dewanto', 'PEKALONGAN', 28197889);

-- --------------------------------------------------------

--
-- Table structure for table `parts`
--

CREATE TABLE `parts` (
  `kd_parts` char(15) NOT NULL,
  `nm_parts` char(35) DEFAULT NULL,
  `harga` int(10) DEFAULT NULL,
  `stok` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `parts`
--

INSERT INTO `parts` (`kd_parts`, `nm_parts`, `harga`, `stok`) VALUES
('20W501000CC', 'Oli Top 1 1000cc', 27000, 38),
('SERV001', 'Engine Tune Up', 25000, 29);

-- --------------------------------------------------------

--
-- Table structure for table `potongan_global`
--

CREATE TABLE `potongan_global` (
  `no_faktur` char(10) DEFAULT NULL,
  `potongan` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `potongan_global`
--

INSERT INTO `potongan_global` (`no_faktur`, `potongan`) VALUES
('05103214', 2000);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `no_faktur` char(10) DEFAULT NULL,
  `kd_parts` char(15) DEFAULT NULL,
  `kuantum` int(10) DEFAULT NULL,
  `harga` int(10) DEFAULT NULL,
  `total_harga` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`no_faktur`, `kd_parts`, `kuantum`, `harga`, `total_harga`) VALUES
('05103214', '20W501000CC', 2, 27000, 52000),
('05103214', 'SERV001', 1, 25000, 23000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `diskon`
--
ALTER TABLE `diskon`
  ADD KEY `kd_parts` (`kd_parts`);

--
-- Indexes for table `faktur_transaksi`
--
ALTER TABLE `faktur_transaksi`
  ADD PRIMARY KEY (`no_faktur`),
  ADD KEY `no_polisi` (`no_polisi`),
  ADD KEY `id_mekanik` (`id_mekanik`);

--
-- Indexes for table `kendaraan`
--
ALTER TABLE `kendaraan`
  ADD PRIMARY KEY (`no_polisi`);

--
-- Indexes for table `mekanik`
--
ALTER TABLE `mekanik`
  ADD PRIMARY KEY (`id_mekanik`);

--
-- Indexes for table `parts`
--
ALTER TABLE `parts`
  ADD PRIMARY KEY (`kd_parts`);

--
-- Indexes for table `potongan_global`
--
ALTER TABLE `potongan_global`
  ADD KEY `no_faktur` (`no_faktur`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD KEY `no_faktur` (`no_faktur`),
  ADD KEY `kd_parts` (`kd_parts`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `diskon`
--
ALTER TABLE `diskon`
  ADD CONSTRAINT `diskon_ibfk_1` FOREIGN KEY (`kd_parts`) REFERENCES `parts` (`kd_parts`);

--
-- Constraints for table `faktur_transaksi`
--
ALTER TABLE `faktur_transaksi`
  ADD CONSTRAINT `faktur_transaksi_ibfk_1` FOREIGN KEY (`no_polisi`) REFERENCES `kendaraan` (`no_polisi`),
  ADD CONSTRAINT `faktur_transaksi_ibfk_2` FOREIGN KEY (`id_mekanik`) REFERENCES `mekanik` (`id_mekanik`);

--
-- Constraints for table `potongan_global`
--
ALTER TABLE `potongan_global`
  ADD CONSTRAINT `potongan_global_ibfk_1` FOREIGN KEY (`no_faktur`) REFERENCES `faktur_transaksi` (`no_faktur`);

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`no_faktur`) REFERENCES `faktur_transaksi` (`no_faktur`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`kd_parts`) REFERENCES `parts` (`kd_parts`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
