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
-- Table `mydb`.`syndrome`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`syndrome` (
  `syndrome_id` INT NOT NULL,
  `syndrome_name` VARCHAR(45) NULL,
  `syndrome_descr` VARCHAR(200) NULL,
  PRIMARY KEY (`syndrome_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`patient` (
  `patiend_id` INT NOT NULL,
  `patient_name` VARCHAR(45) NULL,
  `patient_gender` ENUM("M", "F") NULL,
  `patient_age` INT NULL,
  `syndrome_syndrome_id` INT NOT NULL,
  PRIMARY KEY (`patiend_id`, `syndrome_syndrome_id`),
  INDEX `fk_patient_syndrome1_idx` (`syndrome_syndrome_id` ASC) VISIBLE,
  CONSTRAINT `fk_patient_syndrome1`
    FOREIGN KEY (`syndrome_syndrome_id`)
    REFERENCES `mydb`.`syndrome` (`syndrome_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`gene`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`gene` (
  `gene_id` INT NOT NULL,
  `gene_name` VARCHAR(45) NULL,
  `pos_start` INT NULL,
  `pos_end` INT NULL,
  `chromosome` VARCHAR(45) NULL,
  `description` VARCHAR(45) NULL,
  `syndrome_syndrome_id` INT NOT NULL,
  PRIMARY KEY (`gene_id`),
  INDEX `fk_gene_syndrome1_idx` (`syndrome_syndrome_id` ASC) VISIBLE,
  CONSTRAINT `fk_gene_syndrome1`
    FOREIGN KEY (`syndrome_syndrome_id`)
    REFERENCES `mydb`.`syndrome` (`syndrome_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`patient_has_gene`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`patient_has_gene` (
  `patient_patiend_id` INT NOT NULL,
  `gene_gene_id` INT NOT NULL,
  PRIMARY KEY (`patient_patiend_id`, `gene_gene_id`),
  INDEX `fk_patient_has_gene_gene1_idx` (`gene_gene_id` ASC) VISIBLE,
  INDEX `fk_patient_has_gene_patient_idx` (`patient_patiend_id` ASC) VISIBLE,
  CONSTRAINT `fk_patient_has_gene_patient`
    FOREIGN KEY (`patient_patiend_id`)
    REFERENCES `mydb`.`patient` (`patiend_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_patient_has_gene_gene1`
    FOREIGN KEY (`gene_gene_id`)
    REFERENCES `mydb`.`gene` (`gene_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
