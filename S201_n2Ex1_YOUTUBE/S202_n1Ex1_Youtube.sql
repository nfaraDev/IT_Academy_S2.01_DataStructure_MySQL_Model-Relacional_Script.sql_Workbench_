-- MySQL Script generated by MySQL Workbench
-- Thu Jun 15 17:16:18 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema S202_n1Ex1_YOUTUBE
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema S202_n1Ex1_YOUTUBE
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `S202_n1Ex1_YOUTUBE` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema new_schema1
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema s202_n2ex1_youtube
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema s202_n2ex1_youtube
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `s202_n2ex1_youtube` DEFAULT CHARACTER SET latin1 ;
USE `S202_n1Ex1_YOUTUBE` ;

-- -----------------------------------------------------
-- Table `S202_n1Ex1_YOUTUBE`.`videos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `S202_n1Ex1_YOUTUBE`.`videos` (
  `idvideos` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(300) NOT NULL,
  `tamaño` INT NOT NULL,
  `numero_reproducciones` INT NOT NULL,
  `numero_likes` INT NOT NULL,
  `numero_dislikes` INT NOT NULL,
  `thumbnail` VARCHAR(45) NOT NULL,
  `videoscol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idvideos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `S202_n1Ex1_YOUTUBE`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `S202_n1Ex1_YOUTUBE`.`usuarios` (
  `idusuarios` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `dia_nacimiento` DATE NOT NULL,
  `sexo` VARCHAR(45) NOT NULL,
  `pais` VARCHAR(45) NOT NULL,
  `cp` INT NULL,
  PRIMARY KEY (`idusuarios`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `S202_n1Ex1_YOUTUBE`.`usuario_publica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `S202_n1Ex1_YOUTUBE`.`usuario_publica` (
  `idusuario_publica` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `fecha_hora` DATETIME NOT NULL,
  PRIMARY KEY (`idusuario_publica`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `S202_n1Ex1_YOUTUBE`.`canal_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `S202_n1Ex1_YOUTUBE`.`canal_usuario` (
  `idcanal_usuario` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `decripcion` VARCHAR(300) NOT NULL,
  `dia_creacion` DATETIME NOT NULL,
  PRIMARY KEY (`idcanal_usuario`),
  UNIQUE INDEX `dia_creacion_UNIQUE` (`dia_creacion` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `S202_n1Ex1_YOUTUBE`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `S202_n1Ex1_YOUTUBE`.`usuario` (
  `idusuarios` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `nombre_usuario` VARCHAR(45) NOT NULL,
  `dia_nacimiento` DATE NOT NULL,
  `sexo` VARCHAR(45) NOT NULL,
  `pais` VARCHAR(45) NOT NULL,
  `cp` INT NOT NULL,
  `usuario_publica_idusuario_publica` INT NOT NULL,
  `canal_usuario_idcanal_usuario` INT NOT NULL,
  PRIMARY KEY (`idusuarios`),
  INDEX `fk_usuario_usuario_publica1_idx` (`usuario_publica_idusuario_publica` ASC) VISIBLE,
  INDEX `fk_usuario_canal_usuario1_idx` (`canal_usuario_idcanal_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_usuario_publica1`
    FOREIGN KEY (`usuario_publica_idusuario_publica`)
    REFERENCES `S202_n1Ex1_YOUTUBE`.`usuario_publica` (`idusuario_publica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_canal_usuario1`
    FOREIGN KEY (`canal_usuario_idcanal_usuario`)
    REFERENCES `S202_n1Ex1_YOUTUBE`.`canal_usuario` (`idcanal_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `S202_n1Ex1_YOUTUBE`.`video`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `S202_n1Ex1_YOUTUBE`.`video` (
  `idvideo` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(300) NOT NULL,
  `medida` INT NOT NULL,
  `nombre_archivoVideo` VARCHAR(45) NOT NULL,
  `duracion` INT NOT NULL,
  `thumbnail` VARCHAR(45) NOT NULL,
  `numero_reproducciones` INT NOT NULL,
  `numero_likes` INT NOT NULL,
  `numero_deslikes` INT NOT NULL,
  `usuario_idusuarios` INT NOT NULL,
  PRIMARY KEY (`idvideo`),
  INDEX `fk_video_usuario_idx` (`usuario_idusuarios` ASC) VISIBLE,
  CONSTRAINT `fk_video_usuario`
    FOREIGN KEY (`usuario_idusuarios`)
    REFERENCES `S202_n1Ex1_YOUTUBE`.`usuario` (`idusuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `S202_n1Ex1_YOUTUBE`.`estado_video`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `S202_n1Ex1_YOUTUBE`.`estado_video` (
  `idestado_video` INT NOT NULL AUTO_INCREMENT,
  `publico` VARCHAR(45) NOT NULL,
  `privado` VARCHAR(45) NOT NULL,
  `oculto` VARCHAR(45) NOT NULL,
  `video_idvideo` INT NOT NULL,
  PRIMARY KEY (`idestado_video`),
  INDEX `fk_estado_video_video1_idx` (`video_idvideo` ASC) VISIBLE,
  CONSTRAINT `fk_estado_video_video1`
    FOREIGN KEY (`video_idvideo`)
    REFERENCES `S202_n1Ex1_YOUTUBE`.`video` (`idvideo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `S202_n1Ex1_YOUTUBE`.`etiqueta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `S202_n1Ex1_YOUTUBE`.`etiqueta` (
  `idetiqueta` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idetiqueta`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `S202_n1Ex1_YOUTUBE`.`etiqueta_video`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `S202_n1Ex1_YOUTUBE`.`etiqueta_video` (
  `idetiqueta_video` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `video_idvideo` INT NOT NULL,
  `etiqueta_idetiqueta` INT NOT NULL,
  PRIMARY KEY (`idetiqueta_video`),
  INDEX `fk_etiqueta_video_video1_idx` (`video_idvideo` ASC) VISIBLE,
  INDEX `fk_etiqueta_video_etiqueta1_idx` (`etiqueta_idetiqueta` ASC) VISIBLE,
  CONSTRAINT `fk_etiqueta_video_video1`
    FOREIGN KEY (`video_idvideo`)
    REFERENCES `S202_n1Ex1_YOUTUBE`.`video` (`idvideo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_etiqueta_video_etiqueta1`
    FOREIGN KEY (`etiqueta_idetiqueta`)
    REFERENCES `S202_n1Ex1_YOUTUBE`.`etiqueta` (`idetiqueta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `S202_n1Ex1_YOUTUBE`.`playlists_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `S202_n1Ex1_YOUTUBE`.`playlists_usuario` (
  `idplaylists_usuario` INT GENERATED ALWAYS AS () VIRTUAL,
  `nombre` VARCHAR(45) NOT NULL,
  `dia_Creacion` DATE NOT NULL,
  `usuario_idusuarios` INT NOT NULL,
  `estado_playlist` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idplaylists_usuario`),
  INDEX `fk_playlists_usuario_usuario1_idx` (`usuario_idusuarios` ASC) VISIBLE,
  CONSTRAINT `fk_playlists_usuario_usuario1`
    FOREIGN KEY (`usuario_idusuarios`)
    REFERENCES `S202_n1Ex1_YOUTUBE`.`usuario` (`idusuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `S202_n1Ex1_YOUTUBE`.`marcar_comentario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `S202_n1Ex1_YOUTUBE`.`marcar_comentario` (
  `idmarcar_comentario` INT NOT NULL AUTO_INCREMENT,
  `agrada` TINYINT(1) NOT NULL,
  `no_agrada` TINYINT(1) NOT NULL,
  `usuario_idusuarios` INT NOT NULL,
  `video_idvideo` INT NOT NULL,
  PRIMARY KEY (`idmarcar_comentario`),
  UNIQUE INDEX `agrada_UNIQUE` (`agrada` ASC) VISIBLE,
  UNIQUE INDEX `no_agrada_UNIQUE` (`no_agrada` ASC) VISIBLE,
  INDEX `fk_marcar_comentario_usuario1_idx` (`usuario_idusuarios` ASC) VISIBLE,
  INDEX `fk_marcar_comentario_video1_idx` (`video_idvideo` ASC) VISIBLE,
  CONSTRAINT `fk_marcar_comentario_usuario1`
    FOREIGN KEY (`usuario_idusuarios`)
    REFERENCES `S202_n1Ex1_YOUTUBE`.`usuario` (`idusuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_marcar_comentario_video1`
    FOREIGN KEY (`video_idvideo`)
    REFERENCES `S202_n1Ex1_YOUTUBE`.`video` (`idvideo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `S202_n1Ex1_YOUTUBE`.`comentarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `S202_n1Ex1_YOUTUBE`.`comentarios` (
  `idcomentarios_video` INT NOT NULL AUTO_INCREMENT,
  `texto` VARCHAR(500) NOT NULL,
  `dia_hora` DATETIME NOT NULL,
  `video_idvideo` INT NOT NULL,
  `usuario_idusuarios` INT NOT NULL,
  `marcar_comentario_idmarcar_comentario` INT NOT NULL,
  PRIMARY KEY (`idcomentarios_video`),
  INDEX `fk_comentarios_video1_idx` (`video_idvideo` ASC) VISIBLE,
  INDEX `fk_comentarios_usuario1_idx` (`usuario_idusuarios` ASC) VISIBLE,
  INDEX `fk_comentarios_marcar_comentario1_idx` (`marcar_comentario_idmarcar_comentario` ASC) VISIBLE,
  CONSTRAINT `fk_comentarios_video1`
    FOREIGN KEY (`video_idvideo`)
    REFERENCES `S202_n1Ex1_YOUTUBE`.`video` (`idvideo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comentarios_usuario1`
    FOREIGN KEY (`usuario_idusuarios`)
    REFERENCES `S202_n1Ex1_YOUTUBE`.`usuario` (`idusuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comentarios_marcar_comentario1`
    FOREIGN KEY (`marcar_comentario_idmarcar_comentario`)
    REFERENCES `S202_n1Ex1_YOUTUBE`.`marcar_comentario` (`idmarcar_comentario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `S202_n1Ex1_YOUTUBE`.`like_deslike_video`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `S202_n1Ex1_YOUTUBE`.`like_deslike_video` (
  `idlike_deslike_cometario` INT NOT NULL AUTO_INCREMENT,
  `nombre_usuario` VARCHAR(45) NOT NULL,
  `like` TINYINT(1) NOT NULL,
  `deslike` TINYINT(1) NOT NULL,
  `like_deslike_cometariocol` VARCHAR(45) NULL,
  `dia_hora` DATETIME NOT NULL,
  `usuario_idusuarios` INT NOT NULL,
  `video_idvideo` INT NOT NULL,
  PRIMARY KEY (`idlike_deslike_cometario`),
  INDEX `fk_like_deslike_video_usuario1_idx` (`usuario_idusuarios` ASC) VISIBLE,
  INDEX `fk_like_deslike_video_video1_idx` (`video_idvideo` ASC) VISIBLE,
  CONSTRAINT `fk_like_deslike_video_usuario1`
    FOREIGN KEY (`usuario_idusuarios`)
    REFERENCES `S202_n1Ex1_YOUTUBE`.`usuario` (`idusuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_like_deslike_video_video1`
    FOREIGN KEY (`video_idvideo`)
    REFERENCES `S202_n1Ex1_YOUTUBE`.`video` (`idvideo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `S202_n1Ex1_YOUTUBE`.`subscripcion_canales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `S202_n1Ex1_YOUTUBE`.`subscripcion_canales` (
  `idsubscripcion_canales` INT NOT NULL AUTO_INCREMENT,
  `usuario_idusuarios` INT NOT NULL,
  `canal_usuario_idcanal_usuario` INT NOT NULL,
  `canal_usuario_idcanal_usuario1` INT NOT NULL,
  PRIMARY KEY (`idsubscripcion_canales`),
  INDEX `fk_subscripcion_canales_usuario1_idx` (`usuario_idusuarios` ASC) VISIBLE,
  INDEX `fk_subscripcion_canales_canal_usuario1_idx` (`canal_usuario_idcanal_usuario` ASC) VISIBLE,
  INDEX `fk_subscripcion_canales_canal_usuario2_idx` (`canal_usuario_idcanal_usuario1` ASC) VISIBLE,
  CONSTRAINT `fk_subscripcion_canales_usuario1`
    FOREIGN KEY (`usuario_idusuarios`)
    REFERENCES `S202_n1Ex1_YOUTUBE`.`usuario` (`idusuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_subscripcion_canales_canal_usuario1`
    FOREIGN KEY (`canal_usuario_idcanal_usuario`)
    REFERENCES `S202_n1Ex1_YOUTUBE`.`canal_usuario` (`idcanal_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_subscripcion_canales_canal_usuario2`
    FOREIGN KEY (`canal_usuario_idcanal_usuario1`)
    REFERENCES `S202_n1Ex1_YOUTUBE`.`canal_usuario` (`idcanal_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `S202_n1Ex1_YOUTUBE`.`playlist_estado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `S202_n1Ex1_YOUTUBE`.`playlist_estado` (
  `idplaylist_estado` INT NOT NULL AUTO_INCREMENT,
  `publica` TINYINT(1) NOT NULL,
  `privada` TINYINT(1) NOT NULL,
  `playlists_usuario_idplaylists_usuario` INT NOT NULL,
  PRIMARY KEY (`idplaylist_estado`),
  INDEX `fk_playlist_estado_playlists_usuario1_idx` (`playlists_usuario_idplaylists_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_playlist_estado_playlists_usuario1`
    FOREIGN KEY (`playlists_usuario_idplaylists_usuario`)
    REFERENCES `S202_n1Ex1_YOUTUBE`.`playlists_usuario` (`idplaylists_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `S202_n1Ex1_YOUTUBE`.`video_playlist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `S202_n1Ex1_YOUTUBE`.`video_playlist` (
  `idvideo_playlist` INT NOT NULL AUTO_INCREMENT,
  `video_idvideo` INT NOT NULL,
  `playlists_usuario_idplaylists_usuario` INT NOT NULL,
  PRIMARY KEY (`idvideo_playlist`),
  INDEX `fk_video_playlist_video1_idx` (`video_idvideo` ASC) VISIBLE,
  INDEX `fk_video_playlist_playlists_usuario1_idx` (`playlists_usuario_idplaylists_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_video_playlist_video1`
    FOREIGN KEY (`video_idvideo`)
    REFERENCES `S202_n1Ex1_YOUTUBE`.`video` (`idvideo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_video_playlist_playlists_usuario1`
    FOREIGN KEY (`playlists_usuario_idplaylists_usuario`)
    REFERENCES `S202_n1Ex1_YOUTUBE`.`playlists_usuario` (`idplaylists_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `s202_n2ex1_youtube` ;

-- -----------------------------------------------------
-- Table `s202_n2ex1_youtube`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `s202_n2ex1_youtube`.`usuario` (
  `idusuario` INT(11) NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `diaNacimiento` DATE NOT NULL,
  `sexo` VARCHAR(45) NOT NULL,
  `pais` VARCHAR(45) NOT NULL,
  `cp` INT(11) NOT NULL,
  PRIMARY KEY (`idusuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `s202_n2ex1_youtube`.`videos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `s202_n2ex1_youtube`.`videos` (
  `idvideos` INT(11) NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(300) NOT NULL,
  `tamaño` INT(11) NOT NULL,
  `nombre_archivo` VARCHAR(45) NOT NULL,
  `thumbnail` VARCHAR(45) NOT NULL,
  `num_Reproducciones` INT(11) NOT NULL,
  `num_likes` INT(11) NOT NULL,
  `num_deslikes` INT(11) NOT NULL,
  PRIMARY KEY (`idvideos`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
