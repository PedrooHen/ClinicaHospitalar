-- MySQL Script generated by MySQL Workbench
-- Mon Jun 10 21:21:10 2019
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
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`funcionario` (
  `nome` VARCHAR(45) NOT NULL,
  `sobrenome` VARCHAR(45) NOT NULL,
  `sexo` VARCHAR(45) NOT NULL,
  `dataNascimento` VARCHAR(45) NOT NULL,
  `idade` INT(11) NOT NULL,
  `CPF` VARCHAR(45) NOT NULL,
  `numCrachaF` INT(11) NOT NULL AUTO_INCREMENT,
  `endereco` VARCHAR(45) NOT NULL,
  `nacionalidade` VARCHAR(45) NOT NULL,
  `estadoCivil` VARCHAR(45) NOT NULL,
  `numEndereco` VARCHAR(45) NOT NULL,
  `bairroEndereco` VARCHAR(45) NOT NULL,
  `CEP` VARCHAR(45) NOT NULL,
  `salario` FLOAT NOT NULL,
  `tipoF` ENUM('r', 'a', 'f') NOT NULL,
  PRIMARY KEY (`numCrachaF`),
  UNIQUE INDEX `CPF_UNIQUE` (`CPF` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`administrador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`administrador` (
  `numCrachaF` INT(11) NOT NULL,
  `senha` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`numCrachaF`),
  INDEX `Funcionario_Admin_FK` (`numCrachaF` ASC) VISIBLE,
  CONSTRAINT `Funcionario_Admin_FK`
    FOREIGN KEY (`numCrachaF`)
    REFERENCES `mydb`.`funcionario` (`numCrachaF`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`convenio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`convenio` (
  `idConvenio` INT(11) NOT NULL AUTO_INCREMENT,
  `nomeConvenio` VARCHAR(45) NOT NULL,
  `empresaConvenio` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idConvenio`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`estoque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`estoque` (
  `nome` VARCHAR(45) NOT NULL,
  `descricao` LONGTEXT NOT NULL,
  `quantidade` INT(11) NOT NULL,
  `valorUnidade` FLOAT NOT NULL,
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`financeiro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`financeiro` (
  `numCrachaF` INT(11) NOT NULL,
  `senha` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`numCrachaF`),
  INDEX `Funcionario_Financeiro_FK` (`numCrachaF` ASC) VISIBLE,
  CONSTRAINT `Funcionario_Financeiro_FK`
    FOREIGN KEY (`numCrachaF`)
    REFERENCES `mydb`.`funcionario` (`numCrachaF`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`medico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`medico` (
  `nome` VARCHAR(45) NOT NULL,
  `sobrenome` VARCHAR(45) NOT NULL,
  `sexo` VARCHAR(45) NOT NULL,
  `dataNascimento` VARCHAR(45) NOT NULL,
  `idade` INT(11) NOT NULL,
  `CPF` VARCHAR(45) NOT NULL,
  `numCracha` INT(11) NOT NULL AUTO_INCREMENT,
  `endereco` VARCHAR(45) NOT NULL,
  `nacionalidade` VARCHAR(45) NOT NULL,
  `estadoCivil` VARCHAR(45) NOT NULL,
  `numEndereco` VARCHAR(45) NOT NULL,
  `bairroEndereco` VARCHAR(45) NOT NULL,
  `CEP` VARCHAR(45) NOT NULL,
  `salario` FLOAT NOT NULL,
  `especialidade` LONGTEXT NOT NULL,
  `senha` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`numCracha`),
  UNIQUE INDEX `CPF_UNIQUE` (`CPF` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 12
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`paciente` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `sobrenome` VARCHAR(45) NOT NULL,
  `sexo` VARCHAR(45) NOT NULL,
  `dataNascimento` VARCHAR(45) NOT NULL,
  `idade` INT(11) NOT NULL,
  `CPF` VARCHAR(45) NOT NULL,
  `endereco` VARCHAR(45) NOT NULL,
  `nacionalidade` VARCHAR(45) NOT NULL,
  `estadoCivil` VARCHAR(45) NOT NULL,
  `tipoSanguineo` VARCHAR(45) NULL DEFAULT NULL,
  `peso` FLOAT NULL DEFAULT NULL,
  `altura` FLOAT NULL DEFAULT NULL,
  `numEndereco` INT(11) NOT NULL,
  `bairroEndereco` VARCHAR(45) NOT NULL,
  `profissao` VARCHAR(45) NOT NULL,
  `CEP` VARCHAR(45) NOT NULL,
  `convenio_idConvenio` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `CPF_UNIQUE` (`CPF` ASC) VISIBLE,
  INDEX `fk_paciente_convenio1_idx` (`convenio_idConvenio` ASC) VISIBLE,
  CONSTRAINT `fk_paciente_convenio1`
    FOREIGN KEY (`convenio_idConvenio`)
    REFERENCES `mydb`.`convenio` (`idConvenio`))
ENGINE = InnoDB
AUTO_INCREMENT = 47
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`paciente_has_medico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`paciente_has_medico` (
  `paciente_id` INT(11) NOT NULL,
  `Medico_numCracha` INT(11) NOT NULL,
  `dataConsulta` VARCHAR(45) NOT NULL,
  `valor` FLOAT NOT NULL,
  `horaConsulta` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`paciente_id`, `Medico_numCracha`),
  INDEX `fk_paciente_has_Medico_Medico1_idx` (`Medico_numCracha` ASC) VISIBLE,
  INDEX `fk_paciente_has_Medico_paciente1_idx` (`paciente_id` ASC) VISIBLE,
  CONSTRAINT `fk_paciente_has_Medico_Medico1`
    FOREIGN KEY (`Medico_numCracha`)
    REFERENCES `mydb`.`medico` (`numCracha`),
  CONSTRAINT `fk_paciente_has_Medico_paciente1`
    FOREIGN KEY (`paciente_id`)
    REFERENCES `mydb`.`paciente` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`recepcionista`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`recepcionista` (
  `numCrachaF` INT(11) NOT NULL,
  `senha` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`numCrachaF`),
  INDEX `Funcionario_Recepcionista_FK` (`numCrachaF` ASC) VISIBLE,
  CONSTRAINT `Funcionario_Recepcionista_FK`
    FOREIGN KEY (`numCrachaF`)
    REFERENCES `mydb`.`funcionario` (`numCrachaF`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
