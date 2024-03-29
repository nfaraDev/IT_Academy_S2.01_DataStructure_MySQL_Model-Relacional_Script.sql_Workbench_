-- MySQL Script generated by MySQL Workbench
-- Tue Jun 27 20:59:04 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema s2_1ex1_optica
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema s2_1ex1_optica
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `s2_1ex1_optica` DEFAULT CHARACTER SET latin1 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `s2_1ex1_optica`.`marcas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `s2_1ex1_optica`.`marcas` (
  `id_marca` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id_marca`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `s2_1ex1_optica`.`direcciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `s2_1ex1_optica`.`direcciones` (
  `id_direccion` INT(11) NOT NULL AUTO_INCREMENT,
  `calle` VARCHAR(50) NOT NULL,
  `numero` INT(10) NOT NULL,
  `piso` VARCHAR(10) NOT NULL,
  `puerta` VARCHAR(10) NOT NULL,
  `ciudad` VARCHAR(30) NOT NULL,
  `codigo_postal` INT(10) NOT NULL,
  `pais` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id_direccion`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `s2_1ex1_optica`.`proveedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `s2_1ex1_optica`.`proveedores` (
  `id_proveedor` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(25) NOT NULL,
  `telefono` INT(15) NOT NULL,
  `fax` INT(15) NOT NULL,
  `nif` VARCHAR(15) NOT NULL,
  `direcciones_id_direccion` INT(11) NOT NULL,
  PRIMARY KEY (`id_proveedor`),
  UNIQUE INDEX `nif` (`nif` ASC) VISIBLE,
  INDEX `fk_proveedores_direcciones1_idx` (`direcciones_id_direccion` ASC) VISIBLE,
  CONSTRAINT `fk_proveedores_direcciones1`
    FOREIGN KEY (`direcciones_id_direccion`)
    REFERENCES `s2_1ex1_optica`.`direcciones` (`id_direccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `s2_1ex1_optica`.`monturas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `s2_1ex1_optica`.`monturas` (
  `id_montura` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(20) NOT NULL,
  `flotante` TINYINT(1) NOT NULL,
  `pasta` TINYINT(1) NOT NULL,
  `metálica` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id_montura`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `s2_1ex1_optica`.`gafas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `s2_1ex1_optica`.`gafas` (
  `id_gafas` INT(11) NOT NULL AUTO_INCREMENT,
  `marca_id` VARCHAR(20) NOT NULL,
  `graduación_id` FLOAT NOT NULL,
  `montura_id` VARCHAR(10) NOT NULL,
  `colorMontura` VARCHAR(10) NOT NULL,
  `colorVidrio` VARCHAR(10) NOT NULL,
  `precio` FLOAT(60,5) NOT NULL,
  `marcas_id_marca` INT(11) NOT NULL,
  `proveedores_id_proveedor` INT(11) NOT NULL,
  `monturas_id_montura` INT(11) NOT NULL,
  PRIMARY KEY (`id_gafas`, `proveedores_id_proveedor`, `monturas_id_montura`),
  INDEX `fk_gafas_marcas_idx` (`marcas_id_marca` ASC) VISIBLE,
  INDEX `fk_gafas_proveedores1_idx` (`proveedores_id_proveedor` ASC) VISIBLE,
  INDEX `fk_gafas_monturas1_idx` (`monturas_id_montura` ASC) VISIBLE,
  CONSTRAINT `fk_gafas_marcas`
    FOREIGN KEY (`marcas_id_marca`)
    REFERENCES `s2_1ex1_optica`.`marcas` (`id_marca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_gafas_proveedores1`
    FOREIGN KEY (`proveedores_id_proveedor`)
    REFERENCES `s2_1ex1_optica`.`proveedores` (`id_proveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_gafas_monturas1`
    FOREIGN KEY (`monturas_id_montura`)
    REFERENCES `s2_1ex1_optica`.`monturas` (`id_montura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `s2_1ex1_optica`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `s2_1ex1_optica`.`clientes` (
  `id_cliente` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(15) NOT NULL,
  `CP` INT(5) NOT NULL,
  `telefono` INT(15) NOT NULL,
  `email` VARCHAR(30) NOT NULL,
  `diaRegistro` DATETIME NOT NULL,
  `recomendacion` VARCHAR(15) NULL,
  PRIMARY KEY (`id_cliente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `s2_1ex1_optica`.`empleados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `s2_1ex1_optica`.`empleados` (
  `id_empleado` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id_empleado`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `mydb`.`ventas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ventas` (
  `id_venta` INT NOT NULL AUTO_INCREMENT,
  `id_gafa` INT NOT NULL,
  `id_cliente` INT NOT NULL,
  `id_empleado` INT NOT NULL,
  `cantidad_ventas` INT NOT NULL,
  PRIMARY KEY (`id_venta`),
  INDEX `id_gafa_idx` (`id_gafa` ASC) VISIBLE,
  INDEX `id_cliente_idx` (`id_cliente` ASC) VISIBLE,
  INDEX `id_empleado_idx` (`id_empleado` ASC) VISIBLE,
  CONSTRAINT `id_gafa`
    FOREIGN KEY (`id_gafa`)
    REFERENCES `s2_1ex1_optica`.`gafas` (`id_gafas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_cliente`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `s2_1ex1_optica`.`clientes` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_empleado`
    FOREIGN KEY (`id_empleado`)
    REFERENCES `s2_1ex1_optica`.`empleados` (`id_empleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `s2_1ex1_optica` ;

-- -----------------------------------------------------
-- Table `s2_1ex1_optica`.`graduaciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `s2_1ex1_optica`.`graduaciones` (
  `id_graduacion` INT(11) NOT NULL AUTO_INCREMENT,
  `crital_Derecho` FLOAT NOT NULL,
  `crital_Izquierdo` FLOAT NOT NULL,
  `gafas_id_gafas` INT(11) NOT NULL,
  `gafas_proveedores_id_proveedor` INT(11) NOT NULL,
  `gafas_monturas_id_montura` INT(11) NOT NULL,
  PRIMARY KEY (`id_graduacion`, `gafas_id_gafas`, `gafas_proveedores_id_proveedor`, `gafas_monturas_id_montura`),
  INDEX `fk_graduaciones_gafas1_idx` (`gafas_id_gafas` ASC, `gafas_proveedores_id_proveedor` ASC, `gafas_monturas_id_montura` ASC) VISIBLE,
  CONSTRAINT `fk_graduaciones_gafas1`
    FOREIGN KEY (`gafas_id_gafas` , `gafas_proveedores_id_proveedor` , `gafas_monturas_id_montura`)
    REFERENCES `s2_1ex1_optica`.`gafas` (`id_gafas` , `proveedores_id_proveedor` , `monturas_id_montura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
