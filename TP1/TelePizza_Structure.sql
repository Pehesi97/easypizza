-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema TelePizza
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema TelePizza
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `TelePizza` DEFAULT CHARACTER SET latin1 ;
USE `TelePizza` ;

-- -----------------------------------------------------
-- Table `TelePizza`.`CRUD_preferencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TelePizza`.`CRUD_preferencia` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `TelePizza`.`CRUD_cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TelePizza`.`CRUD_cliente` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `address` VARCHAR(100) NOT NULL,
  `call_count` INT(11) NOT NULL,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  `preference_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `CRUD_cliente_preference_id_1313d5aa_fk_CRUD_preferencia_id` (`preference_id` ASC),
  CONSTRAINT `CRUD_cliente_preference_id_1313d5aa_fk_CRUD_preferencia_id`
    FOREIGN KEY (`preference_id`)
    REFERENCES `TelePizza`.`CRUD_preferencia` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `TelePizza`.`CRUD_motoqueiro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TelePizza`.`CRUD_motoqueiro` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `rg` VARCHAR(11) NOT NULL,
  `cpf` VARCHAR(11) NOT NULL,
  `salary` DECIMAL(5,2) NOT NULL,
  `service_count` INT(11) NOT NULL,
  `hired_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `TelePizza`.`CRUD_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TelePizza`.`CRUD_usuario` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(20) NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `rg` VARCHAR(11) NOT NULL,
  `cpf` VARCHAR(11) NOT NULL,
  `salary` DECIMAL(5,2) NOT NULL,
  `service_count` INT(11) NOT NULL,
  `type` INT(11) NOT NULL,
  `hired_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  `password` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `TelePizza`.`CRUD_pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TelePizza`.`CRUD_pedido` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `status` INT(11) NOT NULL,
  `asked_at` DATETIME NOT NULL,
  `delivered_at` DATETIME NULL DEFAULT NULL,
  `deliver_prediction` DATETIME NULL DEFAULT NULL,
  `client_id` INT(11) NOT NULL,
  `deliveryman_id` INT(11) NOT NULL,
  `attendant_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `CRUD_pedido_client_id_630dab39_fk_CRUD_cliente_id` (`client_id` ASC),
  INDEX `CRUD_pedido_deliveryman_id_019403eb_fk_CRUD_motoqueiro_id` (`deliveryman_id` ASC),
  INDEX `CRUD_pedido_attendant_id_58576986_fk_CRUD_usuario_id` (`attendant_id` ASC),
  CONSTRAINT `CRUD_pedido_attendant_id_58576986_fk_CRUD_usuario_id`
    FOREIGN KEY (`attendant_id`)
    REFERENCES `TelePizza`.`CRUD_usuario` (`id`),
  CONSTRAINT `CRUD_pedido_client_id_630dab39_fk_CRUD_cliente_id`
    FOREIGN KEY (`client_id`)
    REFERENCES `TelePizza`.`CRUD_cliente` (`id`),
  CONSTRAINT `CRUD_pedido_deliveryman_id_019403eb_fk_CRUD_motoqueiro_id`
    FOREIGN KEY (`deliveryman_id`)
    REFERENCES `TelePizza`.`CRUD_motoqueiro` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `TelePizza`.`CRUD_produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TelePizza`.`CRUD_produto` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(50) NOT NULL,
  `price` DECIMAL(4,2) NOT NULL,
  `type` INT(11) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `TelePizza`.`CRUD_pedido_products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TelePizza`.`CRUD_pedido_products` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `pedido_id` INT(11) NOT NULL,
  `produto_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `CRUD_pedido_products_pedido_id_f4d6e647_uniq` (`pedido_id` ASC, `produto_id` ASC),
  INDEX `CRUD_pedido_products_produto_id_c96b7ac8_fk_CRUD_produto_id` (`produto_id` ASC),
  CONSTRAINT `CRUD_pedido_products_pedido_id_5d7c4233_fk_CRUD_pedido_id`
    FOREIGN KEY (`pedido_id`)
    REFERENCES `TelePizza`.`CRUD_pedido` (`id`),
  CONSTRAINT `CRUD_pedido_products_produto_id_c96b7ac8_fk_CRUD_produto_id`
    FOREIGN KEY (`produto_id`)
    REFERENCES `TelePizza`.`CRUD_produto` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `TelePizza`.`CRUD_preferencia_products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TelePizza`.`CRUD_preferencia_products` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `preferencia_id` INT(11) NOT NULL,
  `produto_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `CRUD_preferencia_products_preferencia_id_285411d3_uniq` (`preferencia_id` ASC, `produto_id` ASC),
  INDEX `CRUD_preferencia_products_produto_id_12836e7a_fk_CRUD_produto_id` (`produto_id` ASC),
  CONSTRAINT `CRUD_preferencia__preferencia_id_a863b20b_fk_CRUD_preferencia_id`
    FOREIGN KEY (`preferencia_id`)
    REFERENCES `TelePizza`.`CRUD_preferencia` (`id`),
  CONSTRAINT `CRUD_preferencia_products_produto_id_12836e7a_fk_CRUD_produto_id`
    FOREIGN KEY (`produto_id`)
    REFERENCES `TelePizza`.`CRUD_produto` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `TelePizza`.`CRUD_telefone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TelePizza`.`CRUD_telefone` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `tel` VARCHAR(11) NOT NULL,
  `cliente_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `CRUD_telefone_cliente_id_6fa627fb_fk_CRUD_cliente_id` (`cliente_id` ASC),
  CONSTRAINT `CRUD_telefone_cliente_id_6fa627fb_fk_CRUD_cliente_id`
    FOREIGN KEY (`cliente_id`)
    REFERENCES `TelePizza`.`CRUD_cliente` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
