-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 18, 2022 at 02:58 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_puskesmas`
--

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE `dokter` (
  `id_dokter` int(10) NOT NULL,
  `Nama` varchar(100) NOT NULL,
  `Spesialis` varchar(50) NOT NULL,
  `No telp` int(30) NOT NULL,
  `Alamat` text NOT NULL,
  `id_jam_praktek` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dokter`
--

INSERT INTO `dokter` (`id_dokter`, `Nama`, `Spesialis`, `No telp`, `Alamat`, `id_jam_praktek`) VALUES
(1, 'Andi', 'Kulit', 876902345, 'Jatisawit', 1),
(2, 'Dzikri', 'Mata', 876902367, 'Lohbener', 3),
(3, 'Rizky', 'Gigi', 876902309, 'Lohbener', 5);

-- --------------------------------------------------------

--
-- Table structure for table `jam_dokter`
--

CREATE TABLE `jam_dokter` (
  `id_jam_praktek` int(10) NOT NULL,
  `Hari` varchar(50) NOT NULL,
  `Jam` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jam_dokter`
--

INSERT INTO `jam_dokter` (`id_jam_praktek`, `Hari`, `Jam`) VALUES
(1, 'Senin', '08.00-11.00'),
(2, 'Senin', '13.00-16.00'),
(3, 'Selasa', '08.00-11.00'),
(4, 'Selasa', '13.00-16.00'),
(5, 'Rabu', '08.00-11.00'),
(6, 'Rabu', '13.00-16.00'),
(7, 'Kamis', '08.00-11.00'),
(8, 'Kamis', '13.00-16.00'),
(9, 'Jumat', '08.00-11.00'),
(10, 'Jumat', '13.00-16.00');

-- --------------------------------------------------------

--
-- Table structure for table `keluhan`
--

CREATE TABLE `keluhan` (
  `masukan_nama` varchar(100) NOT NULL,
  `masukan_email` text NOT NULL,
  `keluhan` varchar(100) NOT NULL,
  `keterangan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `id_pasien` int(11) NOT NULL,
  `nama_pasien` varchar(9) CHARACTER SET latin1 NOT NULL,
  `jenis_kelamin` varchar(100) CHARACTER SET latin1 NOT NULL,
  `no_telepon` varchar(25) CHARACTER SET latin1 NOT NULL,
  `alamat` varchar(100) CHARACTER SET latin1 NOT NULL,
  `diagnosa_perawat` varchar(100) CHARACTER SET latin1 NOT NULL,
  `diagnosa_dokter` varchar(100) CHARACTER SET latin1 NOT NULL,
  `username` varchar(100) CHARACTER SET latin1 NOT NULL,
  `password` varchar(255) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`id_pasien`, `nama_pasien`, `jenis_kelamin`, `no_telepon`, `alamat`, `diagnosa_perawat`, `diagnosa_dokter`, `username`, `password`) VALUES
(0, 'takil', 'laki laki', '51231', 'gada', 'sakit biasa', 'pualng aja', '1', '1'),
(1, 'takil', 'laki', '51231', 'ada deh', 'wdsadwa', 'dswa', 'sdaw', 'daw');

-- --------------------------------------------------------

--
-- Table structure for table `pendaftaran`
--

CREATE TABLE `pendaftaran` (
  `id_pasien` int(10) NOT NULL,
  `id_user` int(10) NOT NULL,
  `Nama` varchar(100) NOT NULL,
  `Jenis kelamin` varchar(10) NOT NULL,
  `No telp` int(20) NOT NULL,
  `Alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `rawat_inap`
--

CREATE TABLE `rawat_inap` (
  `Kode_rawat_inap` int(10) NOT NULL,
  `kamar` varchar(80) NOT NULL,
  `Kode_pasien` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `ruang`
--

CREATE TABLE `ruang` (
  `id_ruang` int(10) NOT NULL,
  `Nama_ruang` varchar(50) NOT NULL,
  `id_dokter` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ruang`
--

INSERT INTO `ruang` (`id_ruang`, `Nama_ruang`, `id_dokter`) VALUES
(1, 'K-1', 1),
(2, 'M-1', 2),
(3, 'G-1', 3);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `level` enum('Administrator','Karyawan','Pengunjung') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `username`, `nama_lengkap`, `password`, `level`) VALUES
(0, 'sw', 's', '13', ''),
(1, 'maulana ', 'maulana ibrahim', 'aff4b352312d5569903d88e0e68d3fbb', 'Administrator'),
(2, 'brilian', 'brilian faqih', '1718854405186205720022a7769cc4f4', 'Karyawan'),
(3, 'wahyu', 'wahyu', '32c9e71e866ecdbc93e497482aa6779f', 'Pengunjung');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`id_dokter`),
  ADD KEY `id_jam_praktek` (`id_jam_praktek`);

--
-- Indexes for table `jam_dokter`
--
ALTER TABLE `jam_dokter`
  ADD PRIMARY KEY (`id_jam_praktek`);

--
-- Indexes for table `keluhan`
--
ALTER TABLE `keluhan`
  ADD PRIMARY KEY (`masukan_nama`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id_pasien`);

--
-- Indexes for table `pendaftaran`
--
ALTER TABLE `pendaftaran`
  ADD PRIMARY KEY (`id_pasien`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `rawat_inap`
--
ALTER TABLE `rawat_inap`
  ADD PRIMARY KEY (`Kode_rawat_inap`),
  ADD KEY `Kode_pasien` (`Kode_pasien`);

--
-- Indexes for table `ruang`
--
ALTER TABLE `ruang`
  ADD PRIMARY KEY (`id_ruang`),
  ADD KEY `id_dokter` (`id_dokter`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dokter`
--
ALTER TABLE `dokter`
  MODIFY `id_dokter` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `jam_dokter`
--
ALTER TABLE `jam_dokter`
  MODIFY `id_jam_praktek` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `pendaftaran`
--
ALTER TABLE `pendaftaran`
  MODIFY `id_pasien` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `rawat_inap`
--
ALTER TABLE `rawat_inap`
  MODIFY `Kode_rawat_inap` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ruang`
--
ALTER TABLE `ruang`
  MODIFY `id_ruang` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dokter`
--
ALTER TABLE `dokter`
  ADD CONSTRAINT `dokter_ibfk_1` FOREIGN KEY (`id_jam_praktek`) REFERENCES `jam_dokter` (`id_jam_praktek`);

--
-- Constraints for table `pendaftaran`
--
ALTER TABLE `pendaftaran`
  ADD CONSTRAINT `pendaftaran_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Constraints for table `rawat_inap`
--
ALTER TABLE `rawat_inap`
  ADD CONSTRAINT `rawat_inap_ibfk_1` FOREIGN KEY (`Kode_pasien`) REFERENCES `pendaftaran` (`id_pasien`);

--
-- Constraints for table `ruang`
--
ALTER TABLE `ruang`
  ADD CONSTRAINT `ruang_ibfk_1` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
