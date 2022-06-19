-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : Dim 03 juil. 2022 à 03:35
-- Version du serveur :  8.0.21
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `ctas_prod`
--

-- --------------------------------------------------------

--
-- Structure de la table `activite`
--

DROP TABLE IF EXISTS `activite`;
CREATE TABLE IF NOT EXISTS `activite` (
  `code_act` int NOT NULL AUTO_INCREMENT,
  `intitule` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `id_volet` int NOT NULL,
  PRIMARY KEY (`code_act`),
  KEY `id_volet` (`id_volet`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `activite`
--

INSERT INTO `activite` (`code_act`, `intitule`, `description`, `id_volet`) VALUES
(1, 'RP', 'production de semence', 1),
(2, 'bloc', 'gestion de bloc', 2),
(3, 'PR', 'gestion des paysans relais', 2),
(4, 'BI', 'gestion de boutique Intrant', 3);

-- --------------------------------------------------------

--
-- Structure de la table `activ_critere`
--

DROP TABLE IF EXISTS `activ_critere`;
CREATE TABLE IF NOT EXISTS `activ_critere` (
  `code` int NOT NULL AUTO_INCREMENT,
  `id_activ` int NOT NULL,
  `id_critere` int NOT NULL,
  `unite` varchar(100) NOT NULL,
  PRIMARY KEY (`code`),
  KEY `id_critere` (`id_critere`),
  KEY `id_activ` (`id_activ`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `activ_variette`
--

DROP TABLE IF EXISTS `activ_variette`;
CREATE TABLE IF NOT EXISTS `activ_variette` (
  `code` int NOT NULL AUTO_INCREMENT,
  `id_activ` int NOT NULL,
  `id_variette` int NOT NULL,
  PRIMARY KEY (`code`),
  KEY `id_activ` (`id_activ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `animation_ve`
--

DROP TABLE IF EXISTS `animation_ve`;
CREATE TABLE IF NOT EXISTS `animation_ve` (
  `code` varchar(255) NOT NULL,
  `id_pr` varchar(255) NOT NULL,
  `id_fkt` varchar(255) DEFAULT NULL,
  `id_commune` varchar(255) DEFAULT NULL,
  `village` varchar(100) DEFAULT NULL,
  `date_anim` date NOT NULL,
  `nb_participant` int NOT NULL,
  `nb_h` int NOT NULL,
  `nb_f` int NOT NULL,
  `nb_inf_25` int NOT NULL,
  `type` varchar(100) NOT NULL DEFAULT 'animation',
  `img_piece` mediumtext,
  `img_group_particip` int DEFAULT NULL,
  `id_tech_recenseur` int DEFAULT NULL,
  `etat` varchar(100) NOT NULL DEFAULT 'valide',
  `status` varchar(100) NOT NULL DEFAULT 'active',
  PRIMARY KEY (`code`),
  KEY `id_pr` (`id_pr`),
  KEY `id_fkt` (`id_fkt`),
  KEY `id_commune` (`id_commune`),
  KEY `id_tech_recenseur` (`id_tech_recenseur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `animation_ve`
--

INSERT INTO `animation_ve` (`code`, `id_pr`, `id_fkt`, `id_commune`, `village`, `date_anim`, `nb_participant`, `nb_h`, `nb_f`, `nb_inf_25`, `type`, `img_piece`, `img_group_particip`, `id_tech_recenseur`, `etat`, `status`) VALUES
('AFS3-ANIM-1', 'PR-11AFS3-06', 'Fkt412', NULL, NULL, '2022-06-15', 15, 9, 6, 10, 'animation', NULL, NULL, 11, 'valide', 'active'),
('AFS3-VE-1', 'PR-11AFS3-01', NULL, 'C63', 'village-tsimandrira', '2022-06-13', 25, 16, 9, 0, 've', NULL, NULL, 11, 'valide', 'active');

-- --------------------------------------------------------

--
-- Structure de la table `animation_ve_specu`
--

DROP TABLE IF EXISTS `animation_ve_specu`;
CREATE TABLE IF NOT EXISTS `animation_ve_specu` (
  `code_specu` int NOT NULL AUTO_INCREMENT,
  `id_anime_ve` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_var` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_espece` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `quantite` int NOT NULL DEFAULT '5',
  `etat` varchar(100) NOT NULL DEFAULT 'valide',
  `status` varchar(100) NOT NULL DEFAULT 'active',
  PRIMARY KEY (`code_specu`),
  KEY `id_anime_ve` (`id_anime_ve`),
  KEY `id_espece` (`id_espece`),
  KEY `id_var` (`id_var`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `animation_ve_specu`
--

INSERT INTO `animation_ve_specu` (`code_specu`, `id_anime_ve`, `id_var`, `id_espece`, `quantite`, `etat`, `status`) VALUES
(3, 'AFS3-ANIM-1', 'VAR_10', NULL, 5, 'valide', 'active'),
(4, 'AFS3-ANIM-1', 'VAR_24', NULL, 4, 'valide', 'active'),
(5, 'AFS3-ANIM-1', NULL, 'ESP_37', 5, 'valide', 'active'),
(6, 'AFS3-VE-1', 'VAR_06', NULL, 5, 'valide', 'active'),
(7, 'AFS3-VE-1', NULL, 'ESP_37', 8, 'valide', 'active'),
(8, 'AFS3-VE-1', 'VAR_22', NULL, 5, 'valide', 'active');

-- --------------------------------------------------------

--
-- Structure de la table `association`
--

DROP TABLE IF EXISTS `association`;
CREATE TABLE IF NOT EXISTS `association` (
  `numero` int NOT NULL AUTO_INCREMENT,
  `code_ass` varchar(255) NOT NULL,
  `nom` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ancronyme` varchar(10) NOT NULL DEFAULT 'ASPPMS',
  `id_prjt` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_tech` int NOT NULL COMMENT 'technisiana mpiandraikitran'' i fikambanana',
  `id_fkt` varchar(100) NOT NULL COMMENT 'fokotany ijoroan''i fikambanana',
  `status` varchar(100) NOT NULL DEFAULT 'active',
  PRIMARY KEY (`code_ass`),
  UNIQUE KEY `numero` (`numero`) USING BTREE,
  KEY `id_prjt` (`id_prjt`),
  KEY `id_tech` (`id_tech`),
  KEY `id_fkt` (`id_fkt`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `association`
--

INSERT INTO `association` (`numero`, `code_ass`, `nom`, `ancronyme`, `id_prjt`, `id_tech`, `id_fkt`, `status`) VALUES
(1, 'ASS001', 'HERIMBATO', 'ASPMS', 'P02', 15, 'Fkt018', 'active'),
(2, 'ASS002', 'LAZAHOAHY', 'ASPMS', 'P02', 15, 'Fkt020', 'active'),
(3, 'ASS003', 'TSINJO AINA', 'ASPMS', 'P02', 15, 'Fkt001', 'active'),
(4, 'ASS004', 'ANDOVOBE BELALETSE', 'ASPMS', 'P02', 15, 'Fkt087', 'active'),
(5, 'ASS005', 'MAROMAINTE', 'ASPMS', 'P02', 15, 'Fkt112', 'active'),
(6, 'ASS006', 'BEROROHA', 'ASPMS', 'P02', 15, 'Fkt208', 'active'),
(7, 'ASS007', 'FIRAISANA II', 'ASPMS', 'P02', 15, 'Fkt209', 'active'),
(8, 'ASS008', 'HAFA TY TALOHA', 'ASPMS', 'P02', 15, 'Fkt209', 'active'),
(9, 'ASS009', 'TANANA TEHIVOATSE', 'ASPMS', 'P02', 15, 'Fkt492', 'active'),
(10, 'ASS010', 'ANKILIBEY MIAVOTSE', 'ASPMS', 'P02', 15, 'Fkt533', 'active'),
(11, 'ASS011', 'ANJEKY MORAFENO', 'ASPMS', 'P02', 15, 'Fkt532', 'active'),
(12, 'ASS012', 'BEANANTARA', 'ASPMS', 'P02', 15, 'Fkt533', 'active'),
(13, 'ASS013', 'AMBORY', 'ASPMS', 'P02', 15, 'Fkt240', 'active'),
(14, 'ASS014', 'SOATSIFA MANDROSO', 'ASPMS', 'P02', 15, 'Fkt354', 'active'),
(15, 'ASS015', 'MAHAVOKATSE', 'ASPMS', 'P02', 15, 'Fkt491', ''),
(16, 'ASS016', 'AMBORO', 'ASPMS', 'P02', 15, 'Fkt456', 'active'),
(17, 'ASS017', 'HALOMBORO I', 'ASPMS', 'P02', 15, 'Fkt473', 'active'),
(18, 'ASS018', 'MAROFOTY', 'ASPMS', 'P02', 15, 'Fkt454', 'active'),
(19, 'ASS019', 'GP ANTAFIANAMPELA', 'ASPMS', 'P02', 3, 'Fkt490', 'active'),
(20, 'ASS020', 'GP ANTSAHA', 'ASPMS', 'P02', 3, 'Fkt487', 'active'),
(21, 'ASS021', 'GP BEKOPIKY', 'ASPMS', 'P02', 3, 'Fkt488', 'active'),
(22, 'ASS022', 'MIARAMIAVOTSE', 'ASPMS', 'P02', 3, 'Fkt488', 'active'),
(23, 'ASS023', 'SOATIRY II', 'ASPMS', 'P02', 3, 'Fkt489', 'active'),
(24, 'ASS024', 'GP BELINDO', 'ASPMS', 'P02', 3, 'Fkt519', 'active'),
(25, 'ASS025', 'MAMIRATRA', 'ASPMS', 'P02', 3, 'Fkt515', 'active'),
(26, 'ASS026', 'SAFIDY', 'ASPMS', 'P02', 3, 'Fkt515', 'active'),
(27, 'ASS027', 'GP ANAVIAVY', 'ASPMS', 'P02', 3, 'Fkt517', 'active'),
(28, 'ASS028', 'GP ANIVORANO', 'ASPMS', 'P02', 3, 'Fkt518', 'active'),
(29, 'ASS029', 'GP TSILANY BAS', 'ASPMS', 'P02', 3, 'Fkt516', 'active'),
(30, 'ASS030', 'MANDROSO', 'ASPMS', 'P02', 4, 'Fkt072', 'active'),
(31, 'ASS031', 'TARATRY NY AINA', 'ASPMS', 'P02', 4, 'Fkt033', 'active'),
(32, 'ASS032', 'MITSINJO VALIMBAVAKA', 'ASPMS', 'P02', 4, 'Fkt457', 'active'),
(33, 'ASS033', 'RONONOVELO AVIAVY', 'ASPMS', 'P02', 4, 'Fkt241', 'active'),
(34, 'ASS034', 'SOAFIAVY', 'ASPMS', 'P02', 4, 'Fkt242', 'active'),
(35, 'ASS035', 'SOATIRY', 'ASPMS', 'P02', 4, 'Fkt086', 'active'),
(36, 'ASS036', 'FMMDA', 'ASPMS', 'P02', 12, 'Fkt356', 'active'),
(37, 'ASS037', 'FMDSM', 'ASPMS', 'P02', 12, 'Fkt279', 'active'),
(38, 'ASS038', 'AMBAROMIRAY', 'ASPMS', 'P02', 12, 'Fkt355', 'active'),
(39, 'ASS039', 'EZAKA', 'ASPMS', 'P02', 12, 'Fkt534', 'active'),
(40, 'ASS040', 'TANO AMIN\'NY FIARAHANTSIKA', 'ASPMS', 'P02', 12, 'Fkt531', 'active'),
(41, 'ASS041', 'FMDB', 'ASPMS', 'P02', 12, 'Fkt530', 'active'),
(42, 'ASS042', 'TSIRIRY', 'ASPMS', 'P02', 12, 'Fkt527', 'active'),
(43, 'ASS043', 'TAHIRISOA', 'ASPMS', 'P02', 12, 'Fkt528', 'active'),
(44, 'ASS044', 'TSILANIHERY', 'ASPMS', 'P02', 12, 'Fkt529', 'active'),
(45, 'ASS045', 'MIRAILAHATSE', 'ASPMS', 'P02', 12, 'Fkt526', 'active'),
(46, 'ASS046', 'SOASAOTSY', 'ASPMS', 'P02', 12, 'Fkt524', 'active'),
(47, 'ASS047', 'MANAMBARO', 'ASPMS', 'P02', 12, 'Fkt525', 'active'),
(48, 'ASS048', 'VEHIVAVY MENDRIKA', 'ASPMS', 'P02', 12, 'Fkt521', 'active'),
(49, 'ASS049', 'TSOPOTY', 'ASPMS', 'P02', 12, 'Fkt523', 'active'),
(50, 'ASS050', 'VORIRIKE', 'ASPMS', 'P02', 12, 'Fkt520', 'active'),
(51, 'ASS051', 'MILAVONJY', 'ASPMS', 'P02', 12, 'Fkt522', 'active'),
(52, 'ASS052', 'Avotra', 'AVT', 'P03', 11, 'Fkt504', 'active'),
(53, 'ASS053', 'Finondranon\'akoho', 'FINK', 'P03', 11, 'Fkt505', 'active'),
(54, 'ASS054', 'Zaihagnavotse', 'ZAIH', 'P03', 8, 'Fkt499', 'active'),
(55, 'ASS055', 'Tanjompandrosoana', 'TANP', 'P03', 8, 'Fkt493', 'active');

-- --------------------------------------------------------

--
-- Structure de la table `assoc_parce`
--

DROP TABLE IF EXISTS `assoc_parce`;
CREATE TABLE IF NOT EXISTS `assoc_parce` (
  `code_parce` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_assoc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_benef` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ref_gps` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `lat` double DEFAULT NULL,
  `log` double DEFAULT NULL,
  `superficie` int DEFAULT NULL,
  `id_fkt` varchar(255) NOT NULL,
  `anne_adheran` year DEFAULT NULL,
  `status` varchar(100) NOT NULL DEFAULT 'active',
  PRIMARY KEY (`code_parce`),
  KEY `id_bloc` (`id_assoc`),
  KEY `id_benef` (`id_benef`),
  KEY `id_fkt` (`id_fkt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `assoc_parce`
--

INSERT INTO `assoc_parce` (`code_parce`, `id_assoc`, `id_benef`, `ref_gps`, `lat`, `log`, `superficie`, `id_fkt`, `anne_adheran`, `status`) VALUES
('53FINK-01', 'ASS053', 'B-089', NULL, -25, 45, 5421, 'Fkt505', NULL, 'active'),
('53FINK-02', 'ASS053', 'B-090', NULL, -25, 45, 7286, 'Fkt505', NULL, 'active'),
('53FINK-03', 'ASS053', 'B-091', NULL, -25, 45, 5771, 'Fkt505', NULL, 'active'),
('53FINK-04', 'ASS053', 'B-092', NULL, -25, 45, 1582, 'Fkt505', NULL, 'active'),
('53FINK-05', 'ASS053', 'B-093', NULL, -25, 45, 4418, 'Fkt505', NULL, 'active'),
('53FINK-06', 'ASS053', 'B-095', NULL, -25, 45, 6676, 'Fkt505', NULL, 'active'),
('53FINK-07', 'ASS053', 'B-096', NULL, -25, 45, 5399, 'Fkt505', NULL, 'active'),
('53FINK-08', 'ASS053', 'B-094', NULL, -25, 45, 6123, 'Fkt505', NULL, 'active'),
('54ZAIH-01', 'ASS054', 'B-115', NULL, -25, 45, 3167, 'Fkt499', NULL, 'active'),
('54ZAIH-02', 'ASS054', 'B-116', NULL, -25, 45, 6782, 'Fkt499', NULL, 'active'),
('54ZAIH-03', 'ASS054', 'B-119', NULL, -25, 45, 4262, 'Fkt499', NULL, 'active'),
('54ZAIH-04', 'ASS054', 'B-120', NULL, -25, 45, 3100, 'Fkt499', NULL, 'active'),
('54ZAIH-05', 'ASS054', 'B-120', NULL, -25, 45, 21500, 'Fkt499', NULL, 'active'),
('54ZAIH-06', 'ASS054', 'B-122', NULL, -25, 45, 8706, 'Fkt499', NULL, 'active'),
('54ZAIH-07', 'ASS054', 'B-123', NULL, -25, 45, 2500, 'Fkt499', NULL, 'active'),
('54ZAIH-08', 'ASS054', 'B-124', NULL, -25, 45, 4487, 'Fkt499', NULL, 'active'),
('54ZAIH-09', 'ASS054', 'B-125', NULL, -25, 45, 5146, 'Fkt499', NULL, 'active'),
('54ZAIH-10', 'ASS054', 'B-126', NULL, -25, 45, 4183, 'Fkt499', NULL, 'active'),
('54ZAIH-11', 'ASS054', 'B-127', NULL, -25, 45, 4262, 'Fkt499', NULL, 'active'),
('54ZAIH-12', 'ASS054', 'B-128', NULL, -25, 45, 6171, 'Fkt499', NULL, 'active'),
('54ZAIH-13', 'ASS054', 'B-129', NULL, -25, 45, 4370, 'Fkt499', NULL, 'active'),
('54ZAIH-14', 'ASS054', 'B-130', NULL, -25, 45, 4325, 'Fkt499', NULL, 'active'),
('54ZAIH-15', 'ASS054', 'B-131', NULL, -25, 45, 14620, 'Fkt499', NULL, 'active'),
('54ZAIH-16', 'ASS054', 'B-132', NULL, -25, 45, 8032, 'Fkt499', NULL, 'active'),
('54ZAIH-17', 'ASS054', 'B-132', NULL, -25, 45, 4529, 'Fkt499', NULL, 'active'),
('54ZAIH-18', 'ASS054', 'B-132', NULL, -25, 45, 5956, 'Fkt499', NULL, 'active'),
('54ZAIH-19', 'ASS054', 'B-132', NULL, -25, 45, 5115, 'Fkt499', NULL, 'active'),
('PRC601', 'ASS052', 'B-062', NULL, -25, 45, 12500, 'Fkt504', NULL, 'active'),
('PRC602', 'ASS052', 'B-063', NULL, -25, 45, 7400, 'Fkt504', NULL, 'active'),
('PRC603', 'ASS052', 'B-064', NULL, -25, 45, 20790, 'Fkt504', NULL, 'active'),
('PRC604', 'ASS052', 'B-065', NULL, -25, 45, 1500, 'Fkt504', NULL, 'active'),
('PRC605', 'ASS052', 'B-066', NULL, -25, 45, 8500, 'Fkt504', NULL, 'active'),
('PRC606', 'ASS052', 'B-067', NULL, -25, 45, 1500, 'Fkt504', NULL, 'active'),
('PRC607', 'ASS052', 'B-068', NULL, -25, 45, 14000, 'Fkt504', NULL, 'active'),
('PRC608', 'ASS052', 'B-069', NULL, -25, 45, 4800, 'Fkt504', NULL, 'active'),
('PRC609', 'ASS052', 'B-070', NULL, -25, 45, 4000, 'Fkt504', NULL, 'active'),
('PRC610', 'ASS052', 'B-080', NULL, -25, 45, 7000, 'Fkt504', NULL, 'active'),
('PRC611', 'ASS052', 'B-081', NULL, -25, 45, 1400, 'Fkt504', NULL, 'active'),
('PRC612', 'ASS052', 'B-136', NULL, -25, 45, 11000, 'Fkt504', NULL, 'active'),
('PRC613', 'ASS052', 'B-082', NULL, -25, 45, 3500, 'Fkt504', NULL, 'active'),
('PRC614', 'ASS052', 'B-083', NULL, -25, 45, 3000, 'Fkt504', NULL, 'active'),
('PRC615', 'ASS052', 'B-084', NULL, -25, 45, 4600, 'Fkt504', NULL, 'active'),
('PRC616', 'ASS052', 'B-085', NULL, -25, 45, 24000, 'Fkt504', NULL, 'active'),
('PRC617', 'ASS052', 'B-086', NULL, -25, 45, 14000, 'Fkt504', NULL, 'active'),
('PRC618', 'ASS052', 'B-087', NULL, -25, 45, 8000, 'Fkt504', NULL, 'active'),
('PRC619', 'ASS052', 'B-088', NULL, -25, 45, 1600, 'Fkt504', NULL, 'active');

-- --------------------------------------------------------

--
-- Structure de la table `beneficiaire`
--

DROP TABLE IF EXISTS `beneficiaire`;
CREATE TABLE IF NOT EXISTS `beneficiaire` (
  `code_benef` varchar(50) NOT NULL,
  `img_benef` blob,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) DEFAULT NULL,
  `sexe` varchar(100) NOT NULL,
  `dt_nais` date DEFAULT NULL,
  `dt_nais_vers` varchar(100) DEFAULT NULL,
  `surnom` varchar(50) DEFAULT NULL,
  `cin` bigint DEFAULT NULL,
  `dt_delivrance` date DEFAULT NULL,
  `lieu_delivrance` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `img_cin` blob,
  `contact` int DEFAULT NULL,
  `id_fkt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'adresse bénéficiaire',
  `id_commune` varchar(255) DEFAULT NULL COMMENT 'autres village',
  `village` varchar(100) DEFAULT NULL,
  `dt_Insert` date DEFAULT NULL,
  `etat` varchar(100) DEFAULT 'valide',
  `statut` varchar(100) NOT NULL DEFAULT 'active',
  PRIMARY KEY (`code_benef`),
  KEY `id_fkt` (`id_fkt`),
  KEY `id_commune` (`id_commune`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `beneficiaire`
--

INSERT INTO `beneficiaire` (`code_benef`, `img_benef`, `nom`, `prenom`, `sexe`, `dt_nais`, `dt_nais_vers`, `surnom`, `cin`, `dt_delivrance`, `lieu_delivrance`, `img_cin`, `contact`, `id_fkt`, `id_commune`, `village`, `dt_Insert`, `etat`, `statut`) VALUES
('B-001', NULL, 'Barijaona', NULL, 'H', NULL, '1985', NULL, 514, '2002-02-15', NULL, NULL, NULL, 'Fkt506', NULL, NULL, NULL, 'valide', 'active'),
('B-002', NULL, 'Bekobo', NULL, 'H', '1987-03-16', NULL, NULL, 514, '1999-11-18', 'Toliara', NULL, NULL, 'Fkt506', NULL, NULL, NULL, 'valide', 'active'),
('B-003', NULL, 'Belaza', NULL, 'H', NULL, NULL, NULL, 514, NULL, NULL, NULL, NULL, 'Fkt506', NULL, NULL, NULL, 'valide', 'active'),
('B-004', NULL, 'Borinae', NULL, 'H', NULL, NULL, NULL, 920, '2004-07-05', 'Toliara', NULL, NULL, 'Fkt506', NULL, NULL, NULL, 'valide', 'active'),
('B-005', NULL, 'Fagnitara', NULL, 'H', NULL, NULL, NULL, 516, '1964-04-11', 'Tsihombe', NULL, NULL, 'Fkt506', NULL, NULL, NULL, 'valide', 'active'),
('B-006', NULL, 'Fahafeno', NULL, 'H', NULL, NULL, NULL, 514, '2019-08-08', 'Tsihombe', NULL, NULL, 'Fkt506', NULL, NULL, NULL, 'valide', 'active'),
('B-007', NULL, 'Fiarena', NULL, 'H', NULL, NULL, NULL, 514, '2010-07-28', 'Tsihombe', NULL, NULL, 'Fkt506', NULL, NULL, NULL, 'valide', 'active'),
('B-008', NULL, 'Foterae', NULL, 'F', NULL, NULL, NULL, 504, '1974-11-13', 'Ambanikily', NULL, NULL, 'Fkt506', NULL, NULL, NULL, 'valide', 'active'),
('B-009', NULL, 'Gisomana', 'Manjovala', 'H', NULL, NULL, NULL, 520, '1994-08-28', 'Tsihombe', NULL, NULL, 'Fkt506', NULL, NULL, NULL, 'valide', 'active'),
('B-010', NULL, 'Harenasoa', NULL, 'F', NULL, NULL, NULL, 514, '2016-05-20', 'Tsihombe', NULL, NULL, 'Fkt506', NULL, NULL, NULL, 'valide', 'active'),
('B-011', NULL, 'Jean Noel', NULL, 'H', NULL, NULL, NULL, 501, '2000-11-27', 'Toliara', NULL, NULL, 'Fkt506', NULL, NULL, NULL, 'valide', 'active'),
('B-012', NULL, 'Katity', NULL, 'H', NULL, NULL, NULL, 501, '1994-09-10', 'Betania Toliara', NULL, NULL, 'Fkt506', NULL, NULL, NULL, 'valide', 'active'),
('B-013', NULL, 'Kidihae', NULL, 'F', NULL, NULL, NULL, 514, '2007-07-15', 'Tsihombe', NULL, NULL, 'Fkt506', NULL, NULL, NULL, 'valide', 'active'),
('B-014', NULL, 'Kinasy', NULL, 'F', NULL, NULL, NULL, 504, '1978-11-30', NULL, NULL, NULL, 'Fkt506', NULL, NULL, NULL, 'valide', 'active'),
('B-015', NULL, 'Lianarahee', NULL, 'F', NULL, NULL, NULL, 514, '2010-07-20', 'Tsihombe', NULL, NULL, 'Fkt506', NULL, NULL, NULL, 'valide', 'active'),
('B-016', NULL, 'Gida', NULL, 'F', NULL, '1970', NULL, 514, '1997-10-13', 'Tsihombe', NULL, NULL, 'Fkt512', NULL, NULL, NULL, 'valide', 'active'),
('B-017', NULL, 'Masignarivo', NULL, 'F', '1966-06-28', NULL, NULL, 520, '2007-04-10', 'Tsihombe', NULL, NULL, 'Fkt512', NULL, NULL, NULL, 'valide', 'active'),
('B-018', NULL, 'Ranoletie', NULL, 'F', NULL, NULL, NULL, 514, '1988-12-05', 'Tsihombe', NULL, NULL, 'Fkt512', NULL, NULL, NULL, 'valide', 'active'),
('B-019', NULL, 'Refomeie', NULL, 'F', NULL, NULL, NULL, 514, NULL, NULL, NULL, NULL, 'Fkt512', NULL, NULL, NULL, 'valide', 'active'),
('B-020', NULL, 'Sambeaze', 'Solomay', 'H', NULL, NULL, NULL, 514, '1981-04-17', 'Tsihombe', NULL, NULL, 'Fkt512', NULL, NULL, NULL, 'valide', 'active'),
('B-021', NULL, 'Soalia', NULL, 'H', NULL, NULL, NULL, 514, '1998-02-05', 'Tsihombe', NULL, NULL, 'Fkt512', NULL, NULL, NULL, 'valide', 'active'),
('B-022', NULL, 'Tsimandeha', NULL, 'H', NULL, NULL, NULL, 514, '1988-10-14', 'Tsihombe', NULL, NULL, 'Fkt512', NULL, NULL, NULL, 'valide', 'active'),
('B-023', NULL, 'Vaolilie', NULL, 'F', NULL, NULL, NULL, 514, '1989-01-20', 'Tsihombe', NULL, NULL, 'Fkt512', NULL, NULL, NULL, 'valide', 'active'),
('B-024', NULL, 'Vognesoa', 'Manirisoa', 'F', NULL, NULL, NULL, 514, '2010-04-16', 'Tsihombe', NULL, NULL, 'Fkt512', NULL, NULL, NULL, 'valide', 'active'),
('B-025', NULL, 'Fidina', 'Albert', 'H', NULL, NULL, NULL, 401, '1970-04-29', 'Majunga', NULL, NULL, 'Fkt511', NULL, NULL, NULL, 'valide', 'active'),
('B-026', NULL, 'Tsivahiny', NULL, 'H', NULL, NULL, NULL, 514, NULL, NULL, NULL, NULL, 'Fkt511', NULL, NULL, NULL, 'valide', 'active'),
('B-027', NULL, 'BOSEHA', 'ZEFANIA', 'H', NULL, NULL, NULL, 516, '1967-04-30', 'Ambovombe', NULL, NULL, 'Fkt494', NULL, NULL, NULL, 'valide', 'active'),
('B-028', NULL, 'Fitahianjanahary', NULL, 'H', NULL, NULL, NULL, 514, '2003-03-03', 'Tsihombe', NULL, NULL, 'Fkt494', NULL, NULL, NULL, 'valide', 'active'),
('B-029', NULL, 'HOATSE', 'GERVAIS', 'H', NULL, NULL, NULL, 404, '1963-01-15', 'Maevatanana', NULL, NULL, 'Fkt494', NULL, NULL, NULL, 'valide', 'active'),
('B-030', NULL, 'Kintana', NULL, 'F', NULL, NULL, NULL, 514, '2020-09-11', 'Tsihombe', NULL, NULL, 'Fkt494', NULL, NULL, NULL, 'valide', 'active'),
('B-031', NULL, 'Mamantakevitra', NULL, 'H', NULL, NULL, NULL, 514, '2013-05-27', 'Tsihombe', NULL, NULL, 'Fkt494', NULL, NULL, NULL, 'valide', 'active'),
('B-032', NULL, 'Manankavana', NULL, 'H', NULL, NULL, NULL, 514, '1997-09-04', 'Tsihombe', NULL, NULL, 'Fkt494', NULL, NULL, NULL, 'valide', 'active'),
('B-033', NULL, 'MANDIGNISOA', 'GERVAIS', 'H', NULL, NULL, NULL, 514, '2010-01-27', 'Tsihombe', NULL, NULL, 'Fkt494', NULL, NULL, NULL, 'valide', 'active'),
('B-034', NULL, 'NARCIS', NULL, 'H', NULL, NULL, NULL, 519, '2008-05-10', 'Amboasary', NULL, NULL, 'Fkt494', NULL, NULL, NULL, 'valide', 'active'),
('B-035', NULL, 'Masoandroniaina', NULL, 'H', NULL, NULL, NULL, 514, '2019-02-14', 'Tsihombe', NULL, NULL, 'Fkt494', NULL, NULL, NULL, 'valide', 'active'),
('B-036', NULL, 'Ratovonjanahary', NULL, 'H', NULL, NULL, NULL, 514, '2016-01-27', 'Tsihombe', NULL, NULL, 'Fkt494', NULL, NULL, NULL, 'valide', 'active'),
('B-037', NULL, 'Andriamandahatse', NULL, 'H', NULL, NULL, NULL, 501, '2013-04-03', 'Toliara', NULL, NULL, 'Fkt499', NULL, NULL, NULL, 'valide', 'active'),
('B-038', NULL, 'Andriamarija', NULL, 'H', NULL, NULL, NULL, 514, '1999-03-17', 'Tsihombe', NULL, NULL, 'Fkt499', NULL, NULL, NULL, 'valide', 'active'),
('B-039', NULL, 'AVISOA EDMOND', NULL, 'H', NULL, NULL, NULL, 514, '1980-07-08', 'Tsihombe', NULL, NULL, 'Fkt499', NULL, NULL, NULL, 'valide', 'active'),
('B-040', NULL, 'DOLARIMINY', NULL, 'F', NULL, NULL, NULL, 514, '2016-07-27', 'Imongy', NULL, NULL, 'Fkt499', NULL, NULL, NULL, 'valide', 'active'),
('B-041', NULL, 'Fianinantsoa', NULL, 'F', NULL, NULL, NULL, 514, '2007-04-25', 'Tsihombe', NULL, NULL, 'Fkt499', NULL, NULL, NULL, 'valide', 'active'),
('B-042', NULL, 'Filaza', NULL, 'H', NULL, NULL, NULL, 514, '2003-07-03', 'Tsihombe', NULL, NULL, 'Fkt499', NULL, NULL, NULL, 'valide', 'active'),
('B-043', NULL, 'FIRARIANTSOA Estella', NULL, 'F', NULL, NULL, NULL, 514, '2010-05-07', 'Tsihombe', NULL, NULL, 'Fkt499', NULL, NULL, NULL, 'valide', 'active'),
('B-044', NULL, 'Fitahia', NULL, 'H', NULL, NULL, NULL, 514, '2002-12-04', 'Tsihombe', NULL, NULL, 'Fkt499', NULL, NULL, NULL, 'valide', 'active'),
('B-045', NULL, 'Fitasoa Paulette', NULL, 'F', NULL, NULL, NULL, 514, '1999-06-30', 'Tsihombe', NULL, NULL, 'Fkt499', NULL, NULL, NULL, 'valide', 'active'),
('B-046', NULL, 'Heremeie', NULL, 'F', NULL, NULL, NULL, 514, '2004-04-13', 'Tsihombe', NULL, NULL, 'Fkt499', NULL, NULL, NULL, 'valide', 'active'),
('B-047', NULL, 'JOLLY HAJA', NULL, 'H', NULL, NULL, NULL, 514, '2019-02-15', 'Tsihombe', NULL, NULL, 'Fkt499', NULL, NULL, NULL, 'valide', 'active'),
('B-048', NULL, 'MAHATSALOKY ELIE JEAN', NULL, 'H', NULL, NULL, NULL, 516, '1963-03-09', 'Ambovombe', NULL, NULL, 'Fkt499', NULL, NULL, NULL, 'valide', 'active'),
('B-049', NULL, 'Mahatovory', NULL, 'H', NULL, NULL, NULL, 519, '2018-01-19', 'Amboasary', NULL, NULL, 'Fkt499', NULL, NULL, NULL, 'valide', 'active'),
('B-050', NULL, 'LINAZETY DIMASIE', NULL, 'F', NULL, NULL, NULL, 514, '2003-07-08', 'Tsihombe', NULL, NULL, 'Fkt499', NULL, NULL, NULL, 'valide', 'active'),
('B-051', NULL, 'MANANTO', NULL, 'H', NULL, NULL, NULL, 401, '1997-08-13', 'Mahajanga', NULL, NULL, 'Fkt499', NULL, NULL, NULL, 'valide', 'active'),
('B-052', NULL, 'Mbehoavy Jean Paul', NULL, 'H', NULL, NULL, NULL, 514, '2021-10-14', 'Tsihombe', NULL, NULL, 'Fkt502', NULL, NULL, NULL, 'valide', 'active'),
('B-053', NULL, 'Miandrisoa Gilbert', NULL, 'H', NULL, NULL, NULL, 514, '2015-10-30', 'Marovoay', NULL, NULL, 'Fkt502', NULL, NULL, NULL, 'valide', 'active'),
('B-054', NULL, 'Miatsebala', NULL, 'H', NULL, NULL, NULL, 514, '1988-08-02', 'Tsihombe', NULL, NULL, 'Fkt502', NULL, NULL, NULL, 'valide', 'active'),
('B-055', NULL, 'MOSA Jean', NULL, 'H', NULL, NULL, NULL, 514, '1994-03-09', 'Tsihombe', NULL, NULL, 'Fkt502', NULL, NULL, NULL, 'valide', 'active'),
('B-056', NULL, 'RAZANADIMBY', NULL, 'F', NULL, NULL, NULL, 514, NULL, NULL, NULL, NULL, 'Fkt502', NULL, NULL, NULL, 'valide', 'active'),
('B-057', NULL, 'SAILAMBO Soaniazoe', NULL, 'F', NULL, NULL, NULL, 514, '2010-10-02', 'Tsihombe', NULL, NULL, 'Fkt502', NULL, NULL, NULL, 'valide', 'active'),
('B-058', NULL, 'SAOAMIHARY Odon', NULL, 'H', NULL, NULL, NULL, 514, NULL, NULL, NULL, NULL, 'Fkt502', NULL, NULL, NULL, 'valide', 'active'),
('B-059', NULL, 'TOLIASIE', NULL, 'F', NULL, NULL, NULL, 514, '2013-08-16', 'Tsihombe', NULL, 324718050, 'Fkt502', NULL, NULL, NULL, 'valide', 'active'),
('B-060', NULL, 'TOLIMAEVA', NULL, 'F', NULL, NULL, NULL, 514, '1997-10-15', 'Tsihombe', NULL, NULL, 'Fkt502', NULL, NULL, NULL, 'valide', 'active'),
('B-061', NULL, 'TOLISOAE', NULL, 'F', NULL, NULL, NULL, 514, '2016-02-11', 'Tsihombe', NULL, NULL, 'Fkt502', NULL, NULL, NULL, 'valide', 'active'),
('B-062', NULL, 'SOANDRO André', NULL, 'H', NULL, NULL, NULL, 510, '1978-08-16', 'Belotsiribihina', NULL, NULL, 'Fkt503', NULL, NULL, NULL, 'valide', 'active'),
('B-063', NULL, 'Alphonse', NULL, 'H', NULL, NULL, NULL, 510, '1978-08-19', 'Belotsiribihina', NULL, NULL, 'Fkt503', NULL, NULL, NULL, 'valide', 'active'),
('B-064', NULL, 'Bolee', NULL, 'F', NULL, NULL, NULL, 514, '1992-07-31', 'Tsihombe', NULL, NULL, 'Fkt503', NULL, NULL, NULL, 'valide', 'active'),
('B-065', NULL, 'Soalaza', NULL, 'H', NULL, NULL, NULL, 501, '1997-05-10', 'Toliara', NULL, NULL, 'Fkt503', NULL, NULL, NULL, 'valide', 'active'),
('B-066', NULL, 'Mananasy', NULL, 'H', NULL, NULL, NULL, 514, '1988-09-19', 'Tsihombe', NULL, NULL, 'Fkt503', NULL, NULL, NULL, 'valide', 'active'),
('B-067', NULL, 'Toliandro', NULL, 'H', NULL, NULL, NULL, 415, '2000-02-20', 'Mahajanga I', NULL, NULL, 'Fkt503', NULL, NULL, NULL, 'valide', 'active'),
('B-068', NULL, 'Iasmine', NULL, 'F', NULL, NULL, NULL, 514, '2008-08-01', 'Tsihombe', NULL, NULL, 'Fkt503', NULL, NULL, NULL, 'valide', 'active'),
('B-069', NULL, 'Fagnahisoa G.', NULL, 'F', NULL, NULL, NULL, 514, '2021-09-02', 'Tsihombe', NULL, NULL, 'Fkt503', NULL, NULL, NULL, 'valide', 'active'),
('B-070', NULL, 'Davelo', NULL, 'H', NULL, NULL, NULL, 514, '2013-08-08', 'Tsihombe', NULL, NULL, 'Fkt503', NULL, NULL, NULL, 'valide', 'active'),
('B-080', NULL, 'Kiviloe', NULL, 'F', NULL, NULL, NULL, 514, '1988-09-16', 'Tsihombe', NULL, NULL, 'Fkt503', NULL, NULL, NULL, 'valide', 'active'),
('B-081', NULL, 'Valesoa Jullette', NULL, 'F', NULL, NULL, NULL, 514, '2005-01-21', 'Tsihombe', NULL, NULL, 'Fkt503', NULL, NULL, NULL, 'valide', 'active'),
('B-082', NULL, 'Zoroteny', NULL, 'F', NULL, NULL, NULL, 514, '1988-10-07', 'Tsihombe', NULL, NULL, 'Fkt503', NULL, NULL, NULL, 'valide', 'active'),
('B-083', NULL, 'Vahinisoa Tsimijaly', NULL, 'F', NULL, NULL, NULL, 514, '2003-07-21', 'Tsihombe', NULL, NULL, 'Fkt503', NULL, NULL, NULL, 'valide', 'active'),
('B-084', NULL, 'Toedraza', NULL, 'H', NULL, NULL, NULL, 514, '2011-12-02', 'THB', NULL, NULL, 'Fkt503', NULL, NULL, NULL, 'valide', 'active'),
('B-085', NULL, 'Marthine', NULL, 'F', NULL, NULL, NULL, 501, '1990-04-26', 'Toliara', NULL, NULL, 'Fkt503', NULL, NULL, NULL, 'valide', 'active'),
('B-086', NULL, 'Lastiny', NULL, 'F', NULL, NULL, NULL, 514, '1988-06-11', 'Tsihombe', NULL, NULL, 'Fkt503', NULL, NULL, NULL, 'valide', 'active'),
('B-087', NULL, 'Valesoa Pauline', NULL, 'F', NULL, NULL, NULL, 501, '1991-08-28', 'Toliara', NULL, NULL, 'Fkt503', NULL, NULL, NULL, 'valide', 'active'),
('B-088', NULL, 'Falalantsoa Ellah', NULL, 'H', NULL, NULL, NULL, 514, '2011-07-20', 'Tsihombe', NULL, NULL, 'Fkt503', NULL, NULL, NULL, 'valide', 'active'),
('B-089', NULL, 'Davidine Elyse', NULL, 'F', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Fkt505', NULL, NULL, NULL, 'valide', 'active'),
('B-090', NULL, 'Vilisoa', NULL, 'H', NULL, NULL, NULL, 514, '2001-01-17', 'Tsihombe', NULL, NULL, 'Fkt505', NULL, NULL, NULL, 'valide', 'active'),
('B-091', NULL, 'Volatolie', NULL, 'F', NULL, NULL, NULL, 514, '2020-05-25', 'Tsihombe', NULL, NULL, 'Fkt505', NULL, NULL, NULL, 'valide', 'active'),
('B-092', NULL, 'Soaraza Jeanine', NULL, 'F', NULL, NULL, NULL, 514, '2014-07-08', 'Tsihombe', NULL, NULL, 'Fkt505', NULL, NULL, NULL, 'valide', 'active'),
('B-093', NULL, 'Sorognavy', NULL, 'H', NULL, NULL, NULL, 514, '2021-10-18', 'Tsihombe', NULL, NULL, 'Fkt505', NULL, NULL, NULL, 'valide', 'active'),
('B-094', NULL, 'Volase', NULL, 'F', NULL, NULL, NULL, 514, '1988-06-10', 'Tsihombe', NULL, NULL, 'Fkt505', NULL, NULL, NULL, 'valide', 'active'),
('B-095', NULL, 'Hoazee', NULL, 'F', NULL, NULL, NULL, 514, '2021-04-29', 'Tsihombe', NULL, NULL, 'Fkt505', NULL, NULL, NULL, 'valide', 'active'),
('B-096', NULL, 'Lakamaree', NULL, 'F', NULL, NULL, NULL, 514, '1988-12-19', 'Tsihombe', NULL, NULL, 'Fkt505', NULL, NULL, NULL, 'valide', 'active'),
('B-097', NULL, 'BENOIT', NULL, 'H', NULL, NULL, NULL, 514, '1975-02-26', 'Tsihombe', NULL, NULL, 'Fkt493', NULL, NULL, NULL, 'valide', 'active'),
('B-098', NULL, 'HABILANDRO', 'Modeste', 'H', NULL, NULL, NULL, 514, '2010-10-08', 'Tsihombe', NULL, NULL, 'Fkt493', NULL, NULL, NULL, 'valide', 'active'),
('B-099', NULL, 'KITROANAFY', NULL, 'H', NULL, NULL, NULL, 514, '1983-09-29', 'Tsihombe', NULL, NULL, 'Fkt493', NULL, NULL, NULL, 'valide', 'active'),
('B-100', NULL, 'LAMBO', 'Miarentsoa', 'H', NULL, NULL, NULL, 514, '1988-06-01', 'Tsihombe', NULL, NULL, 'Fkt493', NULL, NULL, NULL, 'valide', 'active'),
('B-101', NULL, 'MAHATSADRAZA', NULL, 'H', NULL, NULL, NULL, 514, '1989-10-04', 'Tsihombe', NULL, NULL, 'Fkt493', NULL, NULL, NULL, 'valide', 'active'),
('B-102', NULL, 'MAHAVISOA', 'Zeffania', 'H', NULL, NULL, NULL, 514, '2011-11-27', 'Tsihombe', NULL, NULL, 'Fkt493', NULL, NULL, NULL, 'valide', 'active'),
('B-103', NULL, 'MANANAZY', NULL, 'H', NULL, NULL, NULL, 514, '1979-08-18', 'Tsihombe', NULL, NULL, 'Fkt493', NULL, NULL, NULL, 'valide', 'active'),
('B-104', NULL, 'MANJOVALA', 'Manjosoa', 'H', NULL, NULL, NULL, 501, '1996-08-02', 'Toliara', NULL, NULL, 'Fkt493', NULL, NULL, NULL, 'valide', 'active'),
('B-105', NULL, 'MIHAMAROAFARA', 'Magnatsara', 'H', NULL, NULL, NULL, 515, '2009-05-26', 'Fort-Dauphin', NULL, NULL, 'Fkt493', NULL, NULL, NULL, 'valide', 'active'),
('B-106', NULL, 'MONJABE', 'Manjarisoa', 'H', NULL, NULL, NULL, 501, '2016-09-29', 'Toliara', NULL, NULL, 'Fkt493', NULL, NULL, NULL, 'valide', 'active'),
('B-107', NULL, 'RAFANOMEZANTSOA', 'Manjoraza', 'H', NULL, NULL, NULL, 516, '1992-05-12', 'Ambovombe', NULL, NULL, 'Fkt493', NULL, NULL, NULL, 'valide', 'active'),
('B-108', NULL, 'RAFOTSY', NULL, 'F', NULL, NULL, NULL, 514, '1988-08-17', 'Tsihombe', NULL, NULL, 'Fkt493', NULL, NULL, NULL, 'valide', 'active'),
('B-109', NULL, 'RANOLATSAKY', NULL, 'F', NULL, NULL, NULL, 514, '1988-09-21', 'Tsihombe', NULL, NULL, 'Fkt493', NULL, NULL, NULL, 'valide', 'active'),
('B-110', NULL, 'RASOA Jeanine', NULL, 'F', NULL, NULL, NULL, 407, '2009-12-02', 'Namakia', NULL, NULL, 'Fkt493', NULL, NULL, NULL, 'valide', 'active'),
('B-111', NULL, 'REVOKARA', NULL, 'H', NULL, NULL, NULL, 514, '1982-09-07', 'Tsihombe', NULL, NULL, 'Fkt493', NULL, NULL, NULL, 'valide', 'active'),
('B-112', NULL, 'SAHIRANY Marie', 'Angèle', 'F', NULL, NULL, NULL, 514, '1988-07-16', 'Tsihombe', NULL, NULL, 'Fkt493', NULL, NULL, NULL, 'valide', 'active'),
('B-113', NULL, 'SAMBANDAHY', 'Gerard', 'H', NULL, NULL, NULL, 514, '2004-07-30', 'Tsihombe', NULL, NULL, 'Fkt493', NULL, NULL, NULL, 'valide', 'active'),
('B-114', NULL, 'SOANARAHE', NULL, 'F', NULL, NULL, NULL, 514, '1998-03-18', 'Tsihombe', NULL, NULL, 'Fkt493', NULL, NULL, NULL, 'valide', 'active'),
('B-115', NULL, 'AVITO', NULL, 'H', NULL, NULL, NULL, 514, '2010-05-14', 'Tsihombe', NULL, NULL, 'Fkt499', NULL, NULL, NULL, 'valide', 'active'),
('B-116', NULL, 'HERENTSOA', NULL, 'H', NULL, NULL, NULL, 514, '2012-03-05', 'Tsihombe', NULL, NULL, 'Fkt499', NULL, NULL, NULL, 'valide', 'active'),
('B-119', NULL, 'MAHATIA', NULL, 'H', NULL, NULL, NULL, 516, '1965-11-11', 'Ambovombe', NULL, NULL, 'Fkt499', NULL, NULL, NULL, 'valide', 'active'),
('B-120', NULL, 'MAMIE', NULL, 'F', NULL, NULL, NULL, 514, '1997-11-12', 'Tsihombe', NULL, NULL, 'Fkt499', NULL, NULL, NULL, 'valide', 'active'),
('B-121', NULL, 'MASIGNAVY', 'Emmanuel', 'H', NULL, NULL, NULL, 519, '1997-12-23', 'Amboasary', NULL, NULL, 'Fkt499', NULL, NULL, NULL, 'valide', 'active'),
('B-122', NULL, 'MIHA', NULL, 'H', NULL, NULL, NULL, 514, '1993-12-08', 'Tsihombe', NULL, NULL, 'Fkt499', NULL, NULL, NULL, 'valide', 'active'),
('B-123', NULL, 'MONJA', NULL, 'H', NULL, NULL, NULL, 514, NULL, NULL, NULL, NULL, 'Fkt499', NULL, NULL, NULL, 'valide', 'active'),
('B-124', NULL, 'ORISOA', NULL, 'H', NULL, NULL, NULL, 514, '2004-10-12', 'Tsihombe', NULL, NULL, 'Fkt499', NULL, NULL, NULL, 'valide', 'active'),
('B-125', NULL, 'RANDRIANJAFINAHATRATRA', NULL, 'H', NULL, NULL, NULL, 514, '2017-04-11', 'Tsihombe', NULL, NULL, 'Fkt499', NULL, NULL, NULL, 'valide', 'active'),
('B-126', NULL, 'RASOANIRINA', 'Tahirisoa', 'F', NULL, NULL, NULL, 514, '2003-08-12', 'Tsihombe', NULL, NULL, 'Fkt499', NULL, NULL, NULL, 'valide', 'active'),
('B-127', NULL, 'RAZANAJAFY', 'Mitasoa', 'F', NULL, NULL, NULL, 519, '1997-06-18', 'Marotsiraka', NULL, NULL, 'Fkt499', NULL, NULL, NULL, 'valide', 'active'),
('B-128', NULL, 'REFINIDY', 'Tolisoa', 'H', NULL, NULL, NULL, 514, '2002-03-15', 'Tsihombe', NULL, NULL, 'Fkt499', NULL, NULL, NULL, 'valide', 'active'),
('B-129', NULL, 'TAHIRINDRAINY', NULL, 'H', NULL, NULL, NULL, 514, '2013-12-02', 'Tsihombe', NULL, NULL, 'Fkt499', NULL, NULL, NULL, 'valide', 'active'),
('B-130', NULL, 'TIRIAZE', NULL, 'F', NULL, NULL, NULL, 401, '2007-11-29', 'Mahajanga', NULL, NULL, 'Fkt499', NULL, NULL, NULL, 'valide', 'active'),
('B-131', NULL, 'TONGOAMAREE', NULL, 'F', NULL, NULL, NULL, 514, '2018-02-26', 'Tsihombe', NULL, NULL, 'Fkt499', NULL, NULL, NULL, 'valide', 'active'),
('B-132', NULL, 'TSARASAOTRA', 'Arline', 'F', NULL, NULL, NULL, 514, '1992-04-22', 'Tsihombe', NULL, NULL, 'Fkt499', NULL, NULL, NULL, 'valide', 'active'),
('B-133', NULL, 'VAHOAVY', NULL, 'H', NULL, NULL, NULL, 514, '1983-07-06', 'Tsihombe', NULL, NULL, 'Fkt499', NULL, NULL, NULL, 'valide', 'active'),
('B-134', NULL, 'VOGNAROVA', NULL, 'F', NULL, NULL, NULL, 407, '1995-07-18', 'Mitsinjo', NULL, NULL, 'Fkt499', NULL, NULL, NULL, 'valide', 'active'),
('B-135', NULL, 'VONJEAZE', NULL, 'F', NULL, NULL, NULL, 514, '2009-08-22', 'Imongy', NULL, NULL, 'Fkt499', NULL, NULL, NULL, 'valide', 'active'),
('B-136', NULL, 'Vorisoa', NULL, 'H', NULL, NULL, NULL, 514, '2003-07-25', 'Tsihombe', NULL, NULL, 'Fkt503', NULL, NULL, NULL, 'valide', 'active');

-- --------------------------------------------------------

--
-- Structure de la table `benef_activ_bl`
--

DROP TABLE IF EXISTS `benef_activ_bl`;
CREATE TABLE IF NOT EXISTS `benef_activ_bl` (
  `code_benef_bl` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_proj` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_activ` int NOT NULL,
  `id_benef` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_bloc` varchar(255) DEFAULT NULL,
  `code_achat` varchar(100) DEFAULT NULL,
  `id_collaborateur` varchar(255) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'active',
  PRIMARY KEY (`code_benef_bl`),
  KEY `benef_activ_bl_ibfk_1` (`id_activ`),
  KEY `id_benef` (`id_benef`),
  KEY `id_proj` (`id_proj`),
  KEY `id_bloc` (`id_bloc`),
  KEY `id_collaborateur` (`id_collaborateur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `benef_activ_bl`
--

INSERT INTO `benef_activ_bl` (`code_benef_bl`, `id_proj`, `id_activ`, `id_benef`, `id_bloc`, `code_achat`, `id_collaborateur`, `status`) VALUES
('BL_AFOTS_01', 'P03', 2, 'B-027', 'BL29', NULL, 'Col01', 'active'),
('BL_AFOTS_02', 'P03', 2, 'B-028', 'BL29', NULL, 'Col01', 'active'),
('BL_AFOTS_03', 'P03', 2, 'B-029', 'BL29', NULL, 'Col01', 'active'),
('BL_AFOTS_04', 'P03', 2, 'B-030', 'BL29', NULL, 'Col01', 'active'),
('BL_AFOTS_05', 'P03', 2, 'B-031', 'BL29', NULL, 'Col01', 'active'),
('BL_AFOTS_06', 'P03', 2, 'B-032', 'BL29', NULL, 'Col01', 'active'),
('BL_AFOTS_07', 'P03', 2, 'B-035', 'BL29', NULL, 'Col01', 'active'),
('BL_AMBVHS_01', 'P03', 2, 'B-037', 'BL30', NULL, 'Col02', 'active'),
('BL_AMBVHS_02', 'P03', 2, 'B-038', 'BL30', NULL, 'Col01', 'active'),
('BL_AMBVHS_03', 'P03', 2, 'B-039', 'BL30', NULL, 'Col01', 'active'),
('BL_AMBVHS_04', 'P03', 2, 'B-040', 'BL30', NULL, 'Col01', 'active'),
('BL_AMBVHS_05', 'P03', 2, 'B-041', 'BL30', NULL, 'Col01', 'active'),
('BL_AMBVHS_06', 'P03', 2, 'B-042', 'BL30', NULL, 'Col01', 'active'),
('BL_AMBVHS_07', 'P03', 2, 'B-043', 'BL30', NULL, 'Col01', 'active'),
('BL_AMBVHS_08', 'P03', 2, 'B-044', 'BL30', NULL, 'Col01', 'active'),
('BL_AMBVHS_09', 'P03', 2, 'B-045', 'BL30', NULL, 'Col02', 'active'),
('BL_AMBVHS_10', 'P03', 2, 'B-046', 'BL30', NULL, 'Col01', 'active'),
('BL_AMBVHS_106', 'P03', 2, 'B-052', 'BL30', NULL, 'Col01', 'active'),
('BL_AMBVHS_107', 'P03', 2, 'B-053', 'BL30', NULL, 'Col01', 'active'),
('BL_BEV_01', 'P03', 2, 'B-016', 'BL32', 'BEV_ACHAT', 'Col01', 'active'),
('BL_BEV_02', 'P03', 2, 'B-017', 'BL32', 'BEV_ACHAT', 'Col01', 'active'),
('BL_BEV_03', 'P03', 2, 'B-018', 'BL32', 'BEV_ACHAT', 'Col01', 'active'),
('BL_BEV_04', 'P03', 2, 'B-019', 'BL32', 'BEV_ACHAT', 'Col01', 'active'),
('BL_BEV_05', 'P03', 2, 'B-020', 'BL32', 'BEV_ACHAT', 'Col01', 'active'),
('BL_BEV_06', 'P03', 2, 'B-021', 'BL32', 'BEV_ACHAT', 'Col01', 'active'),
('BL_BEV_07', 'P03', 2, 'B-022', 'BL32', 'BEV_ACHAT', 'Col01', 'active'),
('BL_BEV_08', 'P03', 2, 'B-023', 'BL32', 'BEV_ACHAT', 'Col01', 'active'),
('BL_BEV_09', 'P03', 2, 'B-024', 'BL32', 'BEV_ACHAT', 'Col01', 'active'),
('BL_BEV_10', 'P03', 2, 'B-025', 'BL32', 'BEV_ACHAT', 'Col01', 'active'),
('BL_NAM_01', 'P03', 2, 'B-001', 'BL31', 'NAM_ACHAT', 'Col01', 'active'),
('BL_NAM_02', 'P03', 2, 'B-002', 'BL31', 'NAM_ACHAT', 'Col01', 'active'),
('BL_NAM_03', 'P03', 2, 'B-003', 'BL31', 'NAM_ACHAT', 'Col01', 'active'),
('BL_NAM_04', 'P03', 2, 'B-004', 'BL31', 'NAM_ACHAT', 'Col01', 'active'),
('BL_NAM_05', 'P03', 2, 'B-005', 'BL31', 'NAM_ACHAT', 'Col01', 'active'),
('BL_NAM_06', 'P03', 2, 'B-006', 'BL31', 'NAM_ACHAT', 'Col01', 'active'),
('BL_NAM_07', 'P03', 2, 'B-007', 'BL31', 'NAM_ACHAT', 'Col01', 'active'),
('BL_NAM_08', 'P03', 2, 'B-008', 'BL31', 'NAM_ACHAT', 'Col01', 'active'),
('BL_NAM_09', 'P03', 2, 'B-009', 'BL31', 'NAM_ACHAT', 'Col01', 'active'),
('BL_NAM_10', 'P03', 2, 'B-010', 'BL31', 'NAM_ACHAT', 'Col02', 'active'),
('BL_NAM_11', 'P03', 2, 'B-011', 'BL31', 'NAM_ACHAT', 'Col01', 'active'),
('BL_NAM_12', 'P03', 2, 'B-012', 'BL31', 'NAM_ACHAT', 'Col01', 'active'),
('BL_NAM_13', 'P03', 2, 'B-013', 'BL31', 'NAM_ACHAT', 'Col01', 'active');

-- --------------------------------------------------------

--
-- Structure de la table `benef_activ_pms`
--

DROP TABLE IF EXISTS `benef_activ_pms`;
CREATE TABLE IF NOT EXISTS `benef_activ_pms` (
  `code_benef_pms` varchar(100) NOT NULL,
  `code_achat` varchar(255) DEFAULT NULL,
  `id_proj` varchar(100) NOT NULL,
  `id_benef` varchar(50) NOT NULL,
  `id_activ` int NOT NULL,
  `id_association` varchar(255) NOT NULL,
  `id_collaborateur` varchar(255) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'active',
  PRIMARY KEY (`code_benef_pms`),
  KEY `id_association` (`id_association`),
  KEY `id_benef` (`id_benef`),
  KEY `id_proj` (`id_proj`),
  KEY `id_collaborateur` (`id_collaborateur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `benef_activ_pms`
--

INSERT INTO `benef_activ_pms` (`code_benef_pms`, `code_achat`, `id_proj`, `id_benef`, `id_activ`, `id_association`, `id_collaborateur`, `status`) VALUES
('B-52AVT-01', NULL, 'P03', 'B-062', 1, 'ASS052', 'Col07', 'active'),
('B-52AVT-02', NULL, 'P03', 'B-063', 1, 'ASS052', 'Col07', 'active'),
('B-52AVT-03', NULL, 'P03', 'B-064', 1, 'ASS052', 'Col07', 'active'),
('B-52AVT-04', NULL, 'P03', 'B-065', 1, 'ASS052', 'Col07', 'active'),
('B-52AVT-05', NULL, 'P03', 'B-066', 1, 'ASS052', 'Col07', 'active'),
('B-52AVT-06', NULL, 'P03', 'B-067', 1, 'ASS052', 'Col07', 'active'),
('B-52AVT-07', NULL, 'P03', 'B-068', 1, 'ASS052', 'Col07', 'active'),
('B-52AVT-08', NULL, 'P03', 'B-069', 1, 'ASS052', 'Col07', 'active'),
('B-52AVT-09', NULL, 'P03', 'B-070', 1, 'ASS052', 'Col07', 'active'),
('B-52AVT-10', NULL, 'P03', 'B-080', 1, 'ASS052', 'Col07', 'active'),
('B-52AVT-11', NULL, 'P03', 'B-081', 1, 'ASS052', 'Col07', 'active'),
('B-52AVT-12', NULL, 'P03', 'B-136', 1, 'ASS052', 'Col07', 'active'),
('B-52AVT-13', NULL, 'P03', 'B-082', 1, 'ASS052', 'Col07', 'active'),
('B-52AVT-14', NULL, 'P03', 'B-083', 1, 'ASS052', 'Col07', 'active'),
('B-52AVT-15', NULL, 'P03', 'B-084', 1, 'ASS052', 'Col07', 'active'),
('B-52AVT-16', NULL, 'P03', 'B-085', 1, 'ASS052', 'Col07', 'active'),
('B-52AVT-17', NULL, 'P03', 'B-086', 1, 'ASS052', 'Col07', 'active'),
('B-52AVT-18', NULL, 'P03', 'B-087', 1, 'ASS052', 'Col07', 'active'),
('B-52AVT-19', NULL, 'P03', 'B-088', 1, 'ASS052', 'Col07', 'active'),
('B-53FINK-01', 'PMSFINK-01', 'P03', 'B-089', 1, 'ASS053', 'Col07', 'active'),
('B-53FINK-02', 'PMSFINK02', 'P03', 'B-090', 1, 'ASS053', 'Col07', 'active'),
('B-53FINK-03', 'PMSFINK03', 'P03', 'B-091', 1, 'ASS053', 'Col07', 'active'),
('B-53FINK-04', 'PMSFINK04', 'P03', 'B-092', 1, 'ASS053', 'Col07', 'active'),
('B-53FINK-05', 'PMSFINK05', 'P03', 'B-093', 1, 'ASS053', 'Col07', 'active'),
('B-53FINK-06', 'B-PMSFINK06', 'P03', 'B-094', 1, 'ASS053', 'Col07', 'active'),
('B-53FINK-07', 'PMSFINK', 'P03', 'B-095', 1, 'ASS053', 'Col07', 'active'),
('B-53FINK-08', 'PMSFINK08', 'P03', 'B-096', 1, 'ASS053', 'Col07', 'active'),
('B-55TANP-01', NULL, 'P03', 'B-097', 1, 'ASS055', 'Col07', 'active'),
('B-55TANP-02', NULL, 'P03', 'B-098', 1, 'ASS055', 'Col07', 'active'),
('B-55TANP-03', NULL, 'P03', 'B-099', 1, 'ASS055', 'Col07', 'active'),
('B-55TANP-04', NULL, 'P03', 'B-100', 1, 'ASS055', 'Col07', 'active'),
('B-55TANP-05', NULL, 'P03', 'B-101', 1, 'ASS055', 'Col07', 'active'),
('B-55TANP-06', NULL, 'P03', 'B-102', 1, 'ASS055', 'Col07', 'active'),
('B-55TANP-07', NULL, 'P03', 'B-103', 1, 'ASS055', 'Col07', 'active'),
('B-55TANP-08', NULL, 'P03', 'B-104', 1, 'ASS055', 'Col07', 'active'),
('B-55TANP-09', NULL, 'P03', 'B-105', 1, 'ASS055', 'Col07', 'active'),
('B-55TANP-10', NULL, 'P03', 'B-106', 1, 'ASS055', 'Col07', 'active'),
('B-55TANP-11', NULL, 'P03', 'B-107', 1, 'ASS055', 'Col07', 'active'),
('B-55TANP-12', NULL, 'P03', 'B-108', 1, 'ASS055', 'Col07', 'active'),
('B-55TANP-13', NULL, 'P03', 'B-109', 1, 'ASS055', 'Col07', 'active'),
('B-55TANP-14', NULL, 'P03', 'B-110', 1, 'ASS055', 'Col07', 'active'),
('B-55TANP-15', NULL, 'P03', 'B-111', 1, 'ASS055', 'Col07', 'active'),
('B-55TANP-16', NULL, 'P03', 'B-112', 1, 'ASS055', 'Col07', 'active'),
('B-55TANP-17', NULL, 'P03', 'B-113', 1, 'ASS055', 'Col07', 'active'),
('B-55TANP-18', NULL, 'P03', 'B-114', 1, 'ASS055', 'Col07', 'active'),
('ZaiHGN01', NULL, 'P03', 'B-115', 1, 'ASS054', 'Col07', 'active'),
('ZaiHGN02', NULL, 'P03', 'B-116', 1, 'ASS054', 'Col07', 'active'),
('ZaiHGN03', NULL, 'P03', 'B-119', 1, 'ASS054', 'Col07', 'active'),
('ZaiHGN04', NULL, 'P03', 'B-120', 1, 'ASS054', 'Col07', 'active'),
('ZaiHGN05', NULL, 'P03', 'B-121', 1, 'ASS054', 'Col07', 'active'),
('ZaiHGN06', NULL, 'P03', 'B-122', 1, 'ASS054', 'Col07', 'active'),
('ZaiHGN07', NULL, 'P03', 'B-123', 1, 'ASS054', 'Col07', 'active'),
('ZaiHGN08', NULL, 'P03', 'B-124', 1, 'ASS054', 'Col07', 'active'),
('ZaiHGN09', NULL, 'P03', 'B-125', 1, 'ASS054', 'Col07', 'active'),
('ZaiHGN10', NULL, 'P03', 'B-126', 1, 'ASS054', 'Col07', 'active'),
('ZaiHGN11', NULL, 'P03', 'B-127', 1, 'ASS054', 'Col07', 'active'),
('ZaiHGN12', NULL, 'P03', 'B-128', 1, 'ASS054', 'Col07', 'active'),
('ZaiHGN13', NULL, 'P03', 'B-129', 1, 'ASS054', 'Col07', 'active'),
('ZaiHGN14', NULL, 'P03', 'B-130', 1, 'ASS054', 'Col07', 'active'),
('ZaiHGN15', NULL, 'P03', 'B-131', 1, 'ASS054', 'Col07', 'active'),
('ZaiHGN16', NULL, 'P03', 'B-132', 1, 'ASS054', 'Col07', 'active'),
('ZaiHGN17', NULL, 'P03', 'B-133', 1, 'ASS054', 'Col07', 'active'),
('ZaiHGN18', NULL, 'P03', 'B-134', 1, 'ASS054', 'Col07', 'active'),
('ZaiHGN19', NULL, 'P03', 'B-135', 1, 'ASS054', 'Col07', 'active');

-- --------------------------------------------------------

--
-- Structure de la table `benef_activ_pr`
--

DROP TABLE IF EXISTS `benef_activ_pr`;
CREATE TABLE IF NOT EXISTS `benef_activ_pr` (
  `code_pr` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_proj` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_activ` int NOT NULL,
  `id_benef` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_bloc` varchar(255) DEFAULT NULL,
  `code_achat` varchar(100) DEFAULT NULL,
  `id_collaborateur` varchar(255) NOT NULL,
  `id_tech` int DEFAULT NULL,
  `etat` varchar(50) NOT NULL DEFAULT 'validate',
  `status` varchar(50) NOT NULL DEFAULT 'active',
  PRIMARY KEY (`code_pr`),
  KEY `benef_activ_bl_ibfk_1` (`id_activ`),
  KEY `id_benef` (`id_benef`),
  KEY `id_proj` (`id_proj`),
  KEY `id_bloc` (`id_bloc`),
  KEY `id_collaborateur` (`id_collaborateur`),
  KEY `id_tech` (`id_tech`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `benef_activ_pr`
--

INSERT INTO `benef_activ_pr` (`code_pr`, `id_proj`, `id_activ`, `id_benef`, `id_bloc`, `code_achat`, `id_collaborateur`, `id_tech`, `etat`, `status`) VALUES
('PR-11AFS3-01', 'P03', 3, 'B-001', 'BL31', 'NAM_ACHAT', 'Col04', 11, 'valide', 'active'),
('PR-11AFS3-02', 'P03', 3, 'B-002', 'BL31', 'NAM_ACHAT', 'Col04', 11, 'valide', 'active'),
('PR-11AFS3-03', 'P03', 3, 'B-014', NULL, 'NAM_ACHAT', 'Col04', 11, 'valide', 'active'),
('PR-11AFS3-04', 'P03', 3, 'B-015', NULL, 'NAM_ACHAT', 'Col04', 11, 'valide', 'active'),
('PR-11AFS3-05', 'P03', 3, 'B-005', 'BL31', 'NAM_ACHAT', 'Col04', 11, 'valide', 'active'),
('PR-11AFS3-06', 'P03', 3, 'B-016', 'BL32', 'BEV_ACHAT', 'Col04', 11, 'valide', 'active'),
('PR-11AFS3-07', 'P03', 3, 'B-017', 'BL32', 'BEV_ACHAT', 'Col04', 11, 'valide', 'active'),
('PR-11AFS3-08', 'P03', 3, 'B-018', 'BL32', 'BEV_ACHAT', 'Col04', 11, 'valide', 'active'),
('PR-11AFS3-09', 'P03', 3, 'B-024', NULL, 'BEV_ACHAT', 'Col04', 11, 'valide', 'active'),
('PR-11AFS3-10', 'P03', 3, 'B-026', NULL, 'BEV_ACHAT', 'Col04', 11, 'valide', 'active'),
('PR-8AFS3-01', 'P03', 3, 'B-046', NULL, NULL, 'Col04', 8, 'valide', 'active'),
('PR-8AFS3-02', 'P03', 3, 'B-047', NULL, NULL, 'Col04', 8, 'valide', 'active'),
('PR-8AFS3-03', 'P03', 3, 'B-050', NULL, NULL, 'Col04', 8, 'valide', 'active'),
('PR-8AFS3-04', 'P03', 3, 'B-049', 'BL30', NULL, 'Col04', 8, 'valide', 'active'),
('PR-8AFS3-05', 'P03', 3, 'B-048', 'BL30', NULL, 'Col04', 8, 'valide', 'active'),
('PR-8AFS3-06', 'P03', 3, 'B-033', 'BL29', NULL, 'Col04', 8, 'valide', 'active'),
('PR-8AFS3-07', 'P03', 3, 'B-034', 'BL29', NULL, 'Col04', 8, 'valide', 'active'),
('PR-8AFS3-08', 'P03', 3, 'B-036', NULL, NULL, 'Col04', 8, 'valide', 'active');

-- --------------------------------------------------------

--
-- Structure de la table `bloc`
--

DROP TABLE IF EXISTS `bloc`;
CREATE TABLE IF NOT EXISTS `bloc` (
  `ordre` int NOT NULL AUTO_INCREMENT,
  `code_bloc` varchar(255) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `ancronyme` varchar(20) NOT NULL DEFAULT 'BL',
  `id_prjt` varchar(100) NOT NULL,
  `id_tech` int DEFAULT NULL,
  `status` varchar(100) NOT NULL DEFAULT 'active',
  PRIMARY KEY (`code_bloc`),
  UNIQUE KEY `ordre` (`ordre`),
  KEY `id_prjt` (`id_prjt`),
  KEY `id_tech` (`id_tech`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `bloc`
--

INSERT INTO `bloc` (`ordre`, `code_bloc`, `nom`, `ancronyme`, `id_prjt`, `id_tech`, `status`) VALUES
(1, 'BL01', 'Ikotoala', 'BL', 'P02', 16, 'active'),
(2, 'BL02', 'Ambazoamazava', 'BL', 'P02', 16, 'active'),
(3, 'BL03', 'Ambanemantsake', 'BL', 'P02', 16, 'active'),
(4, 'BL04', 'Ambaninato-Belay', 'BL', 'P02', 16, 'active'),
(5, 'BL05', 'Erada centre', 'BL', 'P02', 16, 'active'),
(6, 'BL06', 'Habohabo nord', 'BL', 'P02', 16, 'active'),
(7, 'BL07', 'Evazoa', 'BL', 'P02', 16, 'active'),
(8, 'BL08', 'Antsotry', 'BL', 'P02', 16, 'active'),
(9, 'BL09', 'Ankiliromotse-Ambaromionjo', 'BL', 'P02', 16, 'active'),
(10, 'BL10', 'Bebea Sud', 'BL', 'P02', 16, 'active'),
(11, 'BL11', 'Andasary', 'BL', 'P02', 16, 'active'),
(12, 'BL12', 'Analavao haut', 'BL', 'P02', 16, 'active'),
(13, 'BL13', 'Analavao bas', 'BL', 'P02', 16, 'active'),
(14, 'BL14', 'Beratro II', 'BL', 'P02', 16, 'active'),
(15, 'BL15', 'Antsakoamamy-Angodogodo', 'BL', 'P02', 10, 'active'),
(16, 'BL16', 'Ekonka', 'BL', 'P02', 10, 'active'),
(17, 'BL17', 'Karoke Mahandrorano', 'BL', 'P02', 10, 'active'),
(18, 'BL18', 'Antsomontsoy', 'BL', 'P02', 10, 'active'),
(19, 'BL19', 'Betsimeda Ankilimilaly', 'BL', 'P02', 10, 'active'),
(20, 'BL20', 'Ebana', 'BL', 'P02', 10, 'active'),
(21, 'BL21', 'Zanavo sud', 'BL', 'P02', 10, 'active'),
(22, 'BL22', 'Erakoke', 'BL', 'P02', 10, 'active'),
(23, 'BL23', 'Faux Cap', 'BL', 'P05', 9, 'active'),
(24, 'BL24', 'Ambondro', 'BL', 'P05', 6, 'active'),
(25, 'BL25', 'Maroalomainty', 'BL', 'P05', 1, 'active'),
(26, 'BL26', 'Maroalopoty', 'BL', 'P05', 1, 'active'),
(27, 'BL27', 'Sampona', 'BL', 'P05', 7, 'active'),
(28, 'BL28', 'Soatsifa', 'BL', 'P05', 7, 'active'),
(29, 'BL29', 'Afotsifaly', 'AFOT', 'P03', 8, 'active'),
(30, 'BL30', 'Ambarovoahasy', 'AMB', 'P03', 8, 'active'),
(31, 'BL31', 'Namoia', 'NAM', 'P03', 11, 'active'),
(32, 'BL32', 'Bevazavo', 'BEV', 'P03', 11, 'active');

-- --------------------------------------------------------

--
-- Structure de la table `bloc_parce`
--

DROP TABLE IF EXISTS `bloc_parce`;
CREATE TABLE IF NOT EXISTS `bloc_parce` (
  `code_parce` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_bloc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_benef` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ref_gps` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `lat` double DEFAULT NULL,
  `log` double DEFAULT NULL,
  `superficie` int DEFAULT NULL,
  `id_fkt` varchar(255) NOT NULL,
  `anne_adheran` year DEFAULT NULL,
  `status` varchar(100) NOT NULL DEFAULT 'active',
  PRIMARY KEY (`code_parce`),
  KEY `id_bloc` (`id_bloc`),
  KEY `id_benef` (`id_benef`),
  KEY `id_fkt` (`id_fkt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `bloc_parce`
--

INSERT INTO `bloc_parce` (`code_parce`, `id_bloc`, `id_benef`, `ref_gps`, `lat`, `log`, `superficie`, `id_fkt`, `anne_adheran`, `status`) VALUES
('AFOTS-01', 'BL29', 'B-033', NULL, -25.47525, 45.456985, 1808, 'Fkt494', NULL, 'active'),
('AFOTS-02', 'BL29', 'B-035', NULL, -25.7582, 45.12456, 3476, 'Fkt494', NULL, 'active'),
('AFOTS-03', 'BL29', 'B-027', NULL, -25.47525, 45.15678, 3694, 'Fkt494', NULL, 'active'),
('AFOTS-04', 'BL29', 'B-028', NULL, -25.7582, 45.12456, 6875, 'Fkt494', NULL, 'active'),
('AFOTS-05', 'BL29', 'B-029', NULL, -25, 45, 6001, 'Fkt494', NULL, 'active'),
('AFOTS-06', 'BL29', 'B-030', NULL, -25.45622, 45.35658, 3064, 'Fkt494', NULL, 'active'),
('AFOTS-07', 'BL29', 'B-032', NULL, -25.456872, 45.123472, 3476, 'Fkt494', NULL, 'active'),
('AFOTS-08', 'BL29', 'B-031', NULL, -25.47525, 45.15678, 1808, 'Fkt494', NULL, 'active'),
('AMB-01', 'BL30', 'B-037', NULL, NULL, NULL, 5000, 'Fkt499', NULL, 'active'),
('AMB-02', 'BL30', 'B-038', NULL, -25.64512, 45.12345, 2300, 'Fkt499', NULL, 'active'),
('AMB-03', 'BL30', 'B-039', NULL, -25.47821, 45.32758, 3200, 'Fkt499', NULL, 'active'),
('AMB-04', 'BL30', 'B-040', NULL, -25, 45, 5000, 'Fkt499', NULL, 'active'),
('AMB-05', 'BL30', 'B-041', NULL, -25, 45, 2000, 'Fkt499', NULL, 'active'),
('AMB-06', 'BL30', 'B-042', NULL, -25.47821, 45.12356, 3000, 'Fkt499', NULL, 'active'),
('AMB-07', 'BL30', 'B-043', NULL, -25, 45, 1800, 'Fkt499', NULL, 'active'),
('AMB-08', 'BL30', 'B-044', NULL, -25, 45, 3600, 'Fkt499', NULL, 'active'),
('AMB-09', 'BL30', 'B-045', NULL, 0, 0, 5000, 'Fkt499', NULL, 'active'),
('AMB-10', 'BL30', 'B-046', NULL, -25.85265, 45.65824, 3000, 'Fkt499', NULL, 'active'),
('AMB-11', 'BL30', 'B-051', NULL, -25.75824, 45.12345, 10000, 'Fkt499', NULL, 'active'),
('AMB-12', 'BL30', 'B-051', NULL, -25.47821, 45.32758, 6200, 'Fkt499', NULL, 'active'),
('AMB-13', 'BL30', 'B-051', NULL, -25.64582, 45.72315, 4000, 'Fkt499', NULL, 'active'),
('BEV-01', 'BL32', 'B-016', NULL, -25, 45, 7600, 'Fkt512', NULL, 'active'),
('BEV-02', 'BL32', 'B-017', NULL, -25.64512, 45.12345, 8600, 'Fkt512', NULL, 'active'),
('BEV-03', 'BL32', 'B-017', NULL, -25.47821, 45.32758, 3200, 'Fkt512', NULL, 'active'),
('BEV-04', 'BL32', 'B-018', NULL, -25.64582, 45.72315, 4600, 'Fkt512', NULL, 'active'),
('BEV-05', 'BL32', 'B-019', NULL, -25.1235, 45.1232, 8500, 'Fkt512', NULL, 'active'),
('BEV-06', 'BL32', 'B-020', NULL, -25.456872, 45.123472, 7600, 'Fkt512', NULL, 'active'),
('BEV-07', 'BL32', 'B-021', NULL, -25.85265, 45.15678, 7800, 'Fkt512', NULL, 'active'),
('BEV-08', 'BL32', 'B-022', NULL, -25.64512, 45.12345, 6400, 'Fkt512', NULL, 'active'),
('BEV-09', 'BL32', 'B-025', NULL, -25.47821, 45.32758, 11600, 'Fkt511', NULL, 'active'),
('NAM-01', 'BL31', 'B-001', NULL, -25.85265, 45.15678, 6782, 'Fkt506', NULL, 'active'),
('NAM-02', 'BL31', 'B-001', NULL, -25.64512, 45.12456, 4262, 'Fkt506', NULL, 'active'),
('NAM-03', 'BL31', 'B-002', NULL, -25.47821, 45.32758, 3100, 'Fkt506', NULL, 'active'),
('NAM-04', 'BL31', 'B-002', NULL, -25.64582, 45.72315, 21500, 'Fkt506', NULL, 'active'),
('NAM-05', 'BL31', 'B-002', NULL, -25.85236, 45.32465, 8706, 'Fkt506', NULL, 'active'),
('NAM-06', 'BL31', 'B-003', NULL, -25.78945, 45.54987, 2500, 'Fkt506', NULL, 'active'),
('NAM-07', 'BL31', 'B-003', NULL, -25.12345, 45.96325, 4487, 'Fkt506', NULL, 'active'),
('NAM-08', 'BL31', 'B-004', NULL, -25.74125, 45.52147, 4183, 'Fkt506', NULL, 'active'),
('NAM-09', 'BL31', 'B-004', NULL, -25.12345, 45.45123, 4262, 'Fkt506', NULL, 'active'),
('NAM-10', 'BL31', 'B-004', NULL, -25.96542, 45.98752, 5146, 'Fkt506', NULL, 'active'),
('NAM-11', 'BL31', 'B-005', NULL, -25.47525, 45.65824, 6171, 'Fkt506', NULL, 'active'),
('NAM-12', 'BL31', 'B-007', NULL, -25.47821, 45.12356, 4325, 'Fkt506', NULL, 'active'),
('NAM-13', 'BL31', 'B-007', NULL, -25.78526, 45.87456, 14620, 'Fkt506', NULL, 'active'),
('NAM-14', 'BL31', 'B-008', NULL, -25.1235, 45.1232, 4529, 'Fkt506', NULL, 'active'),
('NAM-15', 'BL31', 'B-006', NULL, -25.78529, 45.74125, 4370, 'Fkt506', NULL, 'active'),
('NAM-16', 'BL31', 'B-008', NULL, -25.47525, 45.15678, 5956, 'Fkt506', NULL, 'active'),
('NAM-17', 'BL31', 'B-008', NULL, -25.64512, 45.12456, 5115, 'Fkt506', NULL, 'active'),
('NAM-18', 'BL31', 'B-009', NULL, -25.85226, 45.34569, 14719, 'Fkt506', NULL, 'active'),
('NAM-19', 'BL31', 'B-010', NULL, NULL, NULL, 5000, 'Fkt506', NULL, 'active'),
('NAM-20', 'BL31', 'B-011', NULL, -25.12355, 45.1232, 1800, 'Fkt506', NULL, 'active'),
('NAM-21', 'BL31', 'B-011', NULL, -25.47525, 45.65824, 4800, 'Fkt506', NULL, 'active'),
('NAM-22', 'BL31', 'B-012', NULL, -25.64512, 45.12345, 3935, 'Fkt506', NULL, 'active'),
('NAM-23', 'BL31', 'B-013', NULL, -25.85226, 45.12356, 4800, 'Fkt506', NULL, 'active');

-- --------------------------------------------------------

--
-- Structure de la table `bloc_zone`
--

DROP TABLE IF EXISTS `bloc_zone`;
CREATE TABLE IF NOT EXISTS `bloc_zone` (
  `code` int NOT NULL AUTO_INCREMENT,
  `id_bloc` varchar(255) NOT NULL,
  `id_fkt` varchar(255) NOT NULL,
  `id_km` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`code`),
  KEY `id_km` (`id_km`),
  KEY `bloc_zone_ibfk_4` (`id_fkt`),
  KEY `id_bloc` (`id_bloc`)
) ENGINE=InnoDB AUTO_INCREMENT=284 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `bloc_zone`
--

INSERT INTO `bloc_zone` (`code`, `id_bloc`, `id_fkt`, `id_km`) VALUES
(1, 'BL01', 'Fkt066', NULL),
(2, 'BL01', 'Fkt067', NULL),
(3, 'BL01', 'Fkt068', NULL),
(4, 'BL01', 'Fkt069', NULL),
(5, 'BL01', 'Fkt032', NULL),
(6, 'BL01', 'Fkt057', NULL),
(7, 'BL02', 'Fkt033', NULL),
(8, 'BL02', 'Fkt053', NULL),
(9, 'BL02', 'Fkt062', NULL),
(10, 'BL02', 'Fkt034', NULL),
(11, 'BL02', 'Fkt040', NULL),
(12, 'BL02', 'Fkt041', NULL),
(13, 'BL02', 'Fkt074', NULL),
(14, 'BL02', 'Fkt055', NULL),
(15, 'BL02', 'Fkt035', NULL),
(16, 'BL02', 'Fkt063', NULL),
(17, 'BL02', 'Fkt048', NULL),
(18, 'BL02', 'Fkt076', NULL),
(19, 'BL02', 'Fkt075', NULL),
(20, 'BL02', 'Fkt050', NULL),
(21, 'BL02', 'Fkt535', NULL),
(22, 'BL03', 'Fkt056', NULL),
(23, 'BL03', 'Fkt039', NULL),
(24, 'BL03', 'Fkt081', NULL),
(25, 'BL03', 'Fkt083', NULL),
(26, 'BL03', 'Fkt071', NULL),
(27, 'BL03', 'Fkt080', NULL),
(28, 'BL04', 'Fkt143', NULL),
(29, 'BL04', 'Fkt263', NULL),
(30, 'BL04', 'Fkt270', NULL),
(31, 'BL04', 'Fkt246', NULL),
(32, 'BL04', 'Fkt244', NULL),
(33, 'BL04', 'Fkt248', NULL),
(34, 'BL04', 'Fkt247', NULL),
(35, 'BL04', 'Fkt536', NULL),
(36, 'BL04', 'Fkt144', NULL),
(37, 'BL04', 'Fkt277', NULL),
(38, 'BL04', 'Fkt538', NULL),
(39, 'BL05', 'Fkt262', NULL),
(40, 'BL05', 'Fkt265', NULL),
(41, 'BL05', 'Fkt264', NULL),
(42, 'BL05', 'Fkt261', NULL),
(43, 'BL05', 'Fkt269', NULL),
(44, 'BL05', 'Fkt275', NULL),
(45, 'BL06', 'Fkt269', NULL),
(46, 'BL06', 'Fkt270', NULL),
(47, 'BL06', 'Fkt271', NULL),
(48, 'BL06', 'Fkt261', NULL),
(49, 'BL06', 'Fkt262', NULL),
(50, 'BL06', 'Fkt272', NULL),
(51, 'BL07', 'Fkt171', NULL),
(52, 'BL07', 'Fkt137', NULL),
(53, 'BL07', 'Fkt556', NULL),
(54, 'BL07', 'Fkt169', NULL),
(55, 'BL08', 'Fkt134', NULL),
(56, 'BL08', 'Fkt124', NULL),
(57, 'BL08', 'Fkt557', NULL),
(58, 'BL08', 'Fkt172', NULL),
(59, 'BL08', 'Fkt137', NULL),
(60, 'BL09', 'Fkt119', NULL),
(61, 'BL09', 'Fkt132', NULL),
(62, 'BL09', 'Fkt133', NULL),
(63, 'BL09', 'Fkt142', NULL),
(64, 'BL09', 'Fkt539', NULL),
(65, 'BL09', 'Fkt540', NULL),
(66, 'BL10', 'Fkt124', NULL),
(67, 'BL10', 'Fkt142', NULL),
(68, 'BL10', 'Fkt141', NULL),
(69, 'BL11', 'Fkt122', NULL),
(70, 'BL11', 'Fkt160', NULL),
(71, 'BL11', 'Fkt146', NULL),
(72, 'BL11', 'Fkt541', NULL),
(73, 'BL11', 'Fkt138', NULL),
(74, 'BL11', 'Fkt123', NULL),
(75, 'BL11', 'Fkt542', NULL),
(76, 'BL12', 'Fkt108', NULL),
(77, 'BL12', 'Fkt091', NULL),
(78, 'BL12', 'Fkt093', NULL),
(79, 'BL12', 'Fkt109', NULL),
(80, 'BL12', 'Fkt110', NULL),
(81, 'BL12', 'Fkt112', NULL),
(82, 'BL12', 'Fkt269', NULL),
(83, 'BL12', 'Fkt553', NULL),
(84, 'BL12', 'Fkt554', NULL),
(85, 'BL12', 'Fkt555', NULL),
(86, 'BL12', 'Fkt271', NULL),
(87, 'BL12', 'Fkt117', NULL),
(88, 'BL13', 'Fkt089', NULL),
(89, 'BL13', 'Fkt091', NULL),
(90, 'BL13', 'Fkt093', NULL),
(91, 'BL13', 'Fkt109', NULL),
(92, 'BL13', 'Fkt117', NULL),
(93, 'BL13', 'Fkt107', NULL),
(94, 'BL13', 'Fkt108', NULL),
(95, 'BL14', 'Fkt105', NULL),
(96, 'BL14', 'Fkt107', NULL),
(97, 'BL15', 'Fkt018', NULL),
(98, 'BL15', 'Fkt020', NULL),
(99, 'BL15', 'Fkt015', NULL),
(100, 'BL15', 'Fkt463', NULL),
(101, 'BL15', 'Fkt464', NULL),
(102, 'BL15', 'Fkt022', NULL),
(103, 'BL15', 'Fkt019', NULL),
(104, 'BL15', 'Fkt031', NULL),
(105, 'BL15', 'Fkt485', NULL),
(106, 'BL15', 'Fkt543', NULL),
(107, 'BL16', 'Fkt174', NULL),
(108, 'BL16', 'Fkt239', NULL),
(109, 'BL16', 'Fkt235', NULL),
(110, 'BL16', 'Fkt213', NULL),
(111, 'BL16', 'Fkt214', NULL),
(112, 'BL16', 'Fkt215', NULL),
(113, 'BL16', 'Fkt208', NULL),
(114, 'BL16', 'Fkt544', NULL),
(115, 'BL17', 'Fkt468', NULL),
(116, 'BL17', 'Fkt460', NULL),
(117, 'BL17', 'Fkt250', NULL),
(118, 'BL17', 'Fkt473', NULL),
(119, 'BL17', 'Fkt474', NULL),
(120, 'BL17', 'Fkt470', NULL),
(121, 'BL17', 'Fkt478', NULL),
(122, 'BL17', 'Fkt479', NULL),
(123, 'BL17', 'Fkt477', NULL),
(124, 'BL17', 'Fkt278', NULL),
(125, 'BL17', 'Fkt252', NULL),
(126, 'BL17', 'Fkt253', NULL),
(127, 'BL17', 'Fkt459', NULL),
(128, 'BL17', 'Fkt486', NULL),
(129, 'BL17', 'Fkt472', NULL),
(130, 'BL17', 'Fkt480', NULL),
(131, 'BL17', 'Fkt481', NULL),
(132, 'BL17', 'Fkt482', NULL),
(133, 'BL17', 'Fkt475', NULL),
(134, 'BL17', 'Fkt467', NULL),
(135, 'BL17', 'Fkt469', NULL),
(136, 'BL17', 'Fkt466', NULL),
(137, 'BL18', 'Fkt375', NULL),
(138, 'BL18', 'Fkt296', NULL),
(139, 'BL18', 'Fkt356', NULL),
(140, 'BL18', 'Fkt545', NULL),
(141, 'BL18', 'Fkt399', NULL),
(142, 'BL18', 'Fkt401', NULL),
(143, 'BL18', 'Fkt546', NULL),
(144, 'BL18', 'Fkt547', NULL),
(145, 'BL18', 'Fkt349', NULL),
(146, 'BL18', 'Fkt348', NULL),
(147, 'BL18', 'Fkt450', NULL),
(148, 'BL18', 'Fkt548', NULL),
(149, 'BL18', 'Fkt549', NULL),
(150, 'BL18', 'Fkt552', NULL),
(151, 'BL18', 'Fkt550', NULL),
(152, 'BL18', 'Fkt551', NULL),
(153, 'BL19', 'Fkt559', NULL),
(154, 'BL19', 'Fkt325', NULL),
(155, 'BL19', 'Fkt327', NULL),
(156, 'BL20', 'Fkt187', NULL),
(157, 'BL20', 'Fkt558', NULL),
(158, 'BL20', 'Fkt179', NULL),
(159, 'BL20', 'Fkt182', NULL),
(160, 'BL20', 'Fkt211', NULL),
(161, 'BL20', 'Fkt560', NULL),
(162, 'BL21', 'Fkt347', NULL),
(163, 'BL21', 'Fkt353', NULL),
(164, 'BL21', 'Fkt403', NULL),
(165, 'BL22', 'Fkt562', NULL),
(166, 'BL22', 'Fkt563', NULL),
(167, 'BL22', 'Fkt281', NULL),
(168, 'BL22', 'Fkt282', NULL),
(169, 'BL22', 'Fkt379', NULL),
(170, 'BL22', 'Fkt380', NULL),
(171, 'BL22', 'Fkt307', NULL),
(172, 'BL22', 'Fkt316', NULL),
(173, 'BL22', 'Fkt564', NULL),
(174, 'BL22', 'Fkt565', NULL),
(175, 'BL22', 'Fkt396', NULL),
(176, 'BL22', 'Fkt279', NULL),
(177, 'BL22', 'Fkt333', NULL),
(178, 'BL22', 'Fkt346', NULL),
(179, 'BL22', 'Fkt428', NULL),
(180, 'BL22', 'Fkt348', NULL),
(181, 'BL22', 'Fkt566', NULL),
(182, 'BL22', 'Fkt567', NULL),
(183, 'BL22', 'Fkt549', NULL),
(184, 'BL23', 'Fkt568', NULL),
(185, 'BL23', 'Fkt569', NULL),
(186, 'BL23', 'Fkt570', NULL),
(187, 'BL23', 'Fkt571', NULL),
(188, 'BL24', 'Fkt131', NULL),
(189, 'BL24', 'Fkt129', NULL),
(190, 'BL24', 'Fkt162', NULL),
(191, 'BL25', 'Fkt371', NULL),
(192, 'BL25', 'Fkt281', NULL),
(193, 'BL25', 'Fkt280', NULL),
(194, 'BL25', 'Fkt374', NULL),
(195, 'BL25', 'Fkt452', NULL),
(196, 'BL25', 'Fkt453', NULL),
(197, 'BL25', 'Fkt282', NULL),
(198, 'BL25', 'Fkt315', NULL),
(199, 'BL25', 'Fkt288', NULL),
(200, 'BL25', 'Fkt295', NULL),
(201, 'BL25', 'Fkt291', NULL),
(202, 'BL25', 'Fkt292', NULL),
(203, 'BL25', 'Fkt298', NULL),
(204, 'BL25', 'Fkt309', NULL),
(205, 'BL25', 'Fkt333', NULL),
(206, 'BL25', 'Fkt451', NULL),
(207, 'BL25', 'Fkt395', NULL),
(208, 'BL25', 'Fkt396', NULL),
(209, 'BL25', 'Fkt283', NULL),
(210, 'BL25', 'Fkt326', NULL),
(211, 'BL25', 'Fkt325', NULL),
(212, 'BL25', 'Fkt327', NULL),
(213, 'BL25', 'Fkt546', NULL),
(214, 'BL25', 'Fkt331', NULL),
(215, 'BL25', 'Fkt330', NULL),
(216, 'BL25', 'Fkt301', NULL),
(217, 'BL25', 'Fkt338', NULL),
(218, 'BL25', 'Fkt339', NULL),
(219, 'BL25', 'Fkt344', NULL),
(220, 'BL25', 'Fkt363', NULL),
(221, 'BL25', 'Fkt362', NULL),
(222, 'BL25', 'Fkt352', NULL),
(223, 'BL25', 'Fkt428', NULL),
(224, 'BL26', 'Fkt376', NULL),
(225, 'BL26', 'Fkt355', NULL),
(226, 'BL26', 'Fkt368', NULL),
(227, 'BL26', 'Fkt365', NULL),
(228, 'BL26', 'Fkt366', NULL),
(229, 'BL26', 'Fkt372', NULL),
(230, 'BL26', 'Fkt381', NULL),
(231, 'BL26', 'Fkt414', NULL),
(232, 'BL26', 'Fkt359', NULL),
(233, 'BL26', 'Fkt409', NULL),
(234, 'BL26', 'Fkt410', NULL),
(235, 'BL26', 'Fkt411', NULL),
(236, 'BL26', 'Fkt412', NULL),
(237, 'BL26', 'Fkt360', NULL),
(238, 'BL26', 'Fkt408', NULL),
(239, 'BL26', 'Fkt361', NULL),
(240, 'BL26', 'Fkt439', NULL),
(241, 'BL26', 'Fkt364', NULL),
(242, 'BL26', 'Fkt441', NULL),
(243, 'BL26', 'Fkt446', NULL),
(244, 'BL27', 'Fkt572', NULL),
(245, 'BL27', 'Fkt573', NULL),
(246, 'BL27', 'Fkt574', NULL),
(247, 'BL27', 'Fkt575', NULL),
(248, 'BL27', 'Fkt576', NULL),
(249, 'BL27', 'Fkt577', NULL),
(250, 'BL27', 'Fkt578', NULL),
(251, 'BL27', 'Fkt579', NULL),
(252, 'BL27', 'Fkt580', NULL),
(253, 'BL27', 'Fkt581', NULL),
(254, 'BL27', 'Fkt582', NULL),
(255, 'BL27', 'Fkt583', NULL),
(256, 'BL27', 'Fkt584', NULL),
(257, 'BL28', 'Fkt367', NULL),
(258, 'BL28', 'Fkt383', NULL),
(259, 'BL28', 'Fkt390', NULL),
(260, 'BL28', 'Fkt420', NULL),
(261, 'BL28', 'Fkt439', NULL),
(262, 'BL28', 'Fkt430', NULL),
(263, 'BL28', 'Fkt431', NULL),
(264, 'BL28', 'Fkt432', NULL),
(265, 'BL28', 'Fkt433', NULL),
(266, 'BL28', 'Fkt434', NULL),
(267, 'BL28', 'Fkt435', NULL),
(268, 'BL29', 'Fkt494', NULL),
(269, 'BL29', 'Fkt495', NULL),
(270, 'BL29', 'Fkt496', NULL),
(271, 'BL29', 'Fkt497', NULL),
(272, 'BL29', 'Fkt498', NULL),
(273, 'BL30', 'Fkt502', NULL),
(274, 'BL30', 'Fkt501', NULL),
(275, 'BL30', 'Fkt499', NULL),
(276, 'BL31', 'Fkt506', NULL),
(277, 'BL32', 'Fkt508', NULL),
(278, 'BL32', 'Fkt509', NULL),
(279, 'BL32', 'Fkt510', NULL),
(280, 'BL32', 'Fkt511', NULL),
(281, 'BL32', 'Fkt512', NULL),
(282, 'BL32', 'Fkt513', NULL),
(283, 'BL32', 'Fkt514', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `categorie_espece`
--

DROP TABLE IF EXISTS `categorie_espece`;
CREATE TABLE IF NOT EXISTS `categorie_espece` (
  `code_cat` int NOT NULL AUTO_INCREMENT,
  `libelle` varchar(100) NOT NULL,
  PRIMARY KEY (`code_cat`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `categorie_espece`
--

INSERT INTO `categorie_espece` (`code_cat`, `libelle`) VALUES
(1, 'semences en grains'),
(2, 'jeunes plants'),
(3, 'materiels vegetaux');

-- --------------------------------------------------------

--
-- Structure de la table `cep_parce`
--

DROP TABLE IF EXISTS `cep_parce`;
CREATE TABLE IF NOT EXISTS `cep_parce` (
  `code_parce` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_bloc` varchar(255) DEFAULT NULL,
  `id_benef` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ref_gps` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `lat` double DEFAULT NULL,
  `log` double DEFAULT NULL,
  `superficie` int DEFAULT NULL,
  `id_commune` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'si autres fokontany(village)',
  `id_fkt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `village` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `anne_adheran` year DEFAULT NULL,
  `dt_creation` date DEFAULT NULL,
  `etat` varchar(50) NOT NULL DEFAULT 'validate',
  `status` varchar(100) NOT NULL DEFAULT 'active',
  PRIMARY KEY (`code_parce`),
  KEY `id_benef` (`id_benef`),
  KEY `id_fkt` (`id_fkt`),
  KEY `id_commune` (`id_commune`),
  KEY `id_bloc` (`id_bloc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `cep_parce`
--

INSERT INTO `cep_parce` (`code_parce`, `id_bloc`, `id_benef`, `ref_gps`, `lat`, `log`, `superficie`, `id_commune`, `id_fkt`, `village`, `anne_adheran`, `dt_creation`, `etat`, `status`) VALUES
('CEP-11AFS3-01', NULL, 'B-002', NULL, -25.47525, 45.72654, 4500, 'C63', NULL, 'Village-soamandroso', NULL, '2022-07-02', 'valide', 'active'),
('CEP-11AFS3-02', NULL, 'B-005', NULL, -25.47525, 45.72654, 4500, NULL, 'Fkt495', NULL, NULL, '2022-07-02', 'valide', 'active');

-- --------------------------------------------------------

--
-- Structure de la table `collaborateur`
--

DROP TABLE IF EXISTS `collaborateur`;
CREATE TABLE IF NOT EXISTS `collaborateur` (
  `code_col` varchar(255) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `ancronyme` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`code_col`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `collaborateur`
--

INSERT INTO `collaborateur` (`code_col`, `nom`, `description`, `ancronyme`) VALUES
('Col01', 'beneficiaire', 'bénéficiaire bloc', NULL),
('Col02', 'KM', 'Komity mpitarike', 'KM'),
('Col03', 'boutiquier', 'Responsable boutique Intrant', NULL),
('Col04', 'PR', 'Paysan Relais', 'PR'),
('Col05', 'ATP', 'Mpitsabo voly', NULL),
('Col06', 'PA', 'Président association', NULL),
('Col07', 'PMS', 'Paysan Multiplicateur des semences', 'PMS');

-- --------------------------------------------------------

--
-- Structure de la table `collaborateur_activ`
--

DROP TABLE IF EXISTS `collaborateur_activ`;
CREATE TABLE IF NOT EXISTS `collaborateur_activ` (
  `code` int NOT NULL AUTO_INCREMENT,
  `id_col` varchar(255) NOT NULL,
  `id_activ` int NOT NULL,
  PRIMARY KEY (`code`),
  KEY `id_activ` (`id_activ`),
  KEY `id_col` (`id_col`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `collaborateur_activ`
--

INSERT INTO `collaborateur_activ` (`code`, `id_col`, `id_activ`) VALUES
(1, 'Col01', 2),
(2, 'Col02', 2),
(3, 'Col04', 2),
(4, 'Col06', 1),
(5, 'Col07', 1),
(6, 'Col03', 4);

-- --------------------------------------------------------

--
-- Structure de la table `critere`
--

DROP TABLE IF EXISTS `critere`;
CREATE TABLE IF NOT EXISTS `critere` (
  `code_critere` int NOT NULL AUTO_INCREMENT,
  `libelle` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
  PRIMARY KEY (`code_critere`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cultures_pms`
--

DROP TABLE IF EXISTS `cultures_pms`;
CREATE TABLE IF NOT EXISTS `cultures_pms` (
  `code_culture` varchar(255) NOT NULL,
  `id_parce` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_var` varchar(255) NOT NULL,
  `id_saison` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `annee_du` year NOT NULL,
  `ddp` date NOT NULL,
  `qsa` int NOT NULL,
  `img_fact` blob,
  `dds` date NOT NULL,
  `sfce` int NOT NULL,
  `sc` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ea_id_variette` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Espèce assoccié = ea',
  `ea_autres` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Autres Espèce',
  `dt_creation` date NOT NULL,
  `dt_modification` date NOT NULL,
  `statuts` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'EC' COMMENT 'EC=En cours, CL=Clôturé',
  `Etat` varchar(100) NOT NULL,
  PRIMARY KEY (`code_culture`),
  KEY `id_saison` (`id_saison`),
  KEY `id_parce` (`id_parce`),
  KEY `id_var` (`id_var`),
  KEY `ea_id_variette` (`ea_id_variette`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `culture_bl`
--

DROP TABLE IF EXISTS `culture_bl`;
CREATE TABLE IF NOT EXISTS `culture_bl` (
  `code_culture` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_parce` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_espece` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_var` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_saison` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `annee_du` year NOT NULL,
  `ddp` date NOT NULL,
  `qso` int DEFAULT NULL,
  `dt_distribution` date DEFAULT NULL COMMENT 'Jeunes Plants',
  `dds` date DEFAULT NULL,
  `sfce` int DEFAULT NULL,
  `nbre_ligne` int DEFAULT NULL COMMENT 'Jeunes Plants',
  `long_ligne` int DEFAULT NULL COMMENT 'Jeunes Plants',
  `usage` varchar(100) DEFAULT NULL COMMENT 'Cactus inerme',
  `sc` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ea_autres` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ea_id_variette` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `dt_creation` date DEFAULT NULL,
  `dt_modification` date DEFAULT NULL,
  `status` varchar(50) NOT NULL,
  `etat` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_equipe` int DEFAULT NULL,
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'sem_grain(sg)\r\njeunes_plants(pa)\r\nmat_vegetaux(mv)',
  PRIMARY KEY (`code_culture`),
  KEY `culture_bl_ibfk_1` (`id_parce`),
  KEY `id_var` (`id_var`),
  KEY `id_saison` (`id_saison`),
  KEY `ea_id_variette` (`ea_id_variette`),
  KEY `id_equipe` (`id_equipe`),
  KEY `id_espece` (`id_espece`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `culture_pr`
--

DROP TABLE IF EXISTS `culture_pr`;
CREATE TABLE IF NOT EXISTS `culture_pr` (
  `code_culture` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_parce` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_espece` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_var` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_saison` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `annee_du` year NOT NULL,
  `ddp` date NOT NULL,
  `qso` int DEFAULT NULL,
  `dt_distribution` date DEFAULT NULL COMMENT 'Jeunes Plants',
  `dds` date DEFAULT NULL,
  `sfce` int DEFAULT NULL,
  `nbre_ligne` int DEFAULT NULL COMMENT 'Jeunes Plants',
  `long_ligne` int DEFAULT NULL COMMENT 'Jeunes Plants',
  `usage` varchar(100) DEFAULT NULL COMMENT 'Cactus inerme',
  `sc` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ea_autres` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ea_id_variette` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `dt_creation` date DEFAULT NULL,
  `dt_modification` date DEFAULT NULL,
  `status` varchar(50) NOT NULL,
  `etat` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_equipe` int DEFAULT NULL,
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'sem_grain(sg)\r\njeunes_plants(pa)\r\nmat_vegetaux(mv)',
  PRIMARY KEY (`code_culture`),
  KEY `id_var` (`id_var`),
  KEY `id_saison` (`id_saison`),
  KEY `ea_id_variette` (`ea_id_variette`),
  KEY `id_equipe` (`id_equipe`),
  KEY `id_espece` (`id_espece`),
  KEY `id_parce` (`id_parce`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `equipe`
--

DROP TABLE IF EXISTS `equipe`;
CREATE TABLE IF NOT EXISTS `equipe` (
  `code_equipe` int NOT NULL AUTO_INCREMENT,
  `matricule` varchar(50) DEFAULT NULL,
  `img` blob,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) DEFAULT NULL,
  `sexe` varchar(20) NOT NULL,
  `dt_nais` date NOT NULL,
  `cin` bigint NOT NULL,
  `dt_delivrance` date NOT NULL,
  `lieu_delivrance` varchar(100) NOT NULL,
  `img_cin` blob,
  `email` varchar(100) DEFAULT NULL,
  `num_perso` int(10) UNSIGNED ZEROFILL DEFAULT NULL,
  `num_float` int(10) UNSIGNED ZEROFILL DEFAULT NULL,
  `dt_deb_contrat` date DEFAULT NULL,
  `dt_fin_contrat` date DEFAULT NULL,
  `id_fonct` int NOT NULL,
  `statuts` varchar(100) NOT NULL DEFAULT 'en fonction',
  PRIMARY KEY (`code_equipe`),
  UNIQUE KEY `matricule` (`matricule`),
  KEY `id_fonct` (`id_fonct`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `equipe`
--

INSERT INTO `equipe` (`code_equipe`, `matricule`, `img`, `nom`, `prenom`, `sexe`, `dt_nais`, `cin`, `dt_delivrance`, `lieu_delivrance`, `img_cin`, `email`, `num_perso`, `num_float`, `dt_deb_contrat`, `dt_fin_contrat`, `id_fonct`, `statuts`) VALUES
(1, 'P63', NULL, 'JAFETA', 'J', 'H', '1991-05-26', 516, '2011-11-11', 'Andalatanosy', NULL, NULL, 0000000330, NULL, NULL, NULL, 1, 'active'),
(2, 'P60', NULL, 'MARA', 'mamorisoa', 'H', '1986-11-10', 516, '2004-11-22', 'Ambovombe', NULL, NULL, 0000000332, NULL, NULL, NULL, 1, 'active'),
(3, 'P11', NULL, 'SAMBO', 'Fanampisoa Oscar', 'H', '1976-04-05', 515, '1995-04-18', 'Fort-dauphin', NULL, NULL, 0000000334, NULL, NULL, NULL, 1, 'active'),
(4, NULL, NULL, 'TSITOARIVONY', 'ROGER', 'H', '1965-02-01', 517, '1984-05-16', 'Betoha', NULL, NULL, 0330861858, NULL, NULL, NULL, 1, 'active'),
(5, NULL, NULL, 'MAHATSAKY', 'Manambina Danis Gatineau', 'H', '1992-09-12', 301, '2011-08-01', 'Toamasina I', NULL, NULL, 0000000339, NULL, NULL, NULL, 1, 'active'),
(6, 'P69', NULL, 'RANDRIANIRINA heriniaina', 'THIERRY RICO', 'H', '1992-08-26', 515, '2012-06-18', 'Fort-dauphin', NULL, NULL, 0000000338, NULL, NULL, NULL, 1, 'active'),
(7, 'C05', NULL, 'RAZAFIMANDIMBY', 'Tsirindrainy Jeanna', 'H', '1983-10-26', 516, '2002-12-09', 'Ambovombe', NULL, NULL, 0000000338, NULL, NULL, NULL, 1, 'active'),
(8, NULL, NULL, 'FENOSOA', 'Mampionona', 'H', '1988-08-18', 519, '2009-01-09', 'Amboasary Sud', NULL, NULL, 0330913917, NULL, NULL, NULL, 1, 'active'),
(9, NULL, NULL, 'ANDRY', 'Sarobidy Sylvestre', 'H', '1991-12-16', 519, '2011-05-26', 'Amboasary Sud', NULL, NULL, 0000000334, NULL, NULL, NULL, 1, 'active'),
(10, 'P35', NULL, 'Fabien', 'Manantsoa', 'H', '1972-06-24', 103, '1993-11-24', 'Ambohitondra', NULL, NULL, 0000000334, NULL, NULL, NULL, 1, 'active'),
(11, NULL, NULL, 'CHRISTIAN', 'Zafimandimbisoa Noelson', 'H', '1989-12-25', 516, '2009-05-20', 'Ambovombe', NULL, NULL, 0334702181, NULL, NULL, NULL, 1, 'active'),
(12, 'P12', NULL, 'Samuel', 'mahatratse', 'H', '1975-02-04', 501, '1998-03-06', 'Toliara I', NULL, NULL, 0000000334, NULL, NULL, NULL, 1, 'active'),
(13, 'P67', NULL, 'RAFARARANO', 'Rovanirina Faraniaina', 'H', '1994-05-09', 0, '0000-00-00', '', NULL, NULL, 0000000345, NULL, NULL, NULL, 1, 'active'),
(14, 'P52', NULL, 'ZAFIMANANA', 'clément', 'H', '1987-09-19', 516, '2007-10-20', 'Ambovombe', NULL, NULL, 0000000336, NULL, NULL, NULL, 1, 'active'),
(15, 'P21', NULL, 'RAMANANJAKA', 'Magloire', 'H', '1982-04-13', 516, '2000-11-20', 'Ambovombe', NULL, NULL, 0334702169, NULL, NULL, NULL, 1, 'active'),
(16, 'P37', NULL, 'FANOMEZANTSOA', 'Christophe', 'H', '1990-10-13', 514, '2010-03-03', 'Tsihombe', NULL, NULL, 0000000346, NULL, NULL, NULL, 1, 'active');

-- --------------------------------------------------------

--
-- Structure de la table `espece`
--

DROP TABLE IF EXISTS `espece`;
CREATE TABLE IF NOT EXISTS `espece` (
  `code_espece` varchar(255) NOT NULL,
  `nom_espece` varchar(100) NOT NULL,
  `id_categ` int NOT NULL,
  `saisonnier` int NOT NULL DEFAULT '1',
  `unite` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`code_espece`),
  KEY `id_categ` (`id_categ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `espece`
--

INSERT INTO `espece` (`code_espece`, `nom_espece`, `id_categ`, `saisonnier`, `unite`) VALUES
('ESP_01', 'Antsoroko', 1, 1, NULL),
('ESP_02', 'Arachide', 1, 1, NULL),
('ESP_03', 'Dolique', 1, 1, NULL),
('ESP_04', 'Haricot', 1, 1, NULL),
('ESP_05', 'Konoke', 1, 1, NULL),
('ESP_06', 'Maïs', 1, 1, NULL),
('ESP_07', 'Mil', 1, 1, NULL),
('ESP_08', 'Mucuna', 1, 1, NULL),
('ESP_09', 'Niébé', 1, 1, NULL),
('ESP_10', 'Cajanus', 1, 1, 'Kp'),
('ESP_11', 'Pois', 1, 1, NULL),
('ESP_12', 'Ricin', 1, 1, NULL),
('ESP_13', 'Siratro', 1, 1, NULL),
('ESP_14', 'Sorgho', 1, 1, NULL),
('ESP_15', 'Tsiasisa', 1, 1, NULL),
('ESP_35', 'Bracchiaria', 3, 0, NULL),
('ESP_36', 'Cactus inerme', 3, 0, 'Cld'),
('ESP_37', 'Acacia', 2, 0, NULL),
('ESP_38', 'Morenga', 2, 0, NULL),
('ESP_39', 'Manioc', 3, 1, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `fonction`
--

DROP TABLE IF EXISTS `fonction`;
CREATE TABLE IF NOT EXISTS `fonction` (
  `code_fonct` int NOT NULL AUTO_INCREMENT,
  `intitule` varchar(100) NOT NULL,
  PRIMARY KEY (`code_fonct`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `fonction`
--

INSERT INTO `fonction` (`code_fonct`, `intitule`) VALUES
(1, 'techniciens'),
(2, 'chef de volet');

-- --------------------------------------------------------

--
-- Structure de la table `image`
--

DROP TABLE IF EXISTS `image`;
CREATE TABLE IF NOT EXISTS `image` (
  `code_img` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  `image` blob NOT NULL,
  `dt_creation` datetime NOT NULL,
  PRIMARY KEY (`code_img`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `parcelle`
--

DROP TABLE IF EXISTS `parcelle`;
CREATE TABLE IF NOT EXISTS `parcelle` (
  `code_parce` varchar(255) NOT NULL,
  `id_benef` varchar(50) NOT NULL,
  `ref_gps` int DEFAULT NULL,
  `lat` double DEFAULT NULL,
  `log` double DEFAULT NULL,
  `superficie` int NOT NULL,
  `id_fkt` varchar(255) NOT NULL,
  `status` varchar(100) NOT NULL DEFAULT 'active',
  PRIMARY KEY (`code_parce`),
  KEY `id_benef` (`id_benef`),
  KEY `id_fkt` (`id_fkt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `parcelle`
--

INSERT INTO `parcelle` (`code_parce`, `id_benef`, `ref_gps`, `lat`, `log`, `superficie`, `id_fkt`, `status`) VALUES
('PRC002', 'B-001', NULL, -25, 45, 6782, 'Fkt506', 'active'),
('PRC003', 'B-001', NULL, -25, 45, 4262, 'Fkt506', 'active'),
('PRC004', 'B-002', NULL, -25, 45, 3100, 'Fkt506', 'active'),
('PRC005', 'B-002', NULL, -25, 45, 21500, 'Fkt506', 'active'),
('PRC006', 'B-002', NULL, -25, 45, 8706, 'Fkt506', 'active'),
('PRC007', 'B-003', NULL, -25, 45, 2500, 'Fkt506', 'active'),
('PRC008', 'B-003', NULL, -25, 45, 4487, 'Fkt506', 'active'),
('PRC009', 'B-004', NULL, -25, 45, 5146, 'Fkt506', 'active'),
('PRC010', 'B-004', NULL, -25, 45, 4183, 'Fkt506', 'active'),
('PRC011', 'B-004', NULL, -25, 45, 4262, 'Fkt506', 'active'),
('PRC012', 'B-005', NULL, -25, 45, 6171, 'Fkt506', 'active'),
('PRC013', 'B-006', NULL, -25, 45, 4370, 'Fkt506', 'active'),
('PRC014', 'B-007', NULL, -25, 45, 4325, 'Fkt506', 'active'),
('PRC015', 'B-007', NULL, -25, 45, 14620, 'Fkt506', 'active'),
('PRC017', 'B-008', NULL, -25, 45, 4529, 'Fkt506', 'active'),
('PRC018', 'B-008', NULL, -25, 45, 5956, 'Fkt506', 'active'),
('PRC019', 'B-008', NULL, -25, 45, 5115, 'Fkt506', 'active'),
('PRC020', 'B-009', NULL, -25, 45, 14719, 'Fkt506', 'active'),
('PRC021', 'B-010', NULL, NULL, NULL, 5000, 'Fkt506', 'active'),
('PRC022', 'B-011', NULL, -25, 45, 1800, 'Fkt506', 'active'),
('PRC023', 'B-011', NULL, -25, 45, 4800, 'Fkt506', 'active'),
('PRC024', 'B-012', NULL, -25, 45, 3935, 'Fkt506', 'active'),
('PRC025', 'B-013', NULL, -25, 45, 4800, 'Fkt506', 'active'),
('PRC026', 'B-015', NULL, -25, 45, 1944, 'Fkt506', 'active'),
('PRC097', 'B-016', NULL, -25, 45, 7600, 'Fkt512', 'active'),
('PRC098', 'B-017', NULL, -25, 45, 8600, 'Fkt512', 'active'),
('PRC099', 'B-017', NULL, -25, 45, 3200, 'Fkt512', 'active'),
('PRC100', 'B-018', NULL, -25, 45, 4600, 'Fkt512', 'active'),
('PRC101', 'B-019', NULL, -25, 45, 8500, 'Fkt512', 'active'),
('PRC103', 'B-020', NULL, -25, 45, 7600, 'Fkt512', 'active'),
('PRC104', 'B-021', NULL, -25, 45, 7800, 'Fkt512', 'active'),
('PRC105', 'B-022', NULL, -25, 45, 6400, 'Fkt512', 'active'),
('PRC106', 'B-025', NULL, -25, 45, 11600, 'Fkt511', 'active'),
('PRC108', 'B-026', NULL, -25, 45, 6000, 'Fkt511', 'active'),
('PRC173', 'B-027', NULL, -25, 45, 3694, 'Fkt494', 'active'),
('PRC174', 'B-027', NULL, -25, 45, 1684, 'Fkt494', 'active'),
('PRC175', 'B-028', NULL, -25, 45, 6875, 'Fkt494', 'active'),
('PRC176', 'B-029', NULL, -25, 45, 6001, 'Fkt494', 'active'),
('PRC177', 'B-030', NULL, -25, 45, 3064, 'Fkt494', 'active'),
('PRC178', 'B-031', NULL, -25, 45, 1808, 'Fkt494', 'active'),
('PRC180', 'B-029', NULL, -25, 45, 2737, 'Fkt494', 'active'),
('PRC181', 'B-030', NULL, -25, 45, 2292, 'Fkt494', 'active'),
('PRC182', 'B-031', NULL, -25, 45, 4619, 'Fkt494', 'active'),
('PRC183', 'B-032', NULL, -25, 45, 3476, 'Fkt494', 'active'),
('PRC184', 'B-032', NULL, -25, 45, 3591, 'Fkt494', 'active'),
('PRC185', 'B-035', NULL, -25, 45, 1868, 'Fkt494', 'active'),
('PRC186', 'B-034', NULL, -25, 45, 5209, 'Fkt494', 'active'),
('PRC187', 'B-036', NULL, -25, 45, 6966, 'Fkt494', 'active'),
('PRC314', 'B-037', NULL, NULL, NULL, 5000, 'Fkt499', 'active'),
('PRC315', 'B-038', NULL, -25, 45, 2300, 'Fkt499', 'active'),
('PRC316', 'B-039', NULL, -25, 45, 3200, 'Fkt499', 'active'),
('PRC317', 'B-040', NULL, -25, 45, 5000, 'Fkt499', 'active'),
('PRC318', 'B-041', NULL, -25, 45, 2000, 'Fkt499', 'active'),
('PRC319', 'B-042', NULL, -25, 45, 3000, 'Fkt499', 'active'),
('PRC320', 'B-043', NULL, -25, 45, 1800, 'Fkt499', 'active'),
('PRC321', 'B-044', NULL, -25, 45, 3600, 'Fkt499', 'active'),
('PRC322', 'B-045', NULL, 0, 0, 5000, 'Fkt499', 'active'),
('PRC323', 'B-046', NULL, -25, 45, 3000, 'Fkt499', 'active'),
('PRC324', 'B-047', NULL, -25, 45, 3000, 'Fkt499', 'active'),
('PRC325', 'B-050', NULL, -25, 45, 3500, 'Fkt499', 'active'),
('PRC326', 'B-049', NULL, -25, 45, 3100, 'Fkt499', 'active'),
('PRC327', 'B-048', NULL, -25, 45, 2000, 'Fkt499', 'active'),
('PRC328', 'B-051', NULL, -25, 45, 10000, 'Fkt499', 'active'),
('PRC329', 'B-051', NULL, -25, 45, 6200, 'Fkt499', 'active'),
('PRC330', 'B-051', NULL, -25, 45, 4000, 'Fkt499', 'active'),
('PRC429', 'B-057', NULL, -25, 45, 1200, 'Fkt502', 'active'),
('PRC430', 'B-052', NULL, -25, 45, 2200, 'Fkt502', 'active'),
('PRC431', 'B-052', NULL, -25, 45, 4800, 'Fkt502', 'active'),
('PRC440', 'B-053', NULL, -25, 45, 7800, 'Fkt502', 'active'),
('PRC441', 'B-054', NULL, -25, 45, 7500, 'Fkt502', 'active'),
('PRC442', 'B-054', NULL, -25, 45, 5000, 'Fkt502', 'active'),
('PRC443', 'B-055', NULL, -25, 45, 2400, 'Fkt502', 'active'),
('PRC447', 'B-056', NULL, -25, 45, 1200, 'Fkt502', 'active'),
('PRC449', 'B-058', NULL, -25, 45, 2400, 'Fkt502', 'active'),
('PRC453', 'B-059', NULL, -25, 45, 1000, 'Fkt502', 'active'),
('PRC454', 'B-060', NULL, -25, 45, 1800, 'Fkt502', 'active'),
('PRC455', 'B-061', NULL, -25, 45, 2000, 'Fkt502', 'active'),
('PRC466', 'B-115', NULL, -25, 45, 3167, 'Fkt499', 'active'),
('PRC467', 'B-116', NULL, -25, 45, 6782, 'Fkt499', 'active'),
('PRC468', 'B-119', NULL, -25, 45, 4262, 'Fkt499', 'active'),
('PRC469', 'B-120', NULL, -25, 45, 3100, 'Fkt499', 'active'),
('PRC470', 'B-120', NULL, -25, 45, 21500, 'Fkt499', 'active'),
('PRC471', 'B-122', NULL, -25, 45, 8706, 'Fkt499', 'active'),
('PRC472', 'B-123', NULL, -25, 45, 2500, 'Fkt499', 'active'),
('PRC473', 'B-124', NULL, -25, 45, 4487, 'Fkt499', 'active'),
('PRC474', 'B-125', NULL, -25, 45, 5146, 'Fkt499', 'active'),
('PRC475', 'B-126', NULL, -25, 45, 4183, 'Fkt499', 'active'),
('PRC476', 'B-127', NULL, -25, 45, 4262, 'Fkt499', 'active'),
('PRC477', 'B-128', NULL, -25, 45, 6171, 'Fkt499', 'active'),
('PRC478', 'B-129', NULL, -25, 45, 4370, 'Fkt499', 'active'),
('PRC479', 'B-130', NULL, -25, 45, 4325, 'Fkt499', 'active'),
('PRC480', 'B-131', NULL, -25, 45, 14620, 'Fkt499', 'active'),
('PRC481', 'B-132', NULL, -25, 45, 8032, 'Fkt499', 'active'),
('PRC482', 'B-132', NULL, -25, 45, 4529, 'Fkt499', 'active'),
('PRC483', 'B-132', NULL, -25, 45, 5956, 'Fkt499', 'active'),
('PRC484', 'B-132', NULL, -25, 45, 5115, 'Fkt499', 'active'),
('PRC498', 'B-039', NULL, -25, 45, 9046, 'Fkt499', 'active'),
('PRC499', 'B-044', NULL, -25, 45, 5960, 'Fkt499', 'active'),
('PRC500', 'B-045', NULL, -25, 45, 9115, 'Fkt499', 'active'),
('PRC601', 'B-062', NULL, -25, 45, 12500, 'Fkt504', 'active'),
('PRC602', 'B-063', NULL, -25, 45, 7400, 'Fkt504', 'active'),
('PRC603', 'B-064', NULL, -25, 45, 20790, 'Fkt504', 'active'),
('PRC604', 'B-065', NULL, -25, 45, 1500, 'Fkt504', 'active'),
('PRC605', 'B-066', NULL, -25, 45, 8500, 'Fkt504', 'active'),
('PRC606', 'B-067', NULL, -25, 45, 1500, 'Fkt504', 'active'),
('PRC607', 'B-068', NULL, -25, 45, 14000, 'Fkt504', 'active'),
('PRC608', 'B-069', NULL, -25, 45, 4800, 'Fkt504', 'active'),
('PRC609', 'B-070', NULL, -25, 45, 4000, 'Fkt504', 'active'),
('PRC610', 'B-080', NULL, -25, 45, 7000, 'Fkt504', 'active'),
('PRC611', 'B-081', NULL, -25, 45, 1400, 'Fkt504', 'active'),
('PRC612', 'B-136', NULL, -25, 45, 11000, 'Fkt504', 'active'),
('PRC613', 'B-082', NULL, -25, 45, 3500, 'Fkt504', 'active'),
('PRC614', 'B-083', NULL, -25, 45, 3000, 'Fkt504', 'active'),
('PRC615', 'B-084', NULL, -25, 45, 4600, 'Fkt504', 'active'),
('PRC616', 'B-085', NULL, -25, 45, 24000, 'Fkt504', 'active'),
('PRC617', 'B-086', NULL, -25, 45, 14000, 'Fkt504', 'active'),
('PRC618', 'B-087', NULL, -25, 45, 8000, 'Fkt504', 'active'),
('PRC619', 'B-088', NULL, -25, 45, 1600, 'Fkt504', 'active'),
('PRC663', 'B-089', NULL, -25, 45, 5421, 'Fkt505', 'active'),
('PRC664', 'B-090', NULL, -25, 45, 7286, 'Fkt505', 'active'),
('PRC665', 'B-091', NULL, -25, 45, 5771, 'Fkt505', 'active'),
('PRC666', 'B-092', NULL, -25, 45, 1582, 'Fkt505', 'active'),
('PRC667', 'B-093', NULL, -25, 45, 4418, 'Fkt505', 'active'),
('PRC668', 'B-094', NULL, -25, 45, 6123, 'Fkt505', 'active'),
('PRC669', 'B-095', NULL, -25, 45, 6676, 'Fkt505', 'active'),
('PRC670', 'B-096', NULL, -25, 45, 5399, 'Fkt505', 'active');

-- --------------------------------------------------------

--
-- Structure de la table `participe_proj_activ`
--

DROP TABLE IF EXISTS `participe_proj_activ`;
CREATE TABLE IF NOT EXISTS `participe_proj_activ` (
  `code` int NOT NULL AUTO_INCREMENT,
  `id_proj` varchar(100) NOT NULL,
  `id_activ` int NOT NULL,
  `dt_integr` date DEFAULT NULL,
  `statuts` varchar(100) NOT NULL DEFAULT 'active',
  PRIMARY KEY (`code`),
  KEY `id_proj` (`id_proj`),
  KEY `id_activ` (`id_activ`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `participe_proj_activ`
--

INSERT INTO `participe_proj_activ` (`code`, `id_proj`, `id_activ`, `dt_integr`, `statuts`) VALUES
(1, 'P02', 1, NULL, 'active'),
(2, 'P02', 2, NULL, 'active'),
(3, 'P02', 3, NULL, 'active'),
(4, 'P02', 4, NULL, 'active'),
(5, 'P03', 1, NULL, 'active'),
(6, 'P03', 2, NULL, 'active'),
(7, 'P03', 3, NULL, 'active'),
(8, 'P03', 4, NULL, 'active'),
(9, 'P05', 2, NULL, 'active'),
(10, 'P05', 3, NULL, 'active'),
(11, 'P05', 4, NULL, 'active'),
(12, 'P06', 2, NULL, 'active'),
(13, 'P06', 3, NULL, 'active'),
(14, 'P06', 4, NULL, 'active'),
(15, 'P09', 2, NULL, 'active'),
(16, 'P09', 3, NULL, 'active'),
(17, 'P09', 4, NULL, 'active');

-- --------------------------------------------------------

--
-- Structure de la table `participe_proj_volet`
--

DROP TABLE IF EXISTS `participe_proj_volet`;
CREATE TABLE IF NOT EXISTS `participe_proj_volet` (
  `code` int NOT NULL AUTO_INCREMENT,
  `id_projet` varchar(100) NOT NULL,
  `id_volet` int NOT NULL,
  `id_chef` int DEFAULT NULL,
  `annee_integr` date DEFAULT NULL,
  `statuts` int NOT NULL,
  PRIMARY KEY (`code`),
  KEY `id_volet` (`id_volet`),
  KEY `id_chef` (`id_chef`),
  KEY `id_projet` (`id_projet`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `participe_proj_volet`
--

INSERT INTO `participe_proj_volet` (`code`, `id_projet`, `id_volet`, `id_chef`, `annee_integr`, `statuts`) VALUES
(1, 'P02', 1, NULL, NULL, 1),
(2, 'P02', 2, NULL, NULL, 1),
(3, 'P02', 3, NULL, NULL, 1),
(4, 'P03', 1, NULL, NULL, 1),
(5, 'P03', 2, NULL, NULL, 1),
(6, 'P03', 3, NULL, NULL, 1),
(7, 'P05', 2, NULL, NULL, 1),
(8, 'P05', 3, NULL, NULL, 1),
(9, 'P06', 2, NULL, NULL, 1),
(10, 'P06', 3, NULL, NULL, 1),
(11, 'P09', 2, NULL, NULL, 1),
(12, 'P09', 3, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Structure de la table `projet`
--

DROP TABLE IF EXISTS `projet`;
CREATE TABLE IF NOT EXISTS `projet` (
  `code_proj` varchar(50) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `ancronyme` varchar(10) NOT NULL DEFAULT 'PRJ',
  `dt_deb_prev` date DEFAULT NULL,
  `dt_deb` date DEFAULT NULL,
  `dt_fin_prev` date DEFAULT NULL,
  `dt_fin` date DEFAULT NULL,
  `duree` int DEFAULT NULL,
  `logo` blob,
  `statuts` varchar(50) NOT NULL DEFAULT 'En cours' COMMENT 'brouillon, En cours, Décision, Fermé',
  `numero` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`code_proj`),
  KEY `numero` (`numero`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `projet`
--

INSERT INTO `projet` (`code_proj`, `nom`, `description`, `ancronyme`, `dt_deb_prev`, `dt_deb`, `dt_fin_prev`, `dt_fin`, `duree`, `logo`, `statuts`, `numero`) VALUES
('P01', 'CTAS', 'centre technique Agro-écologie', 'PRJ', NULL, NULL, NULL, NULL, NULL, NULL, 'activer', 1),
('P02', 'AFAFI SUD Lot 1', NULL, 'PRJ', NULL, NULL, NULL, NULL, NULL, 0xffd8ffe000104a46494600010101012c012c0000ffdb004300100b0c0e0c0a100e0d0e1211101318281a181616183123251d283a333d3c3933383740485c4e404457453738506d51575f626768673e4d71797064785c656763ffdb0043011112121815182f1a1a2f634238426363636363636363636363636363636363636363636363636363636363636363636363636363636363636363636363636363ffc000110800d600d403012200021101031101ffc4001f0000010501010101010100000000000000000102030405060708090a0bffc400b5100002010303020403050504040000017d01020300041105122131410613516107227114328191a1082342b1c11552d1f02433627282090a161718191a25262728292a3435363738393a434445464748494a535455565758595a636465666768696a737475767778797a838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae1e2e3e4e5e6e7e8e9eaf1f2f3f4f5f6f7f8f9faffc4001f0100030101010101010101010000000000000102030405060708090a0bffc400b51100020102040403040705040400010277000102031104052131061241510761711322328108144291a1b1c109233352f0156272d10a162434e125f11718191a262728292a35363738393a434445464748494a535455565758595a636465666768696a737475767778797a82838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae2e3e4e5e6e7e8e9eaf2f3f4f5f6f7f8f9faffda000c03010002110311003f00f40a28a2800a28a2800a28a2800a2aa5dea10daba46c4bcce70b1a8c9fa9f41ef541cdfdfcde54acb6f1aa87314527cc79380cdefce40f4eb43d00bd73a9d9db48629275330ff9649f3bf6fe11cf71555353bbbb674b4b068f6a93bae9b673918f9464f3cfa74aaeb0c5246a96dbed2485d44891e79c91d71c139e3273dfaf5a9a1bc65bc8e1bb0639586df66e3839f6ce38ee7f2cfda2b8b5076bb7bffb34f7cf1ef8c1416f1aa8ef9fbc18e7a771dea3d42de2b4803cd3ddba3b00e5a77e0f63c300391e9f9549a8425ddaea20825b739ddbb69c000e0f1cf1fe1dcd17ee2f74532c48ccd80c8146e65607b7b820d2737a85872e8ba7ae58dbef246332b349c73fde27d7f5ace86c2c9e4962d91097cc31a0fb3c60f03393f2febee2b692579655d81963c1ddb90824f6eb55628a587cd7301965f359a36e3be38e4e7ffd5ed44a4c2c87c7a35943feaa3961c64e239dd0739cf423d4d549629edf504b7b4b9bbcc8849dd3ee0b8ff7d5bd87e35b3f37e0063dcd6689e337f733bba048136e78c9cf38cff9ce6aa5263b21a97b7b12c6e248a78d9b66d9d0c726e3d1495c8cff00c040c63eb5326b50a656f6292d5d4e1891bd01ce3ef2e47e783496168563124a181695a4db9c0048c67dff00fafc8cd57b31e7c3737a158bcac447bc11b78c0191d3938c8ffebd2537d446d452c73c4b24322491b74646041fc453eb9cb250f07981122bd8e6f2b746fb59f18e18e0e78072083d3db8bd1ea52db48d15faab0538f3e107038ce597aaf1ce791f4aa524c2e6ad14c8e449503c6eae87a329c834faa1851451400514514005145140051451400514532591218da49182a28c927b0a0071200249c01d49ac6bed4a49032dbb3c30a922498282c4639283b01fde3c0231d694f9dac02edfbbb12084461ccbc1193e8a7231d0ff0057e9f796f71b13ca10ca8b8542b8c2f1d38e98c7e953276d05b95e3b3f374d93ecc830e37c651c966c7203127939e324f1f8546b76c2eadef36fee48304c42e583678cfa738c75fd6adc0ad637b245867b79cef539c956f4fa7f9f53550dd04bf9ff00b301bb964c3148c011a9e84b3faf0703ff00ad59f2b906c5df2a26bc92eb2be43c1f3b83f2b73d739c7007e19aaf26af692811a23de4e9b58adb216e7aeec9e31c0ee69cba43de15935893ce656cac08710a1edc753f53eb5aa91a471848d42a2800003815a28a41ab32d1b5699f296f6f66ac4ef323995fd880303f5a90e9d75246126d52e49ee62544cfe99ad13dc6734bec78aab858cb8f448d49f36f6fe607aabdc363f4c50ba058249be38e4462064acd20271f8d6a1ff3c5079fad1763e54650d1ca3663d4b5051fddf3b23a63b83eb4e367a9a4a248b54dc839f2e681483c772b83d6b4bd0520c13907aff9eb45c2c64cf77791c4f1ded9ca17e5026b43e6673d4ed2323f2a934ebeb59ca436f731384dc3672ae5b3fdd3cf03a9ee6b508c8eb54ef74cb4be18b8855987dd71c30fa114ac98b54558912d2e6fa6d842a364003ef3119efee4f7ee6991a15b6b96ba2ead361b792495cf0a147a83ce3e9d3b25c5b5e5b261c35fc0a0e1f8f3e21df1c7cdd3a7539c735249736d7f02b42eac892869c13828067ef0ea0f1fa5652835aa0b8d4478a3fb5da22dbf9854042df2be48c6e519c127b8e79ef5a5677c9745d363c5347c3c527de1efee3dc5675f5c2cd2a410b0f2e360f2c81f0aa01fbb9fe9f4a85e37b86fb44afe4191c2c0c07cea7b77e9c723d738e80d38cfa303a1a2a858df34927d96f104374bfc39c8907f794f7fe957eb51851451400514514005145140084800927007526b9fbbbc4be6f3a68a67d3e29368551c48c091ce7f84118f424e3d736f51f37519bec30e16dd4ffa44b9ff00c717d49efe9f955f58a358446aa04606d0807006318c50f6d05b9930dfdb433164de8ae72e8e091924fcc08c8e7d33d31d3bcb3c16b387f32440a8a644906311e792d9e99c8279e3af5e6ad4b8855bcf01edc02cccd8c2003bfb75e6b3aded57566134c8469c841b780a851263f8c8f424f00f6e71592837b809124daac62141245a780034cc4892e57d07751ea7a907b738d7b7822b78845046b1a2f4551802a4c007a9e7d694e3a0eb5a790580e33e9499c0e7fc29382dc9cfa7b529c0079fe98a062e07719a51c0f63fa527534a4e067fc8a0033ed4847d68cfbe0529c71db9a006e01e08a5c63a727eb47f9e6949ce3046280007b9a4e3aff5a0f6cf534679fe94001e9fd2b3efb4c8ee255b8858dbdda9cacc8393ecdea3d8fa7d6b4391d79a0f1d4fe14058c2328d42e12cafc1b79a220b4408d9377dca7a91c73e9cfa66a7b2b58962fb4dc45b1d6462aa09c273d00079e7918ee47d6ae5f59437d0f972ee041cac8870c87d41f5e954ad659bed2d6976c0de451928c3849549fbf8ec463903d4e38a89416e84b409d65bf9a44de6211fcc8e9d51f3c1cfafa81ee0fa9bba65e493a3c372156ea13b640bd1bdc7b1e3f3aa0a8f6c8b6b6d3196676cb3673dc7cc793ce07d39e413806592c2682149ad9ccb75092c37bed1273ca9fccfe27d09c90974606c5155ec6ed2f6d5674565c92acac305483820fe22ac56830a28a2800aa9a8ddfd8ed4ba8dd2310b1ae71963c0fd48fceadd62bde4736a7e6c8d8b689fc98ce786908f63d074fa9f6a36023b71159b79534ac84664dc5f689189e7938ce31800f181f96a2dca32a31575de7003291838e87d299796d0dc42c658fcc2aa40da3e6c1ec0fbe071dfbd6448f7461d90de34c6edf65b12aa0a291967f5f94123fcf197bdcc1b1624c6b570d1237fa042d8978ff5cc3f847b7aff00935aefc21c1c103afa5476b0456b6d1c10aec48c600a74c710b9ff0064ff002ad4473d35ed9e9b0c0d3fdaa4768558b2ccd8e87b6ef6edeb554f893490e46cd43715c8c4ec7af38e1ffcf4a76ada3cb7eb0b795360411ed78b676dd904330c1e474f5359ede12b92738b919e4811c447bf597fce2b65cbd4c5f35f42e7fc243a3b6d0d1ea5b73c1f3dc0fc4eff00e75b0d1fcbcd86a7803a8bc1dffedad73c9e16b9000945dba8fe1f2e2e87a819908c9fc71d6baa6bbb931951a6dce71c65a2233ff7dd4cadd0a8dfa8cd3b6fdaa431b4c627822911659198a925f3f789c741d3d2a7d4a4912d0795218d9a58d37000900baa9c0208e84d41a7c6f15cba4870cb6d0a91d811bc1a9b54e2d53b7fa443ff00a352a3a9a742bdc47242501d42f59dce0468911638ea7eef4a6aa5c648f3b51c72798e1c0f5fe1ab4c41d5e118cfee1f9ff81255ce09e290232945cbab1371a921cf78e1fe8a697170495fb56a20819cf970f3ff008ed6a7b5737aacaf05f4bfbc2bc2b27ef3000f5fd0d44ea28ab9a53a7ccf7b1749b8c02b73a939f4f262ce3f151efc53d44fb997ed3a8e4639f2a3c1cfa7c9f87e14cd1b511709e5cec04db98f7e79c9ebf5fcb15ad9fa63eb5519a92b91cad1961a40c824bebf40c76e5e18c0078c73b38cf4e6a78fce87528a16b99264789dcef0a3054a0fe103fbd4ed547fc4a6f3807303f5e9f74d1273abdb1ede44b9ff00bea3aa1173f4aa5a8d97dae10637315cc44b4528e4a363bfa83dc77157402073cd0471c9c548ccad2ee0caae4c6915ceeff48427051bb718e41e4839ee7934f5696f2e55434891c2e4c9c11b8e700023a8eff43eb516ad10b5b88f5255f9507977180798c9ebc64f079e3b52fda3ec117d92da2967b8ce13e538e7a313e8323dbb7159cd6b7e82410dcc16fab3189c3c5758de54e42b81d49f703dbee9ea4d6d561dc4370d1992f25dbbc0f9107cb1639dc4fd403f862b434bba37566a64189532922fa30e0fea0f3ed5717702e514515432aea575f62d3e6b8c02c8a4a8ce327b0e86b28da4e74c8e38a0b79a48d4a9663c96270f82318e73dfb62adeaee1ee2d6dc8dcbbfce75ce0e1482bf5f9b68e3d6a0305ec2cd35a640662cd0c983924839073c0e58f04544f6b088ad7cc8c62db742c0fcd6f31240008ce327a0c93c75c8eb53691109a592ff6e11c7956e3fbb103c1e80fcc79efdaa2d46599ec8b4b1c70cd30fb34597dd92e402781e8323e86b5634482148a350aa8a1557d07614415907524073d38ef51dc866b695558066520123201e7ad4a0127279fa5366c089f391853d2a96e3666c915fbdbda0b19b6208be72ce1589c0c1e51bdff00314d16fab679b8f97da64247fe41a9e2bc2a1208ede499962472632b800e40ea47f74d48d7738e7fb3ee4fd1a3feaf544d8a6b6fab8eb393ee664e3ff2153843aa2af33331c8c62543c7fdfb156cddcf8e34db9ffbea2ffe2ea35d4b7e765a4ef2ab3298c6cdc00ef9dd8e723bff002340582d048352b8f336eef262c9ec4e5f3c7a549a9ffc7ba647fcb788ff00e445a65a4eb35fccf190c8f0c4cadea0eec1ff00f5d3b5303ecc9ff5de13ff0091168ea3e82ba8fed5889277790fff00a127f855beb555bfe424840c910b77eb92bfe156727b526340738e3ffd55c7ca0dbddc90bac8c5739c904b1e49651d39e7fc902ba0d62e1a2b374432a348a42bc7fc27ebdbff00afc562c56d3c5209e594c084ee1bc83ce3b2f5edfa572d6d5d916a9ca44b7b6a2d16d5d729705433f39390057451bee8d1882b900e0f6e2b16cec0ddc86798b18cb6e2641cc9ff00d6adcc67a71574d35a9ad569250ec54d57fe413785b04185fa8ff66964c7f6bdb1e87c897ff428e8d57fe415760633e4bf5191f74d249ceaf6d8ff009e129ebc7de8eb747332e8233c7347079c7f8d21ebd6933d3dbad2281d164464750cac08208c8358f6521b113d998bcc9ed546ce7e6962e76638e71d0f15b1d783cfb7ad666a920b2bdb5bdc80a0b40ff2f2430ca8cfa6e51f99a1ea84c86e5849f2ea971e5ab9045b210463df1cfe1ebc8a96caea15d4d4c6c447729b30c0801d33ebd49071efb7a9c536deeeced5435c164b971b9f7210416e71e8064e3fae4532f649e4862bb91443e4cc1a3561ce06edc4f6fbbcfe1deb283d40dfa2915832865390464515b01912324fa85d179238ca32410c8719df80e5473feef1d783ed489a85dc6fb27b190e091be219cfb81c8efebfcaa089dbcd9a68edfed0925d3c836e415daa1738c75c83c7f90e4bf411cd1dc3dcaa962a0cb10561ee08f43dfb0c563397bd61215bcdb8d56cd5d1a310235c48806572d95519f5e58fe15aa1431dc79fe5599a5c528d42fe495b7e7ca8f9273954c9fd5bf9f02b597dc56834457338b584c8519f1d94565cdadc32c0d1794f975231c77e2b64fbf4ac0f1044892c522a80ce18311deb2a8e5157474e1e309cb964860d4230eb22bcf1388d637daaa77633eb9f53f9d3c6ac41c0b8b838eb98d3fa0ff39ac727a0cf27b7f9fa5755636d0fd9216f2d37140738f6ace9d4a937b9d15e8d2a2968667f6b92dff1f3718cf431274a8d6f6cdd584d1dc48ece5b721f2c807b7cadd30067d715b32e9f6b2821a14c9ee0609fc6b9ebeb17b2b8d858bc6c728c7d3d3f2a7395586a452850a8ed6b336ade78925b99d788d618c845e814063d3fcf6aad75acc13461024abb64462481fc2c1bd7d2ad69ad9660483fba8bf91e6b3f5cb21138b88f85638603d7d6b4ab2925cd132a10a729f2489bfb62dbed82628f8f2f6f2bc8c9e7f97e82b623659503a10cae320fb5716795e78c7b66b5f47d45a35100824973ca2a9507dfa91fa5674ab393b48df1185508f340dd9a249a268dc6558631d6b11e5d3ec2ecac914d348b800b60851edcfd2b445f5c1ff985ddfd37439ffd0ea2b895ae10acba55cb2f3c968b8ffc7eb7942fb1c94e6a2ecf61835eb5c7114d8ce3ee8c7f3a9db54863b34ba28e51ced00019cf3fe1585a7c38bb224b579cc6326352b907f1603f5adc37736ddbfd997247a6e8bff8bace9f3c95d9ad754e12b229df6b16f7161710ac7203246c809c63247d691b5885efe19f649b6389d08c0ce49423ff00413fa551d4e32b701c5b4b6c1870ac50e7fef927d6a9f38ebf813594ab4e32b1d54f0b4aa43991d226b76f2c8b188e5cb1007031fcfdeb439ed58cc975a7c09128811243b4dca23314f973b997900646324fa1e94ed3629ae6d12e3fb4e72ce49f93cb2319e38da70718cfa735d518bb5d9e74dc79ad046b93c01d49e79aa7abc0d3e95711a175709b97675caf231f8814fb0b8371016dfe6aab955947fcb403bf1c75c8f4c824638ab24939c0cfd7b53d88dd198925c6a0b0490cbe443244b21da01625b3919e9c7144965a7c47333e6503abbfcc01c83d3b63bfeb50d903159a4696cb71e5cd346570014f9c9ea7e83bfa539e4bd726de16b681c1231df1db00679c60d652b290234749919f4f8d646dcf1968989ea4a92bfd28aaba4de44b04be61652d2b3ae4672ad86078f63d28ad807e8b8fecd5618c3bbba9ce720b920fb8c55d91124465750c18608f6ac1fedbb5d1b46b212248e4c5b55571c95c03ce71d4fbd5ad235fb7d56531431491c8a9bc87c631d0e08a6e2dea4a92d8934569245bd79327fd2e4099f41851fcab4fb122a8690e1ade5504929712a9faef27f911fe455fcfad27b94b611b9ce6b0bc49c8b7c67a377fa56efd4561f88fadb81fed67f4ac6b7c0ce9c2ff001518830073f8d761643fd0a0f68d73f9571fc8c60f5ef5d8da645a4393d1067f2ac30dbb3af1db21b3dca433451329265270719c63ff00d755b5c883d86fe331b03f9d56bc97cdd6e08c124478fa67a9fe95af222c8a51d4329ea0e08adefce9a38ff86e3228e96402c0051fbb8cf0304fcbfe14dd7f8b05c9c02e073535a845bdb95442bb762e31818c718ff3fcaa9f88646290c6a0ec04b3107a1fe11f43c9fc2aaa2f71a268bbd54fccc023036e4e57a8c74e9c1fcc7d695188c6141c7661953571ad25934d591ad65f30ee769494c15e83be7a05ed5480c0031db15c1522e9b47b14aa2ab1773696fb45f2d8bdb2064dbe6016c582e7a6485c76fcfde952fb41b890c51c6b2bff00756d9988fc36fb7e95996b2324be5aa312ef1920632db5d580e481ebdeb66e1e5ba92dc0b29a2092336e678f9fddb2e061bae48af4294d4e373c7c45274e7632ece7d3e3b991ae30606e62531b30233c71ff00d6abc2ff004381987ce87904791271cf3c01c74aa56a92b25e4096eed23c4530a53e43ce33923bfa56ac0d2dbabc674f9653e748c195a3c10cec4632c3d7bfad14be11623e3fb8ccd49ed24587ec91b04009c98d941e7b1239ff003eb54549c8c74ef53dec061b88a2282364b58f2320ed3b9f8cfb557078e7afbd71565fbc67ab85fe0a3b0b5b88ee558c65be46dac19194a9c038c1008e08349358d9cefbe7b68647e859e3563fad63e93298e481fcc8de319b694c6fb9063e68b07d006dbdb2580e6b7f233cf515e86c78bb81000c0fc40a420761fd29c09e4520ce3a7e348664e990626bd562c0c578f20ff8128c7e8c45699890c7b390b8ecc471f515996d38b6d4357b89e4096cad1f27a021067f98a5b7f11697712ac51dce5ddb6a828c3712471d38e48a6e37d494d2294f3db5a5fdd44f3c517cebb558e303628e99e9c51597e2fb7f3f58565121c44a0e158f393e9451a08e8b49821b8d33cb9a149104d2fcaca181fde37ad5f86da0b705608638b3d42a05cfe55416f7ec7f6f6915cedba2114e79ca2b77edc9a8d6e355ba198a25895bbe071f9ff8544a767636852725727d222f266d417919ba66effc4aa7fad68fae08ff000ac9d37cd8756bc8ae1d0cd3247280b8e401b09e9cf41f9d6b907bd5b77334ada07d6b0fc45d60cf521fa7e15b9deb0fc463e6b7ee46efe958d6f819d385fe2a30f71c8c007d78ad53ae4896eb1c710560a006273fa566364b038fd6ba5b6d36c5ada33f6588314e582004f1edd2b968a6ef6677e2a508db995cc4d3dcbea31b311b8be7245757d7a63fc6b998ecd62d5c5bca19933c6e1c30adc3a7599523c88c038e831fe7e95d141593b9c78b9294938ed612d4e6f6f39e7720c93d3e41c63b75fd6b3354fde5b4b707f8e728bc7202647fe85b8fe35b70c31c20889428272428c76ac6d5ac2decec635803aa871f2991980ebd89e2b5a9f0330a1fc488b15b42f69133e889392a3e6db165bdf93fceb36eece5b4daf221412676af5da327e5e3d07a7ebd6b72cec6292ce172f7196407e5b8900e9d8678a5b9d2209622374db864a9799d803cf6271dea27153858d295574eadfa1cc8c1201ad4b1b78ae9216b7b582296166deeaa14b031b28e9cf56fd3e959ef1b24851fe56070696094453a96f34229f9fcb764247d460d72d1a8e12d4f4b1149568684d05a198dcc09688f26d2a85b68117a1c1ce3071d3d38ad35b244f3049a54739695df77c872199883f31cf4207b557d32d629eea752f36d4395293ba9c64f520827f1ad3fecdb707fd65d74c0cddca3ff0066f6aeca4fdd3cbc4af7cc1bfb692de5b70e9b545b471e01e0152d903d86476f4aaa08ddc91f4f5ad2d66d920923d8d2b641ff00592bb91cf6c938ace03d38e3f2ae3aaef519e9e197ee51ab636172b2ac524572b13c2622ce6322308d98d971ce464f5ef8f4ad8b1b8fb4c1b986d9118c722fa30ebf8771ec4546ba7418cefbaffc0a97ff008aa92dad62b66768f793230662eecd938c67927b7f4af42f73c5b6a58239cd20c82719fa52819c1eb8cd2310aa4b1000f5e0521997a6c3e7c5a82dca6f496ee4186e4328c28fe5fa52dbe83a65b4cb2c56a15d4ee0598b63d3827f2acc86f2f60b182401a2497749f738cb331cfe441a9619efeea630c7721895cee5f947f2eb512ab6958d6187728f331f716e1b50bb678f765d7071d46c5a2b534742904e4e7e6b893be7a363fa7f8f345686162a6a168d717f341bb0b3462552070197e539fa823f2f6aa573f694023b8d45140e088d8961e9c0ad4d7542c30cef9d914803fa6d6f9589fa0627ff00ad5877d0dbc1218a10efb4fccecd9e7d0573d6565cc76e15f33e526b178e3bcb69a3662033432129d43e0af3db0ca3aff7aba500f6fad72d33c8fa73dbc56fe5a95dcae7ef338e508e9ce40ae8ed2e23bab749e16051c64735a5377898d68da6c9fbd61f88c00d6e4f5f9bfa56e73e9587e22e5adf3cf0d9fd2a6afc0cbc2ff1518846d23381dfe95d8daf36f1e0f1b47f2ae398b039cf5fad6a5e78aacac5045062e6650010a70a38e7e6ff000ff1acb0a9b6ec7563dd92346ea063ab5acaa188c10d8e83d3f9d68310aa4b1e0739cf4ae22e3c49aadca3490208625392d12862a3b06272067ffd439a4974c98c36f737f78ef70ea18c0e0b10a4920127a76e31d723deba9c1413948f3e33755a8c4e8d75db559661753450a27dc2cdcb727b7e1fad52d4f58b0bf8960b69bcc90364a9465c0c1f515517c38daa4426fb5794bd02ecdc319ce7a8f7a65c786ffb336dc8ba1202f80a232b8e0fbf403fc8a8d1d2bbdcd52e5c4251d8d087c4fa75b4496ccd234b1c6010b19e4f4206714278c34d77da56e138fbdb477f6049ac1d4f41b8b680ea11b2cb148a1994e415ce7b1f73db9f6eb57ec3c1ac6056bcb96472002b1e4e07619f5efe95bc630e55739272973b489351d4b4ebc991ed675676c86050afa77231fad542483c107e9578f826d91d5a1bb994839195195fa631df3ebfe305edab5a4ed13fcd8030debe9c570e269a4f9a27ad81acdae491a7e1d1fbc9c9ea40edf5adc1c671eb5c44da6cd7d03cf049b24b61bf001c9f5c7208231f9e2a18f59d674b489ae25f32194128d261c13ee793f87635d14217a68e3c64ed599d0ebe009a2c8e8bfd6b23191c73c1a3fb61f575596480214014956ce4faf3c8fd6908e4feb8ae3aaad519e9619de8a3b5cf028079e062906314a7dbfc6bb4f200fe3cd67eb4e46992c28544970440bbba658e0e71ed9fcab47b5636a578916a5129decb6ea642a070ce78519f5c64d3bdb562b37a220335ddc79905880b042022270723a0e4d416fb2199e5903c4f029919471bb68e714f7223996e209c42f2e4ed7edffd6a91ace737512cf28696e187dd1d157049fcf6fe66b9e2b9a573ba525083b1b5a746d1d842b236e72bb988e993c9c7b73455aa2ba4e021bab74bab5960907c922953583b67648dade046ba1959a42a37075c03d7eee473f8f6ae92b26f37d8dfacd08454baf91c953c4980109f6edf8d4c95d58b84b95dcccbcb5f24a9ba90cf70ff007507a55bd35e4b2bb4b6b80516e81963cff0bf575fc7ef761c91505bdb5fb4c6610e6463f7e5edf8532f5662bb2e6e55ee1486882f48e41f7589ec3f3e3358537cafc8eaad173564eed1b9797496918770cd96db85f5ae6f53bf6bd941dbe5a2f033e9ebc7d3f4ae834ebc4bfb35942946c90f1b75461c1535cf78e657582da15e118b3b10a7a818033f42dc7ae3a56b2a4ea3e5b9852ad1a3ef35a94f244800cfd2b325d29ccac6195555d8e7839eb9fc4fe5fceb2dc6d00838c82ca49c135b7e19b38c4b26a571b96decc1739e8cc3a0f4f7faedf5ab861a54758c8aab8c856b2943f12dfddd3e0b4072ab279b316c9131e30083fc3dbf01d2a596596590cac4bb93924f39ae8346b5923b76b8b83bae6e9bcd7e3a7a2fae00c715a3b549e82b1a94a53de4694b114e9af76052d3dbecfa423be48542dc0ea3b5646a9a98bd54554c460e7e6ea7a8ae97008c534c6846368c7d29ca9b6b953229d68c65ced1cd9d409d37ecce84b232b2b75070c0e08fc3f5ae9c1ca822b3f58891b49baf97a44d8fa81c7eb57d0fca09e335718b8ab3665525194af15614648e78f51d6a86b167f6ab6ca0fde47cafbfb568123d38a424638ef4e51e6561424e2d49189e1e04bcfdf017f99a6ea56905bc72dbcd13359cf9652ad930c9ce719e80fb7bf1835ad0dbc50bc9246bb5a4396393fe7bd3a78a39e231cca194faf6ff000a508b846c8bab38d4a9ccce22cadcdbc3b1d8364e49ee3d3fad585200c804e78c7b55ed574c7bcd3da3555fb6da9ce506df397b71eff438208f7ae39a4939572400430049cf4e07e99a9faacaa3e6723658f8d28f2a8e87a2596af1ccb1a4c364a485e0121be9e95aa31dabccb4dbe16f7d6f3190b04954b6e1ce0f5ea7b638c9cfa76af4c1d335ab8386e7239c66ef14417b751d9da497131c246326b06389e77113366f1dccb23f50ad8e13bf0303b9fd6a7d4ae96eaf0286c5bda3f2e06434d83b467fd9ea692dec2e0c02e619ff007a493c1ebcfaf7fc7d6b2a8dfc26f462b59bf911dcda7918496269ee241f7949c2fa76e6b43484692e19d998adba08573d370cee23e99da7e955ff00b52e160686484add965890a8fe26ef8e7a0c9f7c7bd6cda5b8b5b648812768e49e4934e9c52d50ab4e4fdd913d14515a180541796c9796b2dbc9f76452b9f4c8c66a7a28039e9efaea3b2f25a406e223e5cec06181ecd8ec18739e9cf06aac766c25447cbadc47f2c89ced3eb8fc6b6356b1f314dd5bc0b2dc28dac84e3cc4eeb9f5ee0fad6579af35b7d9ecc916c465e476191ea0fa11dc7b561561af31d742a7bbc8b42282e1ad66596dc89a641895233933a0e98f52b9c8f51c7a54be27b71aa68d1deda309162fde120f053b9fa8c67d7823155208de58d4430952ae4f9dce00f7356d2e1ac257974e6173031f326b60b87079dcc9ebfee9f4e3b62a854ee4e268db5470e11fcc8a350fbf3b42a8e49f61f53d3fad769258259d959e9724570d0644970f0c6cc188c7cb951ebcf63851ea2aaea9e1ab7d4625bed1bcbf9b9f2d0ed56e3b74da7d47f93cc5d43359b1867578e551c2b0c739033fa76fa8aee6f9f63cdf84ef0b59a657cbd57190739b8393cfa7a50cf6c46d16faaf078f9e719fc7777fcfd6bcf954edc29c9392bc7b7f80fe7492611c700f5e3b8e7bfe1d3eb4bd90fda1df09a12db56cb583b79c992403f0cb8cd02584c863fb0eacc4707fd21883f8993f4ae054ef1964e01e4280003fd0ff008546ee4927e5ce724818e69fb21f39dcea32ca6c674b186f8b48857648c274604118eacc3be3a0cf069f6d76a20885e457aef81c348b02ae07202332e40ce33cf4fa570a4949386e393951d78c5284760ccd96620364e7247f9c51ecc5ce77714da48385d31013dcc9013efcef3fe4521b8d2949074d5527823cc807e1f7eb831b4310d8e9f28270076fd28543b091c7d00e99effe7b51ec839cef7fe256c703491c8cfcb2403f93feb4a9fd9ca72ba5601cae4490e3a76f9fd0ff002ae094ec57e98ce01f423b83f85398e094386cf180bfaf1df9eb47b20f68772a6086449ac2c258e746031e7c58707194387e78e9d7900fd72fc55611acbf6db468dd246c4a8a41d8df51eb9c7e55cc6766dda49dbc1c76e73fceb534ad12f7569415431db647ef5f21719e76fa9e3b7d38a3979756c39b9b444be1cb192ff578be5dd1c4c1e43c15c0e838f5c1c5765aa5e3bc874fb493cb99d774b3745813d73c727a01f8f18aa918b6d191ec74c412de361e4790f0a3fbce7b2e33c0feb9a55b28a4d32416d3fda272de64b274321e7b0e83ae074ac2acd5ee6f4a9bdba11cef269b18b38e18fecc38556190c3d73dcf7a8ed0dedbc86482276576fba32ca7f5a8a29a45448509955f83130ce3ff00afd4f1e95674e8e69a6fb35b192389b0d3e48fdda1e801fef1c7d40e7d0d7146f52573d39da953b58d1d3835fdebdec8a3ca8730c43a82c0fcec0f719000ff00773df8d7a8e1863b785628515234185551802a4aeb3cd0a28a2800a28a2800ac7beb336eed341b85b4b91711463247fb400fd78c91f415b14500b4d4e6d64487658472466096327ce07a939c1cfa761552db6f942738436cfb89c7decff3e95ab7fa5244c67b783cc8b2cf24009c927a95e783eddff2229c566b773224191668739cf248ea0f707ebc8ae69d369e876d2ab16acf4218e492398dfc4eb0dc49c98598849d7d71d15bd0f7efc66b4a39ac358022bab6513a293e4ce837a67b8cff0031ed55f57f2e69e1b38114ca300607dd1e9c541736f1daa886f82dc2e73100c4327b83d4741d0d5c6ab4ecfef3395152578eefa0b77e0fb19726da5960391819dca3b719e7b0efff00d6c4bbf075fc284c2d1dc2f41b7e563d3a83f4e99ae82cefeea11b54c97f0a7247027400771d1fb74c1e6b4a0d56ca797c959c24a081e5c9947cfa60ff004ae98d47ba38e5492767a1e7834cd40609b0b85ddc3314603e878ff3f8f151a15dc148642c76e08e7be303df8fd6bd688f51f8d040239ab559f523d91e42a064f38da0e483c7d3fcfad3d5ce24c646d20056e7fcfbf15ea93d8dacec4cd6f0c8c7a968c3123f1a8c693a764b7d82d813ff004c569fb617b267966c53312547248dc7a13eb52c71cd704adbc7248411c2a938e3ad7abc70c510c471aa0f40b8a760014bdb0fd91e650e83a9dd79812ce75f9b9f333183d79e7afe19adab6f05cc557ed7748814e36c6a58e33d98e31f91fe95d84d2c70465e5912355eacec00fcea84bab2be458c2f76c0e0b0f962520f3973c71ed9349d593295348af6de1cd2ec90bc9179c532c5ae1830e33d474e3d714b73a835d46cb64fe5c0a7125d32923ae3083f88e78cf418ef9a866286e106af334ce3e611c6b8850f047bb723a9cf53c53d2669a59eca770cb202626032b8edf971f9573caaa5a5f53a2145bd6d64559e38cd90364c4c009338272e589fbcc79cff00f5bf00cb6b9fb2dd35cc507ee0e5396e87eb51c1e689435bc4e665187c02411ffeafd6ac590b892e592c4059081e6023e58b39c93f9703af7e9d799734e573ba5cb4a167b124418dd96b0c2cf70a4a4720c041c65cf5e071d3a938adcb0b186c20f2e204b31dd248dcb48ddc93eb4b636696509457925663979246cb31ff003daacd75463caac8e09cdcddd85145154405145140051451400514514005529ec7f7cd7368562b86186c82564ff780239f7ea3f4abb450060d9ecb6be76bc5682e253841210549ee15ba31f6e0fb75aa6246bed49a48e548a403f75bff0021fe79eb5d34d0c7711345322c91b0c1561906b1eeb423bcbdbbee8ffe793b1047b2bfa74e0838ed8aca74eeb437a75b95b722dd85b6c4f3a48a38e761f31518ef53cf696f7402dcc11ca0740ea180fceab8d46dedf6c772ad6640c0130c2e3d98657f0ce6ae23ac8a1d1832b00410720d6895918b9733b9977360963019ad6eae6dd506dd81bcc5e4fa3679e7b1150c1a95edd0db6f3d9994f4596174cfe4c7daac6bee459aa2e3e6719fa7ff00af1543118bdb28e0da582a96287afad652a8d4ac7453a31942ecb726a9770ee061b391c1c6d5bbda475eb951fce9f15fea52a82ba62727ef1ba52bf9804fe9594abe6cd3c8f6ad720b13f2b118ebe95d158a2a5a461633102b9d849247ad3854e6e84d5a4a1d4acefabb9fddc5651ffbd23be3a7b0e7ad45766fa38964b8bd58941f985bc1f31f6cb16fe55afdaaaea507da2c668c0c9db903d4d6926d2d0c629392b9870a5bb4724a966f3ba47913ddb190f07a73d3bf03fa54b7f706eb49865272e1f076f6383cd3b4689a650e672628c94f2b1c1e3ffaf54ee105b8b8b695b600fb937b001b1fcce08f7ae76e524774634e13b2e83652cd179129065833b083c11e9fe7d2836e16dc5e4522aaa9f9b7b85da7ea6af45a534f1c3e444f11032d34995e7d948dc791fecfd6b4acb48b7b46123169e6ea1e4c7cbc0fba0703a76e7de88d1beb214b12a2ad028d9d8cf71e7b234d68929c3391b5cfaec0791df96fc077ada8618e08c470a2a20eca3152515d0924ac8e2949c9dd8514514c414514500145145001451450014514500145145001451450021008208c83d41aa6fa5dae59a156b6763b8b40db327d481c1fc41a28a0082e34b9665024992e0203b7cd4c31cf62ca40ff00c77f3aa6d0be8f049792d9c1b53825276620120700a81e9dfd68a28514dea8ae7925ca9e861c7a9db46008e6ba56381f2a01d7a7f156a8f1559dac623952e5d91402c157938ff7a8a2942115b0aa559c96acb3a7ebe35395a3b1b63b97fe7b3ed1fc58e80ff76b4556fe42cae96d08dbc3076939fa617dfbd1455b4884d905b68a911cb5c4dcfde4898c6a7ae3beeeff00deab96d656b6a49b78238d9bab05e4fd4f5345152b42db6ddd9628a28a04145145001451450014514500145145007fffd9, 'activer', 2);
INSERT INTO `projet` (`code_proj`, `nom`, `description`, `ancronyme`, `dt_deb_prev`, `dt_deb`, `dt_fin_prev`, `dt_fin`, `duree`, `logo`, `statuts`, `numero`) VALUES
('P03', 'AFAFI SUD Lot 3', NULL, 'AFS3', NULL, NULL, NULL, NULL, NULL, 0xffd8ffe000104a46494600010201032003200000ffed002c50686f746f73686f7020332e30003842494d03ed00000000001003200000000100010320000000010001ffe125d3687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f003c3f787061636b657420626567696e3d22efbbbf222069643d2257354d304d7043656869487a7265537a4e54637a6b633964223f3e0a3c783a786d706d65746120786d6c6e733a783d2261646f62653a6e733a6d6574612f2220783a786d70746b3d2241646f626520584d5020436f726520352e362d633134382037392e3136343035302c20323031392f31302f30312d31383a30333a31362020202020202020223e0a2020203c7264663a52444620786d6c6e733a7264663d22687474703a2f2f7777772e77332e6f72672f313939392f30322f32322d7264662d73796e7461782d6e7323223e0a2020202020203c7264663a4465736372697074696f6e207264663a61626f75743d22220a202020202020202020202020786d6c6e733a64633d22687474703a2f2f7075726c2e6f72672f64632f656c656d656e74732f312e312f220a202020202020202020202020786d6c6e733a786d703d22687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f220a202020202020202020202020786d6c6e733a786d7047496d673d22687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f672f696d672f220a202020202020202020202020786d6c6e733a786d704d4d3d22687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f6d6d2f220a202020202020202020202020786d6c6e733a73745265663d22687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f73547970652f5265736f7572636552656623220a202020202020202020202020786d6c6e733a73744576743d22687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f73547970652f5265736f757263654576656e7423220a202020202020202020202020786d6c6e733a696c6c7573747261746f723d22687474703a2f2f6e732e61646f62652e636f6d2f696c6c7573747261746f722f312e302f220a202020202020202020202020786d6c6e733a7064663d22687474703a2f2f6e732e61646f62652e636f6d2f7064662f312e332f223e0a2020202020202020203c64633a666f726d61743e696d6167652f6a7065673c2f64633a666f726d61743e0a2020202020202020203c64633a7469746c653e0a2020202020202020202020203c7264663a416c743e0a2020202020202020202020202020203c7264663a6c6920786d6c3a6c616e673d22782d64656661756c74223e4c6f676f7320435441533c2f7264663a6c693e0a2020202020202020202020203c2f7264663a416c743e0a2020202020202020203c2f64633a7469746c653e0a2020202020202020203c786d703a43726561746f72546f6f6c3e41646f626520496c6c7573747261746f722032342e30202857696e646f7773293c2f786d703a43726561746f72546f6f6c3e0a2020202020202020203c786d703a437265617465446174653e323032312d30362d32385431373a33353a30322b30333a30303c2f786d703a437265617465446174653e0a2020202020202020203c786d703a4d6f64696679446174653e323032312d30362d32385431343a33353a30345a3c2f786d703a4d6f64696679446174653e0a2020202020202020203c786d703a4d65746164617461446174653e323032312d30362d32385431373a33353a30322b30333a30303c2f786d703a4d65746164617461446174653e0a2020202020202020203c786d703a5468756d626e61696c733e0a2020202020202020202020203c7264663a416c743e0a2020202020202020202020202020203c7264663a6c69207264663a7061727365547970653d225265736f75726365223e0a2020202020202020202020202020202020203c786d7047496d673a77696474683e3235363c2f786d7047496d673a77696474683e0a2020202020202020202020202020202020203c786d7047496d673a6865696768743e3235363c2f786d7047496d673a6865696768743e0a2020202020202020202020202020202020203c786d7047496d673a666f726d61743e4a5045473c2f786d7047496d673a666f726d61743e0a2020202020202020202020202020202020203c786d7047496d673a696d6167653e2f396a2f34414151536b5a4a526741424167454449414d674141442f37514173554768766447397a6147397749444d754d414134516b6c4e412b304141414141414241444941414141414541262378413b41514d6741414141415141422f2b3441446b466b62324a6c414754414141414141662f624149514142675145424155454267554642676b474251594a437767474267674c44416f4b43776f4b262378413b4442414d4441774d44417751444134504541384f44424d54464251544578776247787363487838664878386648783866487745484277634e44413059454241594768555246526f6648783866262378413b4878386648783866487838664878386648783866487838664878386648783866487838664878386648783866487838664878386648783866487838662f384141455167424141454141774552262378413b4141495241514d5241662f4541614941414141484151454241514541414141414141414141415146417749474151414843416b4b437745414167494441514542415145414141414141414141262378413b41514143417751464267634943516f4c4541414341514d44416751434267634442414947416e4d4241674d5242414146495249785156454745324569635945554d7047684278577851695042262378413b557448684d785a69384352796776456c517a52546b714b79593350434e55516e6b364f7a4e6864555a485444307549494a6f4d4a4368675a684a52465271533056744e564b427279342f5045262378413b314f54305a5857466c6157317864586c39575a326870616d74736257357659335231646e6434655870376648312b66334f456859614869496d4b6934794e6a6f2b436b3553566c7065596d5a262378413b71626e4a32656e354b6a704b576d7036697071717573726136766f524141494341514944425155454251594543414d446251454141684544424345534d55454655524e6849675a78675a4579262378413b6f624877464d485234534e4346564a696376457a4a445244676861535579576959374c43423350534e654a45677864556b77674a4368675a4a6a5a464769646b6446553338714f7a77796770262378413b302b507a684a536b744d54553550526c645957567062584631655831526c5a6d646f615770726247317562325231646e6434655870376648312b66334f456859614869496d4b6934794e6a6f262378413b2b446c4a57576c35695a6d7075636e5a36666b714f6b7061616e714b6d717136797472712b762f61414177444151414345514d52414438413955347137465859713746585971374658597137262378413b46585971374658597137465859713746585971374658597137465859713746585971374658597137465859713746585971374658597137465859713746585971374658597137465859713746262378413b58597137465859713746585971374658597137465859713746585971374658597137465859713746585971374658597137465859713746585971374658597137465859713746585971374658262378413b59713746585971374658597137465859713746585971374658597137465859713746585971374658597137465859713746585971374658597137465859713746585971374658597137465859262378413b71374658597137465859713746585971374658597137465859713746585971374658597137465859713746585971374658597137465859713746585971374658597137465859713746585971262378413b37465859713746585971374658597137465859713746585971374658597137465859713746585971374658597137465859713746585971374658597137465859713746585971374658597137262378413b46585971374658597137465859713746585971374658597137465859713746585971374658597137465859713746585971374658597137465859713746585971374658597137465859713746262378413b58597137465859713746585971374658597137465859713746585971374658597137465859713746585971374658597137465859713746585971374658597137465859713746585971374658262378413b59713746585971374658597137465859713746585971374658597137465859713746585971374658597137465859713746585971374658597137465859713746585971374658597137465859262378413b71374658597137465859713746585971374658597137465859713746585971374658597137465859713746585971374658597137465859713746585971374658597137465859713746585971262378413b37465859713746585971374658597137465859713746585971374658597137465859713746585971374658597137465859713746585971374658597137465859713746585971374658597137262378413b46585971374658597137465859713746585971374658597137465859713746585971374658597137465859713746585971374658597137465859713746585971374658597137465859713746262378413b58597137465859713746585971374658597137465859713746585971374658597137465859713746585971374658597137465859713746585971374658597137465859713746585971374658262378413b59713746585971374658597137465859713746585971374658597137465859713746585971374658597137465859713746585971374658597137465859713746585971374658597137465859262378413b71374658597137465859713746585971374658597137465859713746585971374658597137465859713746585971374658597137465859713746585971374658597137465859713746585971262378413b37465859713746585971374658597137465859713746585971374658597137465859713746585971374658597137465859713746585971374658597137465859713746585971374658597137262378413b46585971374658597137465859713746585971374658597137465859713746585971374658597137465859713746585971374658597137465859713746585971374658597137465859713746262378413b58597167645831524e4d746c754a49793852634c4c4a554b6b53304a4d6b684f34556361564150586569315955616e4f4d55627130786953612f4161304c5654716d6d78586a512b677a3144262378413b5238756131553035493946354933326c59714b6a734d645071426c6a593736525241462f722f4834734137492f4c316469727356646972735664697273566469727356646972735664697273262378413b566469727356646972735664697273566469727356646972735664697273566469727356646972735664697158363570556d71366450596936657a5764654a6e68432b73752b2f426e44714b262378413b6a6176477668766c5758454d676f386b537571424d54336a396f4b2f53374f6531684b794d6f443062367567484349384655704739465a6c71704e5846642b776f6f6357495146446b794a4a262378413b4e6b6f334c554f7856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b262378413b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b75262378413b7856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b7578262378413b56324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856262378413b324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b75785632262378413b4b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b262378413b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b75262378413b7856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b7578262378413b56324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856262378413b324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b75785632262378413b4b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b262378413b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b75262378413b7856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b7578262378413b56324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856262378413b324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b75785632262378413b4b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b757856324b262378413b757856324b757856324b757856324b757856324b757856324b7638412f396b3d3c2f786d7047496d673a696d6167653e0a2020202020202020202020202020203c2f7264663a6c693e0a2020202020202020202020203c2f7264663a416c743e0a2020202020202020203c2f786d703a5468756d626e61696c733e0a2020202020202020203c786d704d4d3a4f726967696e616c446f63756d656e7449443e757569643a39453345354339413843383144423131383733344442353846444445344241373c2f786d704d4d3a4f726967696e616c446f63756d656e7449443e0a2020202020202020203c786d704d4d3a446f63756d656e7449443e786d702e6469643a37613533386639382d363464632d363734332d393135662d3839323937613630616237623c2f786d704d4d3a446f63756d656e7449443e0a2020202020202020203c786d704d4d3a496e7374616e636549443e786d702e6969643a37613533386639382d363464632d363734332d393135662d3839323937613630616237623c2f786d704d4d3a496e7374616e636549443e0a2020202020202020203c786d704d4d3a52656e646974696f6e436c6173733e64656661756c743c2f786d704d4d3a52656e646974696f6e436c6173733e0a2020202020202020203c786d704d4d3a4465726976656446726f6d207264663a7061727365547970653d225265736f75726365223e0a2020202020202020202020203c73745265663a696e7374616e636549443e786d702e6969643a36303666333364642d393933342d313234662d383365362d6163373234626334386537623c2f73745265663a696e7374616e636549443e0a2020202020202020202020203c73745265663a646f63756d656e7449443e786d702e6469643a36303666333364642d393933342d313234662d383365362d6163373234626334386537623c2f73745265663a646f63756d656e7449443e0a2020202020202020202020203c73745265663a6f726967696e616c446f63756d656e7449443e757569643a39453345354339413843383144423131383733344442353846444445344241373c2f73745265663a6f726967696e616c446f63756d656e7449443e0a2020202020202020202020203c73745265663a72656e646974696f6e436c6173733e64656661756c743c2f73745265663a72656e646974696f6e436c6173733e0a2020202020202020203c2f786d704d4d3a4465726976656446726f6d3e0a2020202020202020203c786d704d4d3a486973746f72793e0a2020202020202020202020203c7264663a5365713e0a2020202020202020202020202020203c7264663a6c69207264663a7061727365547970653d225265736f75726365223e0a2020202020202020202020202020202020203c73744576743a616374696f6e3e73617665643c2f73744576743a616374696f6e3e0a2020202020202020202020202020202020203c73744576743a696e7374616e636549443e786d702e6969643a62666265636636362d623331382d366434382d393465362d6534386338646662633430353c2f73744576743a696e7374616e636549443e0a2020202020202020202020202020202020203c73744576743a7768656e3e323032312d30362d32355431363a33313a33312b30333a30303c2f73744576743a7768656e3e0a2020202020202020202020202020202020203c73744576743a736f6674776172654167656e743e41646f626520496c6c7573747261746f722032342e30202857696e646f7773293c2f73744576743a736f6674776172654167656e743e0a2020202020202020202020202020202020203c73744576743a6368616e6765643e2f3c2f73744576743a6368616e6765643e0a2020202020202020202020202020203c2f7264663a6c693e0a2020202020202020202020202020203c7264663a6c69207264663a7061727365547970653d225265736f75726365223e0a2020202020202020202020202020202020203c73744576743a616374696f6e3e73617665643c2f73744576743a616374696f6e3e0a2020202020202020202020202020202020203c73744576743a696e7374616e636549443e786d702e6969643a37613533386639382d363464632d363734332d393135662d3839323937613630616237623c2f73744576743a696e7374616e636549443e0a2020202020202020202020202020202020203c73744576743a7768656e3e323032312d30362d32385431373a33353a30322b30333a30303c2f73744576743a7768656e3e0a2020202020202020202020202020202020203c73744576743a736f6674776172654167656e743e41646f626520496c6c7573747261746f722032342e30202857696e646f7773293c2f73744576743a736f6674776172654167656e743e0a2020202020202020202020202020202020203c73744576743a6368616e6765643e2f3c2f73744576743a6368616e6765643e0a2020202020202020202020202020203c2f7264663a6c693e0a2020202020202020202020203c2f7264663a5365713e0a2020202020202020203c2f786d704d4d3a486973746f72793e0a2020202020202020203c696c6c7573747261746f723a5374617274757050726f66696c653e4261736963205247423c2f696c6c7573747261746f723a5374617274757050726f66696c653e0a2020202020202020203c696c6c7573747261746f723a43726561746f72537562546f6f6c3e41646f626520496c6c7573747261746f723c2f696c6c7573747261746f723a43726561746f72537562546f6f6c3e0a2020202020202020203c7064663a50726f64756365723e41646f626520504446206c6962726172792031352e30303c2f7064663a50726f64756365723e0a2020202020203c2f7264663a4465736372697074696f6e3e0a2020203c2f7264663a5244463e0a3c2f783a786d706d6574613e0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a2020202020202020202020202020202020202020202020202020200a3c3f787061636b657420656e643d2277223f3effee000e41646f62650064c000000001ffdb008400010101010101010101010101010101010101010101010101010101010101010101010101010101010101010202020202020202020202030303030303030303030101010101010102010102020201020203030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303ffc00011080277027603011100021101031101ffc4010a0001000103050101000000000000000000000907080a010405060b03020101000007010101000000000000000000000103040506070809020a10000006010302030305080a0b0b09020f01020304050607001108120921311341140af051221519617132231696d6578191a1b1d4559517b739c1d1e142332477d7385878f15272b576b6379718b81ab3347425752698793a62b2732759829243b43536c8d588d8b95a1100010302040303040a0c0908060804070100020311042112050631410751611371812208f091a1b1d13252931417c14292d22353d35415551618e16272b23373243537f182c2b374b47509a2433494d436638344c425b55676e2c384a4a3456595268638ffda000c03010002110311003f00cfe3444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113445f074e9b326cbbc7ae1068d1aa2a3872e9d2c9b76cdd04482a2abaebaa62248a292651318c61029403711d3821200a9e0ac9f32f722e0f60503a590f91d8ed3932780c054e494bfd840c0f4d1ea15486a3a1607cd8c8394ce0a02c54fa0a99cc3b01476a29f52b1b7c259581dd95a9f6854ac3b5eea0ec9db351aeea9676f234025ae91a5f42683d06d5f8907ed546a64af889f8ad5c5dc33c678ab3164f5d158c9a520f5b40d0601d260d9c9c1745d4a3f969e293df1349312a918437a6a0a850374741acf2ee9d398fc91667babdc07bbf02d31ad7ad6f4bf4c2e658baeef5ed34fc1c795a7c8e90b4d3fcd56e4e3e2563faa7234e1814530f4fd355d7220c450df4775c0ed91c18a149d07f02882a6ea0f11028f86a99fbadadf890547f2e9fe8ad7977eb9fa7467fb16812caded75db63f7ad9ea9ed8be240cbce9a48854b8c98e211d2aa10625ccfdf2cb696ec92072999423f691d0d515255433429d303a6ab302a860389440a299a8e6ddf336be1c0df3b89f780562b9f5d5bc24b6d76f44c3cb3de39d4f2d2d995f717434be232e53261bbac2581940dbff00d4b7c80806fe7d5b9ee6e3c3c3524eeebda611459bfcef855a9deb9dba64348745b06f96595def06add1fe236e4b8f82582b07878086e75af47e93780808805909b86c3e5fbba80de17869f828bfe97c2a4fef97bc862ed234d38f274c3fd33edafa43fc46bc9542550567704e109586202def51f12bdea0e456133750ad850987762b0366c093a121ce0664afa8428903a04c072fd8ddd741fe9451967713efe2ab60f5d3d79ae1f4ad06d5c3b1b73237dd313a9ed1556623e24eb2a2814b3bc3f8393702b1c4ee22338bf8347d037f824cacdee28b029eb13fbe38afd26f614beda966ee71009b715fe5ff00f855ea1f5d5696567db643fbafb0f76d1542a9fc4994978f914af5c4cb65723cea342aef2a796a1eeae9122af01376a1584b512864581ab11154a1eb9455503d3fa21f8cd4f66eeb5cd96589cdf21afd80b2bd33d71b66dc383753d36f6d813896bd9281dfc2327da57ed88bbe076feca28a6498c8b61c3d2a62809e2f2bd4e4624843994493290b3b5e1b3568e222b00efef81b001b7fc136d7387716953719323bb1c29eee23dd5b6f41f580e946e0cad83558ade73f69701d0918d3173864ff00a5c3152658f32ee2bcb71649bc5d91e8f90e28e83573efd4cb442d8d14d27add276d45c0c53c7466a65db2e438154021ba4c1e1abbc7345337344e6b9bdc41f796dab2d46c352845ce9d3c53dbb8543a37b5ed3e76921544d4c5589a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a22b73e41f2e38ddc558a8f97e4065cabe38465cae8d0d1f2269095b1cd95910a776683a9d758cc5a264adc0e5038b566a8018c52fe11800644f756f6cdcd3bc3477f1f30e27ccac3b83746dedab666ff715e41696a013591d4269c72b455cf3c306b49c460a1a7939f109e09a5337311c5ba6cb66cb12cd133b4b75b194dd0b1fc73a33831544dd444bb28cbdcb9d36c9f57a656cc0822a17f1de0600c7ef37459c5e85a832494c2a081ee8a95cebbc3d6cba7da34259b604daade16d410c921881ad3174ac6bcd063e8b287019b8d21eb30f7cce7d65b87243465aa87855036c2f1ce18a93d8a9578414d44c5219bbbcfdf2518977500c2664ab553a881b1803701c7e7dd1a94a7230323f20c7dd27ec2e73dc1eb6dd4dd4d8f83498b4fb0889f45d1c6f7ca076174b23db5ef11b5453586c576c913e797b5d8ed9906d526bec791b1cccd5ae71db8595dca915ccab9907a731d637d12947601d8003c8356492f1ee2e7ddca48e3571e039f12b41ea5bb377ef1ba0cd62f2f6fae89a35af7be4c5dc9adaf3a014031f32b87c73c17e5b6554127947c11767acd713268bf97463aa6c54129014112bcb7484136317d3101ea0374888ec03bf86b15d5377edbd34f8173770b6438d055c69fe682b39d03a03d62dd5109744dbf7d2404fc678642de00fc69df18a6231572556ecf3cdbb02e546669d52a52425eb1753d7cac3e0208097e80a75790b01cc70dfef7879eb149fa9db56070f0a69253fc58de07fd2016d6d2bd4a7aed7ae6bafacaceca22057c4bb81c457ba17c9eff2576153ec4d797064d4bbe73adc6a7ba62ab6add66424d6126e3eb101c48bd8f480e003f447a040447c4358f5cf58ac9808b7b67b9dcaa7da5b7746ff0097feb6f2d76b9aedbb23a622189c5c0f3a17903c982b8383ec5b864842127b33e5378a977f54f12cea51491807710f4c8f22268c4d807c7731b7fb9e5ab2cbd67d48610da5b81de5e7de216c2b5ff97a6c776592f35ed55dda18cb7657b699a37d3dd5db13ec69c61112839c939e95d8bb8993b063c4804de1b86c6c6ab6c03e7aa07759f7054e4b6b2f3b64fca057a67fcbe3a4e07e1356dc2e75394b683ff733f656e8dd8cb8a5d23d391b90406dbcc6cd8e4c01fb1fcd61447f6f43d67dc54196dec89fe4cbf9553cff00cbefa43cf54dc9f3f67ff815c4bbec59c6d380fb8e56cdc89840bd3ef7214374528f801b72a5456426010df6f10db53d9d67d6801e25b5a9757978838f717954373ff2fae9b39a5b67aceb8d6f2ceeb57fbadb662a5765ec495fdf7a7e7c9b6e1b9c4a4b1d4183e002ee1e9a665632463c4c600f013026003e7b0796ae56bd6a97ff006bb368029f11c713cf8ac4356ff979698d666d1370dc6724e1342c229cb18e95efc07995adddfb26726a140ea532d38e6ee911231c891a41e569f2870136c9152926ea330388006c22b81771f11000df590daf5936ccae1f4a6cd19c3ed4bbcbc02d51adfa83f546c0d745bdd3ef98057171889c4e033d71e1d831e2ad9ec5dad79d55c4d670be0d7528d911d8cb40dcf1f4c9ce025eaea498b3b59e4ce1ecff0003befe1f36afd1752f66dd11e1de06bbf8cc91bdd4c594f3556acd5fd51bd60f49abff00403e7887db43736925471a86b67cfedb42b33bee27c8d8da40f159128368a83e2a8b23eef63827f1a0a9db0fa6b03755d37220e48989bc4c998c5d84077d87593da6a9697cdcf653c7237f8ae07dbe7edad33aced7de5b26e043af595fe9f7198819d8f6025a71a380a1a768242b88e3d73ff97bc5e70dd3c479c2e0cabcdce650689657a6b8d1553990f7730856ecbf58b46022914be2cc5b1b721477dc03590d9ebda9d97a2c91c5a0f07623cd5fb0b3dda5eb01d4eda5963b4d45d75661c4f85740ccce005012448d029806bdb43e535972c35f11a675899d411cfd84b19dd2a9ee69a2a38c545b1d1ee08ba05530524551b3d9edf5c960147abfc5934a3404fb082a50fa3ac92d77993ff6c8db97f8b507dd2797916fedabeb9373f48116f6d36116a7feb2d33b48c7898a5924a8a56b478c54d9e1bef1ddbff31b9aac236cd24a0dcad468c68dea5926b169ab198cbc999145288796e5e1d5c7bef2578b0220624b99339bc4a6d84075935a6bba5de10d8a50243c8823cd52295f215d31b53ae7d2ede52c769a3ea910d4240da43336481f99dc180cad6b1eeae148defc781350a4eda3b6afdb20f58b96ef59b94cab3676d164dc367089c3722a82e898e92a99c3c40c511010d5df8adb60822a382dc6889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a228eae62f746e29709a559d5325ce596df911e376cf7f9b6c5d131b64b5c7c6ba5554d2929d565a72b95aafb71044e72a4f245176aa65ea491500c5eab6dfead67a70fc3b897fc96e27df03db2b597507ab9b23a69067dc7704df168736de101f3b9a5d9410c2e6340ad717bda280d2ab1bde50f7e8e58652b43d6bc7872c38f58d91155bc724942562e190e71b1d32a6675619eb343cc45432ca1ba8e9a312d9055b6e05f7b584bd66c3ef775dcc8fa598f0e3ef0093e5e23da5c65bffd6f772ea573f47d8309d374f6bbfa59991493bc65c4163bc5898331a8a66380f4b121436caca64dcdb7d56526242e3943235c658c2778fdd4ad9ec9352b2af4ca8a699963bb74a19c3c722254c9b10a26fa2001ac5af75225aeb8bb928ce25ce20015ef2b9aeff5ade3d44d62b7afbbd4f56b89306805ee2e71e0c63451a2a706b400060000a45b117676e59e4d8f6f3761429b89a31caa0076f7c94941b299a8249a9ef2840c0c44b9000c2a74811cb96a7dc07700000df58eb1d52db9a5e6640e92e6e1a7feac0a035e15247b80ae92d93ea59d60ddb6f1de6a42cf47b0772ba7c9e3d295a88a389fe4199ed52b585fb2cf1c69f1e82d981fd832ece1d0311da09cacc536b492c2a01c8a336d5c9061366f4d22817755e18a61111e90f0db5aeb1d61d7ae1a7f43b23b615e2e01ee229cf302079879d75eec2f517e99e8b6f1bf7b4971ac6a38e60d925b786a4d45044e6486830357d0e382912c5bc4ce37617fa78cf0ed32b2e84e828320562acb4b0a8dc4e289feb89d712729d4989cc203eb798efac12f3776b9aa54dfdccb213c454018e0681a005d33b5ba2dd2ed9543b6745b2b69053d2cae91fe8e23d395d23fb79ab852244206c429481f317c03cb6f0000d8360f9b56b639af265a1ce799249f756c610088648c00dec187f005fae91f3dc3fb41f30787b751c7b54721e387b3cdcd682988fb43eefcbefea5c8c73dd51c104669c57e80360db546ee27b2aaa9a28d016baf9e545f49bfcfa7b4a15a714f3d4684e078a86053fb5a624f7a8ad36dfdba96585c70213954ad3a47e5fddd43c370229c5429dabaf5829f55b6b43b0b4d720ec6c5429c87693716ce51b894e00070f49ea2b10bd4001bec1e3b6ab2d6eef6d1e1d6d33e377f15c42b56a7a0e89ad426df57b4b7ba80e05b2b1af14ff381a799588640ed5dc27bf1df3afe681bd4e51f13a7eb6a6d96d70076aa75758acde1d09952b22a187e88f5b237d11fb85db3eb2ea0ee9b38da19706568fb5903483e7cb9bbf8ae7add1ea91d0add19e4768e2cef5c0012db4d3445b435a88c4861c7118c670ef01460667ec5f736f24bc8605cab587f10aabd49c0e4c1968990668fa5b8a68ce57a166dbc8282b06c5051ab70e91f136e1e39e69fd5fb28edd8dd6ede513f37440381c70c1ce69e0b93b7effcbff5afa53ae7a77ab5abac4f086f4c8c7b701809228a50ea9af16b78f75544ae7de2267be38be563f2bd02463a2d559e3669658f29a62a72c9b631535556b30d93148a8aa454a6291c151544a6f12078806ccd1374e8fae47e2699382ee194fa2faf92a7dcaae35dfdd1dea574aaf3c2dcb612c31871cb3c60c909ca47a4d900c388233069ee5ddf8e9dc07983c5087fc9cc1b9aa6ab551fac7eb2569733155fbad50ee0e2803823788b7c54c042a6f136e52aa31aa3254c1e2070378eb38b1d7352b06d1af261af03423dd151e6215c7677ac0f53f6508ed6c75075c694d754c13b192b4e14a07b9be2b070c18f68ae34c4d7222e347c43b8767612bf01ca7c7d6da1ddd4709b096bce378746cf8d0e909cc52ce4844b89c2ddebc41274faaddab599029ba8e0a14a2042e6561bb2cae691dc831cdccfdafbf51eeaec8d8beb6bb1f5f6c563ba629b4bd55d839e407dad6b414787991b518d1d1d063e9118ac872a172a9640aec5dbe8d6681b855a6db11e4458ab52ac66e1649b1ff05667251cbb868e09b86c3d261e910101d84043594b1ed7b43d84169e04705d5705c41750b6e2d5ec92dde2ad7348735c0f0208a823bc2ec9afa5393444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d11344563fcb6ee1bc5ce1ac1c9af94721c449de9919822d70ed32521a7f2bbd5e599aaf62d6714d4a49292828474dd2eb193902b6624298bf8c131d321e8af350b4b26174ef1987da82331f37d9e0b07de7d47d9bb06cdd77b96fa08646b6ad87334cefad69922ae735a7c6a068e6e0b14ae6477aee517269cc3c56277f64e2a50e2caeceee231adf64cd79b33c5d447d0753d91e2a3aad2ed1ab045bfe25946a6c93032cafaea3a0f4853c1b50dd173727c2b5061654e20e27cf853cdeeae0dea5fad6ee8dc8d769bb2d8fd234f6b9c0ca24cd712b6be890e0d6f8380a96b0b8d4d339a28e4c6181f3bf23ac4a171c506f1909f49ca9d097b4a51d28fa1db492a995c2cbd9adae1252358ac291c0e73ba7053980c5f313140704d6b71693a434cbabdc3237d2b473bd377f25b5cc7cc168fda9b03a95d58d5cbf41b2d4753b974995f3b849246d77c63e2dc3aac6606be9bea6a399536dc7fec80c10084b2722b248ba50523ad278da98c05a3745c0390f41177787122670f1033527e348847b73759f62ac205ea3e95d7bac3239efb6d06de801a095eee38710ccb863862e3eed077c74d7d412dd821d5ba95a9191ce692eb2b76650d766f4735c979ce328c5ad89b8ba99ce5c668313f1cb0561649a36c618a68d505dbb56ac8f33135a8a4ec2f916641220794b119b1a6a4d7d84c22a2eb9cc63184c22223ad69a8eb5abea959350b99a4049394bdd9013c68dad00ee017776d2e9574eb625b360daba369d67235ad0646411899d9060e7cb97c473b89a971352557d1280fb3f67e5f36ac458d26bcd6734042fcfa65f3f1dfefea5be36653e440c6d6bceab5db5460068a8aa9f45a87cbf7355b07c4f3a96ee2b5d4e5f29a2815f9d5bdc7d33e55387c54d7cf7e14514fdad42be44e29f775f5c7cffe550ef40d01e49de9f307cbc3d9a80e141eca7b489a53051355a7f774e1e550a62bf7fb9ab88e182949fb3a2790ae1e72bf05668d790963858a9f87914156b2115351ed25235f355c829aedde317c8aed5ca0aa6610310e5314c03b080ea532ea7b69c496cf747234f169208ef0462a8eff0049d3356b5759ea96f0dcda4828e64ac6c8c703810e6bc10453910a367927da8b8cd9ca38ee29b0117836e09a2924d27b1e4047b3821e9722b1cd2b4962ac34348a8aa67310544ccd97f1288a820402eb3bd13a97b8b46a36e9e6faceb8b6471cdfe6bf12298614a715cbfd4ff53be94efd80cda35b45a1eae1a0365b4898d8eb989264b7698d8f26b42416bb0189028a097937daa7925809e19fd461a5339d25555245bd82815894716040c768772b1e6a951eacec8c6b640e89c9eba6b3943c09d47218e040dc5b73a8da0eb6c02e1edb2bc3f6b23c069c7ed5e4341f682f3d3aadea79d50e9dc8ebad121975fd0eb84b6b03cca065a92fb76995cd00820b839c38548ad15a5e0ce51f2378b96067278572bdf31d8c6cf319b93a8309d984291627f1abfa80d6eb43176957ec8d55289d1548edb99404d43810e431bab5b474fd6af2cc892dde5f160695ab4fd82b4decbeab6ffe9cea0c3a5de5cb6da2907896b2bde6176538b1d138d1b51504b435c391042ca4f85ddfc316660b042e37e505562303d91f3445bb6ca4859935b12caca3660edd482d6234db78e778d1bb951a011b0aeee51a8a8a94aa394bc0473fd37745a5e111dd52194f324653edd29ee8ef5de3d32f5a5da5bce41a76e8645a26aa4d1ae92669b77d1b527c5788fc224d4063ea380ce49014fed7ec3016d8288b4556721ecd5ab047339881b157e4d94cc14dc44820474c252225e357731f251cf9b2855115d150e92a43018a610101d650d735ed0e6105a45411882174fc3343730b2e2dded92de468735cd21cd7348a8735c2a0820d410684621731a8a9a9a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a22e267a7e0ead0d2763b34c45d7abf0ac9792989c9a7ed62e262e3daa62ab97b2120f5545a336a8265131d450e529403c4750243455c6802f8924644c324a436368a924d00038924e00058bef3b3bfaae576be3fe0925033b012b5576da673adceb36f8d958e9898424199431c5367cb5576c256b690a0e92929b66edaa8e8de98c7a8927ea2b886a9b9db0fe0b4fa38d3171070f2034ad38d787715c6bd55f5b0d23457bb46e9d986f6fcb0875cc8c97c289c4b9b4631c233239b40e0ea98cd40a3b158e1c5c2660e4764d780c10b965ccad769052525dfb970e276c734f163228ab252b26f151f4d2443d34fd55944dba090148024214a01afb51d6ed6c58fd4355983587125ded61ccf9054ae29b78f7d756374bfe8ecb9d5b745d7a45adc5c4368d07121ad634103880d14e0a6f38b3d94dc4ac4859b957333902fd7347ba8ac7d439d81059a223eaa8f5bdb67463e79aaeaa802914128e549d1b1ff1e3b86da4772f57228e4306db0c771ac9235d4e54c8df44f6fc6eec1779f48fd43997d68dd5fabd3dcdbcee0c732ced658b3379b84f2e495a790cb110463e9f0590163dc6d44c515a654ec755788a856a3c3fc5a22159a4cda954121133aea826503aee952a45eb55413287dbc4475a2f50d4efb56ba75f6a12be4b977326be61d9e4e0bd1bdb7b5b6f6d0d359a3edab486cf4e60c191b4347654d312683126a4aecae0bf8d36fe3bedb7887806c5f1f30f686a544465047c55928e0b5403f1a9fdcf3f0fb9f736d57bfe2a947815ca6a429483e5af97825a40e28bf3e5fdddb547e0bebfe4537305c0485aeb710b190959c898d50080a091f48346a7e9308940de9acb14fd22251f1db6f0d5c60b3b831d63639e09e40956bbed5f4ad3dc1b7f73042f22b47bdad34f390ba949e68c4f108a8b48645a6b62a45398c556c316537e2c04c6002fbcf509800a3e1e7aac8b4ad4a621b1c12971fe295619f7eec8b4afd2b55b06068c6b333dead55a24b774ae11c3a8645ce634d554bd7b959d3af8f0a1d03b1b73b7aca850f1f2f1f1f66b24674f777bc070b514feb23fbf5a4af7d707d5f6c24315c6ba3c4a9f8b6d76ff0075b015f8aef747e14d8df0324331b564228a8b82d2b56b9c53702266e912faafabe9145530f9177dc43c76d4bbbe9a6eeb7678bf452e15e4f8dc7da0e53f4ef5bff57fd4ee05b41aeb233949cd2417518c3f970815ee57358979238473aab228627c8113745625205a4491c8492066c90a8444aa1cb20c9998c432a700012efe23ac5f53dbbace8ac6c9a940e898e3404d284f6604f7adb7b2faa3b03a8825fd8cd4e0bff03fa4c81e0b71a5487b5b854f1150ab86acbe459fa6a3c381504d30f3a77a7cbf734a9388e1fc09ddcd7c1cb945a2265d7508924986e750e6290a4287998c63980a001afb646e90e56e254b9658a061966735918e24e007955103f2738fc4947d087cbb444e5a35c28d1f305e799a0b36748aa7454414f5944ca0722a918a3b08f886af476d6b6d8c4c6de4f09c2a0d2b8715813baafd3565e3f4f935ad3c5e46e2d734ca2a1cd3423cc554daedea996eeafc98b4c0580532f52811128cdf9885ff007c62b65941297ee8ea5cf65756600b88dec0701514590e93b9340d7f37e86bcb6ba2c3888ded711cf802576bd4857a5f91d5be4fe908ef534704d7ce35f3a11c969e03e03f2df427db4a0387251dfca8eda1c79e4f2aad89d3191c7790536b25eef6aa316263c92d20e904c19ab6e8c7516f119d6cd1ca2537e2ced5c9886394172ee025cef6d6ff00d736f38401c26b27115649534038e53504607bc60305ccbd5cf555e99f5518ebe7c5269bb8431f967b5f0d99de47a3e3b1d1b848d0e15c0b1d4246715a8c6c3949dbcf90bc593c9cf58ebe5b463264b204432456d56ce628a476e41ab52cbc583a3ccc1ac758e4208ae80202750a0454c23ae81dbdbe340dc5961b597c3d43f16f041edc09001e1db5a2f2c3ab3ead3d4ce9289b54d4ed3e93b598e196f21731cca39d94788c0ef12335207a4dcb5200715cf70c3b98726b838a398ec752d1979c6f25d40fb136473cdcad3a3d67120d5ebc9ba8845ccc4c854ac4e124144bd4454563cfef2a28bb270a826726d7d275dbab2a455cd05381e03c9d9ef2fae95fac56f0e9f08f48b82dbedb8d68021973668c023fa17835660080d21ccc7e2f0599df0ebb87f19f9bb1ce92c456a78d2f7070d15316ec636c8a7d056cae272a6789141055ca01056c6ad5760a157710cedfa2d80c8fbc0a265d229f60596a5697e0fd1dde98e208a115f7fcd55e8f6c5ea6eccea35b4936d6bb134b0869963735ec923cf5a0735e0578119985cda8e2af9755eb3e4d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d115b4f2bf96388786b88a5b31e62917c58660e584744d62bdf53bbbbdce5e41f35649c3d360e66660909a906c939176e4bef2911b314165d531534cc3aa5bcbc82c60371706918ece26b8601635bbb76e87b23419f726e197c2d36002b415738b9c1ad6b1b5199ce24002bda4900123080e79f716ce5ce1bdd83eb5b2ced4f03b3987e9e3ec3d1cf9d46421aba849a8e2025f2244b09373136bbe19a2691d670b19c20c5513a6cba1313995d7ba9ebb35fbc88cb9b6c2b400d2a39134389f7b92f333ac3eb05aff0050efe4b2d1e5b9b2da6c2f6b226bdd1ba669228eb80c796bcd1a08612e6b2a40ad493b2e1ff6f0cc9cb32236c8b522a9d8a98d8db454e5ba7557683d7c822664bcca3518c6f1eecd2f20d983afa0754cdd9fac20432c020600d55b9f7ce97b7ab6eecf35fbe325ad6d0815a8198922988e189ee553d0ff0055edf3d68cbaddbbe2b2da6cb80c9ae272f0f78195cf16ec0c7788e0d70a1716b33605dc56549c72e28e15e3655d840e33a742c7cbb58f347cbde5c44c62b78b3116742f9c04f5948d13937cdbdef614db8a9e8224210a42801035cdfb875dd4b5db832df4af311356b331c8df236b4069c4f957b0bd31e8f6c6e93e91169fb66ca06df363c925d18e3fa4cd5399d9e50d0f20ba946d7280d6e182b9ff002d83e6f0fb9ac40fc623bd6d5ad7826ff7b6fd9d7ce2387050f2adaac80089d413ec1b06c5db7d8400007ef8086a731e000d031f2a980fda85c1c8cec3d7d83c9a9a9363191716d5c3e917af5ca4820cda3648cab85d73a8728269a49144c611f0000d5d18d74f9638812f710001cc9e002b7df6a5a7e9d6f25cdfcd145044c2e7b9ce0035ad1524f600312ac232ef74ce286239c240bbb34d5cdcab1c948fbd502398d8a3512a8e5c37f7459e9a5992447e516c26327ec218a3bf8eb30d3ba79b97508bc711c71460d3f08e2d27006a0653863edae63de9eb87d16d91a98d2aeaee6bd9cc61f9ad18d9582ae2dca5c646fa429523b286b8ab46c9ddee712a11064716526fd2934b1142957b1c5c3c3b3686121fd25bf13607eaaa2553a772f46c2023ac974ee92ea334c1f7f2c4db607835ce24f68f8a285699ddbff305d87059399b3b4ed467bf38074f1c51b060711499c490698514675bbbb372ced9172d0c8599ad71bcb3578cbdf2191519ca314dda62902ec1fa2749766edb80ee9a8410314de3ecd67963d36db36933272c2fc841a3e841a1ad0835c17256e1f5d2eb36b16b3da5addb6d62958e687455648d0e14ab5cd20870e441e2acf8f3dc80cdb6466aaf60c9f912c72209316af5f4b582654548550c29a20f5c38513210aaaa61001380009875943edf44d3d84b1b05bc205486b5adf3d00fb0b471d4bab3d4abf64d3dceafa9de388607be59a4231c1b98b8d0027c82aae2d9f6f5e68cc11250f8d270beb10140190974486003748f529d4e54e91129b7f1f1d63cfddfb62d25c6e18457905b0e0f560ebfdf8f1469f7153f2a635c7ce7b576965daaf98cfb601a5c1b2ea394bfe3d602a65f11fc230a2c97fa21b788ebe1fd48da81aecb2bb30fe27f0abddbfa96f5dae1cd26cad99987174c47b74615db99f67be60ba010336c6ed04c3b07bd5aa543da01b6e8d656f0dbe6df54aeeaa6da6801bf487618d18dfbf5905b7a88f5d2e28ea692c14fb6b893ec4054a576ddedf995f8a173b65ef295960565e76b6a579957ea7292af986ea49c73f17cfccfa36291556488c04a9ec9888758f886b5cefede7a66e4b2659594720cb287e67868c002283d23c6abb47d54bd5a378747358bcd7f75de5b39f716a621040f91eca9918fcceccc8c1a0610303c702a65d0505528987fdf0edb7b03c3c07c475a8e46e5753b97741e345f6d4bf228269dfcd39d1756b8dcabb448092b259e4db44c545b274f5cba72a26990a9354145ce04f50e403a8244c762efe23aacb1b39efee99040d2e7b9c061de55af5ad6b4ddbfa74baa6ab2b62b386373dc5c698341240af1386039ac5cf9cfdcfee9986666b1c61d919aa763e8f9666295923dfba85b14f1508c59a493473f563e513faa5c3e746314bea089812288800f97446d7e9f5ae92c65eea2c8e5b92d356901cd15754711c4003bb12bc80f58cf5bad7f79dcdced7d8d25c586de8e66fe19af31cd2e5616bdaef0de7d02f248c710d1501446385deb970aba72f5db872b9ccb2ce165d555655530898ea2cb287328a287308888888888eb638f0833280001c051709bf51bb9643349248e99c6a5c5c4b893cc926a7beaa55fb3c3db439e59c3a0da5a50b0415cb40cd4783f7c0c1e6d5f94332074dca63345c5177d072f5f894c0021e21ad7dd4b8601b79cf786f8b9d994d0547a4dad398c176f7a89cbacc9d628cb6698e962da7f11b9de5a4f83265ccdf8b83a845798c165a05ea02801c404ded10f2f3f0fdcd73c9a570e0bd9c7104e09f3feceadeff8eea76afb1c2ab5f9be5fee6be30f32fac53fb3a600651cd43bd37d3c9ecff2a1342b8c998587b1463c869f8a8d9c889140cda422a5d8b5928e7cd8fb099bbc64f1259b3944db7894e53147e6d56d9cb246e12c4e732669c1cd3470f21188541a969f63aa5a3ec752862b8b295b95f1c8c6bd8f6f6398e043877114506fcd4ecf9057b5dcdff8b8956e8f6772f9cbd9fa0482cb42d2e41b2a9395d4355938e8d7a8c0480bbf4c89b4e8498090c3b191e9001dcfb4ba9d35886d8eb99a4b70006c9f19e3103d2a9c45389e2b807af1ea53a7ee3cfb8fa4adb6b1d64c85d2da3898added21c5de00631c237e6ca1aca363a54666d0058eab6779370b5f937b16f2e78a32852248e665231cea46a96fad4aa3d499956af5b1dbbf62a89444044a6e95133080f510db0f42586a0c752e6c65ccd388734fb4bcccb3bede1d37dcaef05f77a6ebb6cf01c017c6e143f15c30ccd3c0b4d5ae15041056597db4fbd253b2e36c4fc70e4dba9a8dcfb2eac9d6dbe5d76deaf138d2ece9afd68feb294ebd3cdb0795db94cc520de38a9958aada4e5b614ce928e936e5d8ba46bf15e64b6b8a8ba35c70ca695f769ddc57a31d17f58cd177ffd176c6bad92df79bd8e05d95adb799cdcce1e1b83c90f2c152c7340cc086935016431ac9574ea6889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a22688a39fb807724c35c11a52a6965e3aff9aa5dbb63d2f0ac54f346960788bf51c22decb6b3a49483ba9d2923b35bfc7966c6176aa2645b154500fe9db351d56d74d67e15c0cc460da8a9eff277d3c8b5a7527aabb5ba67a53eef589e27eac622e86d048d6cd31c4368dc5cd8cb810642d2d14340e70cab05cce79ab2b72cf36d9f2f649586d193720c93140ad20a28e8b76ecd8b6421eb756acc1b4f79551631116d926e8a64151670a019654ca2eb2aa1f58eb1a8b6ea675d5d48d6c7de406b453b4f05e5c6ff00df7b8faabbadfab5c891d24c4321b68f348d8da000191b40ab89a5490dab9c49a299ce09768a5a61ac0e5ee5020ed834588c65e030f3964bb27caa4a13de9256f675d56eed81c00480319e895528f502e62880a7ae7ede9d528e091fa5e805af2096ba50fc0530a370a606b8d576cfabbfa98fe9086df7b7551b2451bf2490e9e585ae20fa41d704b816d70fc16404621c6b82c88d16ed5aa29b768822ddba242a68b74132a69229a65029089913002113214a00000000001b6b4bbe77baaf2eac8ee249c4af50a2822b78db0c2d6b2160a34014000e000180eea2e49a086c71dfc360fb9b06c03e7a9398b8e2a32528a9464fcfb86f10b432991b24d36a2aa883959bb39bb1c4c7bf760d4843ac468cdcba4dc385400e5d8a52ee2260f9f553a7e87aa6a8f2eb1824900752a1a48153db4e0b09dd7d48d8db1edfc7dd3aad8d990090d9668d8f7651521ad73812711877a85dcf1deb6221263ea7c13442d9a3124933a96ab04a1e2d1597318e0b208c48453a584a92605d94f540044de5e1e3b5f4be944970df1f5498c67935ada9f6cb87bcb847a89ff302d3b4dbb758ec0d345ec4002279642c6f135018232780e39b9fb766390bbc07242f500fa0a32360e9e2f4c5e8938a5965df36200180c548e76c800898477df5985874b340b399b3caf74a00f8a40009f6cae7ddcfebd7d54d774d934db186dac5f2709237173dbe4395aac3461390b986c6e1c92b5932ed3b6e78a3d50cd612c4ff00eb75e49415cca26545b19051270757a836fa2203b8786b2d2341d2e3ab6486386214a55a3281db8ae6e7e93d57df9a93ae45b6b37d7d7ce2f348a770933e24fc5ca43abe4c57d6f3c69cfb8aababdbb23e2ab852abc9aeddb8c859221dc510cb3b5d34104d12bb4d332a2655528780786fa990eb7a2ea520834fb98a594b7834e6efe5c17c6e5e8ef51f69e8ced7773e937ba7e9ac735b9e78dd182e710d006602a6a42a1a61055313909d3e2006110dc44be3fb5e201abb46e7001ad5acda0c6fcae3553d9d99b05634c955fccf67bed2a3ac6ee36529b1f10bcdb2074cd24944acab3b066550a5202a274930504047d9bede1ad37d55d7350d3e5b682ca531b1ed93350e27e2d31e5dcbd30f50ee9d6d4dcfa56bbabee6d399772453dab2274adccce1317065452b50dcd4279568b215ad52aa94c8e4a1eab5f89838c4543ac9b48c64835408a29d3d6702a440d8e6e90011f3d684b9bcbeb87e69a491e69cc9382f4df4bd0f46d0ad859e8d6d0dbda035cac680057cd872e0bb4f80f980796c1bfec6df7b54e58d762e009574ccbf450f3fd8f1fbe1eddfe6d54c22b503b146a69cd7e83e6101d87c043cf7dfc7cb6f6f96a68c31a7c2a0c710798f67b02fd988410001280817c807c836f0fd8d4b99c5a010aa9871ef5aec01aa33dfc54c5a0881404c610000f311f000fd91f0d3913cfd9ec3debe490df48f0569bc99e63623e31d69795b4582024ac3e9195614842c916d2cb289a6242a8a3260a1977472a62a1771f4843c7595edada5a9ee39b240d7320a805e5a728ad698e03dd5a63aafd75d8dd25d29d79acdd5b4da97dadab678db3be9c72b3d276187daac5df9cbcf0b572f2c8c116b18ea9f8ee0d121636b6327efc776f0abb950f2722aa4d9aa665d44d629009d2252813cfc75d0bb4f665b6d8b73154497721f49d4a0f2004fbabc86f586f594d63adda9323b3865d3f6d42c0d6db993397baa4f88f21ac1535029434a7156355faecfda24091b598297b04898a0248f848d7928f0482a15303fbbb14575809ea1c0bb886db886b3599f6b6b17f699191b1bc4b8803dd21737e9da3eafad4ff43d22dae2eaeb8e58a37c8eecf8ac04d2a463c17da52125eb72b2107608e9087988d74ab3908b9568bb17ec1d20a1d359b3a68e489ac82a91ca25301800404348c433462588b5f13854118823b411c6aa8b54d3b50d2af1fa76a704b6d7f0b8b5f1c8d2c7b5c0d08735c010411c085273da5f38238cb9350f4c92906cc6b7925bc844b851caa8376e4966b1120ea280ee56f23397289114ca0202750e001b88edad7bd4cd28dde82eb98dae371090e0002702e00e03b062bb0fd4837f8dabd578b42bf9191e9baab5ec25c437f08237960a9e249000008a959709440c50300ee0200203ecd87fb9ae6c6125a0bb072f6d30a61c13e5fb5aa297190d429cde083f21d7c628569fdcfded43ca945ae8a2801b7ddd55c1854294f145aeaa17cab37e6370b71a730a929415a87ea0b7c0b793351ef4c5afbc3faf48482480181d34072cc2621d65da2465da1d54fac09f40e99be96b22db7bab52dad77e2da7a768fa07b2b4a81d871a1e3c9695eb4f4436b759b6f9d3b560db7d6a163fe8d74d682f89ee0388ab4bd84b5b99b98603020e2b118e4e714b2cf16af52d52c835e955a0db3b4db406406d0928852edc8386683d49587977087b8aae9149702386c0a9d541629886df6dc7a976dee7d335fb165c5ac8c170ead63cc0bdb434c5bc71e35a705e2f753ba41bd3a43afcda56bd6f38b463c78578d8e46dbcc0b43818a5232122b47343896b810782980ed6fde526b0885238d9ca174a4e61740b0b4fc799440add091c3b0ac9925170703656cd9901a7e80c888a4911e1942bb8840a0020bb728021b5345d7f286da5e91900a07767603dddeba5fa0feb2d1065becaea049147043086437af7e5146656b239c114f8bff5b9b90cc0d4b865ef073b0768868cb156a662ac55f9b64de4e1a760e45a4b434bc6bb4cab34908c9360b3864fd93a44c074d548e74ce51010110d6680870ab7105776b1ec918248c8731c2a0835041e0411c415caea2be93444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d1145f772aee4d43e0c63d5a2a11787b7f226dac0c18fb1caab2aa1231ab82394bf2eee60d803dc6af16e510291032a93a925cc54d00f4cae1642d5aa6ab0e9b154d0ce7e2b7ec9eef7d6a7eacf56742e966866f6f88975998116f6e0fa4f750fa4ea7c58db4c5c6953e8b71e18344ecee57e4765b713b6396b064ecc195ed2c5170fe41645798b25925d66b151cd11200358e8f6fb8228376e891bb268894a44c89244000d49a9dfb887ea3a9ca046d04973b0000c4fb5ca8bcb1d5b58de5d53dd51befa49751dcb7b232189a034125cea471b1ad0d631b99d8000345493ccac9cbb7a76ccaa60688aa65dcd15d249720123c8bf6ac9697fac21f1e83a2bf8d6ed58a312f9581979656217032ce15f78041650410128900e3ccfbe3a8336b33cba6e96f2dd2050572d0c9c2a711980af0e150bd53f56cf555d23a75a7da6eedef6c25ea17a6ec864cf1dad4b9ad6b431c627bf21199c7306b89ca6a2aa60c03720edf30f87ec0eb5118ce7e3cd76e464160a60b8af10f68887dc010f2fb83b006c1ab89078f353c2fd28a9bdd964d328faa7494281f72f8089440a201bf4fd1110d4595a86815c457c8a54cc7398721a3a869e5e4b176cf5db939dd9a32edfad92512c67e21d5cacea555e4c5eab09012b4e265e29084499048945a8162ca80749c80a06c006dc4075d07a46f6d9da5e9d0dbb1e5af6c6d0e02379f48000d4d31c6abc7cea57aabfac96fdde9a96ad770b2e2c1f7d3baddd25d5b8a40e95c62a343c65fc1e51423376e298afb3267d9bb120db28be84a756bd358ce1ec5cb45ce3df5d3218c9372b76ae9412956540a5137f7a03bebef53eabe85147ffc303e5bae4d2d7341eda922830ef52b65fa847512fb52077bcd0586983898e48e571ec1e838d2a698a971c5ddaa389b8fcd1926f686bda675b3006ef17b0d8ac0f9838726326655d922c24d36491c453fa3b13e8808ede7ad71a8f51b735ed5b1cc2384baa006301185295a54aed7da3ea6bd11daef86ee5d3df79a8c71d1ce96699cd71a825d933e5070a603018732a4260e9553ad328e61035c898a6b12d1ab18f4d9b345316ad59a046ed914d4e9157a5245302f89844403c447585cb79793e632caf2e79abb1e35e38705d2d61a1e8da5431dbe9d690430c4c0d606b5a28d6801a01e3800389aa88fef54c97538eb5c76906cdd1b94624f0036fa69a8a93d128f880f838e91f0f9b5b17a4e32ebcf6b9c48311a79698fb8b8a7d7ec5c9e934324272c02f63ce3b7d26d3ddc7ccb16b50a044840a1b0797ed8fddd746460072f19184b9e0bb8aca43b2b44494771e2daf5e36324ce5ede4731cb1fd3d9ca6922e525c482511374a67000f1dbcf5ce5d5d7b5dad421870119a8af0351df82f66fd42b4fbbb2e95dd5c5c0020b8bc0f8f86200756bcfdb5327fb5e5fb5fb5b08eb531e0bb907d85a87ecf8ee1f2f6ea2a2072e456a5f3fbbfb9bf80f9797906a74249ad38281c0e3f1bfc9e65fa0f3000db7f00d807601f6f96de1b6a67319be3793da46900d1bddcfd9c31f615f51f0f3d49b8ae51e5554d2062574abe5feab8deab3f71b64ab78b84aec4c94c482ea898ea15ac63359f3904504ca759c2c08206129085318c3e001a9da7e9d73a95d36d6d985d239c0003954e153cb8f3202b2ee4dcba3ed3d1ae75dd6e66c5616b03e579389cb1b4bcd1a2a49a03400158e0f2c7bbfdf2cef646b9c71747ab564c441035a5dc6355e65d6c089973b3425992c56853aa0620089007a077f3d6ffdb7d2ed3a06093586ba498f20e34f3e52bcabeb2faf36bbaccd268bd3071b4d29c00fa43a36991d4a17002469a6208ad38285ebade2e19126dc592eb6292b1cd395545167d20b028a08aaa996390a52148926989ce3b148502879006dadaf63a659e9f0b60b560644d0280770a797dbc5706eb9b935bdd1a8bf54d7ee24bad4642497bf126a49340000313c000af5b89fdbf337723e5ea7603d55786c3ef27116d3f6e7afe2d99c63db2ad16932318e51fa532b2a764e364d4223d226f236e1ac4b72efad0b416c900983b560d39581a4fa58e5a9a65e231c5741f453d56f7ff542facf56b9b47dbecb92e5a25b873d8d26305ae786b0bfc4c5a7039789c0e0b276e3df08b0071c3ff5a638a5a0d6c6e638d1523637f21292920fdb0ba23a500c4917cedaa1f8f48bb7a4427d1287ddd73bebbbc35fdc0e7417929fa3d410d01a31029c400781ed5ebb74dfa05d31e940f1f6c69ec6ea4e8b24933def91eff4b3639dce03103e281c02800eef58391c619f62af8d9748ed73096c531eee431badb3e845e27df40e9fe0a6450268824dbf0b637cdade7d32d58df6886d9f9b3dbe46e3cea08c3ced3c57981ebd1d3b8f69f5160dd16d4fa3eb62690804e0f8dd1d6a0f0af8bcbb1454d627a5ea76485b2c23c5584ac248369262f1b881576ee5b2a0a11448db1b610dbe6d6c5bab68ee9a639456173684771aae3ad1757bad0f55b7d5f4f798af6de56bd8e1c4107bf0ad2a1672dc51c98be5ee3ee33c80f5da4f6427a03ae456487728bd64f1dc7380308913fc675b4fa7e01f4b7d7216e3b26e9bae5c58b410d63cd2bd871fb2bf43fd1fddafdefd36d2772cae0eb8b8b519cff19ae730f60afa38ab86f9ff006758ac9f1cf6556cf6f04f9b5f34c2895c53e5ecd43caa29fbba568881edd555bf12a5b97eb552be57e4437dbc76d87e5fb5a8531c782f87027860a91e6ac378e73c506631b650af37b3d62645999d3059cbd62ba4e19bb41eb378c64639c349060edb386e4394e8aa41100121b7218c51b8e97a85f6917ccd434e90c770dad0e0450820820d45287b3bf8ac57796c3db3d42dbf36d9ddd6cdbad22703334973487348735cc7b1cd7b5cd734105ae15a65350483886f35b82f93389968979b5a29591c27316b751942ba24f993b31507a0fe461e0675a9170936734da2da1ca7554408ddc191319330efd21d3fb4779e9fb86de3b5ce06b0c8c191988e1404827022bdebc57f582f577dd9d1cd666d45903a5d8d3ddb996b721ed7503b33a38a46825ed786348cce686b88c0abbded45dd426b881371383332c8b995e2fcfcb9c5a3f54abbd90c292b2ee52f7c9f8b2a493a90734350e02abf8940a7f76399474cd2f54eba4e770e89afbad9c2daf0d6dcf03f27e11ef7259afabf7ac5cdb7a58766efa9df2e8723c360b870a9b6268031e40aba2af33531d49ae5c066af5eb0c15b60a22cf57988db05727e39a4bc24e43bc42422a5a31fa2470cdfc7be6a751bba6ae50500c4390c25300eb3f6b839a1cd35691815e8bc52c7346d9a1735f13c02d7020820e208230208c410b98d457da6889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a228e6ee51cfdab703b0a1ec08251d62ccb7af7a85c41477ca3a2359093445b165acf3c76682ca215ba8b3760e95208a2320e01266455132e2ba36ad5f548f4ab533b86694e0d6f69f807f02d65d57ea5e9dd2edab26bd74c6cf7e5cd6416f9f2199e5cd07d2cae21ac692f71ca7019702e0b030b85db27679c992f75bbcdce644ca7912745cc94ab9f797f2d332f24e366cc23db75ae6691ed8542a0c58a1d2d9936291040844885286a8bbd49f278b7978fa371738b8e0d1f600e5ed05e526bdadee6ea36e792fef5d7179abdece724799d265cee25b144d24e58d95cac6b681a00182cb33813dba693c5aada566be33addf3344aba4a502ccbc03730d15b9d83548b5eab3b78b3f59355bb92ac75a411f7655c7abd1d004207572c6f9df777b96630d997c3a535a5b9331fc21a9f49c050638000d694ad57af7eaebeacfa1f4934f66adb8596da86f895e2413185bfd9416b7f050b9c5e6ad398ba56e42ecd4a0001327454c0a502f8ec5f2dc7d9befb7ec6b58d4f2c175bb9a1e6ae5b659fb26db917728a23f32aa113dfe7dba8437f3d7db21964156024d14b926820a091cd6922b8903cbc571a57b1ee0048cdd22e4e530750a6b155d8040476314861001db55621981abc7a3df82fa82e60b91585ed7d38d0834f697d0371f20f2f1f0102f96fe1e21e3e3f7b4e789551dc16a06128888017730fb480611dbe7f1d7c81861c1382ddb5308aa6dfdbf48dec0111f6886db0f8ebe9b8e34c54b92997ceb90fed6bed53ad7451514fde2630af38793af8443ae2ed54e589b900c3fe31658b6860053cd3dcab7b3cc3c35b0ba67211ba1918fb689ff00cd2b8dfd79ed0cdd07bbb8e515dda9f6e78dbf656252a9444a223e1e1b7dfdc43d9f3f86ba59adf49bdcbc428c80683b5656fd9a250b25c5a72cba8e23136d916e603efb141631d52026223b01760f2d738f55ad445b883c8147c6085ed5fa895ec779d1e92db1cd05eb9a7cf53ed2973f4cbec0fddd6b011b6982ed8c8d1c02d7d32fed6822684ca38f35a810a1e001fddfbfafa0c68e0a21800a2748078ebeb068ee4c8dad547ef35b9f743e24c3b06e58e46f578947e4688d459cca718e193633774aa92520e7dc644504123a05201453dcc6387b35996d8d973ee59ab2bcc366d6e6cf4ad711801515ad7b5735f5f7d64f6e744b4f63044350dc32c81a2ddb20616b4b5c73bdd95d400b40a531aac54335729738e759a9190bc644b7bb8a786391bd582cb2c6aeb26c61540114e2cae528f50e24544a738a40638780f80000746687b6f46d1e2fec5044d77376401c4e1535e3c8735e39751fad7bff00a99aa497dadea37bf4178a36dfc793c16b6ae397202187e310496e238ab7920088efd5b907cca6f12f806ded110dc36d5f9ac009730e1c96a47114a53d2533fc1ac0bc242559f58b90b9228767b34bfe4fc84457ddca22d1bd75016ea3970d5da4aba0f787a75d604d721cbd01e9806de23ad4fbcb59ddaf9bc1d0a296289999ae7fcaa1a55b4070c2a31e6bbffd5bb6074160d31fab7542ff004ebcd56710ba185ee01b102d2e2d7071c5d5203b0a7a2b206af670e33c0568c8d4eeb8ee2ebf0cc975536504ea258316a83643d457d066d01244bd2917c8a5dc76d6929f45d76eae33dd453bae09a92438926bdabd2ed2ba95d2ad2b4d6c3a46a3a6c3a6c4df4591398c6b401c9ada01c16d60f96dc7e9529458e4baeaa99c07a3adea4901877f1dba8c23ecf6eab0ed5d6299c5bbc61d8abe0eae74e2f5a0c3ab5991fcb6f93b5466f75f7d83f356128bb340df2b8fae38f24de2d1cce3d666ee41ca12c9b549e3531c164d649228b0298403a80c3b78786b3de9a41a9e9bac3edaea395b6f301c41cb515f3735c7deb9771d3adfbd3e6ddd8ea36926b7a6cae2c0c2d73ce70d0e6f1040f40578d70ec58cb97aba0440763fdcf6eba00d7815e419cb9a8716ac9afb296651b0e33b4e1b7467eb3ca3b95e75aace5f197648c5ccc9287f7564d4e5ddb7f8e3a318c003d2223beb9f3aafa6b61bf8b538c34326194d05092073f305ebc7a826f766a7b2af364cd248e9f4f7995999f56b63924272b41f8be93eb41829cb1f31fdefbfbeb4a494f10d57a16382d3f73ef7cdaf8c78f3513d89fb9a877fb3d9dc89f37cfa7be9c30549b33669a2e08a3cb5fafd28947c34495a8ac503905d2c67af5bc7a046e86fea2c633974401e901d83c47c0357dd0b48bdd66ec59da00657f03c850571584efedf9b77a75b767dcbb9266c565006922a333b33dac194713e9387007b546759fbcf71e621068ac2c0d86c0aace4c93a6c929ee6a334c86314ca18c762e0150110012f486c203e7ad83174bb5c713e3be36340c0d789ec5ca77febdbd29818c3690dccce7120e3940a77969ad79515f560ee60e0ecfccc55a45ba38d22416c55619e394dbbf2aae80fe9269114e8f5cc229887d1f1dfcc037d625aaedbd5b489032e6339083e90e182e82e9d75b3a7bd4d833edfbd8fe92036b13c80fabab4a76e215c6b8314ca089440c03d260db61dfe8878fcc1fbfab433014e056e068c175dbbe3da564dacbfa8e40abc15c2b12a890af612c514ce563d4314a209ae0ddf22b11372889c4c9aa50051337894407c75496fa85dd85e0bcb191d15c31dc5a482457812391f6959371edad0b76e952689b8ed2def34b947a51cac6c8d2710080e068e1525ae1883882b0e8e7a707ec1c36be463561252572c616e6aa3daedb578718f246c87bebd4d6a74c1d276f90565183245158ab80a45749adb953298a7287586c9deb06e8b1cf306c57ed7d0b2b534a0f486030a9f717887eb19eaf9a974475e8c5abdf7bb5aed99e29fc32cf0dd99c0c2fa39e33b00043aa3302301457a1da33ba4cdf16ed905c7dce13cee578db70984636bd2b24e9caa38226a4cef4e0fa250498bf5dd51ec56072896418f5b74635470b4890fe0e115f73685ad8b691b61727f02e346927e2f7790fb9c567deae5d7db8d26f6d7a73badd9f489242cb7b9924358096b9cd89d50ecd1b9f4632ae688ea3ed45066ae8ac9384925d05535d05d322c8ac89caa24b24a140e9aa9284131144d421804a60110101dc359f2f43810454705f4d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d115a673479778d385f83acd95eff00351cd660d1d37198c6aeed39270e6ff91d3819393add45b2112d9d3c41b493c64523a78704dab240c2aacaa65d84692f6f21b1b774f3100018779e41627bdb78e8fb136e5cee2d664632086376469241965a12c89b404e67b806d684341ccea34123cfff003c66bc9bcb6ce96ccd17f6d1d2193729ca4311ec5d4231f32874d58d8689ab40c156e25dbf98906ec19454536411228e5c2ca0944ea28754e739b53eb3a8199f25f5d39ad8f024f2006030e3fc38af23f7cef0dc5d52de92eb374c0ebdba73238a28838b5ad686b18c635c5c456809c717124f1592ef6d3ede91fc70868bccf90cafd7cd56daa0b47104ba8c1588a2454cad1d2678c6e92482ca296528334d274e41c1884013a4980144c63f2c75077acbadcaed1acc53498e4cd9854191cdab41ae1e8e380a7795ea8faad7ab5da74c2ca2dedb8daf76fabcb400c6ec8596b1c99242c68009f1700d7bf39a62d0054d64333267ec5d81ead3569c856a8b874a1a29c4b162cee3d4969149b914f4d0611c882af1ca8e574fd32741043abcfdbac2b46d1b50d6e765bd8c4e7173b2d69e8d7bdc701cb12ba4f7c75136974e7499b58dd37b15bc50c4640c24991e1bc98c6d5ee24e0000a0c790ddeb2794916acb8e95d862c58b64ccfa5aeb1128b3833837f844dbb346462fa4852fe098c03e3adb9a4f48b3c39b5c7b83eb8358e676f6d1c179ebd4ef5fad405cb61e975b5b1b6cbe9497314b52ee140dcd19a53860a1db2df21b2f6749909dc9175979b5d15a4548f6bef4ba2c6252935c8e1c338e40aa08a2d0a64ca5214c638814801beb6569fa2e9fa247f45d3e26b180004d012e2052a7bfec9382e07df9d57df9d44d53f49ee8bf9a691ae798d81ce6c71890d4b58da9a345000092401c56e309f2472ff1e6ca166c6769711ca887f8e307a655f45480180a5303c642b101511290037dfc36d4dd576fe93aedb8b5d4230e3cb911e434571e9c75977ff4c3513a8ed6bd7b257baae8df99f1bff94da8ae029c565f9c28cc17acfbc78a464ac8902d6bf609c4a4c8645990e83291418cbbe8f6f268345d670bb723b49a81840e60ea1dc4000a21ae5eddba659e85ae4d6160f2f81a4713522ad048a800604af73fa03bf771751ba5fa76eedd50476daadd78950c05ad735923d81e1ae739cdcc1b5a13dfc15d59915480611287407b40436dbe7d807fb1ac6f3b4e15f4aab74820e3c97eda007a8221b7800fdff1fecf878ea78af6af893e2ae4f5f4a4a68a0a383baf30f7de116583017733271477a53787d1f4efb5a2888efe01f44e21acdfa752f87bbadbe4e592bf36f5ca9eba56a2e7d5eb5b3427c375a3f0eebb878f9961e66f12796fe5f735d3f13dafc4705e1137072c97bb1dcb8bac3d97220c7dfeabbb432dd1ed2fbfb091306c02221b0fbbfb35cf9d608dccd5eda43c1d0bbdc229efaf5fbfe5f178e9b606af6448c915fc4476fa4d90fd853929fe0fb3cc7cbf635a9e2f8be75e844740de5e65f4d4d5f631e0b84b05861aaf0f253d3b20d63626258ba92917ae9404d16ac18a2770edca86f11e8411209876011d835f714524f336de16974cf700d03993c02a3bfd474fd2ad25bfd4e6641670c6e7bdee340d6b466713dc002540bf317bbf250cf65a85c6b3c2cdac828c9357203e6328a33d8526ee1f211ac57522ce2b20a09d0150e072ee0225f60eb71ed5e980bb85b7daf8736335fc15454f1a126870e0579c9d77f5e066912cfb7fa506dee266968fa5bd9216e201786b498f118b6b4a730b1f6badaec57eb24c5bad122b4bcf5824decbc9be707fa4abb7ee1474e0c5030fd020aaa8ec50f20f0d6e7b2b0b6b289b6d10cb6ec686b47601c17977adee2d53736b171ae6b72ba5d46e6473dee35c5cf7171a71a0a9c02ed789b03e58ce53e5aee2ca7485a1f8288a6afa0ab366cdb02c72901574fa41c3568926413ee23d5b807b352750d5f4ed1e23717f2b628454e35a9038e0315936c7e9d6f2ea2df0d3768d8cb79725c01228d6b6a695739e5ad0399c7872575ef7b58f389a266e8c3a9bb10011ea697aa1180c5dc361282d644477d87c87c758dfd64ece79f085dd1dfd5c9ef86adcf37a9dfac0c0fc3440f672a5cdad4f98cc175679db939b2c40a57181674c08880f537b0525dee050d876f76b32a2203f3ebedbbf3693c7a37b1e1fc578ff0045582e7d55baf76b2b98fdbb7398d46135a9f7a75d79f704b9751e222be0cb4017a4541f45c41ae3d21f842208cb9c3d9e41beae31eecdba4563ba8f29fe571f6aaa926f561eb9dbc61d3edfba04e1f1e0fcaaeb91fc41e4f484a270adb0bdc0f26b88824d8516080187601e9f5d67e9b728880efe270d4bb8d7f41656692e630ce7c7e056c67abb759e4b916b06837a673cab17be64029c39d175fc95c6ccf387d16cf723e2ab4d61bbd15c1072f1aa0e5038b5f4fd61f5a3dc3c4cbd00b17c4440077f0df555a76e1d1b526e5d3ee2390b303c4115fe501d8ac7b97a33d50da100b8dcda3de5a5b1268e706b9a7b71639c15114d23a4060593324701f12281b18be01e65f30d5f3c4f1002382d65387364f0c821c391047bea55bb3d5ccf58e599e300a0642df42998557ace729523a52b04fd2580a5395339cbeec250dc07f0b5ad7aa563f48dba272718a669ff00a2e0bb5fd43b5f7691d627e9ce05ccbed3a48e95e0e1244e04f9811e7596a7eeefe21fb7ae6190fa67d9eced5ed8b7bd36f97c875f039538a8d16bf7b4a762705a7b3ef7dfd050e1c9468b143ef3f90ac960e4a425317494655fa950e29462dfa9502c83a90999d55cc8285f50523807a442136286dd23bee3e5d29d2bd3e183417dd35c1cf92520f751adc3ecaf1bfd7cf776a3a9753e0db728c9a65a5830b695f4dce925ab8d4f701c39735122901bd32898761e800db7f0f67ddd6cf958d2d2ee6b80de40790de155f545d3e8f72ddf47b9599bc6ca95745d3754c92e8ac9980e9a89a84103018a70df526284b810f687348e7c155595e4f6570db9b77be3b963816b9a4820835ad42902c13dce7935839a45c4a52d1577ad3032843c55b1078ed6f45532c612a2f9b483455212995dc3c07c8035876b1d3dd0b5891ce74662b8e20b2831a7783c4605755f4d3d703aa9d3e6334f7cd1ea1a53050473b5ee34c4d3307b799c14d3e06ef03c7ec888b18dca0e15c676159b23ef07563665fc21de8822551141cb368fcc900a871e9eb30fd10df7d6a3d57a5facda4ae7580f1a2e42ad0ee3e51ee2ef5e9f7af174c772c51da6ee79d2b5273066ac72ba22ec2a016b5f415ed3e7522d3d178bb9278b6cf59524a3edf43bd404ad5e49e43ba415106b2cc4e82ca345d44d62b394684725550398826455021f6f00d61b6e756dbda832e18d745791b9afa1fe29a8ae3c0905750dec1b4faadb36ef49f123bedb97f03e173e335347b0825a48f45ed0e0e692303434587ef38b8676fe2264f9187065372589661d9471c5e244d1ae14996bee2d1dbb8e933c58908ca6225daea2072aa836f782a5eb244f4cc1b753ecbddb6fb934e649239add45a292300381a9a1c788228702695a15e2a75ffa1bacf45776cb67e1cf26d29de0d95d38b0f88dc8d7398fc94cb246e2e6905accd973341054ce765bee94c6bed21b87bc96b9328d876c157aa71aadb211b2ebb833c7f26fd81f18daec29bc7ec9ab048af2391ad28b3566d9a228aed567460164917776ded60c83e837440ca008cf68c703e4c29c3b3b17497ab4f5bdbabdac7d3fdd93c4cbfb78a28ac5e4383a663439a627bb1667635b188fe2e71518b80ae557acbd76726889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a22688b899e9d85abc24b592c72ac20e020639e4bcd4ccaba458c6c5c5c7a0a3a7cfdfbc7074d06cd1ab748c739ce60294a02223a8388682e71a3405f1248c8a374b290d8da09249a00062493c801c579f8f717e7fde79ef9791b1be6ee2b988282e675a613a23e8f886b335f869f0872ccccda5ec69dfaafed767fc9f6677697bf3b64c4102a4d36015945f546bbae3f509e8d14b560394118e3c49f6bb705e4ff005dbacf2f5535e8e0d34491ed4b22e1031c1a1f239d943e57d09c4e50183310d6f0a173ab239da5f8088999d5b975955364ed3729c8bdc4d56505f0388f3a0ea5abce2d56168bb76cd0eaaa089d48c2019720247239dcaa7a7d1cddd4ddf1316bf6f69a5c310257000d700ecade270381229cc2eb8f53cf572618ed7ac1bb18c70707bec2025f99a417c46695a406f27189b570a10fc0d29797cdaee5f8df8fd193d8fa8cfe466b2da60b462068a6514f636b4f0a938299cc9a922ec1250cd5ca252192f494111380ec2003ac5f6b6c0d4759732eaf0b5961407d22439c303850615f2add7eb01eb53b5fa616b36dbd065967ded5733f04c8dcc81d477a4f2f70068e0016e5771e0563417bca79ab95590e397b7cd4b5faf36074ca0a1da22d19b54ccaba75e9b464ce3a39bb360d52339723e3d0500130888eb7d5a69fa56d6b0a5b35b0db36aee24d3b4926a792f247706eaea5f59f74c2ed66e27d4f5c9ded8a36801a066751ad0d606b40abb8d3ca54bb7137b54c6c0c2b5cd3cae2479eb315133d2d2b8dcce65525dbb66693f6e8389778c148ff00121532b92a69ac601fa2023e61ad79b9ba9324f29d1f6d922faa078869979134e3caa3e2aee5e8f7a9b58e91a6c7bf3aca6376991452be5b2064a803335a64737262307001ca2679356cc496ccab602612a433a263a877cfe2e0506ca3c5579766d9e2a44a51e1debf7ea81dc108062075ee0536c3ad8da359dfb74b8a5bf97c5bd7b439e4f22470141f02e22eb1eafb2b53de97236069ecb1db76f2c914401713235af21b23b33de6ae02bc70aae7f88dc759fe44e69a553d8c5b979594ec90ce2ef2050548d98d64b20d8d2a075d3030156559898081b94477f30f3d536e6d6a0d074992ea57017458e1181c4ba9852bdeab7a15d34d4faa5d42d3f4686173f4617709ba762032112373e23ed8b6b415f3859af51eab114babc354a05b15943d7a3dac546b54fa84a8b46890249177398c73088788888ee223ae53d41cfbbbb7dd48e26490d493dbef2fd04e8da169fb7748b7d1b4c608ec6de30c634568037b2b8e3524f795dad6f048fb7b0a1b7cfe021b6ad407e1694c6aaf6cc00a70a2dab41fc60f9fe086db86dfbbe3befaab6f13c14643e8ae4b5f6a4268a2ac8bb8dd7dd59b8619ca298b651dbb357e25da2822539d538c6da20a40dd0420089ba08d84c21f306b29d95336df73dac8f34697904f71695a07d68b4a975ae846e1b0b7617ceeb68dc00153e84f13fdca556162529fa3a540e95037298a21b74980443610f0101010f1d7553184620fa3ddc17e7de41e1ca5a41041e7c7bd4f2f63fc9cca26c598f173d02a6f2c48d5ac716a88807aa68d09b62edb6dbf575095d90c03b0f807b35a7fabf602682def81f899dbede53f617a6bff002f0dd56b05e6bbb4a50ff167104ec76197d012b5c38d6be97679d64849efd3e3e7beb43c34c9876af53db52315d23269ae44a259cd8f946c8dcc229d8d794764228dcb2409185b0a89aa8394ce1ea0078188601f9b5576c6d85c33e999be8d9866a71a73e6158b73bb5d668374edb4e8dbae089de0978ab73d30c2841f696213c80ce9cfeb741c933ce0eb22c6d51c0ba6ef1b0d61b40421d3749fa2edbacb4546b320b75511e91218fd220220203ae9ad1b4cd951e43a2885f74d181cc5ee1f744e3dfc57893d56ea0facceb1a7cb06f87ea10e8af0e6bc361643191f1482636349047226842b02671b20f1c01193178ece6389008d9aaeb984c23d3b6c990c3befacf1af6c76e0c8400071340b992dec350d4088ad6196595dc32b4924f994a8f133b59e5bcec05b3e4338e3da319a20f187bc91d16765c1759b1d345266669d08365589ce6150540300f4ec1e23b6b6dd7d45d3f436f83623c6ba269fc51c79d6b5afd95d93d14f531ddfbfa76ea5bb47e8cdbe620f19b309a424b4801b968016926a5c392c98307f1d716602abb4ace3dab318749ba4092efba0eb49486c3d5eabd7ae1459cae7ebdf6131bc03600f00d739ebfb9354d767325ec84b08f8bcb9f72f5af60f4c366f4d3496e8fb4ed228210317804c8fef73c92e27ceab9fa65db6fef43c8000000007cc3c35606bcb716e0567863cc6ae355a810360287807806decf0d4448f06bcd3c3af3355f932099b7ea294de1b0ee528f87b43c7d83f36bebc7947026be543103e8b8d5be45b708f66537595b2053fb0c5453030786df8401bf96a2eb899e28f7388f295285ac43100023b82e2a72ab5bb2a256b60828b9a6e411e84649922ed2289fa40dd2454a600df60dfc3d9aaab4bab982ae85ef61752b424569c2bdaa8751d2f4ed4a3fa36a10c73c15f8af6d463ddefac49bba861647107271c388a62d23eb77caeb3b2c5b664dcad5b20bfbe483078d92413004932a3ee841fa3b00efbedaea6e9f6b0cd4f40687977d2637969cc6a7803dbdebc4bf5d6e9f5a6c7eac09b4c8190e997f64c99a198343b3c8c70a7007d1180566d80324c861fcbd47bf32596de1a69999d912541b8aec1470903940ea0818013394004770db60d64facd88d434d9ad1f42c730e07b6982d09d28de979b0f7ee9db8ec1c58f8a7687539b1c4541a8e070af9167434b9f6b6aa9572c8c9645c359d848b974556ea95740c9c8b241d97d258822555302ade060f30d71a5ec7e0ddc90d08c9239b88a7c5247d85fa33d13528f59d1ad35688b4b2e6da294508229231aee230e6bb379fcbf7f549e5e0ae9c537d12ab5f30f0fd8fbfa88049a0ed51142b176ef5d8eece866ca964d331ffdd77d428bad7bf6e501095613b6174748532241f47d1904fe909c44447c8035d1bd26bc80e93269c5dfda5b31753f8a43456be65e44faff006ced4e1dfd67bc5ad1fa21fa747097763c4d31e429c1c389af99429a4b89050f547a9205130543c4372750751772fd2f10dfcbc75b725651a43b85179e91c7119bd21e8d7dcae3ee2cbee8bdbbf84d7da45226c712c62e45e019b807f1b62b6b72c88c8b741458ce45bd800171050a3d0637d34f71e910f2d7315cefaddd67793dbbee0e612114c8cf440e1cbbf15ee56dbf555f57ed7f6b69da9fe8586473ed5ae12326b86e6cc0124e594026a389187256a39f7b2a54a701fc8f1f6ca8545ca8a26a215cb7c84c3d8a26c090289a52854e5df14a6003097ac86d847611db592e91d52b9804716b11997882f6501e74a8f447b4b4c7527d4176eea3e2de74dae9b653d016433be4732b519867a3dc2a2b4c0e34503b9cf8f591f8ed7590a4e4162ddbc8b078a340908d5957714f7a04c29aecdd2c837139164c9d65dc853000f880796b71691aae9fad59b6f2c9ce21c2b43f1879684af38fa99d2ddd9d2bd664d177444c12b1f40f8c9731dc694716b788155747c31e7f641e2b4b3080999196b0e20713432b39556ace21e49839729b468e1d473e91041d10deeac930f4bde489ee5f0d84447560dd3b2ecb7134cf0e566a740d0f2481946342061cce345b7bd5e7d67f72f486f19a4ea0f9ae764ba6f12481ad8dcf048635ce6b9f477c568f47381861c56452a3ec0fdccb8c9231e920fcb5db61563312ca11ab1b5546c70720a9184a9118f907676ca2120c77dbd514dcb731933818873175a35ffa5f606b8d767a3a377a41b8b646b870f48761eea11c57a946eba6beb5fd2a96389aefa0dc8393c4019716f346fa35e031ee23d36f2710e61208a1a2c44f3d617b771ff2b5bf135ddb19398a94b3968da45ba6e12673318570a844d8a29450a8ae66526dd22ac91b629c823d23b18a3b750e81afda6b7a647a9daba8d91a091cda682ad3d84703c477af1a77f6cedc1d26ded77b6f532e8b50b3b9788e56e668918c77e0e58c900d1eda381a0a571a1c1667fda03b87c97347114bd3b2ecec4bae4662b55246d076ed63a197bed35e6c9c16426f0d1e8b18f45e19d115672c9316e9356ce8892804488e924c372687aa8d4ed6afa7d218687bff008d4eff007d7a5bd09eac45d54da7f4abba377159bc4572df4467395a44cc6b4e0c7d69c051ed70000cb5989d5ed6ef4d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d1134458a1f7d8ee190f7133ce1161c9a78e50ad5919c9e76ba566d4aa310fe462da58225ee0d928f8e4fdda75bc6c83e41ecda4b38326da4d822d1447d645704f0ddc9aa80dfa05bba8fafa641f2fa3f0e3852945c51eb49d6286c2c874fb6e5c91a8bde0de4914b4c9186bc1b6765c733c96ba4198650dcae0731022d3b6ef0e1cf2932fa33f3e5419e27c4b2d58b15d8f2317f58475a8e491f7e6f45105976ed4539a6d18b15e18454f45a8fd24c45426fa13a81bb20db9a71b78c5750ba63d91d0d0b4d299f004d5b504014a9e61698f55ae87cdd59de4355bea3369e8d7104d739e3cd1ce33970b7a92d6d1e23767ae6a309ab4d54a9f71eee0707876bf25c6ec00bb18eb4251f151afac151916ac185123c9ee2f02222dac537f45274a4687a3d09aa90204536dbc04bad77b0f655d6ab74dd77590efa3b492d6bda4990d08cc4bb8007b41ad1759fad2facd69fb174d97a65d3591b1eb81ac63e6b67b58cb560c8ef0d8d8c7c67370c1ccca1dc0d0838fe636c6793f9259292acd69a4c5c2db3ee56929691508f655c2092ce932bd9b9771f8d541b917745eb514300751c037dc75ba751bbd3741b2373706386dda2801a34134f8a38638705e6b6cfda5bbfab7bb4e9da60b9bdd72e5c6496476795c0170ccf91c6a4005c2a5c7ceb2d8e21f6fec4bc62af10a6611179bd1e4892c6bd4dd6638b2cc9506ed13233885173bf598b64166e639048a8180c711f01f1d7336e3df77fb8aebd2cd15b06e50c0f3422a788000271ecf717b65d12f56ed97d1fd2580470ea1b8cb83dd752c11891aecadf4633e91680e048a3ab52aeab35e2a6b99b16db317b99e97ab34b630463dcccd79616b26d504deb576a91ba843a5f41d11b0a2a977003a4a18a3e03ac7b4bbe3a66a51ea4d63647c649caec41a8231ad7872eca2dafbef68c5be3695e6d496e25b486f181ae922347801ed71028460ea51d8e2090a1211ec55149cc20b39cfef96872bd3a8bb12d108578b321540c543dfc2d62549704bc05414cc0223bf4fb35b647595cdb7f09b62d1306815f1282a071a787ee05c18cff97768bf4efa44fb9247daf884b99f44a12d249cb9fe90687f8d43e452e9c6fe28e2ce2ed5d7ace398a4bfc7de9df4a4ec8a0dd49f9050e8a08826ee453488b2a82646e5e926e0528ee201e3ad65b87736abafca2e2f5fe8b5b400701893c3971f3aed0e95746f64f48b497699b5add8d95efccf94b5be2bcd00f49dc70a76ab99290a4f02940bbfcc1b7edfb75618dee7d731e0b6abeab436db0f56db7b77db6d83cfc47c354a59267ab41ad7bd7d8760a2c3367753c2b87731c5e306ec50ba459910fca1b5d6e79aba6d0524759db74e34ed5a327a574e014409d7b2c41282a1e1ad97a574e356bfd34dfb9c6297931cc2091863526a0799725750bd6fb606c5df56fb3437e9f1c8d065b88266bd9138970c8435ae05c0b457d314af052594eb4b0bad6a16d715d7f564f47b79263eaa6a24afa0e09d64eb22a521ca201f3806b08bb8be8770eb5948f11868574fe8faa5aeb9a5c1ac58126cee230f693d85767d49571c5715330ec27a35e44ca3641ec7bf6eab576cdd26559bb84162f4a89ac91c04a72897d9afb8e47c3209623491a410798a1522ead6def6d24b2ba6364b695a5ae6b80208228410705019c82ecbff009516f9fb6e16c8b1f5d6337349ba4a8b235a315842b6559899f8b297426d332c41912752697ba900a45443a87a43ab7068dd556dbdbb6db5681d998d3f846bab98d45016e5a0c39e63c3bd79bfd52f5046eb9ae5c6e0d8fa9c56d15ccc1df447c1e8440b7d32d91b2b6b570a86f863e3115c31bb3e0676e64389937377bb3dc93b8dce7235b46228b58708e8d8341059d9d73365947ef9776abc0593dcc209f47a7e1befac737befa66e3b76d9c3098e26126a5d526a0634ca00e1eeadbfead5eab9f5277773aeeab7e2f75ab98d8c0d6479191819eb439dc4e6cc38f660a5453fc1f3f96c1ad7517c5f3aec667c55a9bc40436d4c22b8147d698715d6a769d53b4315232cd5881b0472fd5ebc7cd43c7ca32540db7502ad9eb7591380fb7728ea7dbdc5c5a3bc4b591d1c9dad25a7dc215a2fb44d2354b6367aa5a5bdc5a3fe3325899230f9439a411e6ed5d1a1701611ae3d17f058871ac3bb389b7731746ae3157e986c7013b68f4c440c02203beaaae35ad66560125ddcb9a3b6479f7cab2e9fd3dd81a5dc0b8d3343d2adee3e547690b4fb8c14f2aab2ddb376891106a822dd148854d34504ca9a49a64281484226402908429400000036000d63ee7bde4b9c497138e35c7cfeeacde38a389a1913435830000a003b80e0bedfb01f2f66be08078d17df35a787cc1a51bc39f93b5416bb6a193b947c8b41fbda8e51d94428201a8656f3a57c8a042d3a437df60dfd9fdc1d7d034c060140b1b5cc462a2b3bae7193f9eac12f2f75d8a51f5ff1a15a4845959b34967af6194914129868658a417628b766e555c0851e903144c21ad9dd34d70e9dac8b5ba752ce6ad6a783a8687b31a00b8dbd737a4bfb7bd37975fd2e1326e2d2c35f186b039cf8b38f11b50335034b9d4c4545485894ee7289d05b7238218e43a660129c874cc243144a3b094c5317c43d9ae9b191c30399a7de5e20cb13e190d5a5b94d0f2208e35ef0b27ced1fcb588bb637fe632e13cd19dce8e9c430aa359594283db14099372dca945a4ed4055ca91446640326975741142ec001ae75ea96dafa16a4354b389df449439cf735be8b5d81f4881415af13c715ec67a91f5b34fdcbb57eaff5cbb6335cd3d913206c920cf2c595cd0181d42726468ca2b40e0029aef96fad4185177e26878f7251686dc0076f6fcda88a56bc97cbea1a69c4ab01ee43815f678e30dc612bb11f59dce155889cad11bc78be913a8c2663d77ed9a0261ef251711e4540dd1bf879808786b3ee9feb7fa1f5e6493bf2da3aad7f908207b46945cd5eb47d37bbea37496fec34b88c9ad41e1cb080c2f7bb248d739ada7a42ad0ee15e7815867ca45c8c33f7b1526d1c33908d78e18be68e923a2e1aba6aa1d159155350a5390e9a84101010010d754b4c72c6d96239a37341046381c57843796771a75ecb617cc745790bcb1ec7020b5cd34208342082b2d8eda1cb7a3e67c59018e513b58abd63f878f62fe0cbe9a1ebb32fac8a0f1b13d06e559330b71eb1201ba77f11f1d734efbdb17ba4df49a9bbd2b19e426b4229ce985479f05edcfaa775ab6eefed9d6fb4a37b62dc1a65b303e22e18b4d5a0b451b5a65c4007dd52b1ecf1f3dbd9f38eb5ff0015d6dc31548f26e0cc45976381864ac7d50b8a255456495b057a324dcb75453513f55b3a72dcee1aa8045043ac8628edab8d8eadaae9cfcda7dc4d09e61ae700476100e2b12dd3b0364ef7b4759eead26c2fe377033c11c8e69a1156b9cd2e0454d0820ac6fb999daa6d58b5a5b728e257a59fa2c620bcc2b50422640d330ed1105d6729b4324ee48ef90410201b71227b06b7b6d5ea059de399a76a24c776e7001e5d50e268003801c7954af2c7d607d4cf56d9e2ef786c57b67dbd1c66436cc89de2461b52eca439f980001f8a147971cb94595b8cb6a46c1419e7ec989962966a00ee9408a954401528a0ed89fadb98c432c272889044a70010d87c759aee0db3a56e4b3f0af18d3253d17d0661e43c7b972df4b3ac7bd3a49adb2f36fdccadb4cff85b72e708de3810e6f0c0e388e22aa71337635a7f755e3c41e57c6ab46d6f386358c74718cf498493fb128f239072ee9d30f5b1e3deb74d67ac04d1ea2a5548d553a8004d9538869ed22faeba73ae3b4abef11fa5cee395c496b594760e15cc0e07d2e1c015e8b6fbdadb7fd70ba636dbbf6a186df7e697112e682c92494c91b4bade47372380cf1931541c84ba83d22a0438f19a6ebc62ced8fb3355159c8fb0636b8c349cdc0329990aa39b4c045cd317769c753ef5b22b38460adec189d83f45641727429d4644e24286ba62c2fcdacd1dcdb1ab2a09ca70737891515c08f8579cdb0f7a6b9d32ddd6dabd9f8d1f8170c17300718bc689af1e2c320a1a666823d269ca68ea542f43ce33720a95ca6c198f33bd00564abd7e8633dfab5d9ca77f0132c1e3988b156e44c5224067d013cc1c3539c0a522de902840e8394476b5b5c4775036e22f88e1fe51e6382f6036cee2d33766836bb8b4778934fbb883da41069896b9a6986663c398e1c9cd21577d4f57d4d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113445621dc73988df84dc5fb86588b52b6f725bd711555c4b55b2a8e45ad9ae13324d105cc666c976cf1e32abd78cf25dd10aaa2074588a5ea14eaa606a0d4ef45859bee302f18341e64fb2a7b82d7fd50df56dd39d9579ba660d7cf0b436163ab4926790d6370a1201399c0107235d88580e43c264be426583328b6ef6ed9572bdba4e59ea9bb545cceda2cb20e6667255daaa19b326a0e5f3a59c2ea184899004c23b006b4f6abaa436b04ba85fbc36215738f79a95e475a59ee7eaa6f636ba7c4ebadc1aade3e42d600333e5717b8e268d68a924934681895907727721e3aedc3c618de33e137a93ac89778c9b466249fa6a399a506419a4ce66d320ee388c19b590319e8159a661fc5a6980014dd2223a0b41827defb87f68b5214b18246968a61c6a1a01ad7862473f32f487ab7bbb6a7aaa749e3e986c89f3eeed42099b238fa5202f6063e77b981ad6bbd3fc10e200e071ae3b9095fb8e53bac7c143b691b45cadb260d9b21eafbc3f907ca144c631d558e1b8269104c6318c05290a23b8006b794b7d6b63666e5f465ac6da9c3003c817971a6596bbbcf5f65859365bcd76f24a3456ae7b8e24927b00a924d000b2e6e007072078b5486960934557395ed95f644b73974bb4708448ba23678e612305aa2000ddbba4ca0630aaa098c40f1db5cbbbdf7acdb8af5d6f11ffe1b13ce4a0233509198d7bbb97b73eac5eafda5f47b6e3352be05fbcafad59f4924b488f306bdd13080300e001c4d6831524042894a5011dc4000047fb1e7ad7c08320a772ea82006d1bc02faeab94b5f2326261df7f0d48744493c3152cb0b8d4f05f41d466fe8e8a6b47a4be4a2c8a053a8b28448840131ce73014a52fb4c611f00287cfaf9b70684f69519086fa4e3468f69419f702ee8ecf1d389bc43819db099b93273250d6bb22ad5f999575c3738355da3254546493b904d4053e9a42aa65d83c77d6dfd99b10de066a9aa8fecce00b19c0bab8827b070ec5e7c7ac97ae1d96cf9ae36474edf1cfb86373e2b899cd79644e1e8d187d10e7039aa4170e0a32fb7d7082d1cadc86d3205c9a48a188a0e61dab62b024f58b67f353cd5a83e6f18cc8e41770a80ba7081975011310131100300f9675bdf765b6dbb236d0bc7e937b3d06638349cb5af01856953c42e46f562f57fd7fac1baa3dd1ae3251b2edae1c669f3b43a495adced6343aae20b8b3310da509c42cbba0a21a404346c2b127a6ca29920c1a27bf574376a995140a2602977302640dc4003c75cc5732f8f3ba72492f3535e35e6bdb9b1b2b7d3ace2b1b5196da16063476068a05cc6aadbf147914d4d451714071238dff087a84037f00f11dbe71f2df52dc333a8382a9e5e65c80907cc07f7f507c79a94f755106106b5c57ec85e90dbeeee3afa63728a2fa6b728a2fd6bed7d2688b41f2d4b93e21eda288e2b4d5029ab5d46840a8515a79feef8ea03118af9c0a7f634e34afc651fb09f20d3018f04c4a7dd1d47bcf6a8724fddf9797dcd38f1c47b3da4e6b612b1ad65e39e463d41372d1ea0a3770dd5294e92c92a5129d350a6012988628f886ae71bdd1b9b24668f69047942a4b8b6b7bc81f6976d0fb691a5ae69e041e216383cc6ed179157bc4b5eb8d7169d822ec72e9395e92f27202255853386675645cb2792ae625a9989a452dc89759d4282db06e05110de5b5ba9762db4658ee077852c6d3f840d710ec7006809ad39d2982f2c3aff00ea51b86e35fb8dc3d28b7171657770d26d4c9147e166612f731d239832e71f1492466ec0b98e0276f4cdf8672e8669ceb0e4c7d0f8e99ad28d1bfd795f98fad3a1072b3d554342bf94f4db326edc0c3b890c3d5e1beda95bdb7d691a969c74ad20f8ee9c105c5ae1941c052b43535ece4a6fab37aadf503a7fbdbf6f7a8508d3ac34d1e235be2c5217868739c4f86e7fa2d0d070a1c79aba6b9f792c0b5cc95195985612b66a4141c2161b7b36322dd78d7898b84c80d235db54157edc4c9a7f48803e061f3db58cda749f57b8b2fa548436523d16073687850938d0addfbabd7aba6da16ed668ba7b24bbd1466135c359235d1bc1228d6b9a330c0548078e0a53b17e4caa65fa340642a4be34856ec6d4eee35ca882cd953a69b859aaa0a37709a4ba2a26ba0628818a03b86b59ea7a6dd6957b2585d8cb34468e1c788af1181e3c97606ceddba3ef8db569bab40799349bc61746e20824073986ad20104169e202a83f2f97dcd50ac997e1421552193386e43874983e70f680fdcd7dc6f7c64161a3aaa04070a3a85a42c61bbac709242816199e43d25aaefab36cb02eada98245649230320fc8f1e7bd22997ddd73b75d448c1b148a01447c4c1ae8ee9c6eefd23047a3dd9a4d1c6034fcaa5063debc8cf5cef577bad07579baa3b7439fa6dedc975c30650d89cfccf2e1c0d0914a63c5463f17b3a4e71f330d3f20443f3b48f633b0e1674c89aab15ed70b22dcf2cd8e821f8d57a99029b0177308f978eb60ee2d321d5f4b92c666e67ba37067f28820715c83d20ea3ea3d2edf963b96d2431da36e22170002734024699050627d1ad00c7b166ad8373651f9018ea132550240d215f9a2b82a2751b3968ba4e19395993b4166eed245749449cb7307d2286e01b86e0203ae51d5b49bed16f9d61a83324eda1e20820f0208a85efcec0df9b7fa93b5adb776da90c9a55ce6ca4b4b5c0b1c5ae05ae00821c08c479155773fe087e6dc047cb7f0dfcb540cf8cb3567c65c04a47b3998b928491408e63a559ba60fdba803d2bb478dccd9ca4612880f42a8a8203b6c3e3e1aa96131c8d999848d2083d841a8f3d54bbcb3b6d42d24b1bb687db4d1b98e079b5c32b879c158d67729edd4df17a12d9db0fc7393d27762ada2b889d8812ba650cce37df1aa663a6f9da0e5e29d660210e29f50f50ec1beb796c2deeebccba36a46b702a18e3f6d89342780a0f270ed5e4cfad97aac9daacb8ea2ec78deed0c6433c356521072b333460f7073cd4d3352a6b828dce33f2b725f15ee6ad8e86a3078ce43d04e66bf38324b433f4d031fa5533761231ca11da6554c05381fc87c759c6e3dafa76e5b7632fead9195cae6d330ad2bc41ece6b93fa33d6bdd7d1ad59faa682592c1265124326731b80271a35cd39854d0abacee1b82a3a79bd639998760bff00c556578f60b6442b055116957c9cedc39f7cd981fd17ada2e75b1db980dd0a901e02a2650beaa65d587646b525b4926d7d49e7e996cf223248abe2a0a171e048c7014c392df5eb31b02d758b5b3eb9ec6b73fb27aac2d377929960bc24971cb83c31ec2ca1a101f5aba8405729d8bf9d0df04e6495e37650b7c7c261ccceb7bd52d697417327099c9cb98089846894a91506f110f778345668e3de133266926ec0087440eb0a9be36aea6592bac6577e05d8b49f958603cb8fb4157faa4f5464b0bf774e358998dd2e76be5b42ead44e5ecac2d35ca1b202f78040f4db81aba8733ad6c05e8526889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a22688b411000111100000dc447c00003cc447d801a22c0f7bc4f32a07977cab14b1ccc5924313e1585758d201ac83b392b7317389b2d8cd77c815b8923d72d088d8bde1a3049f74a6bbe6312d8c6002741435f6e1be6dd5c18a371f09829dd5a9a91cbbabdcbccdf5a6ea1c7ba3770db9a55c48ed1b4d8c46f6d7f06eb9cef2f7b40241cad2d8f3115194d3038dce76c4c1ad700636b973872db76048d90a93f89c691ae7d11934e3cef1275233c803f410419bd9618a2b766a26b759da9d6dc408a78f32750f597ebd7ecd9da7170736506570e1cc06e18e15a914e34ec5bcfd5376041d37da77fd7dddb1c42ddf60f8ec98ea7880666b9f2b73801a64c99585aeae42e18026b0b59772bdab32e40b0dfad326f9fc8ce48ba749a6f1daef3dc1b2cb18e8316c658e7f4d06e410294a1b143c83c35b56cb4ab5d2ad996f130361634700054f3341862bcf6df3bc356df9b92e7726b724925cdc485c039c5d95a4e0d0493801d9cb829aaecddc67632d2ee79273e54561847529035462bb4054c0bacd1d45bf92454593e821d31594201886136e1ecd6a6eab6bb3595b8d12d4968780e710788a8201f67b8bd02f50be9045753bbaa7a90639b1ba48adc1152096ba373c545052a4020d5648250000d83c036fd9fd91f311d73db5c5d892bd4f0034502fd7cbee79ebed9f1c794289f8a57eb5715293445c4cf4e45d6a1a527e69d26ca261983b939076a98a44dbb364dd472e15318c25000222988f9ebee2b77dd4adb7886695c4003b49c02a4d4351b3d26ca5d4f5091b158c11b9ef79c035ad04927c802c6abb86773a797678f71471f67e7a0a01a3a6a59ebbc6ba18b7534406663388e8c70c5e7bd24c7de1c01151374f58a5e5b6c3adebb2fa76db381ba9eaed619482446ec729ad054114e18f3e2bcacf59ff005bbb9d73c4d91d30b8b9b6b68a66f8d78c7786e95b90d58c2c766cb99d8d40ae5e0adab84fc01c8bca9b134bedb0e68dc641280f2766261c3d3ccd9cca2a2e1c04788a0a8b93bb1dc4eb2aa177eadfc47579ddfbbb4edbb6a60b2a1d44b68d6b7830d2988ec1d8169ce80fab26efeb2eab1eebd7dcd66d532892592573cc93d49710df44d7373717006ab2b7a0e36a6624ad31a6e3eaf44d5ebacb6f778e8866dd8a22a09089aae562b74522ace952a65eb50db9cfd3e23ae73bfbcb9d4ee0dddf3dd24c79b8977b553879382f69b69ed3dbfb33476685b6ad61b4d323248646c6b0124005c434005c401524570e382a84889ba3630ee6011f1df7f6fb3f6356a7650ef4782c8ddddd8beffdad57b7e28f22a7c6ab5d451710a0f52e221e427287800fb04007ef006daf81f181f6799550f8ab97d7daa54d113444d1457e0e7210373980a1ff00da1d83cf6fdfd4080450e2145a0bb82a6f2391597bd3b8d8368e25a498acab775d262b764d9448e91142aee4fb889c015ea29484375014c1b8086b61edbe97ebdaf659cb6386c9cd0ecf2138834f8a003eed02b26a5b82cf4e7786eccf9bb1a061e5a954a9d3dca65943589e5c21e39a3186553356104553c1af228a4ba84907b2ae1349f3744cb2852a80444c2044c043711db5b7a2e8c6df8ed3e893c8f3739aa1e0793058e1de571e2e7118f069c2abb2d0736c0d8a71dd3a5572b3b547a2cceb742a45616541db607645e05ff514cf00899ba5421c89a8998043610f1d69cde5d32d6b6b9372724da7b8e0e656be47020508ee242ca749d72db5405ad05930e468abc1440c1bfb07c407e701d6b0ad3035a8f67057a5af9698a2d3cfcbc3f7b4c380e2a1c782d7fddd39a885afb035706fc50a41ee4f0d7d260b8a9c8c6b330d2b0ef5149c34958e7b1ae505880a22b20f9b2ad554952180c53a6a11510300808080ea644f3148d940a96381f68d5535eda36faca6b1780629e17c6e071043da5a41f6d6171ce1e2e5bb8d5962653928b491a85a1fba94ab3e67b8b4f735dc2c1ee6041452f48edc53db600e9f10001d753ecedc56fb86c1ad8f309a36d1c0d06200c4509ed1d8bc12f58ce8b6b7d2bde939b88da343bb79960736b401ce77a26a06208e551c31570ddb779e26e3fda96a5e57b25c9fe2e90875632b114cd656563eb738f6698ba2b84e35d3f6e8316ab154702a289018c063fe0ec223ab26fed96ed62dfe95a7b22178d782e2702e01a4624035230a556d0f54ef58efab0d64eddde7757926d2961f0e06025f1c12be56baa18e780d69abea5bccf05962c74933936a83966e117292c99142288a84508629ca060314c43180436d7325c5bbe07e5771a95ed2db5d41790b6e2d9c1f0386041047b8b7ff007bfddd48e3c38a9eba6640a2557245564aa772848fb04148a262b88e936c476d4e7e83148a0a270101327d63b790f8eae5a5dfdd69d78cb8b47964c398c38ff9158373ed8d1f77e8d3683aec2c9f4e9da4163c022b434343d955862730b87390789d6d41bcfa6d1e53ecefa58b529d64750537493116aaa883a4544ca66ae1149f261b6e729bc761d758ed5dd36bb96d2bc2f183d214029cb0c57835d79e856e2e8deb606a2d6bf44ba91e2de46927364a1702d2d6e5a6614e35ed5787dacf9b0ae16b746e13babc706a05c251f1a317dd3510839870d9c392a82672ed02b364e5ca7ba9e994dd47388ec223beb15ea0ed3935481dabc34fa544d1515e2da807000e2076f25bb3d4efd611db175a87a7baf3a4fd99bc95e5aec088a4735ce06ae78cad2e1886835af0a9594e377ad6423dabf41405dabc4107482a88809554d748aaa4a10ded29c860101d73d8f8e5a388242f642de464f1b6685c1d13da1c0f10411507ce315f030809be8940a1b6c1befbf9edbee3e1e5a9c38626aaa552bcd3294586c5f7391c96e18b6a5a308e539a34815251b0a2e7a5ab74bd35c4a928aaaf574ca91444375043dbaadd3a1bc9efe21a767fa5e7c32fbb5f356ab0dea15eedcd3f65ea173bb7c3fd022dc8973805a6b40d1476049796e5efa2c152ee6867175b729024316014b24ea90845089a672441e4dc9a38a64d313a69895a090040a2201e4023aebcd3c4efb287e91fd288da1dfca0d153e72bf395b85f6275ebd7e920b74d379318860291f88ec830c051b4c14ccf6bcbcc7e5dc7798f86f90dd399585c89013c956824085916904794813468b88f2bc32bee4ee2dda6476d4c9937497201ca206001d6a4ea2593f49d42d772d9911cb6ef697e5c0bc077034a56a30c577b7aa1ee8b6debb475ae876e573a7b3d461985bf8803db09921c99981d5cae63807b0818385462a23b38621b5f1eb2fdc712da5c205b3d0265a22791895dc911501568c6720e6235c9d268f111711ef5bb848fd2451331836d8437d6dbd0b588757b08351b325b1c8d0472208a8230ec20fb4b90b7b6d6d7ba5bbeef36bdd48e8b5cd2ee1a1b24648e2d6cb148c70ca4558e6b811422ab3a4ed57cc3ad72ef8a349729cdcf4ae4fc3b0351c55998d6c744796594bac0d5229152f2e9e8bc76ea5586402a2a3f4deadd0a2cebde53317ad138eb75e917a2fac59263e2001aeaf1cc00a9f3f15eab748b7bc1bfb61586b4d797ea0d81915cd6951731b1a25381383dde9b4f12d70a806a04946ae6b6626889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a2289cef2bcb18de32f0d6ed5d66668eb21722232c38569718ab851374d62ad306e632ff734536ae9b3d2929f569239905ca264919576c4aa8188a741ad3adde36cf4f7bb0f11e0b40f2e04f981f6e8b51f5bb7c5b6c5e9edfde191add56e60920b669751ce9246966668a827c30ece48e0436bc42c2ef8a782dc72333d637c36d5672c59da25960989062909958aae42c73b999d785131154105022e34e9a0650049eba84288089b61d29ba35e8b40d0a7d55d4cd1c756b4fdb12435a00e27138d179a3d27d8b71d52ea369bb3817b597b31333da0559131ae9257d686872b4e2452a456aa75fbbd5fa1b1271f71171ae9858cfab531828c066b2debca44d5e995c5e1628a29a0b20291dc10520154c9090dd06000f1f0d27d2f825d5759b9d7eeabe23cbcd79173df98f1ecc577a7aecee7d3b6674c348e946df2c6c63c28f2924bd96f6f0ba360c280177a3e91041c7058e6b16e322f59b14003d77ce9bb24bc3ffd63a5488a401b79ee73eb7abdd91ae77c915f697943616925ddf4366dad65958d1fe7380fb2b382e1be332e25e36622a419aa6d1d44567d778926603819e4bbc792ce15329d251399451f08f8f9796b90377df497dae5cdc3887564f30a500017e89fa27b6c6cee98e8db743030c16988c09ccf73e426a39fa58e0ae87589f3a2db09afb61f4c7947bea07815fad5c14aa2a5993b34633c3d0ae67322dd6b552668a6aa89fd7b351f18abc148a26f499a6f1c22770a9c760294a02222201aafb0d36ff5397c2b08a495dcf2b49a79683058a6eededb4f63e9e751dd17f6b670652478923185d4e4d0e209ecc3b56275cb0ee399bb946e24a8f0beed5cc7326a7d52d6a95e68f4646c25178e3dd0f22b2aedeaeeddbb4d72a429220421c000009befbf43edbd8ba3edf6b6f2e1be25e0198bdc410ca0fb5a0140295a9aaf18facfeb4dd40eaec92ed8b10db5daf3fe0c5bc0c7992605cea67ab9ee739c08696b40078515c47033b59219b2b44c9b9d7f2daa50a778e1384ac3344b5f9778a307c2dcce64939b8774e0ac543373f481484f50860101d5a77b75062d2de34fd24c52ca40ccfae668c3916b80af9d6d7f56ef53c8b7ee94cddfd44fa7d9e9c5ee11401a217bcb1f9439e258dceca729c282a0835593654eb3134dad40d5209a959c3d7629843c6b70294a29b28e6a9336c53f41485329e8a20261000dcdb8eb9d6f6e65bdba74f2509738934ed71a95eb168ba3d96dfd2adf45d35a1b656b0b2360c3e2b1a1adad2809a0c4d3ccb9577e650dca1b8786fe1edfded7cc4463ecf715ddbe65f56a01e906ff003983f687f67509083263805072dd6ab07014e0a9fdf5af8ea298ae1cc202b087b3d4df61dbab7f00f30db70dfcb5f3415c4e0aa80f4705cbebe952d3b56ba214d1457e4c60214c630ec529444447e600df5100b880389283134e4ad033c64269698094c6706bf4ca5965a32bcd5c0ab26c81d249bf62f670183e8ce85903348e416289c4e421d42893c404407a23a5dd37778906ead59af10b6a591b851aef8cdab8118d388c42c2b71ebcf8dced3ad880052ae1c791a0c57ced1668cc238da3770772a78963175d8366b2a2ea4e6a4d36856ec9b09fe8aef1e3806e26398004e200630fb443a12361927f09803622683b1a3e058148e73fd27125d5569776adda32edc71dab257ab0fbf0bd64ea52a74e9c6d11598540a76ee45b5859918c9b8909360b028a19170e480a10a05e9d843558c92da26e5648c7bcf3047b9425480c909a9068ab35fb11e26af463fbadf0666c53c9741e364fd6ea9a8c70549168442a0d631b2411065ca997a81126dd422630f88ebe3c465d44e824631f039a416b8541e2310703ec2aa229258646c91922469a8ed571f8032a1722d7576ebc2cbc03a81422d045b4e888bf7f14e9babf564aa82730aaaa8ed16c3eb18436f580c003e1ae22ea6ecb7ed3d6e8ccc6cee5cf7b0f2188396a0018660005b7743d53f4a5a672009d80077969dfe45705f2f0f9796b5a54570f67f02bcfbeb4fbdfdcff007750c380e283b56be1f2fdfd47cbcd2816bab88208aa92535145ae88adab95bc7882e4c61ab3e2d9754f1ea4d7d5ae184c364903bb8b7d1726d249059032a41102a866dd070010ea2184357adbfad49a06ab1ea918cde1d6adf9408229f656b0eaff004c74bead6c6bcda1a9111be76b0c72d01731ec7b646904824025b434e44ac39f925c70c81c68bfcc532db1131f54b774925056b7512ed944d81159a24f0a78f74a93dd975522a86228521cdb19337cc3b752e83afda6e0b48eead9cc2f7349735a6a5b8d31e63cfdabc2aeb0747772f493754fa26af0ce74e63c086e4c6e6c5302c0ff0041e406922a4100e143d85569e1ff003e728f12d5958bae3082b3556c6fa21ccbc6d90b26e156848e174908c42ad649a0333288bd38887498a26297701db560dd1b2b4edc795d26664ed07296d38e1c6a0d7db1cd673d0cf599de7d13749a759476f77a1dcccc748c983dce686d4558e6bdb4c1c791e03c8b29be3472cb17724aaec652b168af1aca74f695aa37966aacbc7b82364dc2c433032bef9e914a611dfa476001dc7c075cf3b8b6b6a3a1dcb9b2c6ff00000f8d4c0e34e3c31c17b2bd29eb3ecceac68d1dfe85796cfd4f28f16ddaf0648dd94120b2b9a82bd8ae9fd9fba1f36b1421c0e53c42db9cb1567dcd5e334272730d582a8ed373f947171339254c5dba88a7e9d93eaf134724e0cb20b07baba78dd2229b000f4fb7595ecedc4fdbfabc739c2ddd2343cff141c4e1e55a53aefd26d3fab5b0aef449c1fd271412bed48cb84f93d0c48381735a09e3deb0bbbfd0ed58a2ed3747b8c63b85b2d65f15076cde24aa0b26714d276d972155210c645741622a99c036314c021aeb2b2bf835481b776ee0fb791b811cfb7dea2f04375ed9d6763ee5b8dbfabc4f8356b4900735c082300e69c69810410781142b295ed8dcda679eaaf1387256209196ec6f418741790f7c05093ace0c91b082e526c711548b1bd721cfb0983cf7db7d738f5076acfa44efd5602e36b3dc38d298b4b8976270c392f613d51fd6060ea668b0ec7bc85b0eb3a4e9b182ecd8cc2211c45c1a4d79838296fdbee06b5754f02bb5cd5516e40e0da9722b1658f14dd16956d05612b132ee61576cde4505e3a41ac93555aaaedabc40a20e1a140dd499b72088786fbeaf7a16b977a06a2cd46d3299995c1c0969070e008e47b5607d4ae9f68dd51d9d75b2f5e74acd3eeb255f11687b4b1ed7b4b4b9ae1f19a2b51c2ab11fcfddbd391988f20cdc2d77155fae94d527e59a546c301012163f7c8749f0a514b4a2908c94499bb70d15484dd444ca26ead8000076e9fd177f68bab69ed9a6b8862b9c8dced71cb475311e91af1ad38af147aa7eabdd50d89b92e2c74bd2751d436fbae5edb69e189d367883bf0664313486b8b695a86d4d683057c9daef879c82a1f2019e46bf522c941aec242bb387e50423b8f5a59c391045366895fb54d42140a2613189e3b06c03ac2fa8db9748bdd10dad94cc9a673c0ab5c0e5a1a9ae27cde55d17ea87d05ea46dbea147bbb72d8cfa7e950b08a4d13d8f91c6940039a28d009a9a772adbdec78d8c2429754e4d5762a4d5b542ccc5d2ef6662dfd76215074c265c474f4a026d8cb37189976c833058ea027d0f0a5306e0510b6f49b703a3ba76832b9be1bda5ecae0730233018d31ad69c78f25b03d7cfa536d71a25b75474b8e53a9433c76d759455a60731e592ba8da82c7b5b1e6272d1e052a02b12ed01cd6ffb21727a320ac8e635ae1ce40bcadd0f27c9c8f4a05acbd64a4c131fdcfeb151db46ac5857e7ec2aa320a38eb4528b7ee561003a44307536dbd49b6b76637902196809ec22b94fbb42b953d55ba916db3b784db7b559238f49d6046ccef394473459fc2f4890d01fe2398eaf1259c298e789ad92bd3e4d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d11344582bf7abe62b4e51f2a95a3d4dea6fb17f1b4d3f40abba2b23363c95da45d4586549b22cba293d5599e66b8d2310036e81938905d1fa2b898dadb756a427ba16d11ab23a8f3f3f780f32f357d6b77ec5b937841b674f787e9fa4b246bc8e06e242df1454815c818d6f300e6a712af63b23f1e2223f1fdcb91d6083ff00de89db0c85269320e8541f46a51aca2d6967f1e915614402566dcaad8ea1d3f50018881440a61eae57eb16bd2cb75168503ab6f1c4d7c828299c9394578e0002ba7fd443a6d6b6bb7af3a99a8c1ffc4e7b97dbdabddc440d633c4734568039ee736a454869e4ace3bd05926df72421ab4e5d7ab0f115266f5834f41a905170f96581c1fde08891c2a06290a1d273980bec00df593f4ae1822d07c58db491e7135389e7cfceb9fbd7bf5abbbaea7dbe932beb6905a35cd6e50284920e39438f9092072515940f4cb73a728b880b54ed75c3b803fe09902cbb41580c21f4ba7a0075b1ee8075b3c37e3063bde5c61b6a5822dd1a73ee07e085ec04f93c56d7dc59eed094455a5d5946e62990340c58a46208989e98b347a7a4c3bf506dae34d4411733e6f8de2bb8f94fd85fa49dbae63b45b37c4418cdb46411c08c83ecd576ef979ead7dc15f7bd0440a02223b0006e3b8f86c1e223afb88173c01c495071a035e0028efe54771ac0fc7b6960ada16c6b64c9ccdb8a4caa50ed241f288bc59328a477f22934344b52b713819421d705003c3a77f0d6c1dbbb2b53d7246cd230c7a757d2792073e42b9bcf45cc3d62f5a2e9b74c34fb9b26deb6eb75b58432de3648fa3cd285ef0df0c06d6a417570a52ab178ca196b3f7343298b8973cb5ce71daee9180ad47b66a9378e8e51c09d26cd9ab52356a42a6512818e7f1110dc475bff4cd2744db1a796da810c5f6cf2492e2071249271ec0bc84de1bd3a95d7edd99a774fa8ea2f7bbc08636b5ad8d8e754343406b7b2a5d8e1c54e47077b50c463c3d732767c6447f7e8a9a676082adb69315a320d566464ea3cf2031ef05abf7ad24513984a26552306c03bf96b546ebea43af58eb0d18916ce6e57b88e35a8396a300461dabd10f57af534d376a1b6dd9d4b6097754170c9a185b212c8b2657373786ec8e7078271cc3929c76cd526898228940a4287814a1d250dbcb600f000db5a72e5ee7495e5f67e05e83b031ac11b006b0700300b71fd8d52f2c31039afbe3e55b277b6e4fbc3fbff70047701d5442302062bedbc2abead7fc1000efbee6df7fba223f38fcfaf897e3f79472dd6ab5bf14791535715aea29dc170e6f05c47c87a800477df6f1f6ee3bfb75f20827b71f605543e2ae5f5f4a956ba28af92ca95148eb1b712a65318c050131b6286e3b14a02223b0796da85710399341e55102aadb6632cccdd6b1628ea6516ea65a5a1a5e361aca80d7518f6d20e5a2ed59bb319c4e03a401bb950a7103a1d6502f89770db59ad9685169ba95bcfaa4d0f80c958f736af24b5ae0e2306d2a461c78ab15d6af0b58f85b984a5ae1c39d081eeae0a9582e15844d6e4edad024af51ecc4169c23c728ab1ee165145162b206ce53436fc6081cc2530a8226ea1101db59aeafd4bd726d41d268d70eb7d32320451656e5005063569ad789a958136c9cff004a6c5e4e38fbab6bfcd7589fe481b158afff005b63b89840691b4c2b1608f4cea6b333967652488915ca8e4844562814864d3d951012eae9a8f58f527e8cdb0b76b62d55f4cf2d01e00825a294049a7d8501a6124168247beb9d990c5d3c7243c2ccc0c6d8635422d1ab45ae44df47caedd2cd6708a6250765f50400c92e0721ca22021e3ac5f46dc5b9b42bd66a970e91f6c38871147349c456b8569c45085f4fb3cc00631ded3970a6c1f56b33f51e6495cf6a74e57219289fac65994375248a69a2a378f41f260553a08263814dd06111112eafdad756b5ebe14d04fd16dc0f483431cee35a6621c695f3af8669e6be983ed11dddcb9e1ae0e2f9faa4853a19c929ed58c943582399ae6589131e9919b88b7e46cb9d690902b1f775522a29faaa07adb943cf5896a7b8755de1a68d3f58958fbe85c1d0b9cd6b4b8bbe333351a013406aee0afba44ccd3ae0bdc488dc403c4f0e180f7fb954294cbf5f615156f2d984ebfae332ba5e55d844ba8d5e263d822670fa49e309a2c6be168d11218c6e84ce736c2052987c35885bed4bf9b516e972e465e4940c198383b31200ccc2e6e27b480b2e3ade9808a4b5f31f7705502bb3d1d68828bb0c42e2e632619a4fd8b814576e2ab65ca06494f45c2692e9898a3e4628087cdab25fd8cba75dc96730a4b1b883dc471e15aab9b5e2460919f1485ccfc835418fb3f817dad757214a0a70522a7895aea289a22d344543b3471db0ee7f87460b2bd2d8da99345057642b399064e592e64d54bd66ee639db45c86e858c1b750878f96ae9a5ebbaae8b378da6ca633c0d00c4120d0e06bc16bfdfdd35d93d4ab11a6ef3b18ef2ddaeccdab9ed730d0805a58e69ad091d8a0079adda6a4b1bc692edc718896b357d8349b91b4c339966e6730d1d1c8a0e5259b9a5e48aedf7e2017112a5d63f8bf2dc435b9368750c5dcc6d75c7b239dce686100fa44f2340471a2f353af7ea557bb76cc6b9d29865bad3e26caf9e27483346c600e04195f571a66c1a49c382886c6b95b26e10b30d8f1ed9e52976560a2881dc374db2c3e253a0aa4e193d41d3358a24318bf4883b7b35b2f52b5b1d562fa2dec6d960342462311cea287dd5c3fb5b7b6f4e9b6b5f4edad79358ea8c243b2e5388a821cd78734f6623c8a63b00779eb7c2a91f159e230b3f1c9b249b2f658a60d907867297a0433a5d8c735480deb10a73081083f4bc835ab75de96595d30cba3b8c7283f149c298e1527d9dabbb7a63ebedaed9cb0d8751201716cd8835f3b1a03f30a02e2c8da2b515ad01a7629a6c33cd9e37e7a27463cc9316f9f10a87bd45c8b59384906e7742722298a12ec997a8650c9983e809b6dbc7cc35a9353d9bafe91e95ec2430d69948702399ab49f7577d6c3f580e95f52632ddb3aa44fbc6e50e8ded7c4e6975680f88d68e471aa802eef38a2063b352b97a06c913243782c635958c6b24d9cbb66ee26198c59143352ac2b153391800ee52f4f8f8f8eb7af4c6fcfe866e9b72c7b65833509045439c4f1f23bdc5e6e7af5ecad26c37cfedce973c724da888c4cd120716ba38d910f46a68086d70145627c4acff3fc68cd30391608e9fa07415829c49c144cdd7859272d15780aa652287114ccd0872f48750097cfcf7caf746850ebfa34b66ec242439b4e4470a72e05734742faa17bd29ea05b6e7b5706b0b4c3283520c5239b9aa0035a65056709012ace6e1a2e5e3dc15d319364ddeb5704dc08b20e5305533977f100314de5e7ae3fb98a4b79df04828f6b88f6bf87f817e862c2fed754b38b50b27e7b59981ed70a805ae181c715cc797def66a9cf672e4ab382fc1934ce206310a712f8944c003b7dd0dc076df5f4c7bd80b41c38d141cd6bb88057ec0403c8a50f9b6000fec6bebc5765a0a5146aba7641a356f2752ec942b846a12f59b4c53b87988e5c4e523964ed2326a140e91d359150bb81887218a721800c5101001d56e9ba94fa65e32fedcd2788e6691da3ec771c0ab26e5dbfa5eead0aeb6f6b51367d32ee1747230f02d70a7114208e208208388c5608f9fb1839c3799729e277c8b84829377b2579899d07e35ec23392729c1c9098863ee49486145728efbf4a9e3b0ee1aed4dbfa80d5348b5d4dbc65858e3dce20123cc57e7a3a87b4af7a7bd42d536d4cc7b3f47ea1332327898db21f05e083f6cccae07bf159e7f6d3e5cffdb4389d47ca92a72ff38102e1ce37cb4924d0cd1b1723d55845af2720d08083769eeb658697612e42370322dc243d0dc0e91ca5ddda65eb6fad1b383577077f2871f87cebd67e986f8b4ea1ecbb3dc96ce0677b03276d29927601e2369e521c298657057f1aaf5b013444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d115aef33f92b0dc45e34e52cf52ecbeb65a9b089a55c822ae46e79fb84f3d6d055488054c4545341ccdc82267072914324d48aa8053746daa5bcb96d9db3ee1df6a3db3c87b6b1ade3b96d7676d8bddcb780186d2073f2934cce028c6571a67710de078f02bcef317d0df654ca78f31d91f28491c8d7dabd4c651721ddaa8b8b54fb38b5e49720a8551c19151f8aea089804fb088983c475a4b58be8ecb4eb8d45e056185f2769395a5dcfb68bc75daba65e6fcded63a1caf71bcd53518a1748e25cecd3cad617b89357105c5c6a71a6279acef31463bae626c7b53c71528f6b19015285650ec906ad5268557dd1b91359eac9245029ddbe71d4b2c71dcc754e2611111df5c45abea371aaea12df5ce63348e24d493cf01e41c005fa0eda3b674cd9db72cf6ce8f1b22d3ed2dd9180d6b5b52d6805c43453339de91ed26bcd633dde7a0936dc88819f124909a42b0dd9a865581118dff001355532656afbde4ea3a702538f590524c0a01e023e5ae88e95bcbf4131fa3469e46a47942f263d7d7466da752adf5588c84cf6c1a6ad01808c681d98927b46514510292e7400aba1d64510395420f5095429c8206298a62fd2298a21b8087b75b41d4ca70e382e0a6173276bc3a8f041047220d41594df6e7ee0b8e2ff8f68586aece86b79160a39cc3a4ac93f339693add819db868e5374e1348e8aea32029053318e3d651001db6d73def6d8da8457936a768d0fb47b81c1b4cb5a035c7b79d02f66fd567d66369ee4db5a6ec1d7e4fa2eecb763a205efccc9833339aecce008716d050938f3578b9cf9e1c7ac06d806d56a6f27225932452f0902649eca3654e8aeb0aab2206029522021b08f56fb886b12d3763ebda9bc88610220dae63803e434c78adf3d46f589e9b74d21aeb1791cd74250c745138191a4d7170c700450f7a803e45f76fce794179487c67eb62fac2ae1cb768ea2e51cad6176c1422887e39da48322a22b10fb8014bd443790eb716dce9a68962192ea1f87b96e2730f46b81c054f0f75799dd4ff005deea1eec96e34dda24e95a4b9c435ec7b8cc5a6adc5c0329518d39156c7c69e20668e5b6466693bfafe321659e38716ac913ad1e49a8cca2cdcbc072749db86abc9aef1444a91045628751c044760db5906e2dc9a2ed8b334c8e7b706b1a4027baa060057b16aae95f4277ef5bb75462e8dc41a75c48e7cf792b1d210002e2e01ce6979711947a4054f15946717f8318538c510d82bd02c2c1723b3628cade6662d89a69dba6ed81272ab23895cab18d1dae2653d02ac70288fe10edbeb9f75dde5aaebefcb3bfc3b269716b1ae3c0f27529988185485ebcf483d5ef62747ad5a346b78ae75c2c6364bb922609496b684b0fa4636b8d4e50f34ed3c4de9143610d83c3d9e001b7807dfd636dca054732b7ab41cc30c3d9ecf6d7d3f7754b3fc6a0ec552c4d4834ad17d85b177fde087980888006e03e3fb9b6fecd4e8456a3bfd982fb6f05f56a1f8adfc47c47cff00b5af99699f862a0e5bad56b7e28f22a7e6b5d4502e1d4fa4b08886df4c37f00f0d8403c803cc4035f20e3414a57d9fe5552051945cbebe9532689cd7cd6ea045412014c602184a530ec513007801840076011fb83a81c869e27c4af969dea35c83376056a32de8215091c8f4d728d365d35fd496878e592948078fc1d159facfd9b63b1496121d5398c2009a8af91840400432eb6ba9639c586a0cf1ad99197349ab5e5ad6976504d680d3be8ac9359db5d8fa4901b33e830e1d809e1c3be9e55db94672c0aa2f9f589f3d5ca6239222d945a3d89143b504144fdd51746228dce2613811413f41c7701f0df5cf3aef50b55be2f82c98cb6809a7a06aec1df280189a50d00a838ac8ecf6e5844d6ba4024701cc607cd8fbe551395bf50a02dac6945968f42db6959ea89c5323105dbb5122aae9e39785484043a7d33098c7f1137ddd5a2e6cf7deada44dafccfbb76956a0667991f46f20002476f0182ae6c9a45acccb402213b9d46b728ad69d9dcb8e91611cc45cca11ab749449332ee1c376e9a6e4e56c02af509932fa8b9c0a5f0288ee3ecd610356d72f2465a7d2ae88738001d2be989a6357500f796422381adc58dedf8a3e056ad09ca4c3977c8ec29f0b6e7637f6eabf2c4a2edb3e62f123c7b75cefc8cdcac25f48134515004a536c60f0d6d1d57a77d66d9fb5e4dd0e3711edca34b9d1cee70a39cd602e6b5d8fa4463cb89560fd27b6efae3e807c1377c32960ad78f1a7670c55c943e4abad78eb0125dc4d26b2a0a9529a5d77852eeb18e7215750545880729ba43c440a001b06ac1b6fac1aa5a48cb6d5e117500cada976578a0a541ca7313cebc4f354b7db4ac6e58e36df8390d780a8ed18600055defaf665c26d6b89d7c2dd392cdd6904e09372646b2c230ed3ddd546c24544c8d81b9dc028044d54480af50074140a26d750e957713b2ea5e23ededda40cc4d24711890cc2ad20102ad7735848d2fe86435d964b9772a500f29c6bc39f15715029ae8c2c622e59b58e70934448b3163ff9934390800641b0022dc0114c7c0bb10a1b7906b0fd408372f78739cd73c9cc49248ed249249f3aca600442d6ba99a9cb82e543c3c7efea841a70e2a6635aafd6ae2dc1a2bc5493c7b9351504d14689a210821bfb345022bc42f8b86ad9e375dabb6e8b96ae5251070ddc2645915d054829aa8ac928531144944cc25314c020203b0ea2096b83da487b4d411c411c08ef0be5f1452b1d1cad6ba2702082010411420838104604151ffc84edc3c67cdf1afc094a83c79637644cc95a693071b16f53588e3d6328e58b24d9b790f5b7129c4e206101f3f0d65fa36f4dc1a75c07c933e7807da3dce238769269ed2e73ea47aaaf49ba8d6ef93e816fa6eaae1fd3dac31c6ead6b57068687571049c48256395cb6edf79378c8fe4a410f7cbad0107e66cc6ccd620ed1706ea7aca3733f6283a91040c54d1103180fd3b86fe1beb76eddde363af441cf0d827a62d2f071eea815f697975d6cf558de3d24924d46d9efd436f9968c919110e00d480f687be840189e0ac3a26766ebee4af2125a5619e10c4123a897eee39c94c43098820bb45515004a6f10f1f01d66ae64128cb3358f61e00807dfaae68b2bfd434d97c6d3a79ade7f951bdcc761c31690705be91b14ed8952b89f9c969972223b292d22f24960dc3610055e2eb1c37fb83aa57431c469046d60a7da803de5f1aa6adab6a6ff001353b9b8b978fb69647c87fe992b6273fa650000111fa252806fe223e050f0f1f3d5c226173003d8ad50c6f965019f18959def1c23df45e10c68ca494494788d4e20aa8a675542f57ba2421f4d63194388079888f8eb8bf70b83b59b8734068f11c3da77928bf493d2cb2bbb0e9fe956d7a7fb436ce3ae24fda8e67155b7cff73565e2b6027cbeff00fb9a8772724fed694f6d13e6dc37fb9a88e35704e0b1b1ef978522a12cf89338c04424d1cdb92b0d46f0fda35224471230e9c3bdaaba7eaa601eb3d72c5cbe444e7fa429b62177102800743748b5a9a7b6b9d2257bb24218f60ad680e60e1dc010de1dfe7f2cff00e601b0ad6c754d1b7e69d0b5b35e89e0ba706d017c622740e711c5c5ae91b538d1a313cbb1fc3e9cb07345cdb68e24ce11e38af6724e4aed48501c88b485c8746abbe91b113dc44bd1bdb28907bacb81ba80d06d93d840db97a77685f9123ec1f521de903dfcc7b43dc5847a9eef96c1737bd3fb9a659c9ba80d71ced63592b294e6c635f5ae190e06b86615acfd77c26889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a22c647e232cef164a9607e30b1508acc49d9dce72b38a62e0ab46c557a267a8f5166b18a606ca379f79679658533018e53c5a67fa2021d589eeaba11dbb2d9bf1dcecc7c8011ee9f7971c7ae2ee982cb68d86d689f4bfbabc1339a2bfd0c4c91b8f2a191eda7f20a8e1ecbf83a3321e7bb5658984d659be138a887110900a5eec368b884db18d70e135133a8a7b8c6c43c393a04bd0a890447c80798fac3acc9a7689169f091e25dbdc0f1ae56652e22980c5c01af1aac2fd43fa7d0ee5dfd7bbcef83bc0d0e28dd170a19ae3c56b6a0d49cad8dc4529434c6b4595306fb808f8fdedbcfc76f3d7348c713c4af5e856a2becf67c0ad7f965c5da5f2b7192f43b51dd473c6af0b2f01371feea57d1d2c836748203ea3a6aeca66aa83a1f548005136c1b086dac936d6e3badb5a97d3ed7169195cd35a16922b803c56a7eb2749f43eb16ce936ceaf9a39b3f8914acca1cd9007018b9aef44e6351ef2c53f2c76f3e5461f9c6f1f258e242c8d247de023a56a8ab39b6ce7dd410f5855498bb5dcb2128b82edeb14806f1e9df61dba2f49df5b6f50b6f1d970237d6995f81f6e945e336fcf55deb06cabb65acba54d776b25724b01648d39699aa1ae25b4a8a6602b8d2b42ba033e1ef28dd18a76b84f200aa061128a318644e062f87d1132a4386c3ed0d5ce4de1b7d868dba80b08e656216dd0aeb239c1f69b7f52af239003d95f8c28ae4f07f6b2e516599572e2dd5d758d608a92c63cbd99dc7aafd676074bd16e48b2bf3bf3028998e61504bd21d3b79886ac5ad751f6fe970b4472b25909146b73539f120502dcdd3cf53aeacefabccfb8ad9fa5e9d439a599d1990bc52832672e35c4d780a297ae30f68fc53899f30b764a7cf321dd21e75b4a4415755ba15b6648e51a3a647fab536c2b395fded230a80aac74ce4d83a75ab75dea6de6a51bad6c9ad86d9ec20915cc6b504549e14ec0bb8fa3dea4fb1b62dc335bdd0f9354d7629db24752d10b034b5cd0630df48e6049ab8820d28a5e18c6b760822d9b2283741b94088a0d932a48244280814844c85210a5280f90006b555c4924d297e605a799e2bb6edad21b36086d9a1b00140d18340ee1c02e47c3fb7a96dc1546057eb57452574cbc5995ac4491d336832124edd271d1acfa80892af9c24b28895ca8274c1243a501131b70dbef886ae7a2e8edd66ffe8d2c822832d4ba95a00457b78d70ef5f33cc6da0f11a0135e05744a5657098b329429d462d9db19d76326dc9629fa5231cba8b995425106fe82ee5667f56bb4c0bd2e4533a80701281800db566b7b5bf47db9bfb573e4b21339849a02298b4914e63881c14ab7bc139a3c65765af657c84e0477f35581ca663f48940040a03d43edf0101f9c076db58b5bb4134ad0f9157b4d02fa360d9310fba3f3ff677d7cce0364a13547638add06aadbf1479153f35aea28b87f015bc77dbafc8043e7000fbdf7fe6d7c73f49550f8ab98d7daa65a68a0ba65d27e5abcc5ac94643a934d107a01388373003c6b160dd75157ad113289fbd2882a4275265031cc411e90dc353aced20bab830dd49e1b9cdfc1e0482ea8c0d01a547334155f4fa88bd11556fd90e4d9b04aa93b446b5493aa64bb3d7e0adcb8a2a1dcbf4641da4488918e708b949bfacd05658542aa91c4db943c040757675b9fd17a947ab1b966a767672be115a06e563b3b5c0b49a3bd118114e4a80b8b6487c0caeb77c8d15eca914e7deb659d21939dc7d2f166bc4ae3866a95b84a5960c8d4d28da38ab25ef2830f7a68f9249cbb4ff00165302473009be886fb6b9f7653ee22dc5036d34e8f54bd738f8503c388749439490d734900e2456840c564fa8c6c92cdcc96674115317020102b88a90463c0e1cd5a271f31571a6a128f3f9b5772b69b9981ccbca59ade94d29677cb3a5ca57d28a399587886e651d395f7505ba452f51c7c00076d67dd60d4bad7269913f7c59bf4ddb8f708e28626b596e28d25ac01af79c1ad340e248031569dbd06ddb799ccd3646cd77425ce241771a124d07322bfe55734f83d22ae629407a5336e23e22201bfcdb0796b9aa52e0d040382cd1a4938d32a8d6e4ae0fc09962ccb964a4262ab949b24c818596b31f2c9aed050320f13074f91877d0c60f77fa26eb3818851f328ebaaba35b97adbb6348fa7d8e993ea9b0246bf3c5200e6b9b8b4e50646b851d88a022a2b885866e0d2f6fea376d649308755a8ca43a9db4ae04634eee4ae3aa8cdc44562ad0aee60d30bc743c7c72b2ce4c99569451ab445133e580bd0531dc093acc20001b8efae5ddcb7115fee9bed42dad3e8914d78f788454f841d213939d295a2ce6caddd1d836da4717163002ee66829527b79abbcc5f0ed90ae3baf63bb1b89198904c15b55ea49d9675ec4be12033062c5574dd995c8b42206f77dd2552208f59c0dd5e3ddbafea8cb8961bfd6a18d91b23688a0634b18e03892013438e388ad16b282164513a28de5ee04d49c4e3dfdeaea209abb6314c59bf7c7927addb269b990311348ced528001dc193480a990ca8f8881400a1ec00d6bfba9e2b891d242dc911712003500765556c44d71f8d4f677ae63f7b54bc38d69ecf61551ef2d75711c14a4f9796a2a09a226889a2734f979688ba5dc2d909526e47b2cb2e6329b268308f6ae24251d9baf738348f6692cedc82641131fa083d240111d8037d55dac134d9b280d81a2ae7b880d6f6549e0a6021a29ccadb415a602f2c55731a574649b18ad9db3928e78c176e731007d25dabf6e8a806e910dfc0435f135bc96ee05e418dcdccd735c0870ed041f817cba38ae2331cad0f61c08215a766aeddbc6bcde65dd4ed4090330aa0e1109bab031897dbb800fc6adbc7b949c2891c3a8a2628ede3abde95bff007069120103dafb7c2a1d5380ecc573fefaf563e92efd91d3ea3a7882f1c0fe121cac78a8a5716381edc41c5584645ec838c5d8954c6992aed12ec5566551a58d4869261e89412078a20b33858f5d25942018c50398e5ea1dbcbc359cd8f58af9849be818e61e196b5f75cb9cb737fcbdb645c0f176bea9a840e396ad94c4f000a075291b0d48a915340792e531bf650c7b59b8c1582e1906c3688a8b315d3a842162dba0f9e24b24745358c31863fb88900e07200f508887d2db7de46a7d5dbbbab67416b6f1c72bb0a9af0eef4b8a9fb47d4136ae85aedbeabaa6a575756b090e3152301ce0471fc1fc5a5452bd98a9c18c8e6912c1a46b0448dd9b24136cd50206c44d048a044c801f314a1ad3b34f25cbfc47d3c43527b2beefb02f406d2d63b38196b08a431b435a3b1a0502df6a471c4aa94fddf97cfa8d0f9d3826883b56ba10547de56cfcbcc0919c91c0190317bd4ce67f270eabfad2e9a88a4a34b4c400bf805caaae9a89a699a4102a6aefb6e8a870dcbbee191ed7d6e6d075886f6323c1cd47d6a7d1381a018e0b55f59fa7f6bd4be9dea3b5e769370f84be120b4113301746417020548a1af22b0bfe35675b3f1873ee2dceb554935a6319db5acb2cc572a86249c1b84dc42dba0d404966ea94676ab24f596e07012fafbf8edb0f6e69372eb2be8ee5b4201f350e07bf812bc2ce966ecfd83ea269bb8e61f83b6b82d9071fc1cac7c3270c6a192388a7db0181e0bd24e9f6b81be54eb177ab3f4e52b371afc35a2bd24914e54dfc24fc737948b784228522a42b964e887e9314a62efb0800ee1adc4d735ed0f6e2d22a3cebd95b79e1ba819736ee0e824607348e05ae15047941aaec7afa5393444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113445806777cca49e53ee1bc8392632cb4b40d3a52b78ca05253d002c5928b528285b4473606e2629db86414e65c14e630a83ebec6e9d8085d6bb867f1f529180fa2ca01e602beed57953eb3faf49ae7566fec43f3d9d8321819c28da42c7c8011d92bdf5ae35c380014e1768fc0a188b8bec6dd20d5346cd999f25739154aaae6502051495695568b26b0108919164aaab0810bb08b91fa43ae3aea8eaedd67707d1986b0da02c1e5750b8f9e83da5e8e7a99f4f46cae9345abca1bfa475b78b87915c236d5b0b4d698805c4802957712a52be7f1f3f2f0f66fe7b6b58900545382eb6a938d78ad7e61f66db0f8f97dc0fbc23a87bebeb8e3cb9fb3ca829904863188530800886e01ecf1f00d7c805a6838153d91b1e3d21c4adaa07eb583729000db800749436e92efe1e425d4e91b46e61c7bd4e31460700b7e24288efb7887dd1fb9ecfd8d539249a9e7ece0a5989871a62100a050d83f73fb3a8570a0e0a2d606f05fbf9b40bed69f2f1d0256a17eb7f0dc7c3c37feeeae638293c5581732f30cdd571fb7b5e2a14e6acb4cc975c8d996a46649223663231131ef4266ca019250dd428fe30bf489e200203beb626cdd3db04d3bf526b9914b63216769735cdcbc3bc55525e305c18606d1cd74ed071a506353db828e0abe6d92c2f7674672c269a5a7272c32b3b28a9142a1109b772ea5a39fb01315c8b84544271529dba88826637487506dd41f3a55d4d7b6326a5a9bde7498c66958f6b05647fa204795d5cb8624969e18159b6ada45a4f1c369a6888dec748d858f7125ad18e705a003d94cdcf11ce5bb1ae577b62ac56aeb2b60058f38e59bc3d71a368c1748576c0e956b046904c8e7ae39e3333a4d578629d400222201e223bc8d6347d398f9adac0344cc8f035750b9b8be981ad4540a818d3871583c734f81981c8703da0f930f715d2355135512aa89c14494fa699c04a60301bc7c04a22021e3ad713e63255e28ec053ccae41e1c2a2bc16eb556df8a3c8a51c16ba8a2e1c44057111001013edb786fe03b8007b07cb5f06a0d39aaafb5aae5ff006f5f6a97de5ae8a2ba15cef95da82d10cac65768359f7468d42441b94f1a8ba3a46311bbe702a145b8b84faba7e88947a47710d5c2c74fbabe6c925a16f89150d2be971e20771fb0be25788d82b5f4b0c392b36be63e93c5b2f8f6a749877cf31ccee4dabce0015daaf494a791d2e82ae51133d5977278b9745d18480538fbb990d803637864da86b50eb7b7756d4352972eb11e9d3b29468f173c6eece6d201e18d550430cb15c5b5bc0cac1e2024d78508a53dd5747426b53b6e5399abdc5811d44d3ab0cae022e9529635550cb814867e43094542b13ecb1371e803140477d83590faa1ec5d22f9b71bdaf636c97d0bdd1c44977a04d5ae205729ab49152091c9593a87a9ddc6e65846ea40e1523b78288dccfdf3fb7f640e52b2e2062fad5facf99ebf902469ad6e501095e6b4446520e45e40cdb37128d6d0126fe34142a86207b918a73a6430817c043a47aefb52cf7874df50b19f2b1f6f119a379fb57c60f0c39b4b879f92c3768ea32d8eb51be3350f395c2b4c091f671efa2be7b16c8b45d1151da09bb2fb98b866926b3a40cf8e0d5370dd35ce521d640eb018a061e9110f1d7913b2b453b8b79699a28c992eafe08dc1e48696ba468703415c454618ae83bcb8365a6cd718931c6f70a7114048e27928f6e7cf7c7e2c76dbb8b5e1a52708ddb901956063583cc9ad60e2635eb38b6d668d696276e9f483c9b5259ccb3a672a0b2890a654d121800a60214003dc1d1343d1f43d1a2d134d859169f1b3286341231c4f124e249e25732dc5cdcde5cbaf27793338d6bcf0e1c30c3055128990e3efd886a198462578189b7d3e22e8da1544d123d85613f1ede5d08d3a6998e891764d9d1533001843728800fcfe2ef51b4468eb76abb774a6b5a1dadcec6025d969e33a809c4d00c174be937ce1b7a0b9b8738bfe8cc71a73f4012a46939d4a3166f4ac63593b723d2a4c252cf1addba9170320ea38c9a2b2a539d4172ea3c8549550a72897a440be223b6ba4e5b19248c5eee099b9a16d5b1927338027068a733502a562e1e0002169af1af7ff0093f802af95d65231d0b1ace5e4c66a51b344d07d2a2d90662fdc90a00ab8f756e52a28fa86fef4a0001ac56f648249df25bb3c380bb06d780a70c6aa742d70199ff1d735fbfaa2c3d9ecf794ef7d7eb5721c2aa46154d452a9a28a689de9a277afc98e52144c6100000111111dbc003451009e0a38f91994a24995628b04f645dcdd2e0ba5216fee3f50b55ec0a3a49f8b971eb2eb3a7c31c894a42191e84847ab7dc443576d4268f47dba62d407e0ef1c1e1a0132398d701506a001983ab8e3ee2b9693a3de6ad739e02d114556b8934f488a8ed27885db310e73afa27b03eb35c172a411ae6457af19268bb58404659b374d4238459b57a776f8aec9ba422a24998440a20001a95a65bddeb16505be9f6ed6c55a3242e21eeab49399a0b9a00a711ed293a85abf49b97c774f0ea76603cd5a157895abac1dab72c5ac7f792308f9272c9c14a9bb66d6508b1d88ba48a73fa665c1ba9b06e3e241d5924b5962639ef072b642c079388f8d423881518e1c55307b49a03e92edbf7b6f978ea40ee5f5e45a7f60750afb40a8279ffbbe3a50b9479ad7cbf73f63d9ecd3eca705a7def3df501ddc6becf6704af627dc0d478e0143c9c13f7874a8ff0034a2d7a40e06288880086c1b0edbeff77532300935ecc3cebe8635069c160f9cf5c0a971eb943922851edd16b5b7ef4b6fa93745572aa6deb5663aeed8b4f51d6eb1c583822cdc7731ff00c17e10ebb17646aafd6f6edbdf486b38195fdb99be4e678f9d7e7f3d62b60b7a69d5ad4f42b701b60f97e916e057086524b463f248736b8fc5e2b304eca593872476efc32c9e4c38999fc66f6ed8c67157456e551927016e977f508b27bb984546f198ee661d021d429553827b9ba87e99ba0340b8371a5c6e71abdb569f3134f728bd0ff57cdc32ee5e91e917b71278977147240f2788f0257c6c07ff005423ef35a952bbabcadd09a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a22688a89724b334471e301e5dcdd3644d7638ce8561b511928e936412b26c18a9f5242a6e9522a549c4e4d28dd9a43d0a18555ca0521cc20519371336de07cefa656b49f67955a75ed5edb40d16ef5abc205b5adbbe5754d0518d2ea579548a0ef2bcd9192366c87762907de25edf7cb318ea9d3070f1dcad8ed73065dd381f50cb3a70e9f49bf31cdd463a8731844444444474c6a17790cb78f77a21a5c6bda315e32df4b7fbd3753a5abe4d4351beae35738ba57d001cdd4a8a770e4bd02ab55c8ea9d7a0eb30ad5167150316c2258356e911ba2dda47b649ab74924530022442269000017c035c3b7f2c97774fba7e32bdc4b8f695fa20d2349b6d134bb7d26c1a1b676f13236014146b1a00e03bb905cd010decdfc7d9e41e5aa3f0dfd8ae01847040218361dbcbe5e3a6479e20a0611885fa3874a471f9886df6f0db628fed6da97439c61ecf6155318a01c16c9b813d428f57d2dcde000001bf4f88efec00df53a52fcb4fb5fe1535dc3b9721aa6f797c27cbe5f36a1cbd9ec095c56ba7bea29a88f2e08b8f9851fa3112ab45b523e934a39ea91ccd55bddd376f88d953346ca38e9382045d702944fb0f480efb0eaef008cccc1292222e6e63cc0a8a9f3054ee0729a7c6a1a7d8507d9a72e5aeaf24d2b0dd9cac8901c2ce6d78f85bab5f4a25fbf5153493e869d43de9cba7712ede1452729810c42ae3b0001f5b66eaf61d07548755be730e8b2da3bc37b9c08924665cac75681b99a1d504721c4d14cd276fbb5bd3a5820afe948ee184d38b584105c3bea4531f71748b0e55aa5e229a30bed55e8a4d1b8d66b92e439ddcdd450844d810645ccebb4915ec049d43a4e7f54c022a247101dc4db634fdc16d25a36f2e8d93ecaf73130b034be3241a02ca6241381a3694595db6d4bfb5be75be96fba8ef6021c647e664720079381a77115381e0ba9e08c848e39caef26d4b5327d5270c97aeb845db1788319549e1fdcda3b451eb51c1156cba89ae50120f5a69fa7e006ea093a345a6c3aa49b7e6b96cf78d8b3453ba50e1f2b2825ce6b3d105b943eb535ee557b9e3bfd4f6fc7ac4762f81ae9bd28db1d08a605e68d6b9c0f1cc452829dea7be91608c90afc003001049cc420f085231fab524133f4ec451a6e22c54310fd4098fd2e8fa5ac6757d3a6b59e49a42d20bc81e966af7838d4778c31a2d78c717b833107b0e1ee710aa2808080080878878080ee03e5e43aa06fc51e40aaa857eb5f4a2b8836e55fff00cfdfc0443cc43cbdbe01af8e74c5548c5ab97d7daa64d141530c87354d4114606f48223073c559a99dc8b728c4b770520091372f140049b2ea904c64c44c51fa0610db61d5df48b6d41f31b9d2c8fa4c58900fa65bdb979b41a0381e2be279218a31e310038d013c2a6be4543a0df4ad1e7e2715e479c5ede69639a6f1c59d46abfaefd1855133c830985c567297bec683c6c291c55132e43187a7e88ef1ea0b6df52db371b87458a3b695ad31dcc2da00dcf835ccf8a48751d9801e8d149d2c4d6f74db599c5d1935613c4d3123dea2a7bca0c616dbe61ce484063dbdc9e3cbfe54c426a3d66d4c537a9275e78c64594b9dc99fc73a6af90fad19b25196e431443de3cc43c35977aa9752f40dbd15c6d1d72782d3c590bd92cb20602ee397d2a0ede242b2effd1ef6efc3bdb38cc8182840153e70313e658c1f681e0165aab5e9ab7ce9c52add22430e648b1de16e4d58a1157979ccd20e139386460629e4b46b2946f0ae95993c92aebdedc828a344c0c9f51ba8bb43d627ad3b774ad9b3681b76f6dee759bc22326099aef0d9425ce764cd5069948c38858fed1db77b2ea8dbcba8e465ac6d27d26900bb0a000d313526bdcb29ab13655d3550a06592313d3593140c52aa733650ae0854cc710290e6325b01b70e911df5e6cecfd7d9b577769bb85ecf122b4bd86570e156b1e1c7857905ba2eed9da86993da60d92585ecee05cd201e5dab1cbb0f6e3e5030ee139cf91f8ef2e40c6d2b90066e8da262f54a696ebd55e25d56184449c557a564a51c1947699d90b645748e8815aa9d3d3b176d7a59af7adcf4dac36b9d574a93e95acc9110db60ec8f0ead3125b5681f1aa598d3ceb4e43d3cd68dd08a50d1183f1c508cbc7d814d244562bd5faad671fcdbf47ea76315075474e94f4590acd916ade2c1714c8614d051d7a7d4001b801876d7993a4ddeb7b9fa8c75eb664b26a7717efb9a54c8e19a4321a934cd941e341e40b71bad9965a50b691c3c364423af0afa34ae1c2bd83b55e3928d7d82b2d5e8f8ed54ebb438979156ab85d1f194949ab7382c97a9235d4d23192122922c9990abbb3aca0148aec54c76db5d8e352d3ee34db8d535868b8d5e40f8a28b002114f464e07e293568006238ac4a48660f021796421a2a295a9c7bc7114574e40d8003d81b807907cde3e1e1b8eb057b8b9b534ad554475ad7123bfccbf7fb3f2fee6a561e45397eb5711c1492b5d45305a6889a27beb87989e8c8149baf26e48d9274f106289d411e9339722208a7b94a6d84e25f6ec1f7753238dd2921bc9a4fb4a20615e4a347961c8046650651b51b4c8455658b67922a5baaf6659a319e5133910731a93888591516562554c0ab25ea09f75ca1d3f48357b1a6ebba45d589b6b712dcdccd4735f18fc1b6ad2092ea86d412731a0002bee916ba55ddb5cc97d264f059502bc4d0f2e271a61e656bef1d55e3194f47d5d046d89582a31ef246d0a487b93a3ce37073200786203372b9e4ccb22ddbabf8ef51429cc06f00d861fa434e93568adf71c995cc2f2ef14b6511b316866671f458492f14c072e3553a2b6d6db646f6c5ae8981e1ad6463217f0f48d295efa83e55c7d50d3ee4aa4ac1b19463269d61f8cb3a41baae5d46b6328d48e162a64e922c7456224b15439440a60dba407c42cb216ede91b1e8f762fedef0b4f871b5d923ad48666ab81c3d03969c55e6e58cd6630cd620fa2ba2340e796d64fe3114045695c70e4a49f8b57e8ebbc9dbbeac6928f128a8aaa46b8b63f835a33ebf70cd294054e0e554c05d900caf513650e50eb374fb755fa8e9b2db68d6d78fac514ef91c21cd5c9c0114af1ae06a01580cb0b6defa4b669cce8c8048efc463cc2bcdf97fbbac688c4554f1da9ecf97effddd0f0c53de5afc836f0df4ef44fee69df4f67b2aa2b4f2fd8fddd294387b3d9f65416bf2f0f2d298d5392d3eeff743418e3cfdb089f2fbda635e55f679d2ab19fefa38bdeb2c9d87f32b74ce78a9fa5b9c7720723712a6de56b9352f6162759c94c20755fb1b22a5214c00205683b0886e05e88e8cea21f6571a69792e6ca5e07710d04f7508f757947ff30ada7347ba347de70b4fd1a6b1fa2bcd30cf14b2cadabbb4b64200ec6aae5f0e46627ec727f2178fab9975a2ac54689ccd14433b702da3a46a13b1147b119262713b62ad34d6eb1607553f4ce258f281fd40e8f4fa97695d55d2d9f60cdeed0fbe1597d4c375492daea7b2e6755b0d2ea304f005c23928dec25d1927b69dab2cdd66abbad3444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d113444d11445f7c9b6c5573b70e60879058a9bcbe59713d520d31390a67124cf2655eeee12214c3ba82584a73c38814047626fe4022163dc6e2dd1e50df8eeca07dd0fb00ad1deb1f7e6c3a39abe476596616f137bf3dcc21c3ee332c523b60e2e4f29f32718b572dcce636962ff0022ca014c913a11ad2497b8194f5407a93faedeb3288143a840decf3d73c6ff00d40e9db6279010249088c71e2eaf0a770271c1715faa8ed3fdaeeb66996f230bad6cc3eee4a50d1b0e5a1c79788f60edc7ceb34efee6b94ab5c57b9544d116ba28af9a9b7a67f3fc036fe3f73d9edf1d523c012e15ad7d9eda98ce02ab8e6de0b17cff00bedc36f6ec3b888fce3b7ecebee435663c3d9d8a69e0b93d52f7952ca7ee7cbcf4f67f0a5534c3f83d9eda79169fdcd3d9ecf6045d4eeb6b46a3128bd3a2774e5fc947c2c6342fd1f7a9496729b362dceafe03722aba8002a1c40840f11100d641a6d8cba95c781152a185c71e01a2a7cbe418f6290f91910ccead2bc141df29a9cdec992ecb6681b19eb97399c855fa95931fb6748bd9b6d2058137d5b270ee8e9158961e6e39aa2bb9dbd5e85ce501390404bad9b3e873c9a24370eb56df88ac9fe139d510905f571233070918496b6a4022b81c0ab8edfd7eded6f0da4b33ade17ca1ce2299f014a621c329e2682b5e6ba5bee36e484a39d3c6e9a5632427d66ead4c584d44ba95a5999749c50b115191f48e771d4b026922998e9fbb9c0fe3d3ad73ace812fd0e2fd1d906a7711c61d13400da1156f879b104621c4bb1a8a6155b1749de3a7b6f5cdbdce34d8deef0e57e639883420d0508e1cbcab9dc3354c27258bf23da32b4c2d1656328ca022d26292832680bf2c5ab1f34c7d06eb9d4215daca15621487315148e6d8a1b1b549b7ec2c6c34dfd37721b2c8c7d1cfa9223228dca5a2849ab8622a0d4761553ba754dc173af43a1690c708df1e60d19409010e2ec5c4000341c30f742efbc59ca09d4f2fc8d1a1ac4bdea1d8c716663ac046762145fa0bb22b75a21f28f8e9b78d5da25d464ccb112290a9f50f500808ed166de9aef67bef2f248c5bbde5ec79734b837393f16a4f60a018e3c16addd3a8c4fd6182281d05d31a18f8c37d1ccd14a823035e66a54a053b2d43c95923582d7387923580eba0de163c893b2c049a044145221ccbb15966ca391173d09f5edeafa46126e003ac1aeb4c64fa79beb0656381b57bea7d26fcb0d3880389e62b8ab73df716f3182e416b8d280b6871e1edab8c0101f101f0f97cfac70104547053410710b893087adbee23f4f6f1f0f3f66fb80ea15a1f22aa1c172fafa54c9a27054333bc8e3061598e6994a45686849d9f650ece59222c056532e5bbc3b332cec8d5d22c48a26928505562fa5d420023e21ac836d375a92f9eed05a24bb8a12e737b63a80ec2a33634c01aa9571f45923115d53266c3cb4c15a95f93c8540c8d8b20dda0ada2a91a79b5a936876e1133e15556f1e848c4cf953315630356c748edd52a490180a60309bd971d44e8dacecdd4a5a982ea60c0e8c61420b8870cc0d337315f2515ba57cf1ea10635636b88e34a0ae1cf92bb95b7324529f73f594077110129c076df7fb9fbfae3a9637464bb81068b3b8dd568cb882153fb728fdb334fea46ed8ee05d3729caaa673a4080aa05743e9a2aa26f50a98889477f30f6f96a303209dee17d239ad11b883c6a40ab4703813ed76a98ec07a34a55527b2485a82cb04c23a29a2f00e115cd3d26b18c555917e9822569fe36994ea9843c4053386c3a936769a03f47b8bbbfb8959ac31c3c189a2ad7602a5f56f0ff3870539a641206347a041a9ec3fc2b85936a265960398532f97aa060ea29370d8c1e61d401f7c00758838303b33b17aad6838762b5cccd168cfbeafc396564126eabe66de5d26472115324ea5a2cacdc2cb8242282a5f775413db603089bc3c35d09eaf2596baec97b710b3c40e6f84f7d3e44b9c36a71afa39bb3058beea2f92ddad85d803e90e58b852bc0f2343c3b54984abacaf3392606b95d8e670b8b6bc460f2c76672a94d39372083a3a8484884c1e98a461e8a49fbd2aa37309ca7314862886fade46db44b2d125bcbd91ced6e76bbc38862d6b48a788ea0c0d6b9466c29520ab07897535c010067d140f49dceb5e0311cb1ad28ae20a5e90d8371fde0f1f60796b00268d015731b9782fd0ea06857d95aeae238293cd6ba8a7913442bf261d8a23f3008fed068a1c7caa23f935c83b05ca45e56a21192a547d1ecee144ac084dc52013ce5824bb414848e0405004d754fd099843acc4010dfc0072388c3a7cadd36c0b2ef70cad69740e63c35b1b9a1f5cf803816f03cc8ed579d2f471716afbfd4c3a3d30b1c1af69cc73d69f1055d863c870e2ad66648d2ef577b4b71ee31f00434d8c6b6af0fb949b042d4444cf12f7a7467604584ecc0e89cc50381c4c23bec5da8f5dddb34baa69facb229a38ed251e2ba4697c6ec85bc1aca5401507963e559469ba15ad8d95cd8999925c5cb7d00080f1813404f038f2ec5cd40545945e3b7f130f12ab652af14c954e7e65ead2126918249924445659a9db33f5248bd496fe89bc4de3d21b8ea55cea1a4ebd7f77a892c16b70e39b2b728c5a49c8d70cd95b4069c71c3b1504b1ea5a7cd696d3b9c646001a0baa48af323027b4ada40662b1e3688906b10cabc52cabb76690752ac5cb976aa324638fa455537a926504b729532143a77286e5110d5934cbfb0d52f60b0861907d1e1cb1f875398c6000e20d4e34a9ad08078ac8750daa4b1fa95d4fe8bdd52d738500271153d809f2abdbe05414b5662a664a715b2373d9566ac212264453246a6c62c8b09e4566ab22dde3578a2ae3d3028ec220511e9101ead663b858c8a31a7c9711dc5cc6d32bcb2a402ea7a0d34a79713cb1145aeaf6f2daeee7c4b388c50b6ad15c1cea73776f770e2a4b3610f01fdcfdff003d60e5b970f67bff006148ee4fb9ecf97906a15e5ecf6762853da4fedfcffee695a9f67f0227cfe3f2db5034a1aa8a7dff00b9a88e353ecf22857b53ef7cbeeea07b07b3caa29a5389e229ecf614af6a7ec6c1f3ff006f43427b076fd8505169de268ecad1c27b8d91547adfe3bb451ec91aa0094048794b5c453de6fb944c24331b21c440a21e2501f66b6774b2edf0eea8ad46114ed7b5dda72b4bc7f35721faededcb7d63a1b77ab48099f4cb9b795a4530124f1c0ec2849c25e5c38a861ecab98d3c4bdc0b17367a76e84665b86b3e1c9172e4c990487b3366b395e4d139c8200e1edc6a91adca051289815db71dfa4dda1b72410ea400e1234b7de23dd0179dbeaa3abc3a3f55d96ef200bfb19adf9fc6ac7337cf58698f69f2acf1f5b117a869a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a22688b17ff00890f283a4a1b8c3849b0bc49a4accde329cca80e5da2c5752bcc23ea7008190496f7378b2616691388ac989d1fa0291be9a81ac4f75dc3596f1c06b57127bb0c31f6d71e7ae2ebecb2d9fa7e820bbc5bbbb32102994b216d3d2c6bf1a4691de31e4ac43b17569577c89cab69144a7670986dd4218ea009c48f2c175a93c43a3727480fbbd795dc7701d8436010df5cc9d61b8645a2dbdab492e7dc877751ac783eeb82c77fe5fda54b3753357d68006087447455e79a5b8b770e54e11bb9aca4b5cecbd6a4f1d140d56ba2fac57cd4fc137fc11fdd01fb83b6a89ffd2d3bd4d6f25c7b7ff0c5f111d80db798f980fb7710d4e907a1ecfe0530f05c97eeea940f67b3976a969f20dfc751f60afb3f8513cbfb5fb9a80c30e489b6ff0037ece80629c55b17298961678f9dd8e35771f54d691909b9a6ac8542bd5118f62b3a6ae923a6531d34e39c220aa9d2253f487d1fa5ad81b35f69fa44c13545cc8dc91bbf8c70029c0975682b8578e0a82f03bc312474f4463e4e6a1bab39e6593669596e12e6b2b2558b57cf1ebdaeb1b24e124545d12479c2c12809c82a649447d229056032696e001f476d663b7355d486aafd2b55b77b7468e67c6e90545052b94b010c151ce94255fb55db9a5dde98dbed3df18d4dd1b5fe1e1e426bc7038f685c5425fac2ca76c6f6992f6e6535709a3cf58d9a00641acefd60fd79072da45c357ea9a4fd507470e85911004cdb6fe221ad6dabeb4db4dc4fd72c666dc5b3677c51414399b1b0e56fa0416fa229420e0782d87a6e8b05f6871e85ab5b088476ed778e7296e770a920fc6a9231a8f497478aa53bcc57d75538c5d9d4d9d816987e9399078e5ac1c2378968fa4db8c883245523332c76deee531523749d42977dbc75f3a559cdab4b37e8e925874b85d9dd1b980667bc5080de7404115e42b4ad15d356d46d76e58c73eaac6cdacbdad635ecc4860a50e63420120834e35f2ae0ee947b9604b4fd5b659f965a0a55b95595531f5a5c95a4f452ac408772c4c651902ee9248412ea59227e09837db6dee5617ced1e26697b82e25874095cfc8e8181f38353461cf95ad638e624077661454b0b6c777175fe816d1c9afdbb5ad736e7d088034ab816e72e70c2956d38d4d55fcf00af5438fae3f8db7822ab60b6c4c9d1fdfe04579988516f7949ac94dcb8203bb870514ce9b8ea14ca52987a83cb57b3b7751d374b8750d3647cb697713e401cef8d0d6b93270a86e0e6d48af0c16b4de3a98d43704f0cd1362bab7cb1499386768a12d3c48af034054cd20b24b90a748e5390c002512880fd130018a3b80ede203beb5fbc10e35142792b3b01ca02e3877f5fe70ea0dfc3c7a80760f2fb9f73528d09ef557cbbd72ff2f2d7daa64d108542f34cbc5c5c6360b953dbdbb1d3d155959933b26f28e635d2a297d5b2058c78506ebb044a55816500e0aa4612090a6dc76ca76ad95c5c5dba4d2e730eb2c19a3f4b207347c66970c463434c41a154774f6c4c0656e689c6879e278607cea8730a3dd6a493da85a265c5f98a00acae3b9e7692f2538c61d6588da6e2645dbd39532ac56ee102b7e854c2a2453f508094006dbbfb54d2aead6df50d3e36da39c4b6e5ad39585e0558e01b8915cdcb034edaa9f6b6c5d27a7e9650729e743edf6725566db6782a2d70f3130afbb326656a826910080b28a2ca22824d902aca249994132a1b0098000007d81ae74d2b44d53736a034cb11e25d485c6b4340054971ca09e03b1646668ad220e9301f0ad99a458ca47b37cd8bf41f3549d948614fd6222e1122c4054a9a8702285053c76110dfc847cf58e6a7693e9d72fb3b8fe9637969e3439490695030c3b156c6e6c8dccdc42e852420098894db26629c801b8f81bc761300980bfb83ab1499de3c36b71270c31f25695f7555c795b8922aa80cd645adc6d991a7bb5d51927e988a4747d155021c4bd60ddc1935fde1bac628808752404f100eadc76d5e62d85b96e7429771470ff618cf3cc0915a55b56d1c01ec24e070c17c49a8da4170db67bbf0a454702ba7cd6319cb659a363aa1f57c5af3ae9a3f979778e14481b9a0deb3751e6044892c0b7a883873b80880018a5d6c1e8b6ecb4d335fb71ad9f13e8af2d82111839c48c7093313f24b5801ec255935eb792682578c227b454d71143514f31f73bd5ffd0728425aa71782c7f0af9ec446c8b9467e754412650c4576228aab1ea15c2aabc59c2ea6e0514c81d3e3e5b6fd09a968f3410c97bae3c36e2405d1b41f4eb424070a0a01e7c56336d7513a4fa35b03469f48d301cbdd5705b7cbfb9f775821042b9f24db4e694f697eb55ede0a5f1e2b4d7d2f95ae8a2a84ddb90741a25956aa588271bb845a3572e649b4691e463617c2e3dd5b2c66ee8efc8baa46c27eaf77144a510dce03b805d6d744babf804d6ef8f127d12ea3881c4e2294f3d7b94a965113c46fae3cc2875cd6bb79fbe64e630e9b75a3a4a6509fadb551b8497feae3c7c2a8fdc25b94ecddb978fddaae124c0e5e94d5d844a62886abee6da1b1dc76dac5dcac89b6f031b29ad0c8eca435b418d0340692ec3d1ec21667a65c4836d3b4f8039f33cbb272ca3371af6d6b4a725d8e7a6551a44495950aab566eb5b19fbc7d411e4488f0a45f759751e0b64954d564cc4a60298400c638800086fab3b263ab69daa4a2799f6f15b3bc3ce6848caead470e22987c0be6d2c9da5eab610dd963af5d251e5a6a1bc32e3c71548e7664eacca00de4c4864a3dd7be432663091e3750dd245de2455000e8b65400c5ea2880280021e201ac4f469754b1d1ae4436af92293d10fc4861c2b978d49181231a2d897961a55d5ec06ea78d9346ead0b8027b013c695af9553e6f786d5d989072b43c7d89d26922ce3584ca22f1bc7ba540ee3ebd4183841562e946aba009009be910cb17a4043a84325dbb6d2d96d676a56c6ddba89b80cccd752e32b9aeab1a1a3301855d88e1c17c6b5a70d575a66977324edd35f0179ca3f0383853312436a6b51c495309c7341de42acd025adb34ea5641922a5981767efb1a9b893632ad966c8bc48e92073fba09408299ba48701f0031477d56c4469f3de3ad58c11e56c4730070735d99cd38d386070238f15a5ee2286498b5a0e40e34a7779f1ae0afcc07c0076f606c003bec1e5e7f3edab0485a5f981a8eef77cea0010b5fed7c8752c60be93e5f7be7f9b4fe28c7d98f67b3b513e5feefddd7ce1ecfb2813f7c75f54af3c4fb3d9c943df4fddf97efe83044f96df2db50a538d3cfec0a3826ff002fee6a24d70f60f32857056d1ccbc7ff00ce8f15b3a52089a2ab896c7b38e189172f5a4127089927e2ce20243880a72316918040044a20021e21ac9f695f0d3b5fb3ba2486b67683438d1de89e247238e3c16a9eb96ddfdaae916bda18cb9e5d3e470ad6958889870c78c629deb080c77757b8bf23d0723c6fbf164b1d5e2a7786811eedcb07c673539f8f9b2a4d5db255bba455585909774ce436c610dc37d7705a4c639a3981140e06abc26d81acbf6eef6d2f57cd905bdf445c7b1a1e0387dce0bd38e224dbcd44c5ccb30501a4b4732936a0b13a1506efdb24e9005480260228092a1d41b8ec3adb20d4542f68dae0e6873781155c8ea2a29a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a226889a22c32fe22c7aa29cd0c511e2447d265c61a9bc4ce08882e2a49655cc48ac53b8ead94480b1698949d3f4044c3b8f506daef79bbfb5c4dec8c1f6dcef8179cbeb9d76f7ef5d2ac2bf838f4b1253be49e66934f24602af1d8b2965638ab30ded44cc0b582eb1b04828628814cd60221370704cc25f10f799536e00220021e5ae52eb05e39daadbd803f838e3cd4ef77f005d35ff2fdd1990ecdd635dc44d3de362e1816c6daf1a627338f3a29dff97ec6b502f417c8b5d1314d1478af92a1f414f6fd037ddfef47d9e5aa4781e2768254c605c7b7dfd62f80f8ee1ed1f2288f9f9788ec3a9927c4c7d9f029a7862b93f97dcd52f1e6a5a7b3d9f2f2fd9d05698e3ecf7d44a7dcfdb0f97ddd3c8a1dc9fb5fb7fb7be9c3871af96bece4a34aaa316dbf57a6e2ad75a6481e7523b590adc97b9ac516fef8f5aa2d9c461d744c655158cd64c8613817a5329c044436d661a5e9d7b6f756d7521103c4ad73730e40d43a8695c45298f91514b24473307a6d00d6846031ad7b29cd468e49e3be20862591bbebd3ea339ad4fb76b48847609bb8c7452c5a2a15c3d54d1ce1ebf4cc75d403288ac995130f49fc7c06fd2c10593e4b9d426223d5816c8ff10332926be883e883e8d7d2ad792bde99adeab7af8a1b1b76cacb0f4806b0bdc47035a54d3d2a0a515ae5968b238c95a3dcdb4f47d8969155d4ab07354932abee8bc33b41c3968e5e3245378d94017fe974ac6131521e82806c21ab56b3ab6ada5436d6d6515a9d0f4e26213b180ba48e4a6574ce04b5e7d02439a00a93db8677a1c7a56b535dc3746ea2d56ed8d73a295c435af15a888380200240209385174f9cbbbfb0bbb8c47be348388bed8db4bcd3e5d530b560932585e338e7028a43bb64dc890e1b94c3d4528eb16837236ef4697468236db5dcf31731f9b233290d0e2e7b9d4c4348c4d2a564a36c1b1bfb6d5a52ebbb7b4b7c8e88373bdcef4b2e46b456a0b81f205cbd672242c940cce25ba38a39a0d087916b51c80f5045bbf86953be45c37451995935880c5e19daa205323d45d83630000ef76dabf47bfb5936fea0e2e737318c0229271a90e385013c41a10150ee8b0bcd32f60ddda131ec924737c66106ac180c582841a3402d38e2705d662b36e4c857f41a0d2a498990a85e9260dd9c2039236be942563d34509774cdd228cb4348acd4a8829b90a6416504476101d5458bf517cf0b6296d0786efa3b206bf339ada50c846670ab5a49ccda0cc149d5343db6e65eea57b1de0fa4c3e3ba6780d6b1f4272b6ad14abb88353453e9c7a929fb04258ad13d168c4389d9d4d506adc563b61333868a66baac9654c7072c8cba4604d4209886028ec23aa8dcb6f059c96f650bfc492387d33857339ce3434e6b4d4258439d19ac45de8f9156895708c4327d2ce8441a306cb3d5c4bf87e9374cca9c0a0223e220511d63b042679d90d4667b8015ed3805579eadc3880b79112484cc5c7cb34dfdda499b67cdfa83637a2e9222c97506fe06e8386e1afab885f6f33a093fa463883e518152450805bcd7223a9487dc5433315baf74f3c1bfafd65a59eacbaae1b5adb7bb3e7328dd13953320b3106ae088a69fa65540e2a2670eae90dc37f1c936fd8e9d7ee922bb99d0dd815888735a091c8e615eca508e0553dc48e6801adccde7dbe55d7690bfd5aecd1f11628d9ec76ed1496aaba5a59abd97672463aa792851324727aac9aa474fd22894554b6129847c36c27aad13ef34fb6b896399ba9b24778c0308696d006bce1db5a9e1dcabf4b2e129ad3211876aeb5c89a1cae40c5b6eaed6645786b52cd1ac855e5d0040568e9e887ed25a3964c5c37708826aaec8125372888a473006dbee180f4d37849b2b7bd86e068fc0c1351e0d72b98f6961cc0115003b30c7880555eb3a6b755d325b37121ce6e04710462391e34a1eeaa816c59df7f87a55af1c65e76630b6e18e40d0a766ea775b5e35869cae0e409aa64b9eb6acdb17842a9267736416e2ec413dd25044c626c5e9d7ad8ed2768eedd3e0d6efed2cee6de68992b5ef6b1e32bdb981a914e0712b40b66d534fb975a5b492b256bcb728241a834a0a715becc9dd0b8518da2523e09e3ef37738e407888fe4dd7ed109955f52dfcc9963a3131d6723a8c6e57516edf7a60e1203944c89c43a8bbefab15a6d4e945a4ff48b3b6d25b710fe12a3c1ccccb8d703514a56aaef74dde82deb7adbf6dab8f173250d3e7a00af8301b3bbe4cc7acf2c665c790d8af24643884dc4cd12ab18e2022a871898199b0868766f957928c1c2ed1b24e9d8ace5631ddaa737d1f02879b5eb29d521ba37efe8ddbd244fdb1a59688b27a513e4c81cf75012d203c96d4762db1b3341365a5896f1af6df4d5cd527352a40f261e7a2b99a247400cec49275c2678589444ce1d4ab900448930480a0f5db85c4a98a89fa7d62a9876ea0df7d696d8326ab3ef48459b47d2e77b8d18dae2ec6800c40ec03960b22d5228a3b131c8691814049ece189ff2aa85872f2d6624623ea87afa87465271e43546a9270c084f6403a48a4e0d7176bbf6c67830f220262a2aa64440e640c6150c03b076b6e4b0b986da57dcc6c9f536c61d2cad70f0e1a923c30054170e2413515e030583e9f7914f473481154b45789eff0067baaf637f6fee86ff00b9ad50e353c71578ef0b6c93d64baaa2083b6cb2c90882a8a2e1251548c02253028990c639040c51010100f10d7dba296301cf6b8348a824115f276a80731c4869048e34e5e5ec5bbd560e0a5e0b4d45428b5d145442f27e7e66abc8e9c7c83772c9c168d02f239f19bb870cdeb074bc947bb014112b8596211540e451221400c0501e9df7119fab5b3e6d3ec0c3332263e57b1c5cfcb4737d3009ab40e231279f1598eddf065b4ba6dc46650c20b5ad15762003979fb4ad52bb389c7aec9b348b918c45c3c90749bd4225cb28a4dfbc76f5d7bb24266e8a253be2a6ab82a5d20204df70d5b35a93568f51b8dc22e2d6e276658dc039af39035ada915383480cad713c0ac8ac8e9b25b45a33eda786370ccdce0b6a6a49c7b713e65d499124205a49252d65348357ae19ae315e031ec8b088b9166ab648fd6a8aa926e8c07398e6ea3f4edb0edbcebfd667d6e06e99b7adbc3b78daf74b2124b8ba4a1792ef45ad61cb5cb4c00e268aae1d1edac2e9ba8eb5207deb886c600205060d000ab9cec78fb8ba33ab6a552467dc47a8b2294fc61192e2c3dfd278e7d67882ce4cf5360a11c2e99506e04200ec0431c7aba8a221ab9edad666bbd2a6d2ae087ea2c79f0aae63626b72e5241710c0789ad4d797053b53daf047a8dbdfb1a19a7fc678cae7485d524603120d71c30c4d57d2398d4edf18c6524aee486b4c1a4d1cd560606144d212ae9b2c4731f1aec80990efe7dd944c060fa42205306de1b05ef49bbb7d1750d3eda76c4f91ad2253198dde8b81ab8b985c3034c4fd956ddc135fdc5a5ec70c338d31efa07ca5cc6b082002d0fcb46f762a536401d5ba222ee9392995212e0bb2071018e6a4b4c432ec9826b11b3123ba643a0f5c1912f5100ebbd01488a1c00e62, 'activer', 3);
INSERT INTO `projet` (`code_proj`, `nom`, `description`, `ancronyme`, `dt_deb_prev`, `dt_deb`, `dt_fin_prev`, `dt_fin`, `duree`, `logo`, `statuts`, `numero`) VALUES
('P04', 'DEFIS 1', NULL, 'PRJ', NULL, NULL, NULL, NULL, NULL, NULL, 'activer', 4),
('P05', 'DEFIS2', NULL, 'PRJ', NULL, NULL, NULL, NULL, NULL, NULL, 'activer', 5),
('P06', 'FA II', NULL, 'PRJ', NULL, NULL, NULL, NULL, NULL, NULL, 'activer', 6),
('P07', 'CPSA', NULL, 'PRJ', NULL, NULL, NULL, NULL, NULL, NULL, 'activer', 7),
('P08', 'PROSOL I', NULL, 'PRJ', NULL, NULL, NULL, NULL, NULL, NULL, 'activer', 8),
('P09', 'OPERATION KERE', NULL, 'PRJ', NULL, NULL, NULL, NULL, NULL, NULL, 'activer', 9),
('P10', 'MACOM', NULL, 'PRJ', NULL, NULL, NULL, NULL, NULL, NULL, 'activer', 10),
('P11', 'Magasin', NULL, 'PRJ', NULL, NULL, NULL, NULL, NULL, NULL, 'activer', 11),
('P12', 'AFAFI urgence', 'Nouveau projet', 'PRJ', NULL, NULL, NULL, NULL, NULL, NULL, 'En attente', 12);

-- --------------------------------------------------------

--
-- Structure de la table `projet_equipe`
--

DROP TABLE IF EXISTS `projet_equipe`;
CREATE TABLE IF NOT EXISTS `projet_equipe` (
  `code` int NOT NULL AUTO_INCREMENT,
  `id_projet` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_equipe` int NOT NULL,
  `status_pe` varchar(100) NOT NULL DEFAULT 'active',
  PRIMARY KEY (`code`),
  KEY `id_equipe` (`id_equipe`),
  KEY `id_projet` (`id_projet`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `projet_equipe`
--

INSERT INTO `projet_equipe` (`code`, `id_projet`, `id_equipe`, `status_pe`) VALUES
(1, 'P01', 2, 'active'),
(2, 'P05', 1, 'active'),
(3, 'P05', 7, 'active'),
(4, 'P05', 9, 'active'),
(5, 'P05', 6, 'active'),
(6, 'P02', 3, 'active'),
(7, 'P02', 4, 'active'),
(8, 'P02', 10, 'active'),
(9, 'P02', 12, 'active'),
(10, 'P02', 15, 'active'),
(11, 'P02', 16, 'active'),
(12, 'P03', 8, 'active'),
(13, 'P03', 11, 'active'),
(14, 'P01', 13, 'active'),
(15, 'P01', 14, 'active'),
(16, 'P06', 5, 'active'),
(17, 'P09', 6, 'active'),
(18, 'P09', 7, 'active'),
(19, 'P02', 11, 'active');

-- --------------------------------------------------------

--
-- Structure de la table `projet_equipe_volet`
--

DROP TABLE IF EXISTS `projet_equipe_volet`;
CREATE TABLE IF NOT EXISTS `projet_equipe_volet` (
  `code` int NOT NULL AUTO_INCREMENT,
  `id_projet` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_equipe` int NOT NULL,
  `id_volet` int NOT NULL,
  `status_pev` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'active',
  PRIMARY KEY (`code`),
  KEY `id_equipe` (`id_equipe`),
  KEY `id_projet` (`id_projet`),
  KEY `id_volet` (`id_volet`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `projet_equipe_volet`
--

INSERT INTO `projet_equipe_volet` (`code`, `id_projet`, `id_equipe`, `id_volet`, `status_pev`) VALUES
(1, 'P01', 2, 4, 'active'),
(2, 'P05', 1, 2, 'active'),
(3, 'P05', 7, 2, 'active'),
(4, 'P05', 9, 2, 'active'),
(5, 'P05', 6, 2, 'active'),
(6, 'P02', 3, 1, 'active'),
(7, 'P02', 4, 1, 'active'),
(8, 'P02', 10, 2, 'active'),
(9, 'P02', 12, 1, 'active'),
(10, 'P02', 15, 1, 'active'),
(11, 'P02', 16, 2, 'active'),
(12, 'P03', 8, 2, 'active'),
(13, 'P03', 11, 1, 'active'),
(14, 'P01', 13, 5, 'active'),
(15, 'P01', 14, 5, 'active'),
(16, 'P06', 5, 2, 'active'),
(17, 'P09', 6, 2, 'active'),
(18, 'P09', 7, 2, 'active'),
(19, 'P03', 11, 2, 'active'),
(20, 'P03', 11, 3, 'active');

-- --------------------------------------------------------

--
-- Structure de la table `saison`
--

DROP TABLE IF EXISTS `saison`;
CREATE TABLE IF NOT EXISTS `saison` (
  `code_saison` varchar(255) NOT NULL,
  `intitule` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`code_saison`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `saison`
--

INSERT INTO `saison` (`code_saison`, `intitule`, `description`) VALUES
('S01', 'CS', 'Contre Saison'),
('S02', 'GS', 'Grande Saison');

-- --------------------------------------------------------

--
-- Structure de la table `suivi_bl`
--

DROP TABLE IF EXISTS `suivi_bl`;
CREATE TABLE IF NOT EXISTS `suivi_bl` (
  `code_sv` varchar(255) NOT NULL,
  `id_culture` varchar(255) NOT NULL,
  `ddp` date NOT NULL,
  `stc` varchar(50) DEFAULT NULL,
  `ql` int DEFAULT NULL,
  `qr` int DEFAULT NULL,
  `long_ligne` int DEFAULT NULL,
  `nbre_ligne` int DEFAULT NULL,
  `nbre_pied` int DEFAULT NULL,
  `hauteur` int DEFAULT NULL,
  `ec` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `img_cult` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `dt_capture` date DEFAULT NULL,
  `ex` int DEFAULT NULL COMMENT 'estimation',
  `dt_creation` date DEFAULT NULL,
  `dt_modification` date DEFAULT NULL,
  `etat` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'valider, synchroniser',
  KEY `id_culture` (`id_culture`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `suivi_pms`
--

DROP TABLE IF EXISTS `suivi_pms`;
CREATE TABLE IF NOT EXISTS `suivi_pms` (
  `id` varchar(255) NOT NULL,
  `id_culture` varchar(255) NOT NULL,
  `ddp` date NOT NULL,
  `stc` varchar(100) NOT NULL,
  `ec` varchar(100) NOT NULL,
  `pb` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ex` int DEFAULT NULL,
  `img_cult` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `controle` varchar(255) DEFAULT NULL,
  `declaration` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `etat` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_culture` (`id_culture`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `suivi_pr`
--

DROP TABLE IF EXISTS `suivi_pr`;
CREATE TABLE IF NOT EXISTS `suivi_pr` (
  `code_sv` varchar(255) NOT NULL,
  `id_culture` varchar(255) NOT NULL,
  `ddp` date NOT NULL,
  `stc` varchar(50) DEFAULT NULL,
  `ql` int DEFAULT NULL,
  `qr` int DEFAULT NULL,
  `long_ligne` int DEFAULT NULL,
  `nbre_ligne` int DEFAULT NULL,
  `nbre_pied` int DEFAULT NULL,
  `hauteur` int DEFAULT NULL,
  `ec` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `img_cult` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `dt_capture` date DEFAULT NULL,
  `ex` int DEFAULT NULL COMMENT 'estimation',
  `dt_creation` date DEFAULT NULL,
  `dt_modification` date DEFAULT NULL,
  `etat` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'valider, synchroniser',
  KEY `id_culture` (`id_culture`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `s_bloc`
--

DROP TABLE IF EXISTS `s_bloc`;
CREATE TABLE IF NOT EXISTS `s_bloc` (
  `code_sbloc` int NOT NULL AUTO_INCREMENT,
  `id_bloc` int NOT NULL,
  `id_proj` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `status` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'active',
  PRIMARY KEY (`code_sbloc`),
  KEY `id_bloc` (`id_bloc`),
  KEY `id_proj` (`id_proj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

DROP TABLE IF EXISTS `utilisateurs`;
CREATE TABLE IF NOT EXISTS `utilisateurs` (
  `code_util` int NOT NULL AUTO_INCREMENT,
  `id_equipe` int NOT NULL,
  `type` varchar(50) NOT NULL DEFAULT 'mobile',
  `role` varchar(50) NOT NULL DEFAULT 'simple',
  `nom_users` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `mot_passe` varchar(100) NOT NULL,
  `situation` varchar(50) NOT NULL DEFAULT 'active',
  `statuts` varchar(50) NOT NULL DEFAULT 'Non actif',
  PRIMARY KEY (`code_util`),
  KEY `id_equipe` (`id_equipe`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`code_util`, `id_equipe`, `type`, `role`, `nom_users`, `mot_passe`, `situation`, `statuts`) VALUES
(1, 8, 'mobile', 'simple', NULL, 'azerty', 'active', 'Non actif'),
(2, 11, 'mobile', 'simple', NULL, 'azerty', 'active', 'Non actif'),
(3, 4, 'mobile', 'simple', NULL, 'azertyuiop', 'active', 'Non actif'),
(4, 15, 'mobile', 'simple', 'P21', 'azertyuiop', 'active', 'Non actif');

-- --------------------------------------------------------

--
-- Structure de la table `variette`
--

DROP TABLE IF EXISTS `variette`;
CREATE TABLE IF NOT EXISTS `variette` (
  `code_var` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nom_var` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_espece` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`code_var`),
  KEY `id_espece` (`id_espece`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `variette`
--

INSERT INTO `variette` (`code_var`, `nom_var`, `id_espece`) VALUES
('VAR_01', 'Moramasake', 'ESP_01'),
('VAR_02', 'Boha', 'ESP_02'),
('VAR_03', 'F11', 'ESP_02'),
('VAR_04', 'kanety', 'ESP_02'),
('VAR_05', 'lohapitse', 'ESP_03'),
('VAR_06', 'manja', 'ESP_03'),
('VAR_07', 'bevoa', 'ESP_03'),
('VAR_08', 'odragne', 'ESP_03'),
('VAR_09', 'vorompotsy', 'ESP_03'),
('VAR_10', 'menangoe', 'ESP_04'),
('VAR_11', 'mandronono', 'ESP_04'),
('VAR_12', 'atolinkibo', 'ESP_05'),
('VAR_13', 'mafiry', 'ESP_05'),
('VAR_14', 'mamy', 'ESP_05'),
('VAR_15', 'matraotraoke', 'ESP_05'),
('VAR_16', 'soamaso', 'ESP_05'),
('VAR_17', 'amaninagnombe', 'ESP_06'),
('VAR_18', 'irat 200', 'ESP_06'),
('VAR_19', 'mailaka', 'ESP_06'),
('VAR_20', 'besomotse', 'ESP_07'),
('VAR_21', 'bevaoke', 'ESP_07'),
('VAR_22', 'saretrako', 'ESP_07'),
('VAR_23', 'garadage', 'ESP_08'),
('VAR_24', 'baboke', 'ESP_09'),
('VAR_25', 'faremaso', 'ESP_09'),
('VAR_26', 'androy', 'ESP_10'),
('VAR_27', 'borikele(Petit)', 'ESP_11'),
('VAR_28', 'de terre vatopilitse', 'ESP_11'),
('VAR_29', 'du cap soramena', 'ESP_11'),
('VAR_30', 'du cap tsimeda', 'ESP_11'),
('VAR_31', 'menavolo', 'ESP_12'),
('VAR_32', 'tsimipike', 'ESP_12'),
('VAR_33', 'teleravegne', 'ESP_13'),
('VAR_34', 'rasta', 'ESP_14'),
('VAR_35', 'miaretse', 'ESP_14'),
('VAR_36', 'malaindrafe', 'ESP_15');

-- --------------------------------------------------------

--
-- Structure de la table `volet`
--

DROP TABLE IF EXISTS `volet`;
CREATE TABLE IF NOT EXISTS `volet` (
  `code_vol` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`code_vol`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `volet`
--

INSERT INTO `volet` (`code_vol`, `nom`, `description`) VALUES
(1, 'RP', 'Reseau paysant'),
(2, 'IDA', 'Identification Diffusion'),
(3, 'MACOM', NULL),
(4, 'RES', NULL),
(5, 'CPSA', 'projet CTAS');

-- --------------------------------------------------------

--
-- Structure de la table `zone_commune`
--

DROP TABLE IF EXISTS `zone_commune`;
CREATE TABLE IF NOT EXISTS `zone_commune` (
  `code_com` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nom_com` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_dist` varchar(255) NOT NULL,
  PRIMARY KEY (`code_com`),
  KEY `id_com` (`id_dist`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `zone_commune`
--

INSERT INTO `zone_commune` (`code_com`, `nom_com`, `id_dist`) VALUES
('C01', 'Ambanisarike', 'D01'),
('C02', 'Ambazoa', 'D01'),
('C03', 'Ambohimalaza', 'D01'),
('C04', 'Ambonaivo', 'D01'),
('C05', 'Ambondro', 'D01'),
('C06', 'Ambovombe', 'D01'),
('C07', 'Ampamata', 'D01'),
('C08', 'Analamary', 'D01'),
('C09', 'Anjeke Ankilikira', 'D01'),
('C10', 'Antanimora Atsimo', 'D01'),
('C11', 'Erada Tsimanato', 'D01'),
('C12', 'Imanombo', 'D01'),
('C13', 'Jafaro', 'D01'),
('C14', 'Maroalomainty', 'D01'),
('C15', 'Maroalopoty', 'D01'),
('C16', 'Marovato Befeno', 'D01'),
('C17', 'Sihanamaro', 'D01'),
('C18', 'Tsimananada', 'D01'),
('C19', 'Andalatanosy', 'D01'),
('C20', 'Ambatomivary', 'D05'),
('C21', 'Amboasary Atsimo', 'D05'),
('C22', 'Beranoville', 'D05'),
('C23', 'Behara', 'D05'),
('C24', 'Ebelo', 'D05'),
('C25', 'Elonty', 'D05'),
('C26', 'Esira', 'D05'),
('C27', 'Ifotaka', 'D05'),
('C28', 'Isoanala', 'D05'),
('C29', 'Mahabo', 'D05'),
('C30', 'Mahaly', 'D05'),
('C31', 'Manevy', 'D05'),
('C32', 'Maromby', 'D05'),
('C33', 'Marotsiraka', 'D05'),
('C34', 'Ranobe', 'D05'),
('C35', 'Sampona', 'D05'),
('C36', 'Tanandava Sud', 'D05'),
('C37', 'Tomboarivo', 'D05'),
('C38', 'Tranomaro', 'D05'),
('C39', 'Tsivory', 'D05'),
('C40', 'Ambahita', 'D02'),
('C41', 'Ambatosola', 'D02'),
('C42', 'Anivorano Mitsinjo', 'D02'),
('C43', 'Anja Nord', 'D02'),
('C44', 'Antsakoamaro', 'D02'),
('C45', 'Bekily Morafeno', 'D02'),
('C46', 'Bekitro', 'D02'),
('C47', 'Belindo Mahasoa', 'D02'),
('C48', 'Beraketa', 'D02'),
('C49', 'Besakoa', 'D02'),
('C50', 'Besaroa Maroviro', 'D02'),
('C51', 'Beteza', 'D02'),
('C52', 'Bevitiky', 'D02'),
('C53', 'Manakompy', 'D02'),
('C54', 'Tanambao Tsirandrany', 'D02'),
('C55', 'Tanandava', 'D02'),
('C56', 'Tsikolaky', 'D02'),
('C57', 'Vohimanga', 'D02'),
('C58', 'Anjampaly', 'D04'),
('C59', 'Antaritarika', 'D04'),
('C60', 'Faux Cap', 'D04'),
('C61', 'Imongy', 'D04'),
('C62', 'Marovato', 'D04'),
('C63', 'Nikoly', 'D04'),
('C64', 'Tsihombe', 'D04'),
('C65', 'Ankilivalo', 'D04'),
('C66', 'Behazomanga', 'D04'),
('C67', 'Ambatoabo', 'D06'),
('C68', 'Ampasimena', 'D06'),
('C69', 'Analamary', 'D06'),
('C70', 'Analapatsy', 'D06'),
('C71', 'Andranobory', 'D06'),
('C72', 'Ankaramena', 'D06'),
('C73', 'Ankariera', 'D06'),
('C74', 'Bevoay', 'D06'),
('C75', 'Emagnobo', 'D06'),
('C76', 'Enakara Haut', 'D06'),
('C77', 'Enaniliha', 'D06'),
('C78', 'Fenoevo Efita', 'D06'),
('C79', 'Iaboakoho', 'D06'),
('C80', 'Ifarantsa', 'D06'),
('C81', 'Isaka Ivondro', 'D06'),
('C82', 'Mahatalaky', 'D06'),
('C83', 'Manambaro', 'D06'),
('C84', 'Manantenina', 'D06'),
('C85', 'Mandiso', 'D06'),
('C86', 'Ranomafana Sud', 'D06'),
('C87', 'Ranopiso', 'D06'),
('C88', 'Sarisambo', 'D06'),
('C89', 'Soavary', 'D06'),
('C90', 'Ankilevalo', 'D06'),
('C91', 'Tanandava Mandrare', 'D06'),
('C92', 'Beanantara', 'D01');

-- --------------------------------------------------------

--
-- Structure de la table `zone_district`
--

DROP TABLE IF EXISTS `zone_district`;
CREATE TABLE IF NOT EXISTS `zone_district` (
  `code_dist` varchar(255) NOT NULL,
  `nom_dist` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_reg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`code_dist`),
  KEY `zone_district_ibfk_1` (`id_reg`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `zone_district`
--

INSERT INTO `zone_district` (`code_dist`, `nom_dist`, `id_reg`) VALUES
('D01', 'Ambovombe-Androy', 'R01'),
('D02', 'Bekily', 'R01'),
('D03', 'Beloha', 'R01'),
('D04', 'Tsihombe', 'R01'),
('D05', 'AMBOASARY ATSIMO', 'R02'),
('D06', 'Taolanaro', 'R02'),
('D07', 'Betroka', 'R02');

-- --------------------------------------------------------

--
-- Structure de la table `zone_fonkotany`
--

DROP TABLE IF EXISTS `zone_fonkotany`;
CREATE TABLE IF NOT EXISTS `zone_fonkotany` (
  `code_fkt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nom_fkt` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_com` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`code_fkt`),
  KEY `zone_fonkotany_ibfk_1` (`id_com`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `zone_fonkotany`
--

INSERT INTO `zone_fonkotany` (`code_fkt`, `nom_fkt`, `id_com`) VALUES
('Fkt001', 'Agnafondrakady', 'C01'),
('Fkt002', 'Ambanisarika', 'C01'),
('Fkt003', 'Ambanisarika II', 'C01'),
('Fkt004', 'Ambanisarika III', 'C01'),
('Fkt005', 'Ambolimoka Ankororoka', 'C01'),
('Fkt006', 'Ampanihy', 'C01'),
('Fkt007', 'Androhondroho I', 'C01'),
('Fkt008', 'Androhondroho II', 'C01'),
('Fkt009', 'Androhondroho III', 'C01'),
('Fkt010', 'Ankako', 'C01'),
('Fkt011', 'Ankako Agnivosoa', 'C01'),
('Fkt012', 'Ankilemara', 'C01'),
('Fkt013', 'Ankileromotse Sud', 'C01'),
('Fkt014', 'Ankileabonibona', 'C01'),
('Fkt015', 'Ankilemivory', 'C01'),
('Fkt016', 'Ankirava', 'C01'),
('Fkt017', 'Anjeba', 'C01'),
('Fkt018', 'Antsakoamamy', 'C01'),
('Fkt019', 'Anjamalangy', 'C01'),
('Fkt020', 'Angodogodo', 'C01'),
('Fkt021', 'Etsoha Marofoty', 'C01'),
('Fkt022', 'Mahaloto', 'C01'),
('Fkt023', 'Mahasoa', 'C01'),
('Fkt024', 'Maronolo Ambarosoa', 'C01'),
('Fkt025', 'Marofoty', 'C01'),
('Fkt026', 'Mitreaky Androvasoa', 'C01'),
('Fkt027', 'Retoka', 'C01'),
('Fkt028', 'Sifiry Antanantsoa', 'C01'),
('Fkt029', 'Tanamba Ankilefaly', 'C01'),
('Fkt030', 'Tsienga', 'C01'),
('Fkt031', 'Tsimananada III', 'C18'),
('Fkt032', 'Ankaragnabo', 'C02'),
('Fkt033', 'Ambazoamazava', 'C02'),
('Fkt034', 'Antanamaeva', 'C02'),
('Fkt035', 'Amborominendra III', 'C02'),
('Fkt036', 'Ampaipaike', 'C02'),
('Fkt037', 'Ampihamy', 'C02'),
('Fkt038', 'Antanemihery Terabovo', 'C02'),
('Fkt039', 'Ambaromanintsy', 'C02'),
('Fkt040', 'Amborominendra I', 'C02'),
('Fkt041', 'Amborominendra II', 'C02'),
('Fkt042', 'Ambasy Tanambao', 'C02'),
('Fkt043', 'Ambazoa I', 'C02'),
('Fkt044', 'Ambazoa II', 'C02'),
('Fkt045', 'Ambazoa III', 'C02'),
('Fkt046', 'Ambazoa IV', 'C02'),
('Fkt047', 'Ambazoa V', 'C02'),
('Fkt048', 'Ambasy', 'C02'),
('Fkt049', 'Ampihamay', 'C02'),
('Fkt050', 'Antanemihery', 'C02'),
('Fkt051', 'Antanemihery I', 'C02'),
('Fkt052', 'Antanemihery II', 'C02'),
('Fkt053', 'Andagoa', 'C02'),
('Fkt054', 'Androvasoa Nord', 'C02'),
('Fkt055', 'Analalasoa', 'C02'),
('Fkt056', 'Ambanemantsake', 'C02'),
('Fkt057', 'Berehake', 'C02'),
('Fkt058', 'Beraketa I', 'C02'),
('Fkt059', 'Beraketa II', 'C02'),
('Fkt060', 'Beraketa III', 'C02'),
('Fkt061', 'Bemagnendrake II', 'C02'),
('Fkt062', 'Efoly', 'C02'),
('Fkt063', 'Amborominendra IV', 'C02'),
('Fkt064', 'Halomboro', 'C02'),
('Fkt065', 'Halamboro II', 'C02'),
('Fkt066', 'Kotoala Haut', 'C02'),
('Fkt067', 'Kotoala Bas', 'C02'),
('Fkt068', 'Kotoala Bemozotse', 'C02'),
('Fkt069', 'kotoala ambory', 'C02'),
('Fkt070', 'Magnarendaza', 'C02'),
('Fkt071', 'Malaindoza', 'C02'),
('Fkt072', 'Satrie', 'C02'),
('Fkt073', 'Satrie Ouest', 'C02'),
('Fkt074', 'Soambotse', 'C02'),
('Fkt075', 'Tanandava', 'C02'),
('Fkt076', 'Tanamalangy', 'C02'),
('Fkt077', 'Talakimahasoa', 'C02'),
('Fkt078', 'Tsiavihandro', 'C02'),
('Fkt079', 'Tsiavihandro Marobe', 'C02'),
('Fkt080', 'Tsiavota I', 'C02'),
('Fkt081', 'Tsiavota II', 'C02'),
('Fkt082', 'Tsiavota III', 'C02'),
('Fkt083', 'Tsiavota sud', 'C02'),
('Fkt084', 'Tsifahera', 'C02'),
('Fkt085', 'Tsifahera II', 'C02'),
('Fkt086', 'Ambonaivo Centre', 'C04'),
('Fkt087', 'Andovobe Belaletse', 'C04'),
('Fkt088', 'Analavao haut', 'C04'),
('Fkt089', 'Analavao bas', 'C04'),
('Fkt090', 'Ambaro Beratro', 'C04'),
('Fkt091', 'Analavao centre', 'C04'),
('Fkt092', 'Beevotse', 'C04'),
('Fkt093', '', 'C04'),
('Fkt094', 'Analavao III', 'C04'),
('Fkt095', 'Andramaro', 'C04'),
('Fkt096', 'Ambokoke', 'C04'),
('Fkt097', 'Ankarandoha', 'C04'),
('Fkt098', 'Ankazoabo', 'C04'),
('Fkt099', 'Ankarandoha I', 'C04'),
('Fkt100', 'Analamamy I', 'C04'),
('Fkt101', 'Anjapohy Nord', 'C04'),
('Fkt102', 'Besavoa', 'C04'),
('Fkt103', 'Beangea', 'C04'),
('Fkt104', 'Beratro I', 'C04'),
('Fkt105', 'Beratro II', 'C04'),
('Fkt106', 'Bealoke', 'C04'),
('Fkt107', 'Belalitsy', 'C04'),
('Fkt108', 'Bemanga', 'C04'),
('Fkt109', 'Marofohy', 'C04'),
('Fkt110', 'Marolava', 'C04'),
('Fkt111', 'Marofoty', 'C04'),
('Fkt112', 'Maromainty', 'C04'),
('Fkt113', 'Nandrosoa', 'C04'),
('Fkt114', 'Nagnalo', 'C04'),
('Fkt115', 'Retoka Ankilemihamy', 'C04'),
('Fkt116', 'Sihanamaie', 'C04'),
('Fkt117', 'Salamamanintsy', 'C04'),
('Fkt118', 'Vozy Centre', 'C04'),
('Fkt119', 'Ambaromionjo', 'C05'),
('Fkt120', 'Andobaka', 'C05'),
('Fkt121', 'Andahive', 'C05'),
('Fkt122', 'Andasary Tsifahera', 'C05'),
('Fkt123', 'Andasary sud', 'C05'),
('Fkt124', 'Ankazoabo II', 'C05'),
('Fkt125', 'Ankazoabo Tantsoa', 'C05'),
('Fkt126', 'Ankilemorotsy', 'C05'),
('Fkt127', 'Antsotre Faliakondro', 'C05'),
('Fkt128', 'Ambinoa Ambondro', 'C05'),
('Fkt129', 'Ambondro Anatirova', 'C05'),
('Fkt130', 'Anaterova', 'C05'),
('Fkt131', 'Anjamahasoa', 'C05'),
('Fkt132', 'Ankiliromotse', 'C05'),
('Fkt133', 'Ankileromotse Tsiboatsoa', 'C05'),
('Fkt134', 'Antsotre Faliankondro', 'C05'),
('Fkt135', 'Antsotre Marolava', 'C05'),
('Fkt136', 'Antsotre Marofoty', 'C05'),
('Fkt137', 'Antsotre Ambonaivo', 'C05'),
('Fkt138', 'Ankilemasy', 'C05'),
('Fkt139', 'Betioky Zanavo', 'C05'),
('Fkt140', 'Beba', 'C05'),
('Fkt141', 'Bebea sud', 'C05'),
('Fkt142', 'Bebea Nord', 'C05'),
('Fkt143', 'Belay', 'C05'),
('Fkt144', 'Belay Marolava', 'C05'),
('Fkt145', 'Imongy Ampihamy', 'C05'),
('Fkt146', 'Lamitihy Anatirova', 'C05'),
('Fkt147', 'Lamitihy Ampisandrata', 'C05'),
('Fkt148', 'Lamitihy Ankasy', 'C05'),
('Fkt149', 'Lamitihy Ankitry', 'C05'),
('Fkt150', 'Lamitihy Ambario', 'C05'),
('Fkt151', 'Lamitihy Ankitry', 'C05'),
('Fkt152', 'Lamitihy Belanky', 'C05'),
('Fkt153', 'Lamitihy Tsibo', 'C05'),
('Fkt154', 'Lamitihy Atsimo', 'C05'),
('Fkt155', 'Lamitihy Antsotrebe', 'C05'),
('Fkt156', 'Lamitihy Androvamiaregne', 'C05'),
('Fkt157', 'Lamitihy Belaza', 'C05'),
('Fkt158', 'Lamitihy Ambatofoty', 'C05'),
('Fkt159', 'Lamitihy Ankaramena', 'C05'),
('Fkt160', 'Lamitihy Andasary', 'C05'),
('Fkt161', 'Marosy Ambondro I', 'C05'),
('Fkt162', 'Marosy Tanambao', 'C05'),
('Fkt163', 'Marosy Analalava', 'C05'),
('Fkt164', 'Marosy Motifeno', 'C05'),
('Fkt165', 'Ramagna Magnefa', 'C05'),
('Fkt166', 'Sihanadiva Tanamasy', 'C05'),
('Fkt167', 'Tsifahera Andobaka', 'C05'),
('Fkt168', 'Terakabo', 'C05'),
('Fkt169', 'Tsilelekogne Vazoa', 'C05'),
('Fkt170', 'Tsimanankiaraky', 'C05'),
('Fkt171', 'Evazoa centre', 'C05'),
('Fkt172', 'Evazoa', 'C05'),
('Fkt173', 'Zanavo Atsimo', 'C05'),
('Fkt174', 'Andova', 'C06'),
('Fkt175', 'Ambanefengoke', 'C06'),
('Fkt176', 'Ambolomariagne', 'C06'),
('Fkt177', 'Ambaniavoha', 'C06'),
('Fkt178', 'Ambaro', 'C06'),
('Fkt179', 'Ambazoamirafy', 'C06'),
('Fkt180', 'Amboasary II', 'C06'),
('Fkt181', 'Ambolobe', 'C06'),
('Fkt182', 'Ambolo mareagne', 'C06'),
('Fkt183', 'Amborobe', 'C06'),
('Fkt184', 'Anafondrakady', 'C06'),
('Fkt185', 'Anafondrakady', 'C06'),
('Fkt186', 'Anjatoka', 'C06'),
('Fkt187', 'Ankaka', 'C06'),
('Fkt188', 'Ankaramena', 'C06'),
('Fkt189', 'Ankilifaly', 'C06'),
('Fkt190', 'Ankilimafaitse Bas', 'C06'),
('Fkt191', 'Ankilimafaitse Haut', 'C06'),
('Fkt192', 'Ankilivinonjy', 'C06'),
('Fkt193', 'Antanambao I', 'C06'),
('Fkt194', 'Antanambao IIi', 'C06'),
('Fkt195', 'Antetebey', 'C06'),
('Fkt196', 'Antsatrahamasy', 'C06'),
('Fkt197', 'Antseky Nord', 'C06'),
('Fkt198', 'Antsatrahamasy', 'C06'),
('Fkt199', 'Antseky Nord', 'C06'),
('Fkt200', 'Avaradrova', 'C06'),
('Fkt201', 'Beabo', 'C06'),
('Fkt202', 'Beanike I', 'C06'),
('Fkt203', 'Beanike II', 'C06'),
('Fkt204', 'Behabobo I', 'C06'),
('Fkt205', 'Behabobo II', 'C06'),
('Fkt206', 'Bekokako', 'C06'),
('Fkt207', 'Berary', 'C06'),
('Fkt208', 'Beroroha', 'C06'),
('Fkt209', 'Bevato', 'C06'),
('Fkt210', 'Botreoke', 'C06'),
('Fkt211', 'Ebana', 'C06'),
('Fkt212', 'Ekonka Amisay', 'C06'),
('Fkt213', 'Ekonka Antragnobey', 'C06'),
('Fkt214', 'Ekonka maromainte', 'C06'),
('Fkt215', 'Ekonka Marofoty', 'C06'),
('Fkt216', 'Esalo', 'C06'),
('Fkt217', 'Esanta Fototra', 'C06'),
('Fkt218', 'Esanta Iii', 'C06'),
('Fkt219', 'Esanta Marofoty', 'C06'),
('Fkt220', 'Esanta Maromainty', 'C06'),
('Fkt221', 'Esingo', 'C06'),
('Fkt222', 'Lavandrandra', 'C06'),
('Fkt223', 'Mahavelo', 'C06'),
('Fkt224', 'Marofanogne', 'C06'),
('Fkt225', 'Marolava', 'C06'),
('Fkt226', 'Maromalay', 'C06'),
('Fkt227', 'Milahane Fenoarivo', 'C06'),
('Fkt228', 'Mitsangana I', 'C06'),
('Fkt229', 'Mitsangana II', 'C06'),
('Fkt230', 'Sarihangy', 'C06'),
('Fkt231', 'Sarisanga', 'C06'),
('Fkt232', 'Sevohipoty', 'C06'),
('Fkt233', 'Talaky Centrale', 'C06'),
('Fkt234', 'Talaky Marofoty', 'C06'),
('Fkt235', 'Tranobe Maromainty', 'C06'),
('Fkt236', 'Tsialihe', 'C06'),
('Fkt237', 'Tsianoriha', 'C06'),
('Fkt238', 'Tsingivilahy', 'C06'),
('Fkt239', 'Tsirangoty', 'C06'),
('Fkt240', 'Amborobey Marofoty', 'C11'),
('Fkt241', 'Mitreake', 'C11'),
('Fkt242', 'Ambaninato', 'C11'),
('Fkt243', 'Ankazomanitsy', 'C11'),
('Fkt244', 'Ambanikily Sud', 'C11'),
('Fkt245', 'Ambanikily Maromainty', 'C11'),
('Fkt246', 'Ambanikily Nord', 'C11'),
('Fkt247', 'Ambanikily Centre', 'C11'),
('Fkt248', 'Ambanikily Maoly', 'C11'),
('Fkt249', 'Ambaninato', 'C11'),
('Fkt250', 'Ambory', 'C11'),
('Fkt251', 'Ambory I', 'C11'),
('Fkt252', 'Ambory II', 'C11'),
('Fkt253', 'Amboro marofoty', 'C11'),
('Fkt254', 'Ankaranabo', 'C11'),
('Fkt255', 'Anketa', 'C11'),
('Fkt256', 'Ankazomanintsy Miary', 'C11'),
('Fkt257', 'Ankiletovoe', 'C11'),
('Fkt258', 'Belaza', 'C11'),
('Fkt259', 'Belitsaky', 'C11'),
('Fkt260', 'Belitsaky II', 'C11'),
('Fkt261', 'Erada I', 'C11'),
('Fkt262', 'Erada II', 'C11'),
('Fkt263', 'Erada III', 'C11'),
('Fkt264', 'Erada Sandrisandry', 'C11'),
('Fkt265', 'Erada centre', 'C11'),
('Fkt266', 'Eradabey', 'C11'),
('Fkt267', 'Erada Ambaninato', 'C11'),
('Fkt268', 'Fotabey Ankaranabo', 'C11'),
('Fkt269', 'Habohabo Nord', 'C11'),
('Fkt270', 'Habohabo Sud', 'C11'),
('Fkt271', 'Habohabo Maromainty', 'C11'),
('Fkt272', 'Habohabo Mihoatse', 'C11'),
('Fkt273', 'Maromainty Ambonaivo', 'C11'),
('Fkt274', 'Marobey Misorogna', 'C11'),
('Fkt275', 'Mitreaky', 'C11'),
('Fkt276', 'Marobey Anketa', 'C11'),
('Fkt277', 'Satrie Mitreaky', 'C11'),
('Fkt278', 'Vohibaoe', 'C11'),
('Fkt279', 'Erakoke', 'C14'),
('Fkt280', 'Ambolovohitse Erako', 'C14'),
('Fkt281', 'Ambonaivo Ampihamibe', 'C14'),
('Fkt282', 'Ampane', 'C14'),
('Fkt283', 'Bema', 'C14'),
('Fkt284', 'Marolava', 'C14'),
('Fkt285', 'Ambaro Miavotse', 'C14'),
('Fkt286', 'Ambonaivo', 'C14'),
('Fkt287', 'Ampihamibe Miarents', 'C14'),
('Fkt288', 'Anjatoka', 'C14'),
('Fkt289', 'Anjatoka Erake', 'C14'),
('Fkt290', 'Anjagnabo Antanesoa', 'C14'),
('Fkt291', 'Ankilemanitsy I', 'C14'),
('Fkt292', 'Ankilimanintsy II', 'C14'),
('Fkt293', 'Ankilemanitsy III', 'C14'),
('Fkt294', 'Ankiilemaroaloke', 'C14'),
('Fkt295', 'Ankilemalaza', 'C14'),
('Fkt296', 'Ankilemiary', 'C14'),
('Fkt298', 'Ankilemanitsy Magnevatana', 'C14'),
('Fkt299', 'Ankilemaroaloke Est', 'C14'),
('Fkt300', 'Ankilehogo Miarinarivo', 'C14'),
('Fkt301', 'Ankilihogo', 'C14'),
('Fkt302', 'Ankilehogo Ambony', 'C14'),
('Fkt303', 'Ankilehogo Marolava', 'C14'),
('Fkt304', 'Ankilehogo Antsakoamasy', 'C14'),
('Fkt305', 'Ankilemifiole', 'C14'),
('Fkt306', 'Ankoroke Mahazosoa', 'C14'),
('Fkt307', 'Ankilevotro', 'C14'),
('Fkt308', 'Ankilevotro II', 'C14'),
('Fkt309', 'Ankiletsimanarito', 'C14'),
('Fkt310', 'Ankoroke Manorosoa', 'C14'),
('Fkt311', 'Ambaro Mahazoarivo', 'C14'),
('Fkt312', 'Ambanebasy Bearivo', 'C14'),
('Fkt313', 'Ambatolahy', 'C14'),
('Fkt314', 'Ampihamamy Mamoasoa', 'C14'),
('Fkt315', 'Anakafy Marosola', 'C14'),
('Fkt316', 'Antanesoa', 'C14'),
('Fkt317', 'Antanesoa Centre', 'C14'),
('Fkt318', 'Beama Ankarana', 'C14'),
('Fkt319', 'Belavenoka Tanantsoa', 'C14'),
('Fkt320', 'Belambo Fanavaozana', 'C14'),
('Fkt321', 'Behabobo Ampatiolotsy', 'C14'),
('Fkt322', 'Betsimeda', 'C14'),
('Fkt323', 'Betsimeda Ankemilaly', 'C14'),
('Fkt324', 'Betsimeda Ankoroke', 'C14'),
('Fkt325', 'Betsimeda Ampihamibe', 'C14'),
('Fkt326', 'Betsimeda 5/5', 'C14'),
('Fkt327', 'Betsimeda Centre', 'C14'),
('Fkt328', 'Belavenoky', 'C14'),
('Fkt329', 'Erada Marolava', 'C14'),
('Fkt330', 'Erakoke Sud', 'C14'),
('Fkt331', 'Erakoke Ouest', 'C14'),
('Fkt332', 'Erakoke Est', 'C14'),
('Fkt333', 'ErakokeAvaratsena', 'C14'),
('Fkt334', 'Erakoke Ambolovohitse', 'C14'),
('Fkt335', 'Fototsambo Magnitao', 'C14'),
('Fkt336', 'Mahazoasoa Ampihamy', 'C14'),
('Fkt337', 'Mareagne I', 'C14'),
('Fkt338', 'Marobe', 'C14'),
('Fkt339', 'Maroho', 'C14'),
('Fkt340', 'Marolava II', 'C14'),
('Fkt341', 'Vahavola Ampihamibe', 'C14'),
('Fkt342', 'Radabetsimivaky', 'C14'),
('Fkt343', 'Radabetsimivaky II', 'C14'),
('Fkt344', 'Rakopoty', 'C14'),
('Fkt345', 'Salama Sud', 'C14'),
('Fkt346', 'Tanambao Fenoarivo', 'C14'),
('Fkt347', 'Volankira Ambatoabo', 'C14'),
('Fkt348', 'Vahavola Centre', 'C14'),
('Fkt349', 'Vahavola Ankilesoa', 'C14'),
('Fkt350', 'Vahavola Ankilemasy', 'C14'),
('Fkt351', 'Vahavola Antsavoa', 'C14'),
('Fkt352', 'Zanavo Nord', 'C14'),
('Fkt353', 'Zanavo Fagnalegna', 'C14'),
('Fkt354', 'Soatsifa', 'C15'),
('Fkt355', 'Ambaro', 'C15'),
('Fkt356', 'Antsomontsoy', 'C15'),
('Fkt358', 'Ankobokemanitsy', 'C15'),
('Fkt359', 'Mangaiky Tsimagnahy', 'C15'),
('Fkt360', 'Marodo Ankilimasy', 'C15'),
('Fkt361', 'Marofengoke', 'C15'),
('Fkt362', 'Savare Ambaroabo', 'C15'),
('Fkt363', 'Savare Tanambao', 'C15'),
('Fkt364', 'Tanambao', 'C15'),
('Fkt365', 'Ambaro I', 'C15'),
('Fkt366', 'Ambaro II', 'C15'),
('Fkt367', 'Ambaro III', 'C15'),
('Fkt368', 'Ambaro Centre', 'C15'),
('Fkt369', 'Ambaro Ankilimanitsy', 'C15'),
('Fkt370', 'Ambaromasy Behantamasay', 'C15'),
('Fkt371', 'Ambaro Tsaramandroso', 'C15'),
('Fkt372', 'Amboasary I', 'C15'),
('Fkt373', 'Amboasary Tanambao', 'C15'),
('Fkt374', 'Ampanavy Fototsabo', 'C15'),
('Fkt375', 'Analamitsetaky', 'C15'),
('Fkt376', 'Analamitsetaky Est', 'C15'),
('Fkt377', 'Anivorano', 'C15'),
('Fkt378', 'Ankilivinonjy', 'C15'),
('Fkt379', 'Ankilivinonjy', 'C15'),
('Fkt380', 'Ankilemieva', 'C15'),
('Fkt381', 'Ankobo Ankilemanintsy', 'C15'),
('Fkt382', 'Ankobo Ankilimiabo', 'C15'),
('Fkt383', 'Ankobo Analamizitsy', 'C15'),
('Fkt384', 'Ankororoke Manorosoa', 'C15'),
('Fkt385', 'Ankilemieva Ampihamibe', 'C15'),
('Fkt386', 'Ankeloke Antsomontsoy', 'C15'),
('Fkt387', 'Antsomontsoy II', 'C15'),
('Fkt388', 'Antsakoamasy Tanambe', 'C15'),
('Fkt389', 'Antsomontsoy', 'C15'),
('Fkt390', 'Antseta ankilemanintsy', 'C15'),
('Fkt391', 'Behabobo Nord Ambaro', 'C15'),
('Fkt392', 'Behanta Beraketa', 'C15'),
('Fkt393', 'Behantamasay Ambaro', 'C15'),
('Fkt394', 'Belambo Ankilemasy', 'C15'),
('Fkt395', 'Belemboke I', 'C15'),
('Fkt396', 'Belemboka Sevohitse', 'C15'),
('Fkt397', 'Belemboka Bas', 'C15'),
('Fkt398', 'Belemboka Haut', 'C15'),
('Fkt399', 'Belitsake Edodo', 'C15'),
('Fkt400', 'Belemboke Savar', 'C15'),
('Fkt401', 'Belitsaky Tsimandrivotse', 'C15'),
('Fkt402', 'Bevato Ambony', 'C15'),
('Fkt403', 'Efoly Ankilemamy', 'C15'),
('Fkt404', 'Efoly Fagnalegna', 'C15'),
('Fkt405', 'Mahavokake', 'C15'),
('Fkt406', 'Manombo', 'C15'),
('Fkt407', 'Marodo Ankilemasy', 'C15'),
('Fkt408', 'Marofoty', 'C15'),
('Fkt409', 'Maroalopoty I', 'C15'),
('Fkt410', 'Maroalopoty II', 'C15'),
('Fkt411', 'Maroalopoty III', 'C15'),
('Fkt412', 'Maroalopoty IV', 'C15'),
('Fkt413', 'Mareagne Tsihalegne', 'C15'),
('Fkt414', 'Magneva', 'C15'),
('Fkt415', 'Marosaragna', 'C15'),
('Fkt416', 'Maropia Ambohimazava', 'C15'),
('Fkt417', 'Maropia Ampisopiso', 'C15'),
('Fkt418', 'Maropia Ankisoatoetse', 'C15'),
('Fkt419', 'Maropia Ankilebey', 'C15'),
('Fkt420', 'Maropia Nord', 'C15'),
('Fkt421', 'Maropia Sud', 'C15'),
('Fkt422', 'Maropia Maromena', 'C15'),
('Fkt423', 'Maropia Ankilimbazaha', 'C15'),
('Fkt424', 'Maromainte', 'C15'),
('Fkt425', 'Miaregnarivo', 'C15'),
('Fkt426', 'Marofengoke Andoharano', 'C15'),
('Fkt427', 'Miodo Marofotibe', 'C15'),
('Fkt428', 'Savara Tanandava', 'C15'),
('Fkt429', 'Soatsifa I', 'C15'),
('Fkt430', 'Soatsifa Bas', 'C15'),
('Fkt431', 'Soatsifa Haut', 'C15'),
('Fkt432', 'Soatsifa Mahazoarivo', 'C15'),
('Fkt433', 'Soatsifa Tanambao', 'C15'),
('Fkt434', 'Soatsifa Agnivorano', 'C15'),
('Fkt435', 'soatsifa Agnalamizitsy', 'C15'),
('Fkt436', 'Soatamea', 'C15'),
('Fkt437', 'Soatamea Morafeno', 'C15'),
('Fkt438', 'Soatandroke', 'C15'),
('Fkt439', 'Sarevalala', 'C15'),
('Fkt440', 'Tanantsoa Nord', 'C15'),
('Fkt441', 'Tanantsoa Miavotse', 'C15'),
('Fkt442', 'Tanambao I', 'C15'),
('Fkt443', 'Tanambao Sud', 'C15'),
('Fkt444', 'Tanambao Manorosoa', 'C15'),
('Fkt445', 'Tsihalegne Ambaromasy', 'C15'),
('Fkt446', 'Tsirandrane', 'C15'),
('Fkt447', 'Tsimikaboke', 'C15'),
('Fkt448', 'Tsiavihandro Ankalimboro', 'C15'),
('Fkt449', 'Tanambao Nord', 'C15'),
('Fkt450', 'Vohimiary', 'C15'),
('Fkt451', 'Belemboke', 'C15'),
('Fkt452', 'Ampanave kilemamy', 'C15'),
('Fkt453', 'Ampanavy', 'C15'),
('Fkt454', 'Marofoty Central', 'C18'),
('Fkt455', 'Tsimananada Central', 'C18'),
('Fkt456', 'Amboro', 'C18'),
('Fkt457', 'Mokofo', 'C18'),
('Fkt458', 'Ambagnemba Marolava', 'C18'),
('Fkt459', 'Ambanifengoke', 'C18'),
('Fkt460', 'Ambarobey Marofoty', 'C18'),
('Fkt461', 'Ambitike', 'C18'),
('Fkt462', 'Anjeky Miavotse', 'C18'),
('Fkt463', 'Anjamaro', 'C18'),
('Fkt464', 'Anjeky Mahasoa', 'C18'),
('Fkt465', 'Ankilimanintsy Ouest', 'C18'),
('Fkt466', 'Ankilerandro Sud', 'C18'),
('Fkt467', 'Ankilirandro- Ambanisarike', 'C18'),
('Fkt468', 'Ankilirandro - Nord', 'C18'),
('Fkt469', 'Ankilerandrobey', 'C18'),
('Fkt470', 'Antsasavy', 'C18'),
('Fkt471', 'Botreoky', 'C18'),
('Fkt472', 'Bekakoka II', 'C18'),
('Fkt473', 'Halomboro I', 'C18'),
('Fkt474', 'Ekaroke Ampihamibey', 'C18'),
('Fkt475', 'Marohafotsy centre', 'C18'),
('Fkt476', 'Mokofo I', 'C18'),
('Fkt477', 'Mokofo II', 'C18'),
('Fkt478', 'Mahandrorano', 'C18'),
('Fkt479', 'Mahandrorano Ambane', 'C18'),
('Fkt480', 'Maroankena sud', 'C18'),
('Fkt481', 'Maroankena nord', 'C18'),
('Fkt482', 'Mihole', 'C18'),
('Fkt483', 'Soalike', 'C18'),
('Fkt484', 'Tsimihevo', 'C18'),
('Fkt485', 'Tsimananada II', 'C18'),
('Fkt486', 'Tsimananada Sud', 'C18'),
('Fkt487', 'Antsaha', 'C19'),
('Fkt488', 'Bekopiky', 'C19'),
('Fkt489', 'Ambondrombe', 'C19'),
('Fkt490', 'Antafianampela', 'C07'),
('Fkt491', 'Andramanera', 'C17'),
('Fkt492', 'Ankilitelo', 'C08'),
('Fkt493', 'Anjira', 'C59'),
('Fkt494', 'Afotsifaly Est', 'C59'),
('Fkt495', 'Ambaromanoy I', 'C59'),
('Fkt496', 'Ambaromanoy II', 'C59'),
('Fkt497', 'Ambaromanoy III', 'C59'),
('Fkt498', 'Beara Ambony', 'C59'),
('Fkt499', 'Ambarovoahasy', 'C61'),
('Fkt501', 'Imongy Centre', 'C61'),
('Fkt502', 'IMONGY II REBEKE', 'C61'),
('Fkt503', 'Ambovotoka', 'C63'),
('Fkt504', 'Ananakirihitse Centre', 'C63'),
('Fkt505', 'Atsimondrano', 'C63'),
('Fkt506', 'Namoia', 'C63'),
('Fkt507', 'Finondranon\'akoho', 'C64'),
('Fkt508', 'Bevazavo', 'C64'),
('Fkt509', 'Bevazavo Centre', 'C64'),
('Fkt510', 'Tesingo Sud', 'C64'),
('Fkt511', 'Ankobaimasy I', 'C64'),
('Fkt512', 'Ambanenonoke', 'C64'),
('Fkt513', 'Antalahavalala', 'C64'),
('Fkt514', 'Tesingo Marofoty', 'C64'),
('Fkt515', 'Beraketa Centre', 'C48'),
('Fkt516', 'Tsilany bas', 'C52'),
('Fkt517', 'Anaviavy', 'C52'),
('Fkt518', 'Anivorano', 'C52'),
('Fkt519', 'Mahasoa be', 'C47'),
('Fkt520', 'Bealoke', 'C35'),
('Fkt521', 'Ankilemitraha', 'C35'),
('Fkt522', 'Voavonto', 'C35'),
('Fkt523', 'Ezambey', 'C35'),
('Fkt524', 'Ambanitsena Manambaro I', 'C83'),
('Fkt525', 'Manambaro ville', 'C83'),
('Fkt526', 'Berano ville', 'C22'),
('Fkt527', 'Tanambao Behara', 'C23'),
('Fkt528', 'Ankirikirike', 'C23'),
('Fkt529', 'Andrenara', 'C23'),
('Fkt530', 'Behara Ambony', 'C23'),
('Fkt531', 'Tanambao Tsiatoro', 'C72'),
('Fkt532', 'Anjeky Morafeno', 'C92'),
('Fkt533', 'Beanantara', 'C92'),
('Fkt534', 'Marovatobe', 'C70'),
('Fkt535', 'Amborominendra-Tsararivotse', 'C02'),
('Fkt536', 'Ambanekile', 'C11'),
('Fkt538', 'Tsifahera Andobaka', 'C11'),
('Fkt539', 'Ankiliromotse centre', 'C05'),
('Fkt540', 'Ankiliromotse Marolava', 'C05'),
('Fkt541', 'Tanamare', 'C05'),
('Fkt542', 'Belanky', 'C05'),
('Fkt543', 'Mitsokeba', 'C18'),
('Fkt544', 'Tetebey', 'C06'),
('Fkt545', 'Antsomontsoy Centre', 'C15'),
('Fkt546', 'Erada Tsimivaky', 'C14'),
('Fkt547', 'Tsimandrivotse', 'C15'),
('Fkt548', 'Vahavola Amboropotsy', 'C14'),
('Fkt549', 'Vahavola Ampihamibe', 'C14'),
('Fkt550', 'Ankeloke Tsaramandroso', 'C14'),
('Fkt551', 'Belitsake Ankeloke', 'C14'),
('Fkt552', 'Ankeloke', 'C14'),
('Fkt553', 'Tsimanato', 'C11'),
('Fkt554', 'Hobahoba', 'C11'),
('Fkt555', 'Amboloke', 'C04'),
('Fkt556', 'Maromainty', 'C05'),
('Fkt557', 'Ambanikily Sud', 'C05'),
('Fkt558', 'Mareagne', 'C06'),
('Fkt559', 'Ankilimamy', 'C14'),
('Fkt560', 'Ebana Mareagna', 'C06'),
('Fkt561', 'Behanta Mareagna', 'C06'),
('Fkt562', 'Ambanibasy Bearivo', 'C14'),
('Fkt563', 'Ambatolahy', 'C14'),
('Fkt564', 'Antsakoamasy Tanabe', 'C14'),
('Fkt565', 'Behanta', 'C15'),
('Fkt566', 'Erakoke Anjamahavelo', 'C14'),
('Fkt567', 'Zanavo Ankilimbazaha', 'C14'),
('Fkt568', 'Anovy Sud', 'C60'),
('Fkt569', 'Tanandava', 'C60'),
('Fkt570', 'Bema', 'C60'),
('Fkt571', 'Morafeno', 'C60'),
('Fkt572', 'Bealoke', 'C35'),
('Fkt573', 'Beroroha Ambato', 'C35'),
('Fkt574', 'Elanja centre', 'C35'),
('Fkt575', 'Magnindra Centre', 'C35'),
('Fkt576', 'Magnindra', 'C35'),
('Fkt577', 'Magnindra Marolava', 'C35'),
('Fkt578', 'Sampona', 'C35'),
('Fkt579', 'Sampona Centre', 'C35'),
('Fkt580', 'Sampona II', 'C35'),
('Fkt581', 'Sampona Marosifotse', 'C35'),
('Fkt582', 'Vahavola', 'C35'),
('Fkt583', 'Vahavola Ankilebey', 'C35'),
('Fkt584', 'Vahavola Anonoke', 'C35'),
('Fkt585', 'Amboro', 'C18');

-- --------------------------------------------------------

--
-- Structure de la table `zone_region`
--

DROP TABLE IF EXISTS `zone_region`;
CREATE TABLE IF NOT EXISTS `zone_region` (
  `code_reg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nom_reg` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`code_reg`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `zone_region`
--

INSERT INTO `zone_region` (`code_reg`, `nom_reg`) VALUES
('R01', 'ANDROY'),
('R02', 'ANOSY');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `activite`
--
ALTER TABLE `activite`
  ADD CONSTRAINT `activite_ibfk_1` FOREIGN KEY (`id_volet`) REFERENCES `volet` (`code_vol`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `animation_ve`
--
ALTER TABLE `animation_ve`
  ADD CONSTRAINT `animation_ve_ibfk_1` FOREIGN KEY (`id_pr`) REFERENCES `benef_activ_pr` (`code_pr`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `animation_ve_ibfk_2` FOREIGN KEY (`id_fkt`) REFERENCES `zone_fonkotany` (`code_fkt`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `animation_ve_ibfk_3` FOREIGN KEY (`id_commune`) REFERENCES `zone_commune` (`code_com`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `animation_ve_ibfk_4` FOREIGN KEY (`id_tech_recenseur`) REFERENCES `equipe` (`code_equipe`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `animation_ve_specu`
--
ALTER TABLE `animation_ve_specu`
  ADD CONSTRAINT `animation_ve_specu_ibfk_1` FOREIGN KEY (`id_anime_ve`) REFERENCES `animation_ve` (`code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `animation_ve_specu_ibfk_2` FOREIGN KEY (`id_espece`) REFERENCES `espece` (`code_espece`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `animation_ve_specu_ibfk_3` FOREIGN KEY (`id_var`) REFERENCES `variette` (`code_var`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `association`
--
ALTER TABLE `association`
  ADD CONSTRAINT `association_ibfk_1` FOREIGN KEY (`id_prjt`) REFERENCES `projet` (`code_proj`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `association_ibfk_2` FOREIGN KEY (`id_tech`) REFERENCES `equipe` (`code_equipe`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `association_ibfk_5` FOREIGN KEY (`id_fkt`) REFERENCES `zone_fonkotany` (`code_fkt`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `assoc_parce`
--
ALTER TABLE `assoc_parce`
  ADD CONSTRAINT `assoc_parce_ibfk_1` FOREIGN KEY (`id_assoc`) REFERENCES `association` (`code_ass`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `assoc_parce_ibfk_2` FOREIGN KEY (`id_benef`) REFERENCES `beneficiaire` (`code_benef`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `assoc_parce_ibfk_3` FOREIGN KEY (`id_fkt`) REFERENCES `zone_fonkotany` (`code_fkt`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `beneficiaire`
--
ALTER TABLE `beneficiaire`
  ADD CONSTRAINT `beneficiaire_ibfk_1` FOREIGN KEY (`id_fkt`) REFERENCES `zone_fonkotany` (`code_fkt`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `beneficiaire_ibfk_2` FOREIGN KEY (`id_commune`) REFERENCES `zone_commune` (`code_com`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `benef_activ_bl`
--
ALTER TABLE `benef_activ_bl`
  ADD CONSTRAINT `benef_activ_bl_ibfk_1` FOREIGN KEY (`id_activ`) REFERENCES `activite` (`code_act`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `benef_activ_bl_ibfk_2` FOREIGN KEY (`id_benef`) REFERENCES `beneficiaire` (`code_benef`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `benef_activ_bl_ibfk_5` FOREIGN KEY (`id_proj`) REFERENCES `projet` (`code_proj`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `benef_activ_bl_ibfk_6` FOREIGN KEY (`id_bloc`) REFERENCES `bloc` (`code_bloc`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `benef_activ_bl_ibfk_7` FOREIGN KEY (`id_collaborateur`) REFERENCES `collaborateur` (`code_col`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `benef_activ_pms`
--
ALTER TABLE `benef_activ_pms`
  ADD CONSTRAINT `benef_activ_pms_ibfk_3` FOREIGN KEY (`id_benef`) REFERENCES `beneficiaire` (`code_benef`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `benef_activ_pms_ibfk_5` FOREIGN KEY (`id_proj`) REFERENCES `projet` (`code_proj`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `benef_activ_pms_ibfk_6` FOREIGN KEY (`id_association`) REFERENCES `association` (`code_ass`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `benef_activ_pms_ibfk_7` FOREIGN KEY (`id_collaborateur`) REFERENCES `collaborateur` (`code_col`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `benef_activ_pr`
--
ALTER TABLE `benef_activ_pr`
  ADD CONSTRAINT `benef_activ_pr_ibfk_1` FOREIGN KEY (`id_activ`) REFERENCES `activite` (`code_act`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `benef_activ_pr_ibfk_2` FOREIGN KEY (`id_benef`) REFERENCES `beneficiaire` (`code_benef`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `benef_activ_pr_ibfk_3` FOREIGN KEY (`id_proj`) REFERENCES `projet` (`code_proj`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `benef_activ_pr_ibfk_4` FOREIGN KEY (`id_bloc`) REFERENCES `bloc` (`code_bloc`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `benef_activ_pr_ibfk_5` FOREIGN KEY (`id_collaborateur`) REFERENCES `collaborateur` (`code_col`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `benef_activ_pr_ibfk_6` FOREIGN KEY (`id_tech`) REFERENCES `equipe` (`code_equipe`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `bloc`
--
ALTER TABLE `bloc`
  ADD CONSTRAINT `bloc_ibfk_1` FOREIGN KEY (`id_prjt`) REFERENCES `projet` (`code_proj`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bloc_ibfk_2` FOREIGN KEY (`id_tech`) REFERENCES `equipe` (`code_equipe`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `bloc_parce`
--
ALTER TABLE `bloc_parce`
  ADD CONSTRAINT `bloc_parce_ibfk_3` FOREIGN KEY (`id_bloc`) REFERENCES `bloc` (`code_bloc`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bloc_parce_ibfk_4` FOREIGN KEY (`id_benef`) REFERENCES `beneficiaire` (`code_benef`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bloc_parce_ibfk_5` FOREIGN KEY (`id_fkt`) REFERENCES `zone_fonkotany` (`code_fkt`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `bloc_zone`
--
ALTER TABLE `bloc_zone`
  ADD CONSTRAINT `bloc_zone_ibfk_3` FOREIGN KEY (`id_km`) REFERENCES `benef_activ_bl` (`code_benef_bl`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bloc_zone_ibfk_4` FOREIGN KEY (`id_fkt`) REFERENCES `zone_fonkotany` (`code_fkt`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bloc_zone_ibfk_5` FOREIGN KEY (`id_bloc`) REFERENCES `bloc` (`code_bloc`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `cep_parce`
--
ALTER TABLE `cep_parce`
  ADD CONSTRAINT `cep_parce_ibfk_1` FOREIGN KEY (`id_benef`) REFERENCES `beneficiaire` (`code_benef`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `cep_parce_ibfk_2` FOREIGN KEY (`id_fkt`) REFERENCES `zone_fonkotany` (`code_fkt`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `cep_parce_ibfk_3` FOREIGN KEY (`id_commune`) REFERENCES `zone_commune` (`code_com`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `cep_parce_ibfk_4` FOREIGN KEY (`id_bloc`) REFERENCES `bloc` (`code_bloc`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `collaborateur_activ`
--
ALTER TABLE `collaborateur_activ`
  ADD CONSTRAINT `collaborateur_activ_ibfk_1` FOREIGN KEY (`id_col`) REFERENCES `collaborateur` (`code_col`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `collaborateur_activ_ibfk_2` FOREIGN KEY (`id_activ`) REFERENCES `activite` (`code_act`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `cultures_pms`
--
ALTER TABLE `cultures_pms`
  ADD CONSTRAINT `cultures_pms_ibfk_3` FOREIGN KEY (`id_saison`) REFERENCES `saison` (`code_saison`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `cultures_pms_ibfk_5` FOREIGN KEY (`id_parce`) REFERENCES `assoc_parce` (`code_parce`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `cultures_pms_ibfk_6` FOREIGN KEY (`id_var`) REFERENCES `variette` (`code_var`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `cultures_pms_ibfk_7` FOREIGN KEY (`ea_id_variette`) REFERENCES `variette` (`code_var`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `culture_bl`
--
ALTER TABLE `culture_bl`
  ADD CONSTRAINT `culture_bl_ibfk_1` FOREIGN KEY (`id_parce`) REFERENCES `bloc_parce` (`code_parce`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `culture_bl_ibfk_2` FOREIGN KEY (`id_var`) REFERENCES `variette` (`code_var`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `culture_bl_ibfk_3` FOREIGN KEY (`id_saison`) REFERENCES `saison` (`code_saison`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `culture_bl_ibfk_4` FOREIGN KEY (`ea_id_variette`) REFERENCES `variette` (`code_var`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `culture_bl_ibfk_5` FOREIGN KEY (`id_equipe`) REFERENCES `equipe` (`code_equipe`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `culture_bl_ibfk_6` FOREIGN KEY (`id_espece`) REFERENCES `espece` (`code_espece`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `culture_pr`
--
ALTER TABLE `culture_pr`
  ADD CONSTRAINT `culture_pr_ibfk_1` FOREIGN KEY (`id_parce`) REFERENCES `cep_parce` (`code_parce`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `culture_pr_ibfk_2` FOREIGN KEY (`id_var`) REFERENCES `variette` (`code_var`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `culture_pr_ibfk_3` FOREIGN KEY (`id_saison`) REFERENCES `saison` (`code_saison`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `culture_pr_ibfk_4` FOREIGN KEY (`ea_id_variette`) REFERENCES `variette` (`code_var`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `culture_pr_ibfk_5` FOREIGN KEY (`id_equipe`) REFERENCES `equipe` (`code_equipe`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `culture_pr_ibfk_6` FOREIGN KEY (`id_espece`) REFERENCES `espece` (`code_espece`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `equipe`
--
ALTER TABLE `equipe`
  ADD CONSTRAINT `equipe_ibfk_1` FOREIGN KEY (`id_fonct`) REFERENCES `fonction` (`code_fonct`);

--
-- Contraintes pour la table `espece`
--
ALTER TABLE `espece`
  ADD CONSTRAINT `espece_ibfk_1` FOREIGN KEY (`id_categ`) REFERENCES `categorie_espece` (`code_cat`);

--
-- Contraintes pour la table `parcelle`
--
ALTER TABLE `parcelle`
  ADD CONSTRAINT `parcelle_ibfk_1` FOREIGN KEY (`id_benef`) REFERENCES `beneficiaire` (`code_benef`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `parcelle_ibfk_2` FOREIGN KEY (`id_fkt`) REFERENCES `zone_fonkotany` (`code_fkt`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `participe_proj_activ`
--
ALTER TABLE `participe_proj_activ`
  ADD CONSTRAINT `participe_proj_activ_ibfk_1` FOREIGN KEY (`id_proj`) REFERENCES `projet` (`code_proj`),
  ADD CONSTRAINT `participe_proj_activ_ibfk_2` FOREIGN KEY (`id_activ`) REFERENCES `activite` (`code_act`);

--
-- Contraintes pour la table `participe_proj_volet`
--
ALTER TABLE `participe_proj_volet`
  ADD CONSTRAINT `participe_proj_volet_ibfk_1` FOREIGN KEY (`id_volet`) REFERENCES `volet` (`code_vol`),
  ADD CONSTRAINT `participe_proj_volet_ibfk_2` FOREIGN KEY (`id_chef`) REFERENCES `equipe` (`code_equipe`),
  ADD CONSTRAINT `participe_proj_volet_ibfk_3` FOREIGN KEY (`id_projet`) REFERENCES `projet` (`code_proj`);

--
-- Contraintes pour la table `projet_equipe`
--
ALTER TABLE `projet_equipe`
  ADD CONSTRAINT `projet_equipe_ibfk_1` FOREIGN KEY (`id_equipe`) REFERENCES `equipe` (`code_equipe`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `projet_equipe_ibfk_2` FOREIGN KEY (`id_projet`) REFERENCES `projet` (`code_proj`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `projet_equipe_volet`
--
ALTER TABLE `projet_equipe_volet`
  ADD CONSTRAINT `projet_equipe_volet_ibfk_1` FOREIGN KEY (`id_equipe`) REFERENCES `equipe` (`code_equipe`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `projet_equipe_volet_ibfk_2` FOREIGN KEY (`id_projet`) REFERENCES `projet` (`code_proj`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `projet_equipe_volet_ibfk_3` FOREIGN KEY (`id_volet`) REFERENCES `volet` (`code_vol`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `suivi_bl`
--
ALTER TABLE `suivi_bl`
  ADD CONSTRAINT `suivi_bl_ibfk_1` FOREIGN KEY (`id_culture`) REFERENCES `culture_bl` (`code_culture`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `suivi_pms`
--
ALTER TABLE `suivi_pms`
  ADD CONSTRAINT `suivi_pms_ibfk_1` FOREIGN KEY (`id_culture`) REFERENCES `cultures_pms` (`code_culture`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `suivi_pr`
--
ALTER TABLE `suivi_pr`
  ADD CONSTRAINT `suivi_pr_ibfk_1` FOREIGN KEY (`id_culture`) REFERENCES `culture_pr` (`code_culture`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `s_bloc`
--
ALTER TABLE `s_bloc`
  ADD CONSTRAINT `s_bloc_ibfk_2` FOREIGN KEY (`id_proj`) REFERENCES `projet` (`code_proj`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD CONSTRAINT `utilisateurs_ibfk_1` FOREIGN KEY (`id_equipe`) REFERENCES `equipe` (`code_equipe`);

--
-- Contraintes pour la table `variette`
--
ALTER TABLE `variette`
  ADD CONSTRAINT `variette_ibfk_1` FOREIGN KEY (`id_espece`) REFERENCES `espece` (`code_espece`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `zone_commune`
--
ALTER TABLE `zone_commune`
  ADD CONSTRAINT `zone_commune_ibfk_1` FOREIGN KEY (`id_dist`) REFERENCES `zone_district` (`code_dist`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `zone_district`
--
ALTER TABLE `zone_district`
  ADD CONSTRAINT `zone_district_ibfk_1` FOREIGN KEY (`id_reg`) REFERENCES `zone_region` (`code_reg`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `zone_fonkotany`
--
ALTER TABLE `zone_fonkotany`
  ADD CONSTRAINT `zone_fonkotany_ibfk_1` FOREIGN KEY (`id_com`) REFERENCES `zone_commune` (`code_com`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
