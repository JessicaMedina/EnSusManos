-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema EnSusManos
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema EnSusManos
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `EnSusManos` DEFAULT CHARACTER SET utf8 ;
USE `EnSusManos` ;

-- -----------------------------------------------------
-- Table `EnSusManos`.`Usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EnSusManos`.`Usuarios` (
  `idUsuarios` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `barrio` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idUsuarios`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EnSusManos`.`Puntaje`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EnSusManos`.`Puntaje` (
  `idPuntaje` INT NOT NULL,
  `situacion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPuntaje`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EnSusManos`.`Reportes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EnSusManos`.`Reportes` (
  `idReportes` INT NOT NULL,
  `nombreReporte` VARCHAR(45) NOT NULL,
  `hora` DATE NOT NULL,
  `fecha` DATE NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `Usuarios_idUsuarios` INT NOT NULL,
  `Puntaje_idPuntaje` INT NOT NULL,
  PRIMARY KEY (`idReportes`),
  INDEX `fk_Reportes_Usuarios_idx` (`Usuarios_idUsuarios` ASC),
  INDEX `fk_Reportes_Puntaje1_idx` (`Puntaje_idPuntaje` ASC) ,
  CONSTRAINT `fk_Reportes_Usuarios`
    FOREIGN KEY (`Usuarios_idUsuarios`)
    REFERENCES `EnSusManos`.`Usuarios` (`idUsuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reportes_Puntaje1`
    FOREIGN KEY (`Puntaje_idPuntaje`)
    REFERENCES `EnSusManos`.`Puntaje` (`idPuntaje`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EnSusManos`.`Registrar_Evento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EnSusManos`.`Registrar_Evento` (
  `idRegistro_Evento` INT NOT NULL,
  `Usuarios_idUsuarios` INT NOT NULL,
  `fecha` DATE NOT NULL,
  `hora` DATETIME NOT NULL,
  `barrio` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `situacion` TEXT(150) NULL,
  PRIMARY KEY (`idRegistro_Evento`),
  INDEX `fk_Registrar_Reporte_Usuarios1_idx` (`Usuarios_idUsuarios` ASC) ,
  CONSTRAINT `fk_Registrar_Reporte_Usuarios1`
    FOREIGN KEY (`Usuarios_idUsuarios`)
    REFERENCES `EnSusManos`.`Usuarios` (`idUsuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
