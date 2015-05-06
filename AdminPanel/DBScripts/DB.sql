-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Anamakine: 127.0.0.1
-- �retim Zaman�: 06 May 2015, 15:55:22
-- Sunucu s�r�m�: 5.6.24
-- PHP S�r�m�: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Veritaban�: `concertsdb`
--
CREATE DATABASE IF NOT EXISTS `concertsdb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `concertsdb`;

-- --------------------------------------------------------

--
-- Tablo i�in tablo yap�s� `admins`
--

DROP TABLE IF EXISTS `admins`;
CREATE TABLE IF NOT EXISTS `admins` (
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo d�k�m verisi `admins`
--

INSERT INTO `admins` (`username`, `password`, `email`) VALUES
('admin', 'admin', 'admin@concerts.com'),
('cem', '123', 'cemyabansu@hotmail.com');

-- --------------------------------------------------------

--
-- Tablo i�in tablo yap�s� `concertdescription`
--

DROP TABLE IF EXISTS `concertdescription`;
CREATE TABLE IF NOT EXISTS `concertdescription` (
  `ID` int(10) NOT NULL,
  `concertDescription` text NOT NULL,
  `concertExplanation` text NOT NULL,
  `picturePath` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tablo i�in tablo yap�s� `concertplace`
--

DROP TABLE IF EXISTS `concertplace`;
CREATE TABLE IF NOT EXISTS `concertplace` (
  `ID` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  `coordinates` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tablo i�in tablo yap�s� `concerts`
--

DROP TABLE IF EXISTS `concerts`;
CREATE TABLE IF NOT EXISTS `concerts` (
  `Id` int(11) NOT NULL,
  `creater_Id` varchar(20) NOT NULL,
  `place_Id` int(11) NOT NULL,
  `concertInfo_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tablo i�in tablo yap�s� `tickettypes`
--

DROP TABLE IF EXISTS `tickettypes`;
CREATE TABLE IF NOT EXISTS `tickettypes` (
  `ID` int(11) NOT NULL,
  `concert_Id` int(11) NOT NULL,
  `ticketType` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `quota` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- D�k�m� yap�lm�� tablolar i�in indeksler
--

--
-- Tablo i�in indeksler `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`username`);

--
-- Tablo i�in indeksler `concertdescription`
--
ALTER TABLE `concertdescription`
  ADD PRIMARY KEY (`ID`);

--
-- Tablo i�in indeksler `concertplace`
--
ALTER TABLE `concertplace`
  ADD PRIMARY KEY (`ID`);

--
-- Tablo i�in indeksler `concerts`
--
ALTER TABLE `concerts`
  ADD PRIMARY KEY (`Id`), ADD KEY `creater_Id` (`creater_Id`), ADD KEY `place_Id` (`place_Id`), ADD KEY `concertInfo_Id` (`concertInfo_Id`);

--
-- Tablo i�in indeksler `tickettypes`
--
ALTER TABLE `tickettypes`
  ADD PRIMARY KEY (`ID`), ADD KEY `concert_Id` (`concert_Id`);

--
-- D�k�m� yap�lm�� tablolar i�in AUTO_INCREMENT de�eri
--

--
-- Tablo i�in AUTO_INCREMENT de�eri `concertdescription`
--
ALTER TABLE `concertdescription`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT;
--
-- Tablo i�in AUTO_INCREMENT de�eri `concerts`
--
ALTER TABLE `concerts`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Tablo i�in AUTO_INCREMENT de�eri `tickettypes`
--
ALTER TABLE `tickettypes`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- D�k�m� yap�lm�� tablolar i�in k�s�tlamalar
--

--
-- Tablo k�s�tlamalar� `concerts`
--
ALTER TABLE `concerts`
ADD CONSTRAINT `concerts_ibfk_1` FOREIGN KEY (`creater_Id`) REFERENCES `admins` (`username`),
ADD CONSTRAINT `concerts_ibfk_2` FOREIGN KEY (`place_Id`) REFERENCES `concertplace` (`ID`),
ADD CONSTRAINT `concerts_ibfk_3` FOREIGN KEY (`concertInfo_Id`) REFERENCES `concertdescription` (`ID`);

--
-- Tablo k�s�tlamalar� `tickettypes`
--
ALTER TABLE `tickettypes`
ADD CONSTRAINT `tickettypes_ibfk_1` FOREIGN KEY (`concert_Id`) REFERENCES `concerts` (`Id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
