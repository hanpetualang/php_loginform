-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 07 Jan 2021 pada 19.36
-- Versi server: 10.4.14-MariaDB
-- Versi PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `epark`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `employee`
--

CREATE TABLE `employee` (
  `id_employee` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `address` text NOT NULL,
  `contact` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `employee`
--

INSERT INTO `employee` (`id_employee`, `name`, `address`, `contact`) VALUES
(1, 'Junaidi', '', ''),
(2, 'Sumardi', '', ''),
(3, 'Dina', '', ''),
(4, 'Rina', '', ''),
(5, 'Dani', '', ''),
(6, 'Alucard', '', ''),
(7, 'Alpha', '', ''),
(8, 'Beta', '', ''),
(9, 'Dine', '', ''),
(10, 'Doc', '', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `parkinglocation`
--

CREATE TABLE `parkinglocation` (
  `locationCode` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `parkinglocation`
--

INSERT INTO `parkinglocation` (`locationCode`, `name`, `address`) VALUES
(1, 'noname', 'no address');

-- --------------------------------------------------------

--
-- Struktur dari tabel `reserveparking`
--

CREATE TABLE `reserveparking` (
  `parkingCode` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `licensePlate` varchar(128) NOT NULL,
  `locationCode` int(11) NOT NULL,
  `duration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `reserveparking`
--

INSERT INTO `reserveparking` (`parkingCode`, `id_user`, `licensePlate`, `locationCode`, `duration`) VALUES
(209, 2, 'AE 1234 EE', 1, 9),
(619, 2, 'AE 5546 AA', 1, 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaction`
--

CREATE TABLE `transaction` (
  `transactionCode` int(11) NOT NULL,
  `id_employee` int(11) NOT NULL,
  `id_parkingCode` int(11) NOT NULL,
  `totalPrice` int(11) NOT NULL,
  `transactionDate` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `transaction`
--

INSERT INTO `transaction` (`transactionCode`, `id_employee`, `id_parkingCode`, `totalPrice`, `transactionDate`) VALUES
(5, 10, 619, 5000, '2021-01-08'),
(6, 7, 209, 10000, '2021-01-08');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `username` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id_user`, `username`, `password`) VALUES
(1, 'paus', '480dbe3286c0740f5f49031e9eaf695a'),
(2, 'kuda', 'a04fa9c8b7c4e095384daf35ede88fd5'),
(3, 'sapi', 'f87f8f834b237ad853fb44cccaa18952');

-- --------------------------------------------------------

--
-- Struktur dari tabel `vehicle`
--

CREATE TABLE `vehicle` (
  `licensePlate` varchar(128) NOT NULL,
  `type` varchar(128) NOT NULL,
  `brand` varchar(128) NOT NULL,
  `produced` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `vehicle`
--

INSERT INTO `vehicle` (`licensePlate`, `type`, `brand`, `produced`) VALUES
('AE 1234 EE', 'KLX', 'YAMAHA', 2017),
('AE 5546 AA', 'NSR', 'Honda', 2011);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id_employee`);

--
-- Indeks untuk tabel `parkinglocation`
--
ALTER TABLE `parkinglocation`
  ADD PRIMARY KEY (`locationCode`);

--
-- Indeks untuk tabel `reserveparking`
--
ALTER TABLE `reserveparking`
  ADD PRIMARY KEY (`parkingCode`),
  ADD KEY `id_user` (`id_user`,`licensePlate`,`locationCode`),
  ADD KEY `locationCode` (`locationCode`),
  ADD KEY `licensePlate` (`licensePlate`);

--
-- Indeks untuk tabel `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`transactionCode`),
  ADD KEY `id_employee` (`id_employee`,`id_parkingCode`),
  ADD KEY `id_parkingCode` (`id_parkingCode`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- Indeks untuk tabel `vehicle`
--
ALTER TABLE `vehicle`
  ADD PRIMARY KEY (`licensePlate`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `employee`
--
ALTER TABLE `employee`
  MODIFY `id_employee` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `transaction`
--
ALTER TABLE `transaction`
  MODIFY `transactionCode` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `reserveparking`
--
ALTER TABLE `reserveparking`
  ADD CONSTRAINT `reserveparking_ibfk_1` FOREIGN KEY (`locationCode`) REFERENCES `parkinglocation` (`locationCode`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reserveparking_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reserveparking_ibfk_3` FOREIGN KEY (`licensePlate`) REFERENCES `vehicle` (`licensePlate`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`id_employee`) REFERENCES `employee` (`id_employee`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transaction_ibfk_2` FOREIGN KEY (`id_parkingCode`) REFERENCES `reserveparking` (`parkingCode`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
