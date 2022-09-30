CREATE DATABASE IF NOT EXISTS `qcm_encodeur`
USE `qcm_encodeur`

CREATE TABLE IF NOT EXISTS `admin`(
    `id_admin`      INT(2) NOT NULL AUTO_INCREMENT,
    `login_admin`   VARCHAR(25) NOT NULL,
    `psw_admin`     VARCHAR(60) NOT NULL,
    PRIMARY KEY(`id_admin`)
)ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `candidat`(
    `id_cand`       INT(5) NOT NULL AUTO_INCREMENT,
    `nom_cand`      VARCHAR(50) NOT NULL,
    `prenom_cand`   VARCHAR(50) NOT NULL,
    `mail_cand`     VARCHAR(50) NOT NULL,
    `tel_cand`      INT(10) NOT NULL,
    PRIMARY KEY(`id_cand`)
)ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `resultat`(
    `id_result`     INT(5) NOT NULL AUTO_INCREMENT,
    `id_cand`       INT(5) NOT NULL,
    `date_result`   DATETIME NOT NULL,
    `tab_quest`     VARCHAR(255) NOT NULL,
    `tab_rep`       VARCHAR(255) NOT NULL,
    PRIMARY KEY(`id_result`)
)ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `question`(
    `id_question`   INT(5) NOT NULL AUTO_INCREMENT,
    `enonc_quest`   VARCHAR(255) NOT NULL,
    `enonc_quest`   VARCHAR(255) DEFAULT NULL,
    `img_quest`     VARCHAR(100),
    PRIMARY KEY(`id_question`)
)ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `reponse`(
    `id_reponse`   INT(5) NOT NULL,
    `txt_reponse`   VARCHAR(255) NOT NULL,
    PRIMARY KEY(`id_reponse`)
)ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `rep_quest`(
    `id_question`   INT(5) NOT NULL,
    `rep_possible`  VARCHAR(255),
    `reponse`       VARCHAR(255)
)ENGINE = InnoDB;

ALTER TABLE `resultat`
    ADD CONSTRAINT `fk-a-pour-result` FOREIGN KEY (`id_cand`) REFERENCES `candidat` (`id_cand`) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE `rep_quest`
    ADD CONSTRAINT `fk-a-reponses` FOREIGN KEY (`id_question`) REFERENCES `question` (`id_question`) ON UPDATE RESTRICT ON DELETE RESTRICT;


---------------------------------------------------------------

-- create table if not exists sont_enregistrees
-- (
--    id_question    int not null auto_increment,
--    id_result int not null,
--    primary key (id_question, id_result)
-- )
-- Engine = InnoDB;
-- create table if not exists a_pour_reponse
-- (
--    id_question    int not null auto_increment,
--    id_rep int not null,
--    primary key (id_question, id_rep)
-- )
-- Engine = InnoDB;
-- create table if not exists a_bonne_reponse
-- (
--    id_question    int not null auto_increment,
--    id_rep int not null,
--    primary key (id_question, id_rep)
-- )
-- Engine = InnoDB;

-- alter table sont_enregistrees add constraint FK_SONT_ENREGISTREES_Q foreign key (id_question)
--       references question (id_question) on delete restrict on update restrict;
-- alter table sont_enregistrees add constraint FK_SONT_ENREGISTREES_R foreign key (id_result)
--       references resultat (id_result) on delete restrict on update restrict;

-- alter table a_pour_reponse add constraint FK_POUR_REPONSE_Q foreign key (id_question)
--       references question (id_question) on delete restrict on update restrict;
-- alter table a_pour_reponse add constraint FK_POUR_REPONSE_R foreign key (id_rep)
--       references reponse (id_rep) on delete restrict on update restrict;

-- alter table a_bonne_reponse add constraint FK_POUR_REPONSE_Q foreign key (id_question)
--       references question (id_question) on delete restrict on update restrict;
-- alter table a_bonne_reponse add constraint FK_POUR_B_REPONSE_R foreign key (id_rep)
--       references reponse (id_rep) on delete restrict on update restrict;