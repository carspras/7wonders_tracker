-- MySQL Script generated by MySQL Workbench
-- 04/08/15 16:36:28
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema 7wonders_tracker
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `7wonders_tracker` ;

-- -----------------------------------------------------
-- Schema 7wonders_tracker
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `7wonders_tracker` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `7wonders_tracker` ;

-- -----------------------------------------------------
-- Table `7wonders_tracker`.`games`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `7wonders_tracker`.`games` ;

CREATE TABLE IF NOT EXISTS `7wonders_tracker`.`games` (
  `id_games` INT NOT NULL,
  `date` DATE NULL,
  `number_of_players` INT NULL,
  `teams` TINYINT(1) NULL DEFAULT 0,
  `cities` TINYINT(1) NULL DEFAULT 0,
  `leaders` TINYINT(1) NULL DEFAULT 0,
  `babel` TINYINT(1) NULL DEFAULT 0,
  `great_projects` TINYINT(1) NULL DEFAULT 0,
  PRIMARY KEY (`id_games`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `7wonders_tracker`.`players`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `7wonders_tracker`.`players` ;

CREATE TABLE IF NOT EXISTS `7wonders_tracker`.`players` (
  `id_players` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_players`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `7wonders_tracker`.`wonders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `7wonders_tracker`.`wonders` ;

CREATE TABLE IF NOT EXISTS `7wonders_tracker`.`wonders` (
  `id_wonders` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id_wonders`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `7wonders_tracker`.`points`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `7wonders_tracker`.`points` ;

CREATE TABLE IF NOT EXISTS `7wonders_tracker`.`points` (
  `id_points` INT NOT NULL,
  `overall` INT NULL,
  `military` INT NULL,
  `money` INT NULL,
  `wonders_babel` INT NULL,
  `blue` INT NULL,
  `yellow` INT NULL,
  `green` INT NULL,
  `guilds` INT NULL,
  `cities_leaders` INT NULL,
  PRIMARY KEY (`id_points`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `7wonders_tracker`.`results`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `7wonders_tracker`.`results` ;

CREATE TABLE IF NOT EXISTS `7wonders_tracker`.`results` (
  `id_results` INT NOT NULL,
  `game` INT NOT NULL,
  `player` INT NOT NULL,
  `wonder` INT NOT NULL,
  `wonder_side` CHAR(1) NOT NULL,
  PRIMARY KEY (`id_results`),
  INDEX `fk_game_played_players_idx` (`player` ASC),
  INDEX `fk_game_played_games1_idx` (`game` ASC),
  INDEX `fk_game_played_wonders1_idx` (`wonder` ASC),
  CONSTRAINT `fk_game_played_players`
    FOREIGN KEY (`player`)
    REFERENCES `7wonders_tracker`.`players` (`id_players`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_game_played_games1`
    FOREIGN KEY (`game`)
    REFERENCES `7wonders_tracker`.`games` (`id_games`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_game_played_wonders1`
    FOREIGN KEY (`wonder`)
    REFERENCES `7wonders_tracker`.`wonders` (`id_wonders`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_game_played_result1`
    FOREIGN KEY (`id_results`)
    REFERENCES `7wonders_tracker`.`points` (`id_points`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;