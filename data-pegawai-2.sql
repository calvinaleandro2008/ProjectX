-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 23 Nov 2024 pada 05.10
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `data-pegawai`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `Data_pegawai`
--

CREATE TABLE `Data_pegawai` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `jabatan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `Data_pegawai`
--

INSERT INTO `Data_pegawai` (`id`, `nama`, `alamat`, `jabatan`) VALUES
(6, 'Calvin', 'Palembang', 'Direktur'),
(7, 'Reagan', 'Muara Dua', 'DIrektur'),
(8, 'Adly', 'Angkatan 66', 'HRD'),
(9, 'Excel', 'KM 5', 'Pegawai'),
(10, 'Steven', 'plg', 'HRD'),
(11, 'Terry', 'Palembang', 'HRD'),
(12, 'Olivia', 'Jakarta', 'Seketaris'),
(13, 'Sanjaya', 'Pekanbaru', 'Sales'),
(14, 'Vincent', 'Palembang', 'manager'),
(15, 'Massimo', 'Bukit', 'HRD'),
(16, 'sepri', 'palembang', 'magang'),
(17, 'anas', 'jakarta', 'hrd');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kontak_messages`
--

CREATE TABLE `kontak_messages` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kontak_messages`
--

INSERT INTO `kontak_messages` (`id`, `name`, `email`, `message`, `created_at`) VALUES
(1, 'Vincent', 'b@gmail.com', 'asik', '2024-11-21 03:03:13'),
(2, 'Vincent', 'b@gmail.com', 'asik', '2024-11-21 03:04:40'),
(3, 'vincent', 'vincentkakakakkaka@gmail.com', 'Halo vincent ', '2024-11-23 04:02:13');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pegawai`
--

CREATE TABLE `pegawai` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `jabatan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pegawai`
--

INSERT INTO `pegawai` (`id`, `nama`, `alamat`, `jabatan`) VALUES
(1, 'John Doe', 'Jalan Mawar No. 5', 'Manager'),
(2, 'Jane Smith', 'Jalan Melati No. 10', 'Staff');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(1, 'admin', '0192023a7bbd73250516f069df18b500');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `Data_pegawai`
--
ALTER TABLE `Data_pegawai`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kontak_messages`
--
ALTER TABLE `kontak_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `Data_pegawai`
--
ALTER TABLE `Data_pegawai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `kontak_messages`
--
ALTER TABLE `kontak_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
