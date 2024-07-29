-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 28, 2024 at 11:51 AM
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
-- Database: `fotocopy_hafa`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `kd_brg` char(10) NOT NULL,
  `nama_brg` char(35) DEFAULT NULL,
  `satuan` char(15) DEFAULT NULL,
  `harga_beli` int(10) DEFAULT NULL,
  `harga_jual` int(10) DEFAULT NULL,
  `stok` int(10) DEFAULT NULL,
  `stok_min` int(10) DEFAULT NULL,
  `stok_max` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`kd_brg`, `nama_brg`, `satuan`, `harga_beli`, `harga_jual`, `stok`, `stok_min`, `stok_max`) VALUES
('A-001-04', 'Gunting', 'Buah', 5000, 8000, 50, 10, 50),
('A-001-05', 'Cutter', 'Buah', 20000, 28000, 19, 5, 20),
('A-001-08', 'Steples', 'Buah', 10000, 19000, 24, 5, 25),
('A-001-09', 'Kapur', 'Box', 2000, 5000, 45, 10, 50),
('A-001-12', 'Penggaris', 'Buah', 1500, 3000, 100, 20, 100),
('A-001-13', 'Tipe-x', 'Buah', 5000, 8000, 48, 10, 50),
('A-001-14', 'Penghapus', 'Buah', 1500, 3000, 50, 10, 50),
('A-001-19', 'Kalkulator', 'Buah', 10000, 17000, 49, 10, 50),
('B-001-06', 'Buku Tulis', 'Buah', 2500, 5000, 50, 10, 50),
('K-001-03', 'Kertas F4', 'Lembar', 150, 300, 49900, 20000, 50000),
('K-001-10', 'Amplop', 'Buah', 500, 1000, 10000, 2000, 10000),
('K-001-11', 'Map', 'Buah', 500, 1000, 1000, 200, 1000),
('K-001-18', 'Origami', 'Buah', 2000, 5000, 999, 200, 1000),
('K-001-20', 'Kertas Folio', 'Lembar', 250, 500, 1000, 200, 1000),
('K-001-21', 'Plastik Sampul', 'Buah', 500, 1000, 5000, 2000, 5000),
('L-001-15', 'Lakban Hitam', 'Buah', 10000, 15000, 67, 20, 70),
('L-001-16', 'Lakban Putih', 'Buah', 1000, 2000, 52, 20, 60),
('L-001-17', 'Lem Kertas', 'Buah', 1000, 2000, 25, 5, 25),
('P-001-01', 'Pensil 2B', 'Buah', 2500, 5000, 100, 20, 100),
('P-001-02', 'Bolpoin Standart', 'Buah', 1000, 2000, 50, 10, 50),
('P-001-07', 'Spidol', 'Buah', 5000, 8000, 23, 5, 25);

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faktur_pembelian`
--

CREATE TABLE `faktur_pembelian` (
  `no_faktur` char(15) NOT NULL,
  `tgl_faktur` date DEFAULT NULL,
  `total_barang` int(10) DEFAULT NULL,
  `total_keseluruhan` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faktur_pembelian`
--

INSERT INTO `faktur_pembelian` (`no_faktur`, `tgl_faktur`, `total_barang`, `total_keseluruhan`) VALUES
('F-06-24-1351', '2024-06-26', 21, 20835000);

-- --------------------------------------------------------

--
-- Table structure for table `faktur_pengeluaran`
--

CREATE TABLE `faktur_pengeluaran` (
  `no_fk` char(15) NOT NULL,
  `tgl_faktur` date DEFAULT NULL,
  `total_barang` int(10) DEFAULT NULL,
  `total_keseluruhan` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faktur_pengeluaran`
--

INSERT INTO `faktur_pengeluaran` (`no_fk`, `tgl_faktur`, `total_barang`, `total_keseluruhan`) VALUES
('FK-06-24-0812', '2024-06-27', 5, 118000),
('FK-06-24-0912', '2024-06-27', 5, 99000);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pembelian_barang`
--

CREATE TABLE `pembelian_barang` (
  `no_faktur` char(15) DEFAULT NULL,
  `kd_brg` char(10) DEFAULT NULL,
  `jumlah` int(10) DEFAULT NULL,
  `harga` int(10) DEFAULT NULL,
  `total_harga` int(10) GENERATED ALWAYS AS (`jumlah` * `harga`) STORED
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pembelian_barang`
--

INSERT INTO `pembelian_barang` (`no_faktur`, `kd_brg`, `jumlah`, `harga`) VALUES
('F-06-24-1351', 'A-001-04', 50, 5000),
('F-06-24-1351', 'A-001-05', 20, 20000),
('F-06-24-1351', 'K-001-03', 50000, 150),
('F-06-24-1351', 'P-001-01', 100, 2500),
('F-06-24-1351', 'P-001-02', 50, 1000),
('F-06-24-1351', 'B-001-06', 50, 2500),
('F-06-24-1351', 'P-001-07', 25, 5000),
('F-06-24-1351', 'A-001-08', 25, 1000),
('F-06-24-1351', 'A-001-09', 50, 2000),
('F-06-24-1351', 'K-001-10', 10000, 500),
('F-06-24-1351', 'K-001-11', 1000, 500),
('F-06-24-1351', 'A-001-12', 100, 1500),
('F-06-24-1351', 'A-001-13', 50, 5000),
('F-06-24-1351', 'A-001-14', 50, 1500),
('F-06-24-1351', 'L-001-15', 70, 10000),
('F-06-24-1351', 'L-001-16', 60, 1000),
('F-06-24-1351', 'L-001-17', 25, 1000),
('F-06-24-1351', 'K-001-18', 1000, 2000),
('F-06-24-1351', 'A-001-19', 50, 10000),
('F-06-24-1351', 'K-001-20', 1000, 250),
('F-06-24-1351', 'K-001-21', 5000, 500);

-- --------------------------------------------------------

--
-- Table structure for table `pengeluaran_barang`
--

CREATE TABLE `pengeluaran_barang` (
  `no_fk` char(15) DEFAULT NULL,
  `kd_brg` char(10) DEFAULT NULL,
  `jumlah` int(10) DEFAULT NULL,
  `harga` int(10) DEFAULT NULL,
  `total_harga` int(10) GENERATED ALWAYS AS (`jumlah` * `harga`) STORED
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pengeluaran_barang`
--

INSERT INTO `pengeluaran_barang` (`no_fk`, `kd_brg`, `jumlah`, `harga`) VALUES
('FK-06-24-0812', 'K-001-03', 100, 300),
('FK-06-24-0812', 'A-001-05', 1, 28000),
('FK-06-24-0812', 'P-001-07', 2, 8000),
('FK-06-24-0812', 'A-001-08', 1, 19000),
('FK-06-24-0812', 'A-001-09', 5, 5000),
('FK-06-24-0912', 'A-001-13', 2, 8000),
('FK-06-24-0912', 'L-001-15', 3, 15000),
('FK-06-24-0912', 'L-001-16', 8, 2000),
('FK-06-24-0912', 'K-001-18', 1, 5000),
('FK-06-24-0912', 'A-001-19', 1, 17000);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('F5yaeIqbdyzWpGQhLDgNeaqIYA4tVbPngS2nfDuP', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36 Edg/126.0.0.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiUFBaZ1hMa3ZmZWtoR2d5Q0l2M1Mwak90emh0QXRraDZqR1lDZDFBViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXNoYm9hcmQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToyO3M6ODoidXNlcm5hbWUiO3M6NToiaWxoYW0iO30=', 1719482562);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `username`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'ilham', 'ilham@gmail.com', NULL, 'ilham77', '$2y$12$aVrUSwtJ59gky51hfPZLfudYaohWJExlSz8x7nYxMuj9WOwOUZFiu', NULL, '2024-06-22 09:26:16', '2024-06-22 09:26:16');

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_pembelian_perbulan`
-- (See below for the actual view)
--
CREATE TABLE `v_pembelian_perbulan` (
`bulan_pembelian` varchar(7)
,`total_seluruh_barang` decimal(32,0)
,`grand_total` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_pengeluaran_perbulan`
-- (See below for the actual view)
--
CREATE TABLE `v_pengeluaran_perbulan` (
`bulan_pengeluaran` varchar(7)
,`total_seluruh_barang` decimal(32,0)
,`grand_total` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_penjualan`
-- (See below for the actual view)
--
CREATE TABLE `v_penjualan` (
`tgl_trans` date
,`nama_brg` char(35)
,`satuan` char(15)
,`harga_beli` int(10)
,`harga_jual` int(10)
,`terjual` int(10)
,`total_jual` int(10)
,`margin` bigint(22)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_stok_barang`
-- (See below for the actual view)
--
CREATE TABLE `v_stok_barang` (
`kode` char(10)
,`nama` char(35)
,`satuan` char(15)
,`terjual` decimal(32,0)
,`stok_tersisa` int(10)
);

-- --------------------------------------------------------

--
-- Structure for view `v_pembelian_perbulan`
--
DROP TABLE IF EXISTS `v_pembelian_perbulan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_pembelian_perbulan`  AS SELECT date_format(`faktur_pembelian`.`tgl_faktur`,'%Y-%m') AS `bulan_pembelian`, sum(`faktur_pembelian`.`total_barang`) AS `total_seluruh_barang`, sum(`faktur_pembelian`.`total_keseluruhan`) AS `grand_total` FROM `faktur_pembelian` GROUP BY date_format(`faktur_pembelian`.`tgl_faktur`,'%Y-%m') ;

-- --------------------------------------------------------

--
-- Structure for view `v_pengeluaran_perbulan`
--
DROP TABLE IF EXISTS `v_pengeluaran_perbulan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_pengeluaran_perbulan`  AS SELECT date_format(`faktur_pengeluaran`.`tgl_faktur`,'%Y-%m') AS `bulan_pengeluaran`, sum(`faktur_pengeluaran`.`total_barang`) AS `total_seluruh_barang`, sum(`faktur_pengeluaran`.`total_keseluruhan`) AS `grand_total` FROM `faktur_pengeluaran` GROUP BY date_format(`faktur_pengeluaran`.`tgl_faktur`,'%Y-%m') ;

-- --------------------------------------------------------

--
-- Structure for view `v_penjualan`
--
DROP TABLE IF EXISTS `v_penjualan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_penjualan`  AS SELECT `fp`.`tgl_faktur` AS `tgl_trans`, `b`.`nama_brg` AS `nama_brg`, `b`.`satuan` AS `satuan`, `b`.`harga_beli` AS `harga_beli`, `b`.`harga_jual` AS `harga_jual`, `pb`.`jumlah` AS `terjual`, `pb`.`total_harga` AS `total_jual`, `pb`.`total_harga`- `b`.`harga_beli` * `pb`.`jumlah` AS `margin` FROM ((`faktur_pengeluaran` `fp` join `pengeluaran_barang` `pb` on(`fp`.`no_fk` = `pb`.`no_fk`)) join `barang` `b` on(`pb`.`kd_brg` = `b`.`kd_brg`)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_stok_barang`
--
DROP TABLE IF EXISTS `v_stok_barang`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_stok_barang`  AS SELECT `b`.`kd_brg` AS `kode`, `b`.`nama_brg` AS `nama`, `b`.`satuan` AS `satuan`, coalesce(`penjualan`.`total_penjualan`,0) AS `terjual`, `b`.`stok` AS `stok_tersisa` FROM (`barang` `b` left join (select `pengeluaran_barang`.`kd_brg` AS `kd_brg`,sum(`pengeluaran_barang`.`jumlah`) AS `total_penjualan` from `pengeluaran_barang` group by `pengeluaran_barang`.`kd_brg`) `penjualan` on(`b`.`kd_brg` = `penjualan`.`kd_brg`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`kd_brg`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `faktur_pembelian`
--
ALTER TABLE `faktur_pembelian`
  ADD PRIMARY KEY (`no_faktur`);

--
-- Indexes for table `faktur_pengeluaran`
--
ALTER TABLE `faktur_pengeluaran`
  ADD PRIMARY KEY (`no_fk`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `pembelian_barang`
--
ALTER TABLE `pembelian_barang`
  ADD KEY `no_faktur` (`no_faktur`),
  ADD KEY `kd_brg` (`kd_brg`);

--
-- Indexes for table `pengeluaran_barang`
--
ALTER TABLE `pengeluaran_barang`
  ADD KEY `no_fk` (`no_fk`),
  ADD KEY `kd_brg` (`kd_brg`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pembelian_barang`
--
ALTER TABLE `pembelian_barang`
  ADD CONSTRAINT `pembelian_barang_ibfk_1` FOREIGN KEY (`no_faktur`) REFERENCES `faktur_pembelian` (`no_faktur`),
  ADD CONSTRAINT `pembelian_barang_ibfk_2` FOREIGN KEY (`kd_brg`) REFERENCES `barang` (`kd_brg`);

--
-- Constraints for table `pengeluaran_barang`
--
ALTER TABLE `pengeluaran_barang`
  ADD CONSTRAINT `pengeluaran_barang_ibfk_1` FOREIGN KEY (`no_fk`) REFERENCES `faktur_pengeluaran` (`no_fk`),
  ADD CONSTRAINT `pengeluaran_barang_ibfk_2` FOREIGN KEY (`kd_brg`) REFERENCES `barang` (`kd_brg`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
