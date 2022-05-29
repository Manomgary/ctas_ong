-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 04 fév. 2022 à 06:52
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
-- Base de données : `ctas`
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
  KEY `id_activ` (`id_activ`),
  KEY `id_variette` (`id_variette`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `association`
--

DROP TABLE IF EXISTS `association`;
CREATE TABLE IF NOT EXISTS `association` (
  `code_ass` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `id_prjt` varchar(100) NOT NULL,
  `id_tech` int NOT NULL COMMENT 'technisiana mpiandraikitran'' i fikambanana',
  `id_pms` varchar(100) DEFAULT NULL,
  `id_fkt` int NOT NULL COMMENT 'fokotany ijoroan''i fikambanana',
  `status` varchar(100) NOT NULL DEFAULT 'active',
  PRIMARY KEY (`code_ass`),
  UNIQUE KEY `id_pms` (`id_pms`) USING BTREE,
  KEY `id_prjt` (`id_prjt`),
  KEY `id_tech` (`id_tech`),
  KEY `id_commune` (`id_fkt`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `association`
--

INSERT INTO `association` (`code_ass`, `nom`, `id_prjt`, `id_tech`, `id_pms`, `id_fkt`, `status`) VALUES
(1, 'soafiavy', 'P003', 2, 'AFAI_SF05', 71, 'active'),
(2, 'ranovelo aviavy', 'P003', 2, NULL, 72, 'active'),
(3, 'mahasoa', 'P004', 3, NULL, 16, 'active');

-- --------------------------------------------------------

--
-- Structure de la table `assoc_parce`
--

DROP TABLE IF EXISTS `assoc_parce`;
CREATE TABLE IF NOT EXISTS `assoc_parce` (
  `code` varchar(50) NOT NULL,
  `id_assoc` int NOT NULL,
  `id_parce` int NOT NULL,
  `annee_adheran` year NOT NULL,
  `status` varchar(100) NOT NULL DEFAULT 'active',
  PRIMARY KEY (`code`),
  KEY `id_assoc` (`id_assoc`),
  KEY `id_parce` (`id_parce`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `assoc_parce`
--

INSERT INTO `assoc_parce` (`code`, `id_assoc`, `id_parce`, `annee_adheran`, `status`) VALUES
('P_RNA2_01', 2, 5, 2020, 'active'),
('P_RNA2_02', 2, 4, 2020, 'active'),
('P_SF1_001', 1, 1, 2019, 'active'),
('P_SF1_002', 1, 2, 2019, 'active'),
('P_SF1_003', 1, 3, 2019, 'active');

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
  `dt_nais` date NOT NULL,
  `surnom` varchar(50) DEFAULT NULL,
  `cin` bigint NOT NULL,
  `dt_delivrance` date NOT NULL,
  `lieu_delivrance` varchar(100) NOT NULL,
  `img_cin` blob,
  `contact` int DEFAULT NULL,
  `id_fkt` int NOT NULL,
  `dt_Insert` date DEFAULT NULL,
  `statut` varchar(100) NOT NULL DEFAULT 'active',
  PRIMARY KEY (`code_benef`),
  KEY `id_fkt` (`id_fkt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `beneficiaire`
--

INSERT INTO `beneficiaire` (`code_benef`, `img_benef`, `nom`, `prenom`, `sexe`, `dt_nais`, `surnom`, `cin`, `dt_delivrance`, `lieu_delivrance`, `img_cin`, `contact`, `id_fkt`, `dt_Insert`, `statut`) VALUES
('B0001', NULL, 'Mahasoa', NULL, 'H', '1990-01-10', NULL, 511222333444, '2007-01-12', 'ERADA', NULL, 330569812, 71, '2022-01-26', 'active'),
('B0002', NULL, 'Miza', NULL, 'F', '1970-01-04', NULL, 512369147205, '2000-01-03', 'Ambonaivo', NULL, NULL, 71, '2022-01-26', 'active'),
('B0003', NULL, 'SAOTSE', NULL, 'H', '1850-01-12', NULL, 522141265123, '1999-01-26', 'Erada', NULL, 331269812, 72, '2022-01-26', 'active'),
('B0004', NULL, 'Zanatsoa', NULL, 'F', '1999-01-04', NULL, 510369147205, '2008-01-26', 'Erada', NULL, NULL, 72, '2022-01-26', 'active'),
('B0005', NULL, 'FEDRAZA', 'Emilien', 'H', '1980-10-17', 'soavosy', 510321000444, '1999-01-26', 'Ambovombe', NULL, 330669812, 71, '2022-01-26', 'active'),
('B0006', NULL, 'MIHERENTSOA', NULL, 'H', '1990-10-10', NULL, 500125897123, '2011-01-27', 'AMBONDRO', NULL, NULL, 72, '2022-01-27', 'active'),
('B0007', NULL, 'RAKOTO', 'BENJAKA', 'H', '2002-02-08', NULL, 516151015000, '2015-02-02', 'ambondro', NULL, NULL, 24, NULL, 'active'),
('B0008', NULL, 'LAMBASOA', 'Mahavike', 'H', '1990-02-16', NULL, 502151010320, '2006-02-03', 'agnorike', NULL, NULL, 68, NULL, 'active');

-- --------------------------------------------------------

--
-- Structure de la table `benef_activ_bl`
--

DROP TABLE IF EXISTS `benef_activ_bl`;
CREATE TABLE IF NOT EXISTS `benef_activ_bl` (
  `code_benef_bl` varchar(100) NOT NULL,
  `id_proj` varchar(100) NOT NULL,
  `id_activ` int NOT NULL,
  `id_benef` varchar(50) NOT NULL,
  `id_bloc` int DEFAULT NULL,
  `id_collaborateur` int DEFAULT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'active',
  PRIMARY KEY (`code_benef_bl`),
  KEY `benef_activ_bl_ibfk_3` (`id_bloc`),
  KEY `benef_activ_bl_ibfk_4` (`id_collaborateur`),
  KEY `id_activ` (`id_activ`),
  KEY `id_benef` (`id_benef`),
  KEY `id_proj` (`id_proj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `benef_activ_bl`
--

INSERT INTO `benef_activ_bl` (`code_benef_bl`, `id_proj`, `id_activ`, `id_benef`, `id_bloc`, `id_collaborateur`, `status`) VALUES
('B_DEFI_AB_001', 'P005', 2, 'B0007', 2, 1, 'active'),
('B_DEFIS_FC_001', 'P005', 2, 'B0005', 1, 7, 'active');

-- --------------------------------------------------------

--
-- Structure de la table `benef_activ_pms`
--

DROP TABLE IF EXISTS `benef_activ_pms`;
CREATE TABLE IF NOT EXISTS `benef_activ_pms` (
  `code_benef_pms` varchar(100) NOT NULL,
  `id_proj` varchar(100) NOT NULL,
  `id_activ` int NOT NULL,
  `id_benef` varchar(50) NOT NULL,
  `id_association` int NOT NULL,
  `id_collaborateur` int DEFAULT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'active',
  PRIMARY KEY (`code_benef_pms`),
  KEY `id_association` (`id_association`),
  KEY `id_activ` (`id_activ`),
  KEY `id_benef` (`id_benef`),
  KEY `id_collaborateur` (`id_collaborateur`),
  KEY `id_proj` (`id_proj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `benef_activ_pms`
--

INSERT INTO `benef_activ_pms` (`code_benef_pms`, `id_proj`, `id_activ`, `id_benef`, `id_association`, `id_collaborateur`, `status`) VALUES
('AFA3_MHS_001', 'P004', 1, 'B0007', 3, 2, 'active'),
('AFAI_RA01', 'P003', 1, 'B0003', 2, 2, 'active'),
('AFAI_RA02', 'P003', 1, 'B0004', 2, 2, 'active'),
('AFAI_RA03', 'P003', 1, 'B0006', 2, 6, 'active'),
('AFAI_SF001', 'P003', 1, 'B0001', 1, 6, 'active'),
('AFAI_SF002', 'P003', 1, 'B0002', 1, 2, 'active'),
('AFAI_SF05', 'P003', 1, 'B0005', 1, 2, 'active');

-- --------------------------------------------------------

--
-- Structure de la table `bloc`
--

DROP TABLE IF EXISTS `bloc`;
CREATE TABLE IF NOT EXISTS `bloc` (
  `code_bloc` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `id_prjt` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL DEFAULT 'active',
  PRIMARY KEY (`code_bloc`),
  KEY `id_prjt` (`id_prjt`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `bloc`
--

INSERT INTO `bloc` (`code_bloc`, `nom`, `id_prjt`, `status`) VALUES
(1, 'faux-cap', 'P005', 'active'),
(2, 'ambondoro', 'P005', 'active');

-- --------------------------------------------------------

--
-- Structure de la table `bloc_parce`
--

DROP TABLE IF EXISTS `bloc_parce`;
CREATE TABLE IF NOT EXISTS `bloc_parce` (
  `code_blparce` int NOT NULL AUTO_INCREMENT,
  `id_bloc` int NOT NULL,
  `id_parce` int NOT NULL,
  `anne_adheran` year NOT NULL,
  `status` varchar(100) NOT NULL DEFAULT 'active',
  PRIMARY KEY (`code_blparce`),
  KEY `id_bloc` (`id_bloc`),
  KEY `id_parce` (`id_parce`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `bloc_zone`
--

DROP TABLE IF EXISTS `bloc_zone`;
CREATE TABLE IF NOT EXISTS `bloc_zone` (
  `code` int NOT NULL AUTO_INCREMENT,
  `id_commune` int NOT NULL,
  `id_bloc` int NOT NULL,
  PRIMARY KEY (`code`),
  KEY `id_bloc` (`id_bloc`),
  KEY `id_commune` (`id_commune`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `bloc_zone`
--

INSERT INTO `bloc_zone` (`code`, `id_commune`, `id_bloc`) VALUES
(1, 22, 1),
(2, 5, 2),
(3, 23, 1);

-- --------------------------------------------------------

--
-- Structure de la table `categorie_espece`
--

DROP TABLE IF EXISTS `categorie_espece`;
CREATE TABLE IF NOT EXISTS `categorie_espece` (
  `code_cat` int NOT NULL AUTO_INCREMENT,
  `libelle` varchar(100) NOT NULL,
  PRIMARY KEY (`code_cat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `collaborateur`
--

DROP TABLE IF EXISTS `collaborateur`;
CREATE TABLE IF NOT EXISTS `collaborateur` (
  `code_col` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`code_col`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `collaborateur`
--

INSERT INTO `collaborateur` (`code_col`, `nom`, `description`) VALUES
(1, 'KM', 'komity Mpitarika'),
(2, 'PMS', 'paysans multiplicateur de semences'),
(3, 'Boutiqier', 'Boutique Intran'),
(4, 'PR', 'Paysan relais'),
(5, 'ATP', 'Mpitsabo voly'),
(6, 'PA', 'Président association'),
(7, 'bénéficiaire', 'bénéficiaire');

-- --------------------------------------------------------

--
-- Structure de la table `collaborateur_activ`
--

DROP TABLE IF EXISTS `collaborateur_activ`;
CREATE TABLE IF NOT EXISTS `collaborateur_activ` (
  `code` int NOT NULL AUTO_INCREMENT,
  `id_col` int NOT NULL,
  `id_activ` int NOT NULL,
  PRIMARY KEY (`code`),
  KEY `id_col` (`id_col`),
  KEY `id_activ` (`id_activ`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `collaborateur_activ`
--

INSERT INTO `collaborateur_activ` (`code`, `id_col`, `id_activ`) VALUES
(4, 1, 2),
(5, 6, 1),
(6, 3, 4),
(7, 2, 1),
(8, 7, 2),
(9, 5, 1);

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
-- Structure de la table `cultures_cep_ps`
--

DROP TABLE IF EXISTS `cultures_cep_ps`;
CREATE TABLE IF NOT EXISTS `cultures_cep_ps` (
  `code_culture` int NOT NULL AUTO_INCREMENT,
  `id_parce` int NOT NULL,
  `id_var` int NOT NULL,
  `saison` varchar(100) NOT NULL,
  `annee_du` year NOT NULL,
  `annee_au` year DEFAULT NULL,
  `dt_modification` date NOT NULL,
  `qsa` int NOT NULL,
  `dds` date NOT NULL,
  `sfce` int NOT NULL,
  `objectif` int DEFAULT NULL,
  `sc` varchar(100) NOT NULL,
  `ea` varchar(100) NOT NULL,
  `utl` int NOT NULL,
  `ex` int NOT NULL,
  PRIMARY KEY (`code_culture`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `equipe`
--

DROP TABLE IF EXISTS `equipe`;
CREATE TABLE IF NOT EXISTS `equipe` (
  `code_equipe` int NOT NULL AUTO_INCREMENT,
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
  `id_proj` varchar(100) NOT NULL,
  `statuts` varchar(100) NOT NULL DEFAULT 'en fonction',
  PRIMARY KEY (`code_equipe`),
  KEY `id_fonct` (`id_fonct`),
  KEY `id_proj` (`id_proj`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `equipe`
--

INSERT INTO `equipe` (`code_equipe`, `img`, `nom`, `prenom`, `sexe`, `dt_nais`, `cin`, `dt_delivrance`, `lieu_delivrance`, `img_cin`, `email`, `num_perso`, `num_float`, `dt_deb_contrat`, `dt_fin_contrat`, `id_fonct`, `id_proj`, `statuts`) VALUES
(1, NULL, 'christian', NULL, 'H', '1995-04-20', 516151010320, '2011-01-18', 'Ambovombe', NULL, NULL, 0334655107, NULL, NULL, NULL, 1, 'P002', 'supprime'),
(2, NULL, 'Roger', '', 'H', '1987-09-16', 515121023120, '2005-06-08', 'fort-dauphin', NULL, NULL, 0330200052, NULL, NULL, NULL, 1, 'P003', 'en fonction'),
(3, NULL, 'john', NULL, 'H', '1998-02-09', 500111011327, '2015-02-03', 'ANDALATANOSY', NULL, NULL, 0330100055, NULL, NULL, NULL, 1, 'P004', 'en fonction');

-- --------------------------------------------------------

--
-- Structure de la table `espece`
--

DROP TABLE IF EXISTS `espece`;
CREATE TABLE IF NOT EXISTS `espece` (
  `code_espece` int NOT NULL AUTO_INCREMENT,
  `nom_espece` varchar(100) NOT NULL,
  `id_categ` int NOT NULL,
  PRIMARY KEY (`code_espece`),
  KEY `id_categ` (`id_categ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  `code_parce` int NOT NULL AUTO_INCREMENT,
  `id_benef` varchar(50) NOT NULL,
  `ref_gps` int DEFAULT NULL,
  `lat` double DEFAULT NULL,
  `log` double DEFAULT NULL,
  `superficie` int NOT NULL,
  `status` varchar(100) NOT NULL DEFAULT 'active',
  PRIMARY KEY (`code_parce`),
  KEY `id_benef` (`id_benef`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `parcelle`
--

INSERT INTO `parcelle` (`code_parce`, `id_benef`, `ref_gps`, `lat`, `log`, `superficie`, `status`) VALUES
(1, 'B0005', NULL, NULL, NULL, 3000, 'active'),
(2, 'B0005', NULL, NULL, NULL, 4000, 'active'),
(3, 'B0005', NULL, NULL, NULL, 3500, 'active'),
(4, 'B0006', NULL, NULL, NULL, 4500, 'active'),
(5, 'B0006', NULL, NULL, NULL, 3600, 'active'),
(6, 'B0003', NULL, NULL, NULL, 3800, 'active');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `participe_proj_activ`
--

INSERT INTO `participe_proj_activ` (`code`, `id_proj`, `id_activ`, `dt_integr`, `statuts`) VALUES
(1, 'P003', 1, '2022-01-27', 'active'),
(2, 'P003', 2, '2022-01-27', 'active'),
(3, 'P003', 3, '2022-01-27', 'active'),
(4, 'P003', 4, '2022-01-27', 'active'),
(6, 'P004', 1, NULL, 'active');

-- --------------------------------------------------------

--
-- Structure de la table `participe_proj_volet`
--

DROP TABLE IF EXISTS `participe_proj_volet`;
CREATE TABLE IF NOT EXISTS `participe_proj_volet` (
  `code` int NOT NULL AUTO_INCREMENT,
  `id_projet` varchar(100) NOT NULL,
  `id_volet` int NOT NULL,
  `id_chef` int NOT NULL,
  `annee_integr` date DEFAULT NULL,
  `statuts` int NOT NULL,
  PRIMARY KEY (`code`),
  KEY `id_volet` (`id_volet`),
  KEY `id_chef` (`id_chef`),
  KEY `id_projet` (`id_projet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `projet`
--

DROP TABLE IF EXISTS `projet`;
CREATE TABLE IF NOT EXISTS `projet` (
  `code_proj` varchar(50) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `dt_deb_prev` date DEFAULT NULL,
  `dt_deb` date DEFAULT NULL,
  `dt_fin_prev` date DEFAULT NULL,
  `dt_fin` date DEFAULT NULL,
  `duree` int DEFAULT NULL,
  `logo` blob,
  `statuts` varchar(50) NOT NULL DEFAULT 'En cours' COMMENT 'brouillon, En cours, Décision, Fermé',
  PRIMARY KEY (`code_proj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `projet`
--

INSERT INTO `projet` (`code_proj`, `nom`, `description`, `dt_deb_prev`, `dt_deb`, `dt_fin_prev`, `dt_fin`, `duree`, `logo`, `statuts`) VALUES
('P001', 'CTAS', 'Centre Technique Agro-écologique du Sud', NULL, NULL, NULL, NULL, NULL, NULL, 'EC'),
('P002', 'Fondation Avril Phase 2', 'Projet gret', NULL, NULL, NULL, NULL, NULL, NULL, 'EC'),
('P003', 'AFAFI SUD Lot 1', 'Appuyer l’agroécologie dans le Sud et le Sud-Est de Madagascar', NULL, NULL, NULL, NULL, NULL, NULL, 'EC'),
('P004', 'AFAFI SUD Lot 3', 'Appuyer l’agroécologie dans le Sud et le Sud-Est de Madagascar', NULL, NULL, NULL, NULL, NULL, NULL, 'EC'),
('P005', 'DEFIS 2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'EC'),
('P006', 'PROSOL I', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'EC');

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
  `nom_users` varchar(100) NOT NULL,
  `mot_passe` varchar(100) NOT NULL,
  `situation` varchar(50) NOT NULL DEFAULT 'active',
  `statuts` varchar(50) NOT NULL DEFAULT 'Non actif',
  PRIMARY KEY (`code_util`),
  KEY `id_equipe` (`id_equipe`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`code_util`, `id_equipe`, `type`, `role`, `nom_users`, `mot_passe`, `situation`, `statuts`) VALUES
(1, 1, 'mobile', 'simple', 'tech_afa1', 'azerty', 'active', 'Non actif'),
(2, 2, 'mobile', 'simple', 'tech_afa2', 'azertyuiop', 'active', 'Non actif'),
(3, 3, 'mobile', 'simple', 'john_afi3', 'azerty', 'active', 'Non actif');

-- --------------------------------------------------------

--
-- Structure de la table `variette`
--

DROP TABLE IF EXISTS `variette`;
CREATE TABLE IF NOT EXISTS `variette` (
  `code_var` int NOT NULL AUTO_INCREMENT,
  `nom_var` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_espece` int NOT NULL,
  PRIMARY KEY (`code_var`),
  KEY `id_espece` (`id_espece`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `volet`
--

INSERT INTO `volet` (`code_vol`, `nom`, `description`) VALUES
(1, 'RP', 'Reseau paysant'),
(2, 'IDA', 'Identification Diffusion'),
(3, 'MACOM', NULL),
(4, 'RES', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `zone_commune`
--

DROP TABLE IF EXISTS `zone_commune`;
CREATE TABLE IF NOT EXISTS `zone_commune` (
  `code_com` int NOT NULL AUTO_INCREMENT,
  `nom_com` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_dist` int NOT NULL,
  PRIMARY KEY (`code_com`),
  KEY `id_com` (`id_dist`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `zone_commune`
--

INSERT INTO `zone_commune` (`code_com`, `nom_com`, `id_dist`) VALUES
(1, 'Ambanisarike', 1),
(2, 'Ambazoa', 1),
(3, 'Ambohimalaza', 1),
(4, 'Ambonaivo', 1),
(5, 'Ambondro', 1),
(6, 'Ambovombe', 1),
(7, 'Ampamata', 1),
(8, 'Analamary', 1),
(9, 'Andalatanosy', 1),
(10, 'Anjeke Ankilikira', 1),
(11, 'Antanimora Atsimo', 1),
(12, 'Erada Tsimanato', 1),
(13, 'Imanombo', 1),
(14, 'Jafaro', 1),
(15, 'Maroalomainty', 1),
(16, 'Maroalopoty', 1),
(17, 'Marovato Befeno', 1),
(18, 'Sihanamaro', 1),
(19, 'Tsimananada', 1),
(20, 'Anjampaly', 4),
(21, 'Antaritarika', 4),
(22, 'Faux Cap', 4),
(23, 'Imongy', 4),
(24, 'Marovato', 4),
(25, 'Nikoly', 4),
(26, 'Tsihombe', 4),
(27, 'Ambahita', 2),
(28, 'Ambatosola', 2),
(29, 'Anivorano Mitsinjo', 2),
(30, 'Anja Nord', 2),
(31, 'Ankaranabo Nord', 2),
(32, 'Antsakoamaro', 2),
(33, 'Bekily Morafeno', 2),
(34, 'Bekitro', 2),
(35, 'Belindo Mahasoa', 2),
(36, 'Beraketa', 2),
(37, 'Besaroa Maroviro', 2),
(38, 'Beteza', 2),
(39, 'Bevitiky', 2),
(40, 'Manakompy', 2),
(41, 'Tanambao Tsirandrany', 2),
(42, 'Tanandava', 2),
(43, 'Tsikolaky', 2),
(44, 'Vohimanga', 2);

-- --------------------------------------------------------

--
-- Structure de la table `zone_district`
--

DROP TABLE IF EXISTS `zone_district`;
CREATE TABLE IF NOT EXISTS `zone_district` (
  `code_dist` int NOT NULL AUTO_INCREMENT,
  `nom_dist` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_reg` int NOT NULL,
  PRIMARY KEY (`code_dist`),
  KEY `id_reg` (`id_reg`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `zone_district`
--

INSERT INTO `zone_district` (`code_dist`, `nom_dist`, `id_reg`) VALUES
(1, 'AMBOVOMBE ANDROY', 1),
(2, 'BEKILY', 1),
(3, 'BELOHA', 1),
(4, 'TSIHOMBE', 1),
(5, 'AMBOASARY ATSIMO', 2),
(6, 'BETROKA', 2),
(7, 'BENENITRA', 3);

-- --------------------------------------------------------

--
-- Structure de la table `zone_fonkotany`
--

DROP TABLE IF EXISTS `zone_fonkotany`;
CREATE TABLE IF NOT EXISTS `zone_fonkotany` (
  `code_fkt` int NOT NULL AUTO_INCREMENT,
  `nom_fkt` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_com` int NOT NULL,
  PRIMARY KEY (`code_fkt`),
  KEY `id_com` (`id_com`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `zone_fonkotany`
--

INSERT INTO `zone_fonkotany` (`code_fkt`, `nom_fkt`, `id_com`) VALUES
(1, 'Ambaromanintsy', 23),
(3, 'Ambatovato Centre', 23),
(4, 'Ambatovato Makifaha', 23),
(5, 'Ambonaivo Nord', 23),
(6, 'Andamoty', 23),
(7, 'Andramirava Centre', 23),
(8, 'Andramirava II', 23),
(9, 'Ambaromanintsy', 23),
(10, 'Andratino', 23),
(11, 'Ankilibe Nord', 23),
(12, 'Ankilimalangy', 23),
(13, 'Antsakoamanga Bas', 23),
(14, 'Antsakoamanga Centre', 23),
(15, 'Fekony', 23),
(16, 'Imongy Central', 23),
(17, 'Imongy I', 23),
(18, 'Marobe', 23),
(19, 'Tomily', 23),
(20, 'Afotsifaly Est', 21),
(21, 'Ambaromanoy', 21),
(22, 'Ambavatany', 21),
(23, 'Ambohitse', 21),
(24, 'Ambonaivo', 21),
(25, 'Anakania', 21),
(26, 'Anakanimo', 21),
(27, 'Andraketalahy', 21),
(28, 'Andranopoly', 21),
(29, 'Androvamare', 21),
(30, 'Anjira', 21),
(31, 'Ankilimikaiky', 21),
(32, 'Antaritarika Centrale', 21),
(33, 'Antaritarika II', 21),
(34, 'Antaritarika Maromainty', 21),
(35, 'Antsakoamanga', 21),
(36, 'Bemozotsy', 21),
(37, 'Fanarano', 21),
(38, 'Maroafo', 21),
(39, 'Mokabe', 21),
(40, 'Talaky Bas', 21),
(41, 'Talaky Haut', 21),
(42, 'Ambanikily Ambani*', 24),
(43, 'Ambanikily Volaki*', 24),
(44, 'Ambaro', 24),
(45, 'Ambazoa', 24),
(46, 'Amboandelaka', 24),
(47, 'Antseta', 24),
(48, 'Befeha', 24),
(49, 'Belitsaky', 24),
(50, 'Betaimboraka', 24),
(51, 'Betsingivy', 24),
(52, 'Bevala', 24),
(53, 'Mantara', 24),
(54, 'Marolava', 24),
(55, 'Mionjona', 24),
(56, 'Soramena', 24),
(57, 'Tsinava', 24),
(58, 'Amanda II', 22),
(59, 'Ambory Andraketalahy', 22),
(60, 'Ambotry', 22),
(61, 'Anja Haut', 22),
(62, 'Ankilimiary', 22),
(63, 'Anovy Sud', 22),
(64, 'Antalahavalala', 22),
(65, 'Antavy Nord', 22),
(66, 'Bema', 22),
(67, 'Benonoka', 22),
(68, 'Betanty (faux Cap Centre)', 22),
(69, 'Morafeno', 22),
(70, 'Anja Haut', 22),
(71, 'Ambaninato', 12),
(72, 'Mitreaky', 12);

-- --------------------------------------------------------

--
-- Structure de la table `zone_region`
--

DROP TABLE IF EXISTS `zone_region`;
CREATE TABLE IF NOT EXISTS `zone_region` (
  `code_reg` int NOT NULL AUTO_INCREMENT,
  `nom_reg` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`code_reg`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `zone_region`
--

INSERT INTO `zone_region` (`code_reg`, `nom_reg`) VALUES
(1, 'ANDROY'),
(2, 'ANOSY'),
(3, 'ATSIMO ANDREFANA');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `activite`
--
ALTER TABLE `activite`
  ADD CONSTRAINT `activite_ibfk_1` FOREIGN KEY (`id_volet`) REFERENCES `volet` (`code_vol`);

--
-- Contraintes pour la table `association`
--
ALTER TABLE `association`
  ADD CONSTRAINT `association_ibfk_1` FOREIGN KEY (`id_prjt`) REFERENCES `projet` (`code_proj`),
  ADD CONSTRAINT `association_ibfk_2` FOREIGN KEY (`id_tech`) REFERENCES `equipe` (`code_equipe`),
  ADD CONSTRAINT `association_ibfk_3` FOREIGN KEY (`id_fkt`) REFERENCES `zone_fonkotany` (`code_fkt`),
  ADD CONSTRAINT `association_ibfk_4` FOREIGN KEY (`id_pms`) REFERENCES `benef_activ_pms` (`code_benef_pms`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `beneficiaire`
--
ALTER TABLE `beneficiaire`
  ADD CONSTRAINT `beneficiaire_ibfk_1` FOREIGN KEY (`id_fkt`) REFERENCES `zone_fonkotany` (`code_fkt`);

--
-- Contraintes pour la table `benef_activ_bl`
--
ALTER TABLE `benef_activ_bl`
  ADD CONSTRAINT `benef_activ_bl_ibfk_3` FOREIGN KEY (`id_bloc`) REFERENCES `bloc` (`code_bloc`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `benef_activ_bl_ibfk_4` FOREIGN KEY (`id_collaborateur`) REFERENCES `collaborateur` (`code_col`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `benef_activ_bl_ibfk_5` FOREIGN KEY (`id_activ`) REFERENCES `activite` (`code_act`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `benef_activ_bl_ibfk_6` FOREIGN KEY (`id_benef`) REFERENCES `beneficiaire` (`code_benef`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `benef_activ_bl_ibfk_7` FOREIGN KEY (`id_proj`) REFERENCES `projet` (`code_proj`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `benef_activ_pms`
--
ALTER TABLE `benef_activ_pms`
  ADD CONSTRAINT `benef_activ_pms_ibfk_1` FOREIGN KEY (`id_association`) REFERENCES `association` (`code_ass`),
  ADD CONSTRAINT `benef_activ_pms_ibfk_2` FOREIGN KEY (`id_activ`) REFERENCES `activite` (`code_act`),
  ADD CONSTRAINT `benef_activ_pms_ibfk_3` FOREIGN KEY (`id_benef`) REFERENCES `beneficiaire` (`code_benef`),
  ADD CONSTRAINT `benef_activ_pms_ibfk_4` FOREIGN KEY (`id_collaborateur`) REFERENCES `collaborateur` (`code_col`),
  ADD CONSTRAINT `benef_activ_pms_ibfk_5` FOREIGN KEY (`id_proj`) REFERENCES `projet` (`code_proj`);

--
-- Contraintes pour la table `bloc`
--
ALTER TABLE `bloc`
  ADD CONSTRAINT `bloc_ibfk_1` FOREIGN KEY (`id_prjt`) REFERENCES `projet` (`code_proj`);

--
-- Contraintes pour la table `bloc_zone`
--
ALTER TABLE `bloc_zone`
  ADD CONSTRAINT `bloc_zone_ibfk_1` FOREIGN KEY (`id_bloc`) REFERENCES `bloc` (`code_bloc`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bloc_zone_ibfk_2` FOREIGN KEY (`id_commune`) REFERENCES `zone_commune` (`code_com`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `collaborateur_activ`
--
ALTER TABLE `collaborateur_activ`
  ADD CONSTRAINT `collaborateur_activ_ibfk_1` FOREIGN KEY (`id_activ`) REFERENCES `activite` (`code_act`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `collaborateur_activ_ibfk_2` FOREIGN KEY (`id_col`) REFERENCES `collaborateur` (`code_col`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `equipe`
--
ALTER TABLE `equipe`
  ADD CONSTRAINT `equipe_ibfk_1` FOREIGN KEY (`id_fonct`) REFERENCES `fonction` (`code_fonct`),
  ADD CONSTRAINT `equipe_ibfk_2` FOREIGN KEY (`id_proj`) REFERENCES `projet` (`code_proj`);

--
-- Contraintes pour la table `espece`
--
ALTER TABLE `espece`
  ADD CONSTRAINT `espece_ibfk_1` FOREIGN KEY (`id_categ`) REFERENCES `categorie_espece` (`code_cat`);

--
-- Contraintes pour la table `parcelle`
--
ALTER TABLE `parcelle`
  ADD CONSTRAINT `parcelle_ibfk_1` FOREIGN KEY (`id_benef`) REFERENCES `beneficiaire` (`code_benef`);

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
-- Contraintes pour la table `s_bloc`
--
ALTER TABLE `s_bloc`
  ADD CONSTRAINT `s_bloc_ibfk_1` FOREIGN KEY (`id_bloc`) REFERENCES `bloc` (`code_bloc`),
  ADD CONSTRAINT `s_bloc_ibfk_2` FOREIGN KEY (`id_proj`) REFERENCES `projet` (`code_proj`);

--
-- Contraintes pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD CONSTRAINT `utilisateurs_ibfk_1` FOREIGN KEY (`id_equipe`) REFERENCES `equipe` (`code_equipe`);

--
-- Contraintes pour la table `variette`
--
ALTER TABLE `variette`
  ADD CONSTRAINT `variette_ibfk_1` FOREIGN KEY (`id_espece`) REFERENCES `espece` (`code_espece`);

--
-- Contraintes pour la table `zone_commune`
--
ALTER TABLE `zone_commune`
  ADD CONSTRAINT `zone_commune_ibfk_1` FOREIGN KEY (`id_dist`) REFERENCES `zone_district` (`code_dist`);

--
-- Contraintes pour la table `zone_district`
--
ALTER TABLE `zone_district`
  ADD CONSTRAINT `zone_district_ibfk_1` FOREIGN KEY (`id_reg`) REFERENCES `zone_region` (`code_reg`);

--
-- Contraintes pour la table `zone_fonkotany`
--
ALTER TABLE `zone_fonkotany`
  ADD CONSTRAINT `zone_fonkotany_ibfk_1` FOREIGN KEY (`id_com`) REFERENCES `zone_commune` (`code_com`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
