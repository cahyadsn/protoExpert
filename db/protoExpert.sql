-- phpMyAdmin SQL Dump
-- version 3.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 08, 2014 at 08:47 AM
-- Server version: 5.5.25a
-- PHP Version: 5.4.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `expert`
CREATE DATABASE IF NOT EXISTS expert;
USE expert;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_symptoms`
--

DROP TABLE IF EXISTS `tbl_symptoms`;
CREATE TABLE IF NOT EXISTS `tbl_symptoms` (
  `code` char(4) NOT NULL,
  `symptom` varchar(100) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_symptoms`
--

INSERT INTO `tbl_symptoms` (`code`, `symptom`) VALUES
('G001', 'Demam mendadak tinggi (38-40 C)'),
('G002', 'Demam tiba-tiba turun'),
('G003', 'Kebocoran pembuluh darah'),
('G004', 'Sakit kepala berat'),
('G005', 'Nyeri otot dan ruam'),
('G006', 'Sakit perut (mual dan muntah)'),
('G007', 'Terjadi syok'),
('G008', 'Nafas terengah-engah'),
('G009', 'Detak jantung cepat tapi lemah'),
('G010', 'Kulit dingin dan kebiruan'),
('G011', 'Perubahan mental seperti tampak linglung'),
('G012', 'Menggigil'),
('G013', 'Sakit tulang'),
('G014', 'Batuk'),
('G015', 'Telapak tangan yang terasa dingin dan lembab'),
('G016', 'Organ hati sering membesar'),
('G017', 'Pembengkakan Kelenjar Getah Bening'),
('G018', 'Bintik merah pada tangan dan kaki'),
('G019', 'Nyeri pada persendian lutut, pergelangan tangan, dan kaki'),
('G020', 'Nyeri tenggorokan'),
('G021', 'Buang air besar berwarna hitam dan keras'),
('G022', 'Lelah'),
('G023', 'Kurang darah'),
('G024', 'Warna kuning di kulit/selaput lendir mata'),
('G025', 'Mata merah'),
('G026', 'Radang saluran kelenjar getah bening'),
('G027', 'Pembesaran tungkai, lengan, bbuah dada'),
('G028', 'Buah zakar terlihat agak merah dan terasa panas'),
('G029', 'Hilang nafsu makan');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_diseases`
--

DROP TABLE IF EXISTS `tbl_diseases`;
CREATE TABLE IF NOT EXISTS `tbl_diseases` (
  `code` char(4) NOT NULL,
  `disease` varchar(60) NOT NULL,
  `scientific_name` varchar(60) NOT NULL,
  `definition` text NOT NULL,
  `solution` text NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_diseases`
--

INSERT INTO `tbl_diseases` (`code`, `disease`, `scientific_name`, `definition`, `solution`) VALUES
('P001', 'Demam Berdarah', 'Dengue Fever', 'Penyakit yang disebabkan oleh virus dengue ini disebarkan oleh gigitan nyamuk Aedes aegypti betina.', 'Minumlah air putih min.20 gelas berukuran sedang setiap hari (lebih banyak lebih baik); Cobalah menurunkan panas dengan minum obat penurun panas (paracetamol misalnya); Beberapa teman dan dokter menyarankan untuk minum minuman ion tambahan seperti pocari sweat; Minuman lain yang disarankan: Jus jambu merah untuk meningkatkan trombosit (ada juga yang menyarankan: daun angkak, daun jambu, dsb); Makanlah makanan yang bergizi dan usahakan makan dalam kuantitas yang banyak (meskipun biasanya minat makan akan menurun drastis).'),
('P002', 'Malaria', 'Vivax', 'Penyebabnya adalah parasit dari keluarga Plasmodium falciparum, vivax, atau malariae. Penyebarnya nyamuk Anopheles betina.', 'Saat ini ada obat-obatan atau kombinasi obat-obatan baru yang diberikan untuk mengobati malaria di berbagai daerah. Salah satunya adalah artemisinin (sudah digunakan bertahun-tahun di Cina), yang sering diberikan bersama dengan obat antimalaria lainnya atau dengan antibiotik. Di beberapa daerah klorokin (obat yang paling banyak digunakan selama bertahun-tahun) masih ampuh.'),
('P003', 'Chikungunya', 'Arthralgia', 'Demam Chikungunya disebabkan oleh virus Chikungunya (CHIKV). CHIKV termasuk keluarga Togaviridae, Genus alphavirus, dan ditularkan oleh nyamuk Aedes Aegypti.', 'Belum ada obat atau vaksin untuk penyakit ini. Perawatan hanya untuk mengurangi gejala.'),
('P004', 'Kaki Gajah', 'Filariasis/Elephantiasis', 'Filariasis (penyakit kaki gajah) adalah penyakit menular yang disebabkan cacing yang ditularkan melalui gigitan berbagai jenis nyamuk. Cacing jenis Wuchereria bancrofti yang paling sering ditemukan di negeri tropis seperti Indonesia. Kemudian ada jenis lain bernama Brugia malayi merupakan jenis endemis di daerah pedesaan di India, Asia Tenggara, daerah pantai utara China dan Korea Selatan. Dan yang terakhir jenis Brugia timori yang banyak ditemukan di daerah pedesaan di Kepulauan Timor, Flores, Alor dan Roti di Tenggara Indonesia.', 'Pengobatan filariasis secara massal dilakukan di daerah endemis dengan menggunakan obat diethyl carbamazine citrate (DEC) dikombinasikan dengan Albenzol sekali setahun selama 5-10 tahun. Untuk mencegah reaksi samping seperti demam, diberikan parasetamol. Dosis obat untuk sekali minum adalah DEC 6 mg/kg/berat badan, Albenzol 400 mg (1 tablet).'),
('P005', 'Demam Penyakit Kuning', 'Icterus/Jaundice', 'Demam penyakit kuning perkotaan disebarkan oleh nyamuk hitam yang sama dengan yang menyebarkan demam berdarah. Nyamuknya mempunyai bintik-bintik putih di sepanjang punggung dan kaki-kakinya. Nyamuk ini hidup dan berkembangbiak dalam genangan air di kota-kota dan desa-desa.', 'Pengobatan terbaik untuk demam penyakit kuning adalah istirahat dan minum banyak cairan. Kebanyakan orang sembuh total setelah beberapa waktu dan badan mereka membentuk antibodi terhadap demam penyakit kuning.'),
('P006','undefined','undefined','undefined','unknown');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_relations`
--

DROP TABLE IF EXISTS `tbl_relations`;
CREATE TABLE IF NOT EXISTS `tbl_relations` (
  `disease_code` char(4) NOT NULL,
  `symptom_code` char(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_relations`
--

INSERT INTO `tbl_relations` (`disease_code`, `symptom_code`) VALUES
('P001', 'G001'),
('P001', 'G002'),
('P001', 'G003'),
('P001', 'G004'),
('P001', 'G005'),
('P001', 'G006'),
('P001', 'G007'),
('P001', 'G008'),
('P001', 'G009'),
('P001', 'G010'),
('P001', 'G011'),
('P001', 'G012'),
('P001', 'G018'),
('P001', 'G019'),
('P001', 'G020'),
('P001', 'G021'),
('P002', 'G002'),
('P002', 'G004'),
('P002', 'G005'),
('P002', 'G006'),
('P002', 'G012'),
('P002', 'G013'),
('P002', 'G014'),
('P002', 'G015'),
('P002', 'G016'),
('P002', 'G020'),
('P002', 'G022'),
('P002', 'G023'),
('P002', 'G024'),
('P003', 'G001'),
('P003', 'G004'),
('P003', 'G006'),
('P003', 'G017'),
('P003', 'G018'),
('P003', 'G019'),
('P003', 'G025'),
('P004', 'G001'),
('P004', 'G017'),
('P004', 'G026'),
('P004', 'G027'),
('P004', 'G028'),
('P005', 'G001'),
('P005', 'G002'),
('P005', 'G004'),
('P005', 'G005'),
('P005', 'G006'),
('P005', 'G009'),
('P005', 'G029').
('P006', 'G004');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

DROP TABLE IF EXISTS `tbl_users`;
CREATE TABLE IF NOT EXISTS `tbl_users` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(32) NOT NULL,
  `surename` varchar(30) NOT NULL,
  `sex` enum('M','F') NOT NULL,
  `address` varchar(100) NOT NULL,
  `occupation` varchar(60) NOT NULL,
  `level` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`id`, `username`, `password`, `salt`, `surename`, `sex`, `address`, `occupation`, `level`) VALUES
(1, 'admin', 'df5ea16694cf699082605a75cc6235ee427676cd', '0b05984787416f8a82911f1ac3c45c5a', 'administrator', 'M', 'depok', 'freelance', 10);

-- --------------------------------------------------------

--
-- Table structure for table `tmp_analyzes`
--

DROP TABLE IF EXISTS `tmp_analyzes`;
CREATE TABLE IF NOT EXISTS `tmp_analyzes` (
  `user_id` smallint(4) unsigned NOT NULL,
  `disease_code` char(4) NOT NULL,
  `symptom_code` char(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tmp_symptoms`
--

DROP TABLE IF EXISTS `tmp_symptoms`;
CREATE TABLE IF NOT EXISTS `tmp_symptoms` (
  `user_id` smallint(4) unsigned NOT NULL,
  `symptom_code` char(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tmp_diseases`
--

DROP TABLE IF EXISTS `tmp_diseases`;
CREATE TABLE IF NOT EXISTS `tmp_diseases` (
  `user_id` smallint(4) NOT NULL,
  `disease_code` char(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
