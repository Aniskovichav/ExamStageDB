-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema products_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema products_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `products_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `products_db` ;

-- -----------------------------------------------------
-- Table `products_db`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `products_db`.`categories` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `products_db`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `products_db`.`products` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `price` DECIMAL(10,2) NOT NULL,
  `category_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `category_id` (`category_id` ASC) VISIBLE,
  CONSTRAINT `products_ibfk_1`
    FOREIGN KEY (`category_id`)
    REFERENCES `products_db`.`categories` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 17
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `products_db`.`suppliers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `products_db`.`suppliers` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `contact_name` VARCHAR(50) NULL DEFAULT NULL,
  `phone` VARCHAR(20) NULL DEFAULT NULL,
  `address` VARCHAR(255) NULL DEFAULT NULL,
  `email` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `products_db`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `products_db`.`orders` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `order_date` DATE NOT NULL,
  `product_id` INT NULL DEFAULT NULL,
  `quantity` INT NOT NULL,
  `supplier_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `product_id` (`product_id` ASC) VISIBLE,
  INDEX `supplier_id` (`supplier_id` ASC) VISIBLE,
  CONSTRAINT `orders_ibfk_1`
    FOREIGN KEY (`product_id`)
    REFERENCES `products_db`.`products` (`id`),
  CONSTRAINT `orders_ibfk_2`
    FOREIGN KEY (`supplier_id`)
    REFERENCES `products_db`.`suppliers` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
