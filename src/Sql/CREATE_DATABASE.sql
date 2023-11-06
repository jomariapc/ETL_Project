-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema tepuy
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema tepuy
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `tepuy` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `tepuy` ;

-- -----------------------------------------------------
-- Table `tepuy`.`brand`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tepuy`.`brand` (
  `brand_id` INT NOT NULL,
  `brand` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`brand_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `tepuy`.`channel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tepuy`.`channel` (
  `channel_id` INT NOT NULL,
  `channel` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`channel_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `tepuy`.`location`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tepuy`.`location` (
  `location_id` INT NOT NULL,
  `location` VARCHAR(50) NULL DEFAULT NULL,
  `brand_brand_id` INT NOT NULL,
  PRIMARY KEY (`location_id`),
  INDEX `fk_location_brand_idx` (`brand_brand_id` ASC) VISIBLE,
  CONSTRAINT `fk_location_brand`
    FOREIGN KEY (`brand_brand_id`)
    REFERENCES `tepuy`.`brand` (`brand_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `tepuy`.`status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tepuy`.`status` (
  `status_id` INT NOT NULL,
  `status` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`status_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `tepuy`.`order_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tepuy`.`order_type` (
  `order_type_id` INT NOT NULL,
  `order_type` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`order_type_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `tepuy`.`software`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tepuy`.`software` (
  `software_id` INT NOT NULL,
  `software` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`software_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `tepuy`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tepuy`.`order` (
  `order_id` INT NOT NULL,
  `order_id_software` VARCHAR(50) NULL DEFAULT NULL,
  `created_datetime` VARCHAR(50) NULL DEFAULT NULL,
  `total` FLOAT NULL DEFAULT NULL,
  `payment_method` VARCHAR(50) NULL DEFAULT NULL,
  `delivery_cost` FLOAT NULL DEFAULT NULL,
  `discount` FLOAT NULL DEFAULT NULL,
  `tip` FLOAT NULL DEFAULT NULL,
  `driver_tip` FLOAT NULL DEFAULT NULL,
  `subtotal` FLOAT NULL DEFAULT NULL,
  `vat` FLOAT NULL DEFAULT NULL,
  `location_id` INT NULL DEFAULT NULL,
  `brand_id` INT NULL DEFAULT NULL,
  `channel_id` INT NULL DEFAULT NULL,
  `status_id` INT NULL DEFAULT NULL,
  `order_type_id` INT NULL DEFAULT NULL,
  `software_id` INT NULL DEFAULT NULL,
  `location_location_id` INT NOT NULL,
  `channel_channel_id` INT NOT NULL,
  `status_status_id` INT NOT NULL,
  `order_type_order_type_id` INT NOT NULL,
  `software_software_id` INT NOT NULL,
  PRIMARY KEY (`order_id`),
  INDEX `fk_order_location1_idx` (`location_location_id` ASC) VISIBLE,
  INDEX `fk_order_channel1_idx` (`channel_channel_id` ASC) VISIBLE,
  INDEX `fk_order_status1_idx` (`status_status_id` ASC) VISIBLE,
  INDEX `fk_order_order_type1_idx` (`order_type_order_type_id` ASC) VISIBLE,
  INDEX `fk_order_software1_idx` (`software_software_id` ASC) VISIBLE,
  CONSTRAINT `fk_order_location1`
    FOREIGN KEY (`location_location_id`)
    REFERENCES `tepuy`.`location` (`location_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_channel1`
    FOREIGN KEY (`channel_channel_id`)
    REFERENCES `tepuy`.`channel` (`channel_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_status1`
    FOREIGN KEY (`status_status_id`)
    REFERENCES `tepuy`.`status` (`status_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_order_type1`
    FOREIGN KEY (`order_type_order_type_id`)
    REFERENCES `tepuy`.`order_type` (`order_type_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_software1`
    FOREIGN KEY (`software_software_id`)
    REFERENCES `tepuy`.`software` (`software_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
