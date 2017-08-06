-- MySQL Script generated by MySQL Workbench
-- Sat Aug  5 19:38:19 2017
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Finca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Finca` (
  `NIT` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `propietario` VARCHAR(45) NOT NULL,
  `pais` VARCHAR(45) NOT NULL,
  `Departamento` VARCHAR(45) NOT NULL,
  `Municipio` VARCHAR(45) NOT NULL,
  `Verda` VARCHAR(45) NULL,
  `Direccion` VARCHAR(45) NOT NULL,
  `Telefono` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`NIT`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Empleado` (
  `Identificacion` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellido` VARCHAR(45) NOT NULL,
  `Cargo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Identificacion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Contratacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Contratacion` (
  `Finca_NIT` INT NOT NULL,
  `Empleado_Identificacion` INT NOT NULL,
  PRIMARY KEY (`Finca_NIT`, `Empleado_Identificacion`),
  INDEX `fk_Finca_has_Empleado_Empleado1_idx` (`Empleado_Identificacion` ASC),
  INDEX `fk_Finca_has_Empleado_Finca_idx` (`Finca_NIT` ASC),
  CONSTRAINT `fk_Finca_has_Empleado_Finca`
    FOREIGN KEY (`Finca_NIT`)
    REFERENCES `mydb`.`Finca` (`NIT`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Finca_has_Empleado_Empleado1`
    FOREIGN KEY (`Empleado_Identificacion`)
    REFERENCES `mydb`.`Empleado` (`Identificacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Credenciales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Credenciales` (
  `contraseña` VARCHAR(45) NOT NULL,
  `Empleado_Identificacion` INT NOT NULL,
  INDEX `fk_Credenciales_Empleado1_idx` (`Empleado_Identificacion` ASC),
  CONSTRAINT `fk_Credenciales_Empleado1`
    FOREIGN KEY (`Empleado_Identificacion`)
    REFERENCES `mydb`.`Empleado` (`Identificacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tareas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tareas` (
  `idTareas` INT NOT NULL,
  `fecha_creacion` DATE NOT NULL,
  `fecha_asignacion` DATE NOT NULL,
  `estado` VARCHAR(45) NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  `Empleado_Identificacion` INT NOT NULL,
  PRIMARY KEY (`idTareas`),
  INDEX `fk_Tareas_Empleado1_idx` (`Empleado_Identificacion` ASC),
  CONSTRAINT `fk_Tareas_Empleado1`
    FOREIGN KEY (`Empleado_Identificacion`)
    REFERENCES `mydb`.`Empleado` (`Identificacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Parentezco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Parentezco` (
  `IdPadre` INT NOT NULL,
  `IdMadre` INT NOT NULL,
  PRIMARY KEY (`IdPadre`, `IdMadre`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Res`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Res` (
  `idRes` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Ubicacion` VARCHAR(45) NOT NULL,
  `sexo` VARCHAR(45) NOT NULL,
  `Finca_NIT` INT NOT NULL,
  `Parentezco_IdPadre` INT NOT NULL,
  `Parentezco_IdMadre` INT NOT NULL,
  `Fecha_nacimiento` DATE NOT NULL,
  `Edad` INT NOT NULL,
  `Condicion_Corporal` VARCHAR(45) NOT NULL,
  `Color` VARCHAR(45) NOT NULL,
  `raza` VARCHAR(45) NOT NULL,
  `Estado_reproductivo` VARCHAR(45) NOT NULL,
  `alzada` VARCHAR(45) NULL,
  `CircuferenciaE` VARCHAR(45) NULL,
  `TesticuloD` VARCHAR(45) NULL,
  `TesticuloIz` VARCHAR(45) NULL,
  `Leche` VARCHAR(45) NULL,
  `Produccion_Lactea` VARCHAR(45) NULL,
  `Enfermedad` VARCHAR(45) NULL,
  PRIMARY KEY (`idRes`, `Finca_NIT`, `Parentezco_IdPadre`, `Parentezco_IdMadre`),
  INDEX `fk_Res_Finca1_idx` (`Finca_NIT` ASC),
  INDEX `fk_Res_Parentezco1_idx` (`Parentezco_IdPadre` ASC, `Parentezco_IdMadre` ASC),
  CONSTRAINT `fk_Res_Finca1`
    FOREIGN KEY (`Finca_NIT`)
    REFERENCES `mydb`.`Finca` (`NIT`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Res_Parentezco1`
    FOREIGN KEY (`Parentezco_IdPadre` , `Parentezco_IdMadre`)
    REFERENCES `mydb`.`Parentezco` (`IdPadre` , `IdMadre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Inventario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Inventario` (
  `id_inventario` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `Categoria` VARCHAR(45) NOT NULL,
  `Finca_NIT` INT NOT NULL,
  PRIMARY KEY (`id_inventario`),
  INDEX `fk_Inventario_Finca1_idx` (`Finca_NIT` ASC),
  CONSTRAINT `fk_Inventario_Finca1`
    FOREIGN KEY (`Finca_NIT`)
    REFERENCES `mydb`.`Finca` (`NIT`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Elemento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Elemento` (
  `Codigo` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `observacion` VARCHAR(45) NOT NULL,
  `Estado` VARCHAR(45) NOT NULL,
  `Presentacion` VARCHAR(45) NULL,
  `Medio_uso` VARCHAR(45) BINARY NULL,
  `Cantidad` INT NULL,
  `Uso` VARCHAR(45) BINARY NULL,
  PRIMARY KEY (`Codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ReporteInventario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ReporteInventario` (
  `codigo` INT NOT NULL,
  `fecha` DATE NOT NULL,
  `Quien_realiza` INT NOT NULL,
  `Quien_recibe` INT NOT NULL,
  `Quien_entrega` INT NOT NULL,
  `Inventario_id_inventario` INT NOT NULL,
  `Elemento_Codigo` INT NOT NULL,
  PRIMARY KEY (`codigo`),
  INDEX `fk_ReporteInventario_Inventario1_idx` (`Inventario_id_inventario` ASC),
  INDEX `fk_ReporteInventario_Elemento1_idx` (`Elemento_Codigo` ASC),
  CONSTRAINT `fk_ReporteInventario_Inventario1`
    FOREIGN KEY (`Inventario_id_inventario`)
    REFERENCES `mydb`.`Inventario` (`id_inventario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ReporteInventario_Elemento1`
    FOREIGN KEY (`Elemento_Codigo`)
    REFERENCES `mydb`.`Elemento` (`Codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tarea_sobre_Res`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tarea_sobre_Res` (
  `Res_idRes` INT NOT NULL,
  `Tareas_idTareas` INT NOT NULL,
  `Servicio` VARCHAR(45) NULL,
  `Evento` VARCHAR(45) NULL,
  `Alzada_Res` VARCHAR(45) NULL,
  `CircunferenciaE_Res` VARCHAR(45) NULL,
  `TesticuloD_Res` VARCHAR(45) NULL,
  `TesticuloIz_Res` VARCHAR(45) NULL,
  `Observacion` VARCHAR(45) NULL,
  `MuestraLeche` VARCHAR(45) NULL,
  `Leche_Res` VARCHAR(45) NULL,
  `Id_Cria` VARCHAR(45) NULL,
  `ProduccionLac_Res` VARCHAR(45) NULL,
  PRIMARY KEY (`Res_idRes`, `Tareas_idTareas`),
  INDEX `fk_Res_has_Tareas_Tareas1_idx` (`Tareas_idTareas` ASC),
  INDEX `fk_Res_has_Tareas_Res1_idx` (`Res_idRes` ASC),
  CONSTRAINT `fk_Res_has_Tareas_Res1`
    FOREIGN KEY (`Res_idRes`)
    REFERENCES `mydb`.`Res` (`idRes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Res_has_Tareas_Tareas1`
    FOREIGN KEY (`Tareas_idTareas`)
    REFERENCES `mydb`.`Tareas` (`idTareas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Hierro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Hierro` (
  `idHierro` INT NOT NULL,
  `Nombre_Ganaderia` VARCHAR(45) NOT NULL,
  `Imagen` VARCHAR(45) NULL,
  PRIMARY KEY (`idHierro`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Marcacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Marcacion` (
  `Res_idRes` INT NOT NULL,
  `Hierro_idHierro` INT NOT NULL,
  `Id_Marcacion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Res_idRes`, `Hierro_idHierro`, `Id_Marcacion`),
  INDEX `fk_Res_has_Hierro_Hierro1_idx` (`Hierro_idHierro` ASC),
  INDEX `fk_Res_has_Hierro_Res1_idx` (`Res_idRes` ASC),
  CONSTRAINT `fk_Res_has_Hierro_Res1`
    FOREIGN KEY (`Res_idRes`)
    REFERENCES `mydb`.`Res` (`idRes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Res_has_Hierro_Hierro1`
    FOREIGN KEY (`Hierro_idHierro`)
    REFERENCES `mydb`.`Hierro` (`idHierro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
