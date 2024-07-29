-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 27, 2024 at 01:47 AM
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
-- Database: `ilham_p11`
--

-- --------------------------------------------------------

--
-- Table structure for table `alamat`
--

CREATE TABLE `alamat` (
  `kdpos` int(5) NOT NULL,
  `alm1` char(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bagian`
--

CREATE TABLE `bagian` (
  `nobag` char(8) NOT NULL,
  `nama_bg` char(15) DEFAULT NULL,
  `lokasi` char(15) DEFAULT NULL,
  `manager` char(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lok_pro`
--

CREATE TABLE `lok_pro` (
  `lokpro` char(15) NOT NULL,
  `nopro` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `nopeg` int(4) NOT NULL,
  `nama_peg` char(15) DEFAULT NULL,
  `kdpos` int(5) NOT NULL,
  `tgl_lah` date DEFAULT NULL,
  `nobag` char(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `proyek`
--

CREATE TABLE `proyek` (
  `nopro` int(6) NOT NULL,
  `nama_pro` char(20) DEFAULT NULL,
  `nobag` char(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alamat`
--
ALTER TABLE `alamat`
  ADD PRIMARY KEY (`kdpos`);

--
-- Indexes for table `bagian`
--
ALTER TABLE `bagian`
  ADD PRIMARY KEY (`nobag`);

--
-- Indexes for table `lok_pro`
--
ALTER TABLE `lok_pro`
  ADD PRIMARY KEY (`lokpro`),
  ADD KEY `nopro` (`nopro`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`nopeg`),
  ADD KEY `kdpos` (`kdpos`),
  ADD KEY `nobag` (`nobag`);

--
-- Indexes for table `proyek`
--
ALTER TABLE `proyek`
  ADD PRIMARY KEY (`nopro`),
  ADD KEY `nobag` (`nobag`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `lok_pro`
--
ALTER TABLE `lok_pro`
  ADD CONSTRAINT `lok_pro_ibfk_1` FOREIGN KEY (`nopro`) REFERENCES `proyek` (`nopro`);

--
-- Constraints for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD CONSTRAINT `pegawai_ibfk_1` FOREIGN KEY (`kdpos`) REFERENCES `alamat` (`kdpos`),
  ADD CONSTRAINT `pegawai_ibfk_2` FOREIGN KEY (`nobag`) REFERENCES `bagian` (`nobag`);

--
-- Constraints for table `proyek`
--
ALTER TABLE `proyek`
  ADD CONSTRAINT `proyek_ibfk_1` FOREIGN KEY (`nobag`) REFERENCES `bagian` (`nobag`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
