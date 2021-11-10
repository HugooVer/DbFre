-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 10, 2021 at 04:11 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbfret`
--

-- --------------------------------------------------------

--
-- Table structure for table `affretement`
--

CREATE TABLE `affretement` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `heure` time NOT NULL,
  `idBatFret` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `affretement`
--

INSERT INTO `affretement` (`id`, `date`, `heure`, `idBatFret`) VALUES
(1, '2021-11-01', '01:00:00', 2),
(2, '2021-11-01', '01:30:00', 2),
(459629, '2021-11-01', '00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `bateaufret`
--

CREATE TABLE `bateaufret` (
  `id` int(11) NOT NULL,
  `poidsMax` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bateaufret`
--

INSERT INTO `bateaufret` (`id`, `poidsMax`) VALUES
(1, 1000),
(2, 1000);

-- --------------------------------------------------------

--
-- Table structure for table `lot`
--

CREATE TABLE `lot` (
  `idAff` int(11) NOT NULL,
  `idLot` int(11) NOT NULL,
  `poids` int(11) NOT NULL,
  `idTran` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lot`
--

INSERT INTO `lot` (`idAff`, `idLot`, `poids`, `idTran`) VALUES
(2, 3, 500, 2),
(459629, 1, 700, 1),
(459629, 2, 300, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tranche`
--

CREATE TABLE `tranche` (
  `id` int(11) NOT NULL,
  `tarifunit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tranche`
--

INSERT INTO `tranche` (`id`, `tarifunit`) VALUES
(1, 100),
(2, 80);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `affretement`
--
ALTER TABLE `affretement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idBatFret` (`idBatFret`);

--
-- Indexes for table `bateaufret`
--
ALTER TABLE `bateaufret`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lot`
--
ALTER TABLE `lot`
  ADD PRIMARY KEY (`idAff`,`idLot`),
  ADD KEY `idTran` (`idTran`);

--
-- Indexes for table `tranche`
--
ALTER TABLE `tranche`
  ADD PRIMARY KEY (`id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `affretement`
--
ALTER TABLE `affretement`
  ADD CONSTRAINT `affretement_ibfk_1` FOREIGN KEY (`idBatFret`) REFERENCES `bateaufret` (`id`);

--
-- Constraints for table `lot`
--
ALTER TABLE `lot`
  ADD CONSTRAINT `lot_ibfk_1` FOREIGN KEY (`idAff`) REFERENCES `affretement` (`id`),
  ADD CONSTRAINT `lot_ibfk_2` FOREIGN KEY (`idTran`) REFERENCES `tranche` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
