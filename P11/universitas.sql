-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 21, 2024 at 05:33 AM
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
-- Database: `universitas`
--

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa_ekonomi`
--

CREATE TABLE `mahasiswa_ekonomi` (
  `nim` char(9) DEFAULT NULL,
  `nama` char(20) DEFAULT NULL,
  `umur` int(2) DEFAULT NULL,
  `tempat_lahir` char(15) DEFAULT NULL,
  `ipk` float(3,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mahasiswa_ekonomi`
--

INSERT INTO `mahasiswa_ekonomi` (`nim`, `nama`, `umur`, `tempat_lahir`, `ipk`) VALUES
('109045319', 'TANTI', 21, 'DENPASAR', 2.30),
('108545021', 'TUMIYEM ANRI', 24, 'DENPASAR', 3.92),
('087645055', 'TARMIJI', 25, 'DEPOK', 2.26),
('999999999', 'ARIFIN', 30, 'SEMARANG', 3.40),
('999999999', 'ARIFIN ILHAM', 30, 'SEMARANG', 3.40);

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa_ilkom`
--

CREATE TABLE `mahasiswa_ilkom` (
  `nim` char(9) DEFAULT NULL,
  `nama` char(20) DEFAULT NULL,
  `umur` int(2) DEFAULT NULL,
  `tempat_lahir` char(15) DEFAULT NULL,
  `ipk` float(3,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mahasiswa_ilkom`
--

INSERT INTO `mahasiswa_ilkom` (`nim`, `nama`, `umur`, `tempat_lahir`, `ipk`) VALUES
('089045001', 'ILHAM R', 22, 'PEKALONGAN', 3.99),
('099145055', 'DODI SITUMORANG', 22, 'MEDAN', 1.90);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
