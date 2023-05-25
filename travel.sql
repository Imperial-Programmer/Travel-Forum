-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 20, 2023 at 11:10 PM
-- Server version: 10.3.24-MariaDB-log
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `travel_forum`
--

-- --------------------------------------------------------

--
-- Table structure for table `budget_categories`
--

-- CREATE TABLE `budget_categories` (
--   `id` int(11) NOT NULL,
--   `title` varchar(150) DEFAULT NULL,
--   `budget_min` int(11) DEFAULT NULL,
--   `budget_max` int(11) DEFAULT NULL,
--   `created_at` timestamp NULL DEFAULT NULL,
--   `updated_at` timestamp NULL DEFAULT NULL
-- ) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

-- CREATE TABLE `cities` (
--   `id` int(10) NOT NULL,
--   `province_id` int(10) NOT NULL,
--   `name` varchar(100) DEFAULT NULL,
--   `created_at` timestamp NULL DEFAULT NULL,
--   `updated_at` timestamp NULL DEFAULT NULL
-- ) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cities`
--

-- INSERT INTO `cities` (`id`, `province_id`, `name`, `created_at`, `updated_at`) VALUES
-- (1, 1, 'PIDIE JAYA', NULL, NULL),
-- (2, 1, 'SIMEULUE', NULL, NULL),
-- (3, 1, 'BIREUEN', NULL, NULL),
-- (4, 1, 'ACEH TIMUR', NULL, NULL),
-- (5, 1, 'ACEH UTARA', NULL, NULL),
-- (6, 1, 'PIDIE', NULL, NULL),
-- (7, 1, 'ACEH BARAT DAYA', NULL, NULL),
-- (8, 1, 'GAYO LUES', NULL, NULL),
-- (9, 1, 'ACEH SELATAN', NULL, NULL),
-- (10, 1, 'ACEH TAMIANG', NULL, NULL),
-- (11, 1, 'ACEH BESAR', NULL, NULL),
-- (12, 1, 'ACEH TENGGARA', NULL, NULL),
-- (13, 1, 'BENER MERIAH', NULL, NULL),
-- (14, 1, 'ACEH JAYA', NULL, NULL),
-- (15, 1, 'LHOKSEUMAWE', NULL, NULL),
-- (16, 1, 'ACEH BARAT', NULL, NULL),
-- (17, 1, 'NAGAN RAYA', NULL, NULL),
-- (18, 1, 'LANGSA', NULL, NULL),
-- (19, 1, 'BANDA ACEH', NULL, NULL),
-- (20, 1, 'ACEH SINGKIL', NULL, NULL),
-- (21, 1, 'SABANG', NULL, NULL),
-- (22, 1, 'ACEH TENGAH', NULL, NULL),
-- (23, 1, 'SUBULUSSALAM', NULL, NULL),
-- (24, 2, 'NIAS SELATAN', NULL, NULL),
-- (25, 2, 'MANDAILING NATAL', NULL, NULL),
-- (26, 2, 'DAIRI', NULL, NULL),
-- (27, 2, 'LABUHAN BATU UTARA', NULL, NULL),
-- (28, 2, 'TAPANULI UTARA', NULL, NULL),
-- (29, 2, 'SIMALUNGUN', NULL, NULL),
-- (30, 2, 'LANGKAT', NULL, NULL),
-- (31, 2, 'SERDANG BEDAGAI', NULL, NULL),
-- (32, 2, 'TAPANULI SELATAN', NULL, NULL),
-- (33, 2, 'ASAHAN', NULL, NULL),
-- (34, 2, 'PADANG LAWAS UTARA', NULL, NULL),
-- (35, 2, 'PADANG LAWAS', NULL, NULL),
-- (36, 2, 'LABUHAN BATU SELATAN', NULL, NULL),
-- (37, 2, 'PADANG SIDEMPUAN', NULL, NULL),
-- (38, 2, 'TOBA SAMOSIR', NULL, NULL),
-- (39, 2, 'TAPANULI TENGAH', NULL, NULL),
-- (40, 2, 'HUMBANG HASUNDUTAN', NULL, NULL),
-- (41, 2, 'SIBOLGA', NULL, NULL),
-- (42, 2, 'BATU BARA', NULL, NULL),
-- (43, 2, 'SAMOSIR', NULL, NULL),
-- (44, 2, 'PEMATANG SIANTAR', NULL, NULL),
-- (45, 2, 'LABUHAN BATU', NULL, NULL),
-- (46, 2, 'DELI SERDANG', NULL, NULL),
-- (47, 2, 'GUNUNGSITOLI', NULL, NULL),
-- (48, 2, 'NIAS UTARA', NULL, NULL),
-- (49, 2, 'NIAS', NULL, NULL),
-- (50, 2, 'KARO', NULL, NULL),
-- (51, 2, 'NIAS BARAT', NULL, NULL),
-- (52, 2, 'MEDAN', NULL, NULL),
-- (53, 2, 'PAKPAK BHARAT', NULL, NULL),
-- (54, 2, 'TEBING TINGGI', NULL, NULL),
-- (55, 2, 'BINJAI', NULL, NULL),
-- (56, 2, 'TANJUNG BALAI', NULL, NULL),
-- (57, 3, 'DHARMASRAYA', NULL, NULL),
-- (58, 3, 'SOLOK SELATAN', NULL, NULL),
-- (59, 3, 'SIJUNJUNG (SAWAH LUNTO SIJUNJUNG)', NULL, NULL),
-- (60, 3, 'PASAMAN BARAT', NULL, NULL),
-- (61, 3, 'SOLOK', NULL, NULL),
-- (62, 3, 'PASAMAN', NULL, NULL),
-- (63, 3, 'PARIAMAN', NULL, NULL),
-- (64, 3, 'TANAH DATAR', NULL, NULL),
-- (65, 3, 'PADANG PARIAMAN', NULL, NULL),
-- (66, 3, 'PESISIR SELATAN', NULL, NULL),
-- (67, 3, 'PADANG', NULL, NULL),
-- (68, 3, 'SAWAH LUNTO', NULL, NULL),
-- (69, 3, 'LIMA PULUH KOTO / KOTA', NULL, NULL),
-- (70, 3, 'AGAM', NULL, NULL),
-- (71, 3, 'PAYAKUMBUH', NULL, NULL),
-- (72, 3, 'BUKITTINGGI', NULL, NULL),
-- (73, 3, 'PADANG PANJANG', NULL, NULL),
-- (74, 3, 'KEPULAUAN MENTAWAI', NULL, NULL),
-- (75, 4, 'INDRAGIRI HILIR', NULL, NULL),
-- (76, 4, 'KUANTAN SINGINGI', NULL, NULL),
-- (77, 4, 'PELALAWAN', NULL, NULL),
-- (78, 4, 'PEKANBARU', NULL, NULL),
-- (79, 4, 'ROKAN HILIR', NULL, NULL),
-- (80, 4, 'BENGKALIS', NULL, NULL),
-- (81, 4, 'INDRAGIRI HULU', NULL, NULL),
-- (82, 4, 'ROKAN HULU', NULL, NULL),
-- (83, 4, 'KAMPAR', NULL, NULL),
-- (84, 4, 'KEPULAUAN MERANTI', NULL, NULL),
-- (85, 4, 'DUMAI', NULL, NULL),
-- (86, 4, 'SIAK', NULL, NULL),
-- (87, 5, 'TEBO', NULL, NULL),
-- (88, 5, 'TANJUNG JABUNG BARAT', NULL, NULL),
-- (89, 5, 'MUARO JAMBI', NULL, NULL),
-- (90, 5, 'KERINCI', NULL, NULL),
-- (91, 5, 'MERANGIN', NULL, NULL),
-- (92, 5, 'BUNGO', NULL, NULL),
-- (93, 5, 'TANJUNG JABUNG TIMUR', NULL, NULL),
-- (94, 5, 'SUNGAIPENUH', NULL, NULL),
-- (95, 5, 'BATANG HARI', NULL, NULL),
-- (96, 5, 'JAMBI', NULL, NULL),
-- (97, 5, 'SAROLANGUN', NULL, NULL),
-- (98, 6, 'PALEMBANG', NULL, NULL),
-- (99, 6, 'LAHAT', NULL, NULL),
-- (100, 6, 'OGAN KOMERING ULU TIMUR', NULL, NULL),
-- (101, 6, 'MUSI BANYUASIN', NULL, NULL),
-- (102, 6, 'PAGAR ALAM', NULL, NULL),
-- (103, 6, 'OGAN KOMERING ULU SELATAN', NULL, NULL),
-- (104, 6, 'BANYUASIN', NULL, NULL),
-- (105, 6, 'MUSI RAWAS', NULL, NULL),
-- (106, 6, 'MUARA ENIM', NULL, NULL),
-- (107, 6, 'OGAN KOMERING ULU', NULL, NULL),
-- (108, 6, 'OGAN KOMERING ILIR', NULL, NULL),
-- (109, 6, 'EMPAT LAWANG', NULL, NULL),
-- (110, 6, 'LUBUK LINGGAU', NULL, NULL),
-- (111, 6, 'PRABUMULIH', NULL, NULL),
-- (112, 6, 'OGAN ILIR', NULL, NULL),
-- (113, 7, 'BENGKULU TENGAH', NULL, NULL),
-- (114, 7, 'REJANG LEBONG', NULL, NULL),
-- (115, 7, 'MUKO MUKO', NULL, NULL),
-- (116, 7, 'KAUR', NULL, NULL),
-- (117, 7, 'BENGKULU UTARA', NULL, NULL),
-- (118, 7, 'LEBONG', NULL, NULL),
-- (119, 7, 'KEPAHIANG', NULL, NULL),
-- (120, 7, 'BENGKULU SELATAN', NULL, NULL),
-- (121, 7, 'SELUMA', NULL, NULL),
-- (122, 7, 'BENGKULU', NULL, NULL),
-- (123, 8, 'LAMPUNG UTARA', NULL, NULL),
-- (124, 8, 'WAY KANAN', NULL, NULL),
-- (125, 8, 'LAMPUNG TENGAH', NULL, NULL),
-- (126, 8, 'MESUJI', NULL, NULL),
-- (127, 8, 'PRINGSEWU', NULL, NULL),
-- (128, 8, 'LAMPUNG TIMUR', NULL, NULL),
-- (129, 8, 'LAMPUNG SELATAN', NULL, NULL),
-- (130, 8, 'TULANG BAWANG', NULL, NULL),
-- (131, 8, 'TULANG BAWANG BARAT', NULL, NULL),
-- (132, 8, 'TANGGAMUS', NULL, NULL),
-- (133, 8, 'LAMPUNG BARAT', NULL, NULL),
-- (134, 8, 'PESISIR BARAT', NULL, NULL),
-- (135, 8, 'PESAWARAN', NULL, NULL),
-- (136, 8, 'BANDAR LAMPUNG', NULL, NULL),
-- (137, 8, 'METRO', NULL, NULL),
-- (138, 9, 'BELITUNG', NULL, NULL),
-- (139, 9, 'BELITUNG TIMUR', NULL, NULL),
-- (140, 9, 'BANGKA', NULL, NULL),
-- (141, 9, 'BANGKA SELATAN', NULL, NULL),
-- (142, 9, 'BANGKA BARAT', NULL, NULL),
-- (143, 9, 'PANGKAL PINANG', NULL, NULL),
-- (144, 9, 'BANGKA TENGAH', NULL, NULL),
-- (145, 10, 'KEPULAUAN ANAMBAS', NULL, NULL),
-- (146, 10, 'BINTAN', NULL, NULL),
-- (147, 10, 'NATUNA', NULL, NULL),
-- (148, 10, 'BATAM', NULL, NULL),
-- (149, 10, 'TANJUNG PINANG', NULL, NULL),
-- (150, 10, 'KARIMUN', NULL, NULL),
-- (151, 10, 'LINGGA', NULL, NULL),
-- (152, 11, 'JAKARTA UTARA', NULL, NULL),
-- (153, 11, 'JAKARTA BARAT', NULL, NULL),
-- (154, 11, 'JAKARTA TIMUR', NULL, NULL),
-- (155, 11, 'JAKARTA SELATAN', NULL, NULL),
-- (156, 11, 'JAKARTA PUSAT', NULL, NULL),
-- (157, 11, 'KEPULAUAN SERIBU', NULL, NULL),
-- (158, 12, 'DEPOK', NULL, NULL),
-- (159, 12, 'KARAWANG', NULL, NULL),
-- (160, 12, 'CIREBON', NULL, NULL),
-- (161, 12, 'BANDUNG', NULL, NULL),
-- (162, 12, 'SUKABUMI', NULL, NULL),
-- (163, 12, 'SUMEDANG', NULL, NULL),
-- (164, 12, 'INDRAMAYU', NULL, NULL),
-- (165, 12, 'MAJALENGKA', NULL, NULL),
-- (166, 12, 'KUNINGAN', NULL, NULL),
-- (167, 12, 'TASIKMALAYA', NULL, NULL),
-- (168, 12, 'CIAMIS', NULL, NULL),
-- (169, 12, 'SUBANG', NULL, NULL),
-- (170, 12, 'PURWAKARTA', NULL, NULL),
-- (171, 12, 'BOGOR', NULL, NULL),
-- (172, 12, 'BEKASI', NULL, NULL),
-- (173, 12, 'GARUT', NULL, NULL),
-- (174, 12, 'PANGANDARAN', NULL, NULL),
-- (175, 12, 'CIANJUR', NULL, NULL),
-- (176, 12, 'BANJAR', NULL, NULL),
-- (177, 12, 'BANDUNG BARAT', NULL, NULL),
-- (178, 12, 'CIMAHI', NULL, NULL),
-- (179, 13, 'PURBALINGGA', NULL, NULL),
-- (180, 13, 'KEBUMEN', NULL, NULL),
-- (181, 13, 'MAGELANG', NULL, NULL),
-- (182, 13, 'CILACAP', NULL, NULL),
-- (183, 13, 'BATANG', NULL, NULL),
-- (184, 13, 'BANJARNEGARA', NULL, NULL),
-- (185, 13, 'BLORA', NULL, NULL),
-- (186, 13, 'BREBES', NULL, NULL),
-- (187, 13, 'BANYUMAS', NULL, NULL),
-- (188, 13, 'WONOSOBO', NULL, NULL),
-- (189, 13, 'TEGAL', NULL, NULL),
-- (190, 13, 'PURWOREJO', NULL, NULL),
-- (191, 13, 'PATI', NULL, NULL),
-- (192, 13, 'SUKOHARJO', NULL, NULL),
-- (193, 13, 'KARANGANYAR', NULL, NULL),
-- (194, 13, 'PEKALONGAN', NULL, NULL),
-- (195, 13, 'PEMALANG', NULL, NULL),
-- (196, 13, 'BOYOLALI', NULL, NULL),
-- (197, 13, 'GROBOGAN', NULL, NULL),
-- (198, 13, 'SEMARANG', NULL, NULL),
-- (199, 13, 'DEMAK', NULL, NULL),
-- (200, 13, 'REMBANG', NULL, NULL),
-- (201, 13, 'KLATEN', NULL, NULL),
-- (202, 13, 'KUDUS', NULL, NULL),
-- (203, 13, 'TEMANGGUNG', NULL, NULL),
-- (204, 13, 'SRAGEN', NULL, NULL),
-- (205, 13, 'JEPARA', NULL, NULL),
-- (206, 13, 'WONOGIRI', NULL, NULL),
-- (207, 13, 'KENDAL', NULL, NULL),
-- (208, 13, 'SURAKARTA (SOLO)', NULL, NULL),
-- (209, 13, 'SALATIGA', NULL, NULL),
-- (210, 14, 'SLEMAN', NULL, NULL),
-- (211, 14, 'BANTUL', NULL, NULL),
-- (212, 14, 'YOGYAKARTA', NULL, NULL),
-- (213, 14, 'GUNUNG KIDUL', NULL, NULL),
-- (214, 14, 'KULON PROGO', NULL, NULL),
-- (215, 15, 'GRESIK', NULL, NULL),
-- (216, 15, 'KEDIRI', NULL, NULL),
-- (217, 15, 'SAMPANG', NULL, NULL),
-- (218, 15, 'BANGKALAN', NULL, NULL),
-- (219, 15, 'SUMENEP', NULL, NULL),
-- (220, 15, 'SITUBONDO', NULL, NULL),
-- (221, 15, 'SURABAYA', NULL, NULL),
-- (222, 15, 'JEMBER', NULL, NULL),
-- (223, 15, 'PAMEKASAN', NULL, NULL),
-- (224, 15, 'JOMBANG', NULL, NULL),
-- (225, 15, 'PROBOLINGGO', NULL, NULL),
-- (226, 15, 'BANYUWANGI', NULL, NULL),
-- (227, 15, 'PASURUAN', NULL, NULL),
-- (228, 15, 'BOJONEGORO', NULL, NULL),
-- (229, 15, 'BONDOWOSO', NULL, NULL),
-- (230, 15, 'MAGETAN', NULL, NULL),
-- (231, 15, 'LUMAJANG', NULL, NULL),
-- (232, 15, 'MALANG', NULL, NULL),
-- (233, 15, 'BLITAR', NULL, NULL),
-- (234, 15, 'SIDOARJO', NULL, NULL),
-- (235, 15, 'LAMONGAN', NULL, NULL),
-- (236, 15, 'PACITAN', NULL, NULL),
-- (237, 15, 'TULUNGAGUNG', NULL, NULL),
-- (238, 15, 'MOJOKERTO', NULL, NULL),
-- (239, 15, 'MADIUN', NULL, NULL),
-- (240, 15, 'PONOROGO', NULL, NULL),
-- (241, 15, 'NGAWI', NULL, NULL),
-- (242, 15, 'NGANJUK', NULL, NULL),
-- (243, 15, 'TUBAN', NULL, NULL),
-- (244, 15, 'TRENGGALEK', NULL, NULL),
-- (245, 15, 'BATU', NULL, NULL),
-- (246, 16, 'TANGERANG', NULL, NULL),
-- (247, 16, 'SERANG', NULL, NULL),
-- (248, 16, 'PANDEGLANG', NULL, NULL),
-- (249, 16, 'LEBAK', NULL, NULL),
-- (250, 16, 'TANGERANG SELATAN', NULL, NULL),
-- (251, 16, 'CILEGON', NULL, NULL),
-- (252, 17, 'KLUNGKUNG', NULL, NULL),
-- (253, 17, 'KARANGASEM', NULL, NULL),
-- (254, 17, 'BANGLI', NULL, NULL),
-- (255, 17, 'TABANAN', NULL, NULL),
-- (256, 17, 'GIANYAR', NULL, NULL),
-- (257, 17, 'BADUNG', NULL, NULL),
-- (258, 17, 'JEMBRANA', NULL, NULL),
-- (259, 17, 'BULELENG', NULL, NULL),
-- (260, 17, 'DENPASAR', NULL, NULL),
-- (261, 18, 'MATARAM', NULL, NULL),
-- (262, 18, 'DOMPU', NULL, NULL),
-- (263, 18, 'SUMBAWA BARAT', NULL, NULL),
-- (264, 18, 'SUMBAWA', NULL, NULL),
-- (265, 18, 'LOMBOK TENGAH', NULL, NULL),
-- (266, 18, 'LOMBOK TIMUR', NULL, NULL),
-- (267, 18, 'LOMBOK UTARA', NULL, NULL),
-- (268, 18, 'LOMBOK BARAT', NULL, NULL),
-- (269, 18, 'BIMA', NULL, NULL),
-- (270, 19, 'TIMOR TENGAH SELATAN', NULL, NULL),
-- (271, 19, 'FLORES TIMUR', NULL, NULL),
-- (272, 19, 'ALOR', NULL, NULL),
-- (273, 19, 'ENDE', NULL, NULL),
-- (274, 19, 'NAGEKEO', NULL, NULL),
-- (275, 19, 'KUPANG', NULL, NULL),
-- (276, 19, 'SIKKA', NULL, NULL),
-- (277, 19, 'NGADA', NULL, NULL),
-- (278, 19, 'TIMOR TENGAH UTARA', NULL, NULL),
-- (279, 19, 'BELU', NULL, NULL),
-- (280, 19, 'LEMBATA', NULL, NULL),
-- (281, 19, 'SUMBA BARAT DAYA', NULL, NULL),
-- (282, 19, 'SUMBA BARAT', NULL, NULL),
-- (283, 19, 'SUMBA TENGAH', NULL, NULL),
-- (284, 19, 'SUMBA TIMUR', NULL, NULL),
-- (285, 19, 'ROTE NDAO', NULL, NULL),
-- (286, 19, 'MANGGARAI TIMUR', NULL, NULL),
-- (287, 19, 'MANGGARAI', NULL, NULL),
-- (288, 19, 'SABU RAIJUA', NULL, NULL),
-- (289, 19, 'MANGGARAI BARAT', NULL, NULL),
-- (290, 20, 'LANDAK', NULL, NULL),
-- (291, 20, 'KETAPANG', NULL, NULL),
-- (292, 20, 'SINTANG', NULL, NULL),
-- (293, 20, 'KUBU RAYA', NULL, NULL),
-- (294, 20, 'PONTIANAK', NULL, NULL),
-- (295, 20, 'KAYONG UTARA', NULL, NULL),
-- (296, 20, 'BENGKAYANG', NULL, NULL),
-- (297, 20, 'KAPUAS HULU', NULL, NULL),
-- (298, 20, 'SAMBAS', NULL, NULL),
-- (299, 20, 'SINGKAWANG', NULL, NULL),
-- (300, 20, 'SANGGAU', NULL, NULL),
-- (301, 20, 'MELAWI', NULL, NULL),
-- (302, 20, 'SEKADAU', NULL, NULL),
-- (303, 21, 'KOTAWARINGIN TIMUR', NULL, NULL),
-- (304, 21, 'SUKAMARA', NULL, NULL),
-- (305, 21, 'KOTAWARINGIN BARAT', NULL, NULL),
-- (306, 21, 'BARITO TIMUR', NULL, NULL),
-- (307, 21, 'KAPUAS', NULL, NULL),
-- (308, 21, 'PULANG PISAU', NULL, NULL),
-- (309, 21, 'LAMANDAU', NULL, NULL),
-- (310, 21, 'SERUYAN', NULL, NULL),
-- (311, 21, 'KATINGAN', NULL, NULL),
-- (312, 21, 'BARITO SELATAN', NULL, NULL),
-- (313, 21, 'MURUNG RAYA', NULL, NULL),
-- (314, 21, 'BARITO UTARA', NULL, NULL),
-- (315, 21, 'GUNUNG MAS', NULL, NULL),
-- (316, 21, 'PALANGKA RAYA', NULL, NULL),
-- (317, 22, 'TAPIN', NULL, NULL),
-- (318, 22, 'BANJAR', NULL, NULL),
-- (319, 22, 'HULU SUNGAI TENGAH', NULL, NULL),
-- (320, 22, 'TABALONG', NULL, NULL),
-- (321, 22, 'HULU SUNGAI UTARA', NULL, NULL),
-- (322, 22, 'BALANGAN', NULL, NULL),
-- (323, 22, 'TANAH BUMBU', NULL, NULL),
-- (324, 22, 'BANJARMASIN', NULL, NULL),
-- (325, 22, 'KOTABARU', NULL, NULL),
-- (326, 22, 'TANAH LAUT', NULL, NULL),
-- (327, 22, 'HULU SUNGAI SELATAN', NULL, NULL),
-- (328, 22, 'BARITO KUALA', NULL, NULL),
-- (329, 22, 'BANJARBARU', NULL, NULL),
-- (330, 23, 'KUTAI BARAT', NULL, NULL),
-- (331, 23, 'SAMARINDA', NULL, NULL),
-- (332, 23, 'PASER', NULL, NULL),
-- (333, 23, 'KUTAI KARTANEGARA', NULL, NULL),
-- (334, 23, 'BERAU', NULL, NULL),
-- (335, 23, 'PENAJAM PASER UTARA', NULL, NULL),
-- (336, 23, 'BONTANG', NULL, NULL),
-- (337, 23, 'KUTAI TIMUR', NULL, NULL),
-- (338, 23, 'BALIKPAPAN', NULL, NULL),
-- (339, 24, 'MALINAU', NULL, NULL),
-- (340, 24, 'NUNUKAN', NULL, NULL),
-- (341, 24, 'BULUNGAN (BULONGAN)', NULL, NULL),
-- (342, 24, 'TANA TIDUNG', NULL, NULL),
-- (343, 24, 'TARAKAN', NULL, NULL),
-- (344, 25, 'BOLAANG MONGONDOW (BOLMONG)', NULL, NULL),
-- (345, 25, 'BOLAANG MONGONDOW SELATAN', NULL, NULL),
-- (346, 25, 'MINAHASA SELATAN', NULL, NULL),
-- (347, 25, 'BITUNG', NULL, NULL),
-- (348, 25, 'MINAHASA', NULL, NULL),
-- (349, 25, 'KEPULAUAN SANGIHE', NULL, NULL),
-- (350, 25, 'MINAHASA UTARA', NULL, NULL),
-- (351, 25, 'KEPULAUAN TALAUD', NULL, NULL),
-- (352, 25, 'KEPULAUAN SIAU TAGULANDANG BIARO (SITARO)', NULL, NULL),
-- (353, 25, 'MANADO', NULL, NULL),
-- (354, 25, 'BOLAANG MONGONDOW UTARA', NULL, NULL),
-- (355, 25, 'BOLAANG MONGONDOW TIMUR', NULL, NULL),
-- (356, 25, 'MINAHASA TENGGARA', NULL, NULL),
-- (357, 25, 'KOTAMOBAGU', NULL, NULL),
-- (358, 25, 'TOMOHON', NULL, NULL),
-- (359, 26, 'BANGGAI KEPULAUAN', NULL, NULL),
-- (360, 26, 'TOLI-TOLI', NULL, NULL),
-- (361, 26, 'PARIGI MOUTONG', NULL, NULL),
-- (362, 26, 'BUOL', NULL, NULL),
-- (363, 26, 'DONGGALA', NULL, NULL),
-- (364, 26, 'POSO', NULL, NULL),
-- (365, 26, 'MOROWALI', NULL, NULL),
-- (366, 26, 'TOJO UNA-UNA', NULL, NULL),
-- (367, 26, 'BANGGAI', NULL, NULL),
-- (368, 26, 'SIGI', NULL, NULL),
-- (369, 26, 'PALU', NULL, NULL),
-- (370, 27, 'MAROS', NULL, NULL),
-- (371, 27, 'WAJO', NULL, NULL),
-- (372, 27, 'BONE', NULL, NULL),
-- (373, 27, 'SOPPENG', NULL, NULL),
-- (374, 27, 'SIDENRENG RAPPANG / RAPANG', NULL, NULL),
-- (375, 27, 'TAKALAR', NULL, NULL),
-- (376, 27, 'BARRU', NULL, NULL),
-- (377, 27, 'LUWU TIMUR', NULL, NULL),
-- (378, 27, 'SINJAI', NULL, NULL),
-- (379, 27, 'PANGKAJENE KEPULAUAN', NULL, NULL),
-- (380, 27, 'PINRANG', NULL, NULL),
-- (381, 27, 'JENEPONTO', NULL, NULL),
-- (382, 27, 'PALOPO', NULL, NULL),
-- (383, 27, 'TORAJA UTARA', NULL, NULL),
-- (384, 27, 'LUWU', NULL, NULL),
-- (385, 27, 'BULUKUMBA', NULL, NULL),
-- (386, 27, 'MAKASSAR', NULL, NULL),
-- (387, 27, 'SELAYAR (KEPULAUAN SELAYAR)', NULL, NULL),
-- (388, 27, 'TANA TORAJA', NULL, NULL),
-- (389, 27, 'LUWU UTARA', NULL, NULL),
-- (390, 27, 'BANTAENG', NULL, NULL),
-- (391, 27, 'GOWA', NULL, NULL),
-- (392, 27, 'ENREKANG', NULL, NULL),
-- (393, 27, 'PAREPARE', NULL, NULL),
-- (394, 28, 'KOLAKA', NULL, NULL),
-- (395, 28, 'MUNA', NULL, NULL),
-- (396, 28, 'KONAWE SELATAN', NULL, NULL),
-- (397, 28, 'KENDARI', NULL, NULL),
-- (398, 28, 'KONAWE', NULL, NULL),
-- (399, 28, 'KONAWE UTARA', NULL, NULL),
-- (400, 28, 'KOLAKA UTARA', NULL, NULL),
-- (401, 28, 'BUTON', NULL, NULL),
-- (402, 28, 'BOMBANA', NULL, NULL),
-- (403, 28, 'WAKATOBI', NULL, NULL),
-- (404, 28, 'BAU-BAU', NULL, NULL),
-- (405, 28, 'BUTON UTARA', NULL, NULL),
-- (406, 29, 'GORONTALO UTARA', NULL, NULL),
-- (407, 29, 'BONE BOLANGO', NULL, NULL),
-- (408, 29, 'GORONTALO', NULL, NULL),
-- (409, 29, 'BOALEMO', NULL, NULL),
-- (410, 29, 'POHUWATO', NULL, NULL),
-- (411, 30, 'MAJENE', NULL, NULL),
-- (412, 30, 'MAMUJU', NULL, NULL),
-- (413, 30, 'MAMUJU UTARA', NULL, NULL),
-- (414, 30, 'POLEWALI MANDAR', NULL, NULL),
-- (415, 30, 'MAMASA', NULL, NULL),
-- (416, 31, 'MALUKU TENGGARA BARAT', NULL, NULL),
-- (417, 31, 'MALUKU TENGGARA', NULL, NULL),
-- (418, 31, 'SERAM BAGIAN BARAT', NULL, NULL),
-- (419, 31, 'MALUKU TENGAH', NULL, NULL),
-- (420, 31, 'SERAM BAGIAN TIMUR', NULL, NULL),
-- (421, 31, 'MALUKU BARAT DAYA', NULL, NULL),
-- (422, 31, 'AMBON', NULL, NULL),
-- (423, 31, 'BURU', NULL, NULL),
-- (424, 31, 'BURU SELATAN', NULL, NULL),
-- (425, 31, 'KEPULAUAN ARU', NULL, NULL),
-- (426, 31, 'TUAL', NULL, NULL),
-- (427, 32, 'HALMAHERA BARAT', NULL, NULL),
-- (428, 32, 'TIDORE KEPULAUAN', NULL, NULL),
-- (429, 32, 'TERNATE', NULL, NULL),
-- (430, 32, 'PULAU MOROTAI', NULL, NULL),
-- (431, 32, 'KEPULAUAN SULA', NULL, NULL),
-- (432, 32, 'HALMAHERA SELATAN', NULL, NULL),
-- (433, 32, 'HALMAHERA TENGAH', NULL, NULL),
-- (434, 32, 'HALMAHERA TIMUR', NULL, NULL),
-- (435, 32, 'HALMAHERA UTARA', NULL, NULL),
-- (436, 33, 'YALIMO', NULL, NULL),
-- (437, 33, 'DOGIYAI', NULL, NULL),
-- (438, 33, 'ASMAT', NULL, NULL),
-- (439, 33, 'JAYAPURA', NULL, NULL),
-- (440, 33, 'PANIAI', NULL, NULL),
-- (441, 33, 'MAPPI', NULL, NULL),
-- (442, 33, 'TOLIKARA', NULL, NULL),
-- (443, 33, 'PUNCAK JAYA', NULL, NULL),
-- (444, 33, 'PEGUNUNGAN BINTANG', NULL, NULL),
-- (445, 33, 'JAYAWIJAYA', NULL, NULL),
-- (446, 33, 'LANNY JAYA', NULL, NULL),
-- (447, 33, 'NDUGA', NULL, NULL),
-- (448, 33, 'BIAK NUMFOR', NULL, NULL),
-- (449, 33, 'KEPULAUAN YAPEN (YAPEN WAROPEN)', NULL, NULL),
-- (450, 33, 'PUNCAK', NULL, NULL),
-- (451, 33, 'INTAN JAYA', NULL, NULL),
-- (452, 33, 'WAROPEN', NULL, NULL),
-- (453, 33, 'NABIRE', NULL, NULL),
-- (454, 33, 'MIMIKA', NULL, NULL),
-- (455, 33, 'BOVEN DIGOEL', NULL, NULL),
-- (456, 33, 'YAHUKIMO', NULL, NULL),
-- (457, 33, 'SARMI', NULL, NULL),
-- (458, 33, 'MERAUKE', NULL, NULL),
-- (459, 33, 'DEIYAI (DELIYAI)', NULL, NULL),
-- (460, 33, 'KEEROM', NULL, NULL),
-- (461, 33, 'SUPIORI', NULL, NULL),
-- (462, 33, 'MAMBERAMO RAYA', NULL, NULL),
-- (463, 33, 'MAMBERAMO TENGAH', NULL, NULL),
-- (464, 34, 'RAJA AMPAT', NULL, NULL),
-- (465, 34, 'MANOKWARI SELATAN', NULL, NULL),
-- (466, 34, 'MANOKWARI', NULL, NULL),
-- (467, 34, 'KAIMANA', NULL, NULL),
-- (468, 34, 'MAYBRAT', NULL, NULL),
-- (469, 34, 'SORONG SELATAN', NULL, NULL),
-- (470, 34, 'FAKFAK', NULL, NULL),
-- (471, 34, 'PEGUNUNGAN ARFAK', NULL, NULL),
-- (472, 34, 'TAMBRAUW', NULL, NULL),
-- (473, 34, 'SORONG', NULL, NULL),
-- (474, 34, 'TELUK WONDAMA', NULL, NULL),
-- (475, 34, 'TELUK BINTUNI', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `guide_tours`
--

-- CREATE TABLE `guide_tours` (
--   `id` int(11) NOT NULL,
--   `city_id` int(11) DEFAULT NULL,
--   `location` text DEFAULT NULL,
--   `content` text DEFAULT NULL,
--   `budget_min` int(11) DEFAULT NULL,
--   `budget_max` int(11) DEFAULT NULL,
--   `gmaps` text DEFAULT NULL,
--   `created_at` timestamp NULL DEFAULT NULL,
--   `updated_at` timestamp NULL DEFAULT NULL
-- ) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `guide_tours`
--

-- INSERT INTO `guide_tours` (`id`, `city_id`, `location`, `content`, `budget_min`, `budget_max`, `gmaps`, `created_at`, `updated_at`) VALUES
-- (2, 221, 'Tugu Pahlawan', '<p>Mantap</p>', 0, 1000000, NULL, '2022-10-11 07:46:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `provinces`
--

-- CREATE TABLE `provinces` (
--   `id` int(10) NOT NULL,
--   `name` varchar(100) DEFAULT NULL,
--   `created_at` timestamp NULL DEFAULT NULL,
--   `updated_at` timestamp NULL DEFAULT NULL
-- ) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `provinces`
--

-- INSERT INTO `provinces` (`id`, `name`, `created_at`, `updated_at`) VALUES
-- (1, 'ACEH', NULL, NULL),
-- (2, 'SUMATERA UTARA', NULL, NULL),
-- (3, 'SUMATERA BARAT', NULL, NULL),
-- (4, 'RIAU', NULL, NULL),
-- (5, 'JAMBI', NULL, NULL),
-- (6, 'SUMATERA SELATAN', NULL, NULL),
-- (7, 'BENGKULU', NULL, NULL),
-- (8, 'LAMPUNG', NULL, NULL),
-- (9, 'KEPULAUAN BANGKA BELITUNG', NULL, NULL),
-- (10, 'KEPULAUAN RIAU', NULL, NULL),
-- (11, 'DKI JAKARTA', NULL, NULL),
-- (12, 'JAWA BARAT', NULL, NULL),
-- (13, 'JAWA TENGAH', NULL, NULL),
-- (14, 'DI YOGYAKARTA', NULL, NULL),
-- (15, 'JAWA TIMUR', NULL, NULL),
-- (16, 'BANTEN', NULL, NULL),
-- (17, 'BALI', NULL, NULL),
-- (18, 'NUSA TENGGARA BARAT', NULL, NULL),
-- (19, 'NUSA TENGGARA TIMUR', NULL, NULL),
-- (20, 'KALIMANTAN BARAT', NULL, NULL),
-- (21, 'KALIMANTAN TENGAH', NULL, NULL),
-- (22, 'KALIMANTAN SELATAN', NULL, NULL),
-- (23, 'KALIMANTAN TIMUR', NULL, NULL),
-- (24, 'KALIMANTAN UTARA', NULL, NULL),
-- (25, 'SULAWESI UTARA', NULL, NULL),
-- (26, 'SULAWESI TENGAH', NULL, NULL),
-- (27, 'SULAWESI SELATAN', NULL, NULL),
-- (28, 'SULAWESI TENGGARA', NULL, NULL),
-- (29, 'GORONTALO', NULL, NULL),
-- (30, 'SULAWESI BARAT', NULL, NULL),
-- (31, 'MALUKU', NULL, NULL),
-- (32, 'MALUKU UTARA', NULL, NULL),
-- (33, 'PAPUA', NULL, NULL),
-- (34, 'PAPUA BARAT', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `setting_name` text DEFAULT NULL,
  `setting_label` varchar(100) DEFAULT NULL,
  `setting_value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `setting_name`, `setting_label`, `setting_value`, `created_at`, `updated_at`) VALUES
(1, 'about', 'Halaman About', '    <h2 style=\"text-align: center; \">About Us!</h2>\r\n    <h3 style=\"text-align: center;\">Welcome To <span id=\"W_Name1\">Travel Forum</span></h3>\r\n    <p style=\"text-align: justify; \"><span id=\"W_Name2\">Travel Forum</span> is a Professional <span id=\"W_Type1\">Forum</span> Platform. Here we will provide you only interesting content, which you will like very much. We\'re dedicated to providing you the best of <span id=\"W_Type2\">Forum</span>, with a focus on dependability and <span id=\"W_Spec\">Forum about Travel</span>. We\'re working to turn our passion for <span id=\"W_Type3\">Forum</span> into a booming <a href=\"https://www.blogearns.com/2021/05/free-about-us-page-generator.html\" rel=\"do-follow\" style=\"color: inherit; text-decoration: none;\">online website</a>. We hope you enjoy our <span id=\"W_Type4\">Forum</span> as much as we enjoy offering them to you.</p>\r\n<p style=\"text-align: justify;\">I will keep posting more important posts on my Website for all of you. Please give your support and love.</p>\r\n<p style=\"font-weight: bold; text-align: center;\">Thanks For Visiting Our Site<br><br>\r\n<span style=\"color: blue; font-size: 16px; font-weight: bold; text-align: center;\">Have a nice day!</span></p>\r\n    ', '2022-10-09 05:38:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `threads`
--

CREATE TABLE `threads` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `title` text DEFAULT NULL,
  `content` text DEFAULT NULL,
  `thread_category_id` int(11) DEFAULT NULL,
  `tour_by_budget_id` int(11) DEFAULT NULL,
  `is_publish` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `threads`
--

INSERT INTO `threads` (`id`, `user_id`, `title`, `content`, `thread_category_id`, `tour_by_budget_id`, `is_publish`, `created_at`, `updated_at`) VALUES
(1, 1, 'Keindahan Pulau Batam Istimewa', '<p>Yang asyik ada disini.</p><p>Wisatawan dapat merasakan keindahan alam Pulau Batam serta berbagai keunggulan pariwisata lainnya dalam kunjungan wisata maupun dengan keperluan bisnis, tentunya dengan berbagai kemudahan fasilitas karena Pulau Batam merupakan Kawasan Perdagangan Bebas dan Pelabuhan Bebas.</p>\r\n<p>Batam merupakan sebuah pulau di daerah Kepulauan Riau, berlokasi di sebelah barat pulau Bintan dan sebelah selatan Singapura. Sebagai daerah kepulauan, Batam tentunya memiliki berbagai keindahan alam yang dapat dinikmati oleh siapapun yang berkunjung ke Batam. Keindahan resort, laut, pantai, hingga lapangan golf dapat dinikmati saat berada di Batam.</p>\r\n<p>Sebagai Kawasan Perdagangan Bebas dan Pelabuhan Bebas, Batam dapat menjadi salah satu tujuan wisata, baik wisatawan domestik maupun mancanegara. Dengan memanfaatkan berbagai kemudahan dan fasilitas yang ada di Batam, wisatawan dapat menikmati berbagai destinasi wisata di Batam dengan mudah.</p>', 1, 1, 1, '2022-10-02 05:32:46', '2022-10-02 15:12:17'),
(2, 1, 'Keindahan Kota Batam', '<p>Wisatawan dapat merasakan keindahan alam Pulau Batam serta berbagai keunggulan pariwisata lainnya dalam kunjungan wisata maupun dengan keperluan bisnis, tentunya dengan berbagai kemudahan fasilitas karena Pulau Batam merupakan Kawasan Perdagangan Bebas dan Pelabuhan Bebas.</p>\r\n<p>Batam merupakan sebuah pulau di daerah Kepulauan Riau, berlokasi di sebelah barat pulau Bintan dan sebelah selatan Singapura. Sebagai daerah kepulauan, Batam tentunya memiliki berbagai keindahan alam yang dapat dinikmati oleh siapapun yang berkunjung ke Batam. Keindahan resort, laut, pantai, hingga lapangan golf dapat dinikmati saat berada di Batam.</p>\r\n<p>Sebagai Kawasan Perdagangan Bebas dan Pelabuhan Bebas, Batam dapat menjadi salah satu tujuan wisata, baik wisatawan domestik maupun mancanegara. Dengan memanfaatkan berbagai kemudahan dan fasilitas yang ada di Batam, wisatawan dapat menikmati berbagai destinasi wisata di Batam dengan mudah.</p>', 1, 1, 1, '2022-10-02 05:32:46', NULL),
(6, 4, 'The Cafe Hotel Mulia', '<p>The Cafe Hotel Mulia merupakan restoran high-end yang berada pada lobby Hotel Mulia Senayan ialah all you can eat buffet dengan pilihan masakan yang beragam dengan suasana yang mewah, berikut merupakan website The Cafe Hotel Mulia,&nbsp;<a href=\"https://muliadining.com/jakarta/thecafe/\" target=\"_blank\">https://muliadining.com/jakarta/thecafe/</a>.</p>', 3, 4, NULL, '2022-12-28 04:41:12', '2023-01-01 13:51:49'),
(7, 4, 'Kebun Binatang Ragunan', '<p>Kebun Binatang Ragunan merupakan kebun binatang yang berada di Jakarta Selatan, ada 2009 fauna pada kebun binatang ini yang seluas 147 hektar, tiket dewasa berupa Rp. 4000,- dan untuk anak-anak berupa Rp. 3000,-, untuk lebih lengkap, website kebun binatang ialah&nbsp;<a href=\"https://ragunanzoo.jakarta.go.id/\" target=\"_blank\">https://ragunanzoo.jakarta.go.id/</a>.</p>', 7, 1, NULL, '2023-01-01 13:48:38', NULL),
(8, 4, 'Taman Safari Bogor', '<p>Taman Safari Bogor merupakan pusat konservasi yang dapat dikunjungi oleh wisatawan dengan harga tiket Rp. 260.000,- perorangan, untuk mengetahui lebih lanjut, berikut website Taman Safari Bogor,&nbsp;<a href=\"https://bogor.tamansafari.com/index.php\" target=\"_blank\">https://bogor.tamansafari.com/index.php</a>.</p>', 8, 3, NULL, '2023-01-01 13:58:26', '2023-01-01 14:16:13'),
(9, 4, 'Layar Seafood', '<p>Layar Seafood merupakan restoran yang menyajikan makanan laut dengan rasa asli Indonesia, untuk mengetahui lebih lanjut, berikut website restoran layar,&nbsp;https://www.layarseafood.com/about</p>', 3, 3, NULL, '2023-01-01 14:00:58', NULL),
(10, 4, 'Hotel Mulia Jakarta', '<p>Hotel Mulia merupakan Hotel Bintang Lima kelas dunia yang memberikan suasana mewah dan elegan, lengkap dengan pelayanan yang baik, untuk mengetahui lebih lengkap berikut website Hotel Mulia Jakarta,&nbsp;<a href=\"https://www.themulia.com/jakarta/\" target=\"_blank\">https://www.themulia.com/jakarta/</a>.</p>', 4, 4, NULL, '2023-01-01 14:04:50', NULL),
(11, 4, 'Dunia Fantasi Ancol', '<p>Dunia Fantasi Ancol merupakan pusat hiburan outdoor dan juga kawasan edutainment, Dufan memiliki fasilitas permainan yang beragam, untuk mengetahui lebih lanjut, berikut website Dunia Fantasi Ancol,&nbsp;<a href=\"https://www.ancol.com/unit-rekreasi/dunia-fantasi--2\" target=\"_blank\">https://www.ancol.com/unit-rekreasi/dunia-fantasi--2</a>.</p>', 6, 2, NULL, '2023-01-01 14:08:11', '2023-01-01 14:08:22'),
(12, 4, 'Waterboom Lippo Cikarang', '<p>Waterboom Lippo Cikarang merupakan wisata waterpark yang family-friendly dengan kolam berenang bermacam-macam dan beragam water slides, untuk mengetahui lebih lanjut, berikut website Waterboom Lippo Cikarang,&nbsp;<a href=\"http://www.waterboomlippocikarang.com/\" target=\"_blank\">http://www.waterboomlippocikarang.com/</a>.</p>', 8, 2, NULL, '2023-01-01 14:13:13', '2023-01-01 14:16:42'),
(13, 4, 'Pantai Ancol', '<p>Pantai Ancol merupakan pantai yang berada di Jakarta Utara, Ancol memiliki fasilitas beragam, seperti aquarium besar dan lain lain, untuk mengetahui lebih, berikut website Pantai Ancol,&nbsp;<a href=\"https://www.ancol.com/home\" target=\"_blank\">https://www.ancol.com/home</a>.</p>', 5, 1, NULL, '2023-01-01 14:19:53', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `thread_categories`
--

CREATE TABLE `thread_categories` (
  `id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `thread_categories`
--

INSERT INTO `thread_categories` (`id`, `title`, `description`, `created_at`, `updated_at`) VALUES
(3, 'Restoran', 'Restoran yang Berada di Jabodetabek', '2022-12-28 04:35:14', NULL),
(4, 'Hotel', 'Hotel yang Berada di Jabodetabek', '2023-01-01 13:41:21', NULL),
(5, 'Pantai', 'Pantai yang Berada di Jabodetabek', '2023-01-01 13:41:39', NULL),
(6, 'Taman Hiburan', 'Taman Hiburan yang Berada di Jabodetabek', '2023-01-01 13:42:38', NULL),
(7, 'Kebun Binatang', 'Kebun Binatang yang Berada di Jabodetabek', '2023-01-01 13:43:19', NULL),
(8, 'Waterpark', 'Waterpark yang Berada di Jabodetabek', '2023-01-01 14:09:17', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `thread_reacts`
--

CREATE TABLE `thread_reacts` (
  `id` int(11) NOT NULL,
  `thread_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `react` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `thread_replies`
--

CREATE TABLE `thread_replies` (
  `id` int(11) NOT NULL,
  `thread_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `is_publish` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `thread_replies`
--

INSERT INTO `thread_replies` (`id`, `thread_id`, `user_id`, `content`, `is_publish`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '<p>Wah, mantap batam</p>', 1, '2022-09-20 15:59:38', NULL),
(4, 1, 1, '<p>Mantap Boss</p>', NULL, '2022-10-02 14:25:17', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `thread_reply_reacts`
--

CREATE TABLE `thread_reply_reacts` (
  `id` int(11) NOT NULL,
  `thread_reply_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `react` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `thread_reply_reacts`
--

INSERT INTO `thread_reply_reacts` (`id`, `thread_reply_id`, `user_id`, `react`, `created_at`, `updated_at`) VALUES
(1, 4, 1, 0, NULL, NULL),
(6, 1, 1, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tour_by_budgets`
--

CREATE TABLE `tour_by_budgets` (
  `id` int(11) NOT NULL,
  `title` varchar(150) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `budget_min` int(11) DEFAULT NULL,
  `budget_max` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tour_by_budgets`
--

INSERT INTO `tour_by_budgets` (`id`, `title`, `description`, `budget_min`, `budget_max`, `created_at`, `updated_at`) VALUES
(1, 'Budget Murah', 'Budget untuk Penghemat', 0, 100000, '2022-11-22 10:02:46', NULL),
(2, 'Budget Sedang', 'Budget Sedang untuk Pengeluaran Sedang', 100000, 500000, '2022-12-28 04:37:11', NULL),
(3, 'Budget Besar', 'Budget Besar untuk Pengeluaran Besar', 500000, 1000000, '2022-12-28 04:37:49', NULL),
(4, 'Budget Premium', 'Budget Premium untuk Pengeluaran Lebih dari Rp. 1.000.000', 1000000, 10000000, '2022-12-28 04:39:26', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `photo` text DEFAULT NULL,
  `address` text DEFAULT NULL,
  `birth_place` varchar(50) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `role_id` tinyint(4) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `phone`, `photo`, `address`, `birth_place`, `birth_date`, `role_id`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Rizky Ridhoo', 'rizkyridho@gmail.com', '72a1859db4de52dde4a8ac36ffbf2755', '089912312312', 'no-image-icon-23485.png', 'Jln. Sehat', 'Sidoarjo', '1995-10-11', 1, NULL, '2022-09-25 04:57:43', NULL),
(2, 'Irma', 'bundairma@gmail.com', 'f03c2d847091384694718f35caa461f5', NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-09-25 06:56:01', NULL),
(3, 'Admin', 'admin@travelforum.id', '0192023a7bbd73250516f069df18b500', NULL, NULL, NULL, NULL, NULL, 2, NULL, '2022-10-09 08:30:15', NULL),
(4, 'Lucky Abdurrahman Saleh', 'luckyabdurahman@gmail.com', 'd2974daaa5c5cca70c863693f1ccdcfe', NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-12-23 11:22:25', NULL),
(5, 'Sheila', 'sheilanooraisyah@yahoo.com', '28b662d883b6d76fd96e4ddc5e9ba780', NULL, NULL, NULL, NULL, NULL, 1, NULL, '2023-01-02 09:03:57', NULL),
(7, 'Deputi ERC', 'zgutqa@cutradition.com', '4314878fd84b23af64524725a94b45bc', NULL, NULL, NULL, NULL, NULL, 1, NULL, '2023-01-02 09:12:55', NULL),
(8, 'fitri fenti', 'fitrifentip@gmail.com', '3b1636fdb3aea7a397412c33cf8845b4', NULL, NULL, NULL, NULL, NULL, 1, NULL, '2023-01-03 01:53:30', NULL),
(11, 'Yulianti', 'yulianti.yuli1607@gmail.com', '19d552d9b80d0cd84619661663b1dc42', NULL, NULL, NULL, NULL, NULL, 1, NULL, '2023-01-03 03:06:46', NULL),
(12, 'Aditya halimi', 'ultraz.as@gmail.com', '08253a87c10b5648da7de83da876690a', NULL, NULL, NULL, NULL, NULL, 1, NULL, '2023-01-03 03:09:35', NULL),
(13, 'Fahmi', 'fahmi22r@gmail.com', 'cea2bdf0c61b61e73b23b2563147487d', NULL, NULL, NULL, NULL, NULL, 1, NULL, '2023-01-03 03:12:10', NULL),
(15, 'Nurhasanah', 'nurhasanah@indonesiare.co.id', 'baef7d6b4973a386ee1413b06fe35b64', NULL, NULL, NULL, NULL, NULL, 1, NULL, '2023-01-03 03:21:20', NULL),
(17, 'Hendra Lesmana', 'hendra@indonesiare.co.id', '691359ee83188c68be973c9f8d9d0b0c', NULL, NULL, NULL, NULL, NULL, 1, NULL, '2023-01-03 03:22:07', NULL),
(18, 'Rosinta', 'yuniarrosinta13@gmail.com', 'c3e3aea34dea13e297cac17f2558bd76', NULL, NULL, NULL, NULL, NULL, 1, NULL, '2023-01-03 03:32:24', NULL),
(19, 'sekar', 'sekarcat9@gmail.com', '623e9f5f94bb7724faa180af5ca4e10d', NULL, NULL, NULL, NULL, NULL, 1, NULL, '2023-01-03 03:39:09', NULL),
(20, 'Tazkia Maulida Poetri', 'tazkiamisc@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, NULL, NULL, 1, NULL, '2023-01-03 03:53:09', NULL),
(22, 'Muhamad Arief', 'arfantojaya@gmail.com', 'b42c7b8b7f2860aa543bcf7bd040d40e', NULL, NULL, NULL, NULL, NULL, 1, NULL, '2023-01-03 03:58:46', NULL),
(24, 'mrkmdw', 'mkamadewa@gmail.com', '3438197d012936fd8c65135af4ca9a45', NULL, NULL, NULL, NULL, NULL, 1, NULL, '2023-01-03 04:16:35', NULL),
(25, 'Mbik', 'febryanipi@gmail.com', '6de04120f9acf00ae7337b0e195666b3', NULL, NULL, NULL, NULL, NULL, 1, NULL, '2023-01-03 05:05:09', NULL),
(26, 'Test', 'backupacc1254@gmail.com', 'bf0e6c10a221968a573dab85fc04533c', NULL, NULL, NULL, NULL, NULL, 1, NULL, '2023-01-03 14:15:26', NULL),
(27, 'Wahida Sabila', 'wahida.sabila@gmail.com', 'a8e74b061793f44a5fbfdab1bac15559', NULL, NULL, NULL, NULL, NULL, 1, NULL, '2023-01-03 14:26:52', NULL),
(28, 'UAB', 'albarri066@gmail.com', '3dbc7279b51a00bb0cb1aec35f249d30', NULL, NULL, NULL, NULL, NULL, 1, NULL, '2023-01-03 14:33:05', NULL),
(29, 'Dhea Adinda Nabilla Firdausy', 'cemilanmeruya92@gmail.com', '440cf283659357111abdc8c90b11b338', NULL, NULL, NULL, NULL, NULL, 1, NULL, '2023-01-03 14:38:36', NULL),
(30, 'Ina', 'inahinuh@gmail.com', '9d0edcdfa7c7d43a40ca363df9d02b79', NULL, NULL, NULL, NULL, NULL, 1, NULL, '2023-01-03 14:48:48', NULL),
(31, 'As', 'test@test.com', '827ccb0eea8a706c4c34a16891f84e7b', NULL, NULL, NULL, NULL, NULL, 1, NULL, '2023-01-18 06:20:48', NULL),
(40, 'budi', 'budi@gmail.com', '00dfc53ee86af02e742515cdcf075ed3', NULL, NULL, NULL, NULL, NULL, 1, NULL, '2023-03-14 06:18:23', NULL),
(43, 'Test', 't@t.com', '25d55ad283aa400af464c76d713c07ad', NULL, NULL, NULL, NULL, NULL, 1, NULL, '2023-03-16 09:36:40', NULL),
(44, 'Test', 'a@a.com', '25d55ad283aa400af464c76d713c07ad', NULL, NULL, NULL, NULL, NULL, 1, NULL, '2023-03-16 12:38:38', NULL),
(45, 'Euro', 'vztrezxhjdm@eurokool.com', '514fd49e51bd3e0b527bf8ce7bbac3af', '089911231123', 'Awesome-Profile-Pictures-for-Guys-look-away2.webp', 'Jln. Sehat', 'Surabaya', '1995-03-17', 1, NULL, '2023-03-17 08:39:30', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `budget_categories`
--
-- ALTER TABLE `budget_categories`
--   ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
-- ALTER TABLE `cities`
--   ADD PRIMARY KEY (`id`),
--   ADD KEY `FKcities335274` (`province_id`);

--
-- Indexes for table `guide_tours`
--
-- ALTER TABLE `guide_tours`
--   ADD PRIMARY KEY (`id`);

--
-- Indexes for table `provinces`
-- --
-- ALTER TABLE `provinces`
--   ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `threads`
--
ALTER TABLE `threads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `thread_categories`
--
ALTER TABLE `thread_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `thread_reacts`
--
ALTER TABLE `thread_reacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `thread_replies`
--
ALTER TABLE `thread_replies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `thread_reply_reacts`
--
ALTER TABLE `thread_reply_reacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tour_by_budgets`
--
ALTER TABLE `tour_by_budgets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `budget_categories`
-- --
-- ALTER TABLE `budget_categories`
--   MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cities`
--
-- ALTER TABLE `cities`
--   MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=476;

--
-- AUTO_INCREMENT for table `guide_tours`
--
-- ALTER TABLE `guide_tours`
--   MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `provinces`
-- 
-- ALTER TABLE `provinces`
--   MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `threads`
--
ALTER TABLE `threads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `thread_categories`
--
ALTER TABLE `thread_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `thread_reacts`
--
ALTER TABLE `thread_reacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `thread_replies`
--
ALTER TABLE `thread_replies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `thread_reply_reacts`
--
ALTER TABLE `thread_reply_reacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tour_by_budgets`
--
ALTER TABLE `tour_by_budgets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cities`
--
-- ALTER TABLE `cities`
--   ADD CONSTRAINT `FKcities335274` FOREIGN KEY (`province_id`) REFERENCES `provinces` (`id`);
-- COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
