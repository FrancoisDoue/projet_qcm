CREATE DATABASE IF NOT EXISTS `qcm_encodeur`;
USE `qcm_encodeur`;
CREATE TABLE IF NOT EXISTS `administrateur` (
  `ID_ADMIN` int(5) NOT NULL AUTO_INCREMENT,
  `LOGIN_ADMIN` varchar(50) NOT NULL,
  `PSW_ADMIN` varchar(60) NOT NULL,
  PRIMARY KEY (`ID_ADMIN`)
) ENGINE=InnoDB;

INSERT INTO `administrateur` (`ID_ADMIN`, `LOGIN_ADMIN`, `PSW_ADMIN`) VALUES
(1, 'admin', 'admin');

CREATE TABLE IF NOT EXISTS `candidat` (
  `ID_CAND` int(5) NOT NULL AUTO_INCREMENT,
  `NOM_CAND` varchar(50) NOT NULL,
  `PRENOM_CAND` varchar(50) NOT NULL,
  `MAIL_CAND` varchar(50) NOT NULL,
  `TEL_CAND` int(11) NOT NULL,
  PRIMARY KEY (`ID_CAND`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `categorie` (
  `ID_CAT` int(5) NOT NULL AUTO_INCREMENT,
  `LIB_CAT` varchar(25) NOT NULL,
  PRIMARY KEY (`ID_CAT`)
) ENGINE=InnoDB;

INSERT INTO `categorie` (`ID_CAT`, `LIB_CAT`) VALUES
(1, 'Default'),
(2, 'java'),
(3, 'C#'),
(4, 'HTML');

CREATE TABLE IF NOT EXISTS `question` (
  `ID_QUESTION` int(5) NOT NULL AUTO_INCREMENT,
  `ENONC_QUEST` varchar(255) NOT NULL,
  `IMG_QUEST` varchar(255) DEFAULT NULL,
  `ID_CAT` int(5) NOT NULL,
  PRIMARY KEY (`ID_QUESTION`),
  KEY `FK_QUESTION_IDCAT` (`ID_CAT`)
) ENGINE=InnoDB AUTO_INCREMENT=33;

INSERT INTO `question` (`ID_QUESTION`, `ENONC_QUEST`, `IMG_QUEST`, `ID_CAT`) VALUES
(18, 'Quel est le sens de la vie?', NULL, 1),
(19, 'test', NULL, 1),
(20, 'bla bla', NULL, 1),
(21, 'What does HTML stand for?', NULL, 4),
(22, 'Who is making the web standards', NULL, 4),
(23, 'Choose the correct HTML element for the largest heading :', NULL, 4),
(26, 'What is the correct HTML element for inserting a line break?', NULL, 4),
(32, 'test quest', NULL, 4);

CREATE TABLE IF NOT EXISTS `reponse` (
  `ID_REP` int(5) NOT NULL AUTO_INCREMENT,
  `TXT_REP` varchar(255) NOT NULL,
  `ID_QUESTION` int(5) NOT NULL,
  `ID_QUESTION_1` int(5) DEFAULT NULL,
  PRIMARY KEY (`ID_REP`),
  KEY `FK_QUESTION_ID` (`ID_QUESTION`)
) ENGINE=InnoDB AUTO_INCREMENT=62;

INSERT INTO `reponse` (`ID_REP`, `TXT_REP`, `ID_QUESTION`, `ID_QUESTION_1`) VALUES
(9, '42', 18, 18),
(10, "C'est pas faux", 18, 18),
(11, 'test 1', 19, NULL),
(12, ' test 2', 19, 19),
(13, 'test 3', 19, 19),
(14, 'test 4', 19, NULL),
(15, 'blu', 20, 20),
(16, 'blue', 20, NULL),
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
(61, 'test rep 2', 32, 32);

CREATE TABLE IF NOT EXISTS `sont_enregistrees` (
  `ID_QUESTION` int(5) NOT NULL,
  `ID_REP` int(5) NOT NULL,
  `ID_CAND` int(5) NOT NULL,
  PRIMARY KEY (`ID_QUESTION`,`ID_REP`,`ID_CAND`),
  KEY `FK_QUESTION_IDR_ENRE` (`ID_REP`),
  KEY `FK_QUESTION_IDQC_ENRE` (`ID_CAND`)
) ENGINE=InnoDB;