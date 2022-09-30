-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 30 sep. 2022 à 06:27
-- Version du serveur : 5.7.36
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `qcm_encodeur`
--
CREATE DATABASE IF NOT EXISTS `qcm_encodeur` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `qcm_encodeur`;

-- --------------------------------------------------------

--
-- Structure de la table `administrateur`
--

DROP TABLE IF EXISTS `administrateur`;
CREATE TABLE IF NOT EXISTS `administrateur` (
  `ID_ADMIN` int(5) NOT NULL AUTO_INCREMENT,
  `LOGIN_ADMIN` varchar(50) NOT NULL,
  `PSW_ADMIN` varchar(60) NOT NULL,
  PRIMARY KEY (`ID_ADMIN`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `administrateur`
--

INSERT INTO `administrateur` (`ID_ADMIN`, `LOGIN_ADMIN`, `PSW_ADMIN`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Structure de la table `candidat`
--

DROP TABLE IF EXISTS `candidat`;
CREATE TABLE IF NOT EXISTS `candidat` (
  `ID_CAND` int(5) NOT NULL AUTO_INCREMENT,
  `NOM_CAND` varchar(50) NOT NULL,
  `PRENOM_CAND` varchar(50) NOT NULL,
  `MAIL_CAND` varchar(50) NOT NULL,
  `TEL_CAND` int(11) NOT NULL,
  PRIMARY KEY (`ID_CAND`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `candidat`
--

INSERT INTO `candidat` (`ID_CAND`, `NOM_CAND`, `PRENOM_CAND`, `MAIL_CAND`, `TEL_CAND`) VALUES
(2, 'Norris', 'Chuck', 'norris.chuck@dtgueule.com', 666666666),
(3, 'Jean', 'Le Nul', 'lenul.jean@nulistan.nl', 0),
(4, 'Minet', 'Bernard', 'lablaga.nanard@mailex.com', 612345678),
(10, 'Doué', 'Francois', 'doue.francois@outlook.com', 633192794);

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
CREATE TABLE IF NOT EXISTS `categorie` (
  `ID_CAT` int(5) NOT NULL AUTO_INCREMENT,
  `LIB_CAT` varchar(25) NOT NULL,
  PRIMARY KEY (`ID_CAT`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`ID_CAT`, `LIB_CAT`) VALUES
(1, 'Default'),
(2, 'java'),
(3, 'C#'),
(4, 'HTML');

-- --------------------------------------------------------

--
-- Structure de la table `question`
--

DROP TABLE IF EXISTS `question`;
CREATE TABLE IF NOT EXISTS `question` (
  `ID_QUESTION` int(5) NOT NULL AUTO_INCREMENT,
  `ENONC_QUEST` varchar(255) NOT NULL,
  `IMG_QUEST` varchar(255) DEFAULT NULL,
  `ID_CAT` int(5) NOT NULL,
  PRIMARY KEY (`ID_QUESTION`),
  KEY `FK_QUESTION_IDCAT` (`ID_CAT`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `question`
--

INSERT INTO `question` (`ID_QUESTION`, `ENONC_QUEST`, `IMG_QUEST`, `ID_CAT`) VALUES
(18, 'Quel est le sens de la vie?', NULL, 1),
(20, 'bla bla', NULL, 1),
(21, 'What does HTML stand for?', NULL, 4),
(22, 'Who is making the web standards', NULL, 4),
(23, 'Choose the correct HTML element for the largest heading :', NULL, 4),
(26, 'What is the correct HTML element for inserting a line break?', NULL, 4),
(32, 'test quest', NULL, 4),
(33, 'Test question', NULL, 1),
(34, 'La nouvelle BDD fera l\'affaire?', NULL, 1),
(35, 'Encore une question test?', NULL, 1);

-- --------------------------------------------------------

--
-- Structure de la table `reponse`
--

DROP TABLE IF EXISTS `reponse`;
CREATE TABLE IF NOT EXISTS `reponse` (
  `ID_REP` int(5) NOT NULL AUTO_INCREMENT,
  `TXT_REP` varchar(255) NOT NULL,
  `ID_QUESTION` int(5) NOT NULL,
  `ID_QUESTION_1` int(5) DEFAULT NULL,
  PRIMARY KEY (`ID_REP`),
  KEY `FK_QUESTION_ID` (`ID_QUESTION`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `reponse`
--

INSERT INTO `reponse` (`ID_REP`, `TXT_REP`, `ID_QUESTION`, `ID_QUESTION_1`) VALUES
(9, '42', 18, 18),
(10, 'C\'est pas faux', 18, 18),
(15, 'blurg', 20, NULL),
(16, 'blue', 20, 16),
(17, 'Hyperlinks and Text Markup language', 21, NULL),
(18, 'Hyper Text Markup Language', 21, 21),
(19, 'Home Tool markup language', 21, NULL),
(20, 'Microsoft', 22, NULL),
(21, 'Google', 22, NULL),
(22, 'The World Wild Web Consortium', 22, 22),
(23, 'Mozilla', 22, NULL),
(24, '<h1>', 23, 23),
(25, '<heading>', 23, NULL),
(26, '<head>', 23, NULL),
(27, '<h6>', 23, NULL),
(36, '<break>', 26, NULL),
(37, '<lb>', 26, NULL),
(38, '<br>', 26, 26),
(39, 'Obiwan Kenobi', 26, NULL),
(60, 'test rep 1', 32, NULL),
(61, 'test rep 42', 32, 61),
(62, 'La nouvelle base de donnée fera l\'affaire', 33, 33),
(63, 'non elle ne fera pas l\'affaire.', 33, NULL),
(64, 'Oui', 34, 34),
(65, 'Non', 34, NULL),
(66, 'Oui!', 35, NULL),
(67, 'Non!', 35, NULL),
(68, 'm\'en fout.', 35, 35);

-- --------------------------------------------------------

--
-- Structure de la table `sont_enregistrees`
--

DROP TABLE IF EXISTS `sont_enregistrees`;
CREATE TABLE IF NOT EXISTS `sont_enregistrees` (
  `ID_QUESTION` int(5) NOT NULL,
  `ID_REP` int(5) NOT NULL,
  `ID_CAND` int(5) NOT NULL,
  PRIMARY KEY (`ID_QUESTION`,`ID_REP`,`ID_CAND`),
  KEY `FK_QUESTION_IDR_ENRE` (`ID_REP`),
  KEY `FK_QUESTION_IDQC_ENRE` (`ID_CAND`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `sont_enregistrees`
--

INSERT INTO `sont_enregistrees` (`ID_QUESTION`, `ID_REP`, `ID_CAND`) VALUES
(18, 9, 4),
(18, 10, 2),
(20, 15, 2),
(20, 15, 4),
(21, 18, 2),
(21, 18, 4),
(22, 22, 2),
(22, 22, 4),
(23, 24, 2),
(23, 24, 4),
(26, 38, 2),
(26, 39, 4),
(32, 61, 2),
(32, 61, 4),
(33, 62, 2),
(33, 62, 4),
(34, 64, 2),
(34, 65, 4),
(35, 68, 2),
(35, 68, 4);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
