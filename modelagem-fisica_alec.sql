-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema SGE
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `SGE` ;

-- -----------------------------------------------------
-- Schema SGE
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `SGE` ;
USE `SGE` ;

-- -----------------------------------------------------
-- Table `SGE`.`Professor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SGE`.`Professor` ;

CREATE TABLE IF NOT EXISTS `SGE`.`Professor` (
  `idProfessor` INT NOT NULL,
  `E-mail` VARCHAR(45) NULL,
  `Flores` VARCHAR(45) NULL,
  `Especialização_TI` VARCHAR(45) NULL,
  `Endereço` VARCHAR(45) NULL,
  PRIMARY KEY (`idProfessor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SGE`.`Leciona`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SGE`.`Leciona` ;

CREATE TABLE IF NOT EXISTS `SGE`.`Leciona` (
  `idLeciona` INT NOT NULL,
  `id_Turma: Fk` VARCHAR(45) NULL,
  `Professor_idProfessor` INT NOT NULL,
  PRIMARY KEY (`idLeciona`, `Professor_idProfessor`),
  INDEX `fk_Leciona_Professor1_idx` (`Professor_idProfessor` ASC) VISIBLE,
  CONSTRAINT `fk_Leciona_Professor1`
    FOREIGN KEY (`Professor_idProfessor`)
    REFERENCES `SGE`.`Professor` (`idProfessor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SGE`.`Ministra`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SGE`.`Ministra` ;

CREATE TABLE IF NOT EXISTS `SGE`.`Ministra` (
  `id_Disciplina:Pk:Fk` INT NOT NULL,
  `ID_Professor: Pk:Fk` VARCHAR(45) NULL,
  `Professor_idProfessor` INT NOT NULL,
  PRIMARY KEY (`id_Disciplina:Pk:Fk`, `Professor_idProfessor`),
  INDEX `fk_Ministra_Professor1_idx` (`Professor_idProfessor` ASC) VISIBLE,
  CONSTRAINT `fk_Ministra_Professor1`
    FOREIGN KEY (`Professor_idProfessor`)
    REFERENCES `SGE`.`Professor` (`idProfessor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SGE`.`Disciplina`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SGE`.`Disciplina` ;

CREATE TABLE IF NOT EXISTS `SGE`.`Disciplina` (
  `ID_Disciplina:Pk:Fk]` INT NOT NULL,
  `Nome` VARCHAR(45) NULL,
  `cod_Disciplina` VARCHAR(45) NULL,
  `Carga_Horária` VARCHAR(45) NULL,
  `Ministra_id_Disciplina:Pk:Fk` INT NOT NULL,
  PRIMARY KEY (`ID_Disciplina:Pk:Fk]`, `Ministra_id_Disciplina:Pk:Fk`),
  INDEX `fk_Disciplina_Ministra1_idx` (`Ministra_id_Disciplina:Pk:Fk` ASC) VISIBLE,
  CONSTRAINT `fk_Disciplina_Ministra1`
    FOREIGN KEY (`Ministra_id_Disciplina:Pk:Fk`)
    REFERENCES `SGE`.`Ministra` (`id_Disciplina:Pk:Fk`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SGE`.`Associada`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SGE`.`Associada` ;

CREATE TABLE IF NOT EXISTS `SGE`.`Associada` (
  `ID_Disciplina:Pk:Fk` INT NOT NULL,
  `ID_Turma:Pk:Fk` VARCHAR(45) NULL,
  `Disciplina_ID_Disciplina:Pk:Fk]` INT NOT NULL,
  PRIMARY KEY (`ID_Disciplina:Pk:Fk`, `Disciplina_ID_Disciplina:Pk:Fk]`),
  INDEX `fk_Associada_Disciplina1_idx` (`Disciplina_ID_Disciplina:Pk:Fk]` ASC) VISIBLE,
  CONSTRAINT `fk_Associada_Disciplina1`
    FOREIGN KEY (`Disciplina_ID_Disciplina:Pk:Fk]`)
    REFERENCES `SGE`.`Disciplina` (`ID_Disciplina:Pk:Fk]`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SGE`.`turma`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SGE`.`turma` ;

CREATE TABLE IF NOT EXISTS `SGE`.`turma` (
  `idturma` INT NOT NULL,
  `2°Ano médil` VARCHAR(45) NULL,
  `turma 2°A` VARCHAR(45) NULL,
  `Leciona_idLeciona` INT NOT NULL,
  `Associada_ID_Disciplina:Pk:Fk` INT NOT NULL,
  PRIMARY KEY (`idturma`, `Leciona_idLeciona`, `Associada_ID_Disciplina:Pk:Fk`),
  INDEX `fk_turma_Leciona1_idx` (`Leciona_idLeciona` ASC) VISIBLE,
  INDEX `fk_turma_Associada1_idx` (`Associada_ID_Disciplina:Pk:Fk` ASC) VISIBLE,
  CONSTRAINT `fk_turma_Leciona1`
    FOREIGN KEY (`Leciona_idLeciona`)
    REFERENCES `SGE`.`Leciona` (`idLeciona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_turma_Associada1`
    FOREIGN KEY (`Associada_ID_Disciplina:Pk:Fk`)
    REFERENCES `SGE`.`Associada` (`ID_Disciplina:Pk:Fk`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SGE`.`Aluno`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SGE`.`Aluno` ;

CREATE TABLE IF NOT EXISTS `SGE`.`Aluno` (
  `idAluno` INT NOT NULL,
  `Alec hudson` VARCHAR(45) NULL,
  `ENDEREÇO` VARCHAR(45) NULL,
  `DT_Nascimento` VARCHAR(45) NULL,
  `turma_idturma` INT NOT NULL,
  PRIMARY KEY (`idAluno`, `turma_idturma`),
  INDEX `fk_Aluno_turma1_idx` (`turma_idturma` ASC) VISIBLE,
  CONSTRAINT `fk_Aluno_turma1`
    FOREIGN KEY (`turma_idturma`)
    REFERENCES `SGE`.`turma` (`idturma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
