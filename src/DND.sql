-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema d&d
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema d&d
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `d&d` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
-- -----------------------------------------------------
-- Schema dnd
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema dnd
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dnd` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `d&d` ;

-- -----------------------------------------------------
-- Table `d&d`.`alignment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `d&d`.`alignment` (
  `id_races` INT NULL DEFAULT NULL,
  `lawful` TEXT NULL DEFAULT NULL,
  `chaotic` TEXT NULL DEFAULT NULL,
  `neutral` TEXT NULL DEFAULT NULL,
  `good` TEXT NULL DEFAULT NULL,
  `evil` TEXT NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `d&d`.`characteristics`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `d&d`.`characteristics` (
  `id_char` INT NULL DEFAULT NULL,
  `name` TEXT NULL DEFAULT NULL,
  `abrv` TEXT NULL DEFAULT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `skills` TEXT NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `d&d`.`races`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `d&d`.`races` (
  `id_races` INT NULL DEFAULT NULL,
  `race_name` TEXT NULL DEFAULT NULL,
  `size` TEXT NULL DEFAULT NULL,
  `speed` INT NULL DEFAULT NULL,
  `id_alignment` INT NULL DEFAULT NULL,
  `first_lang` TEXT NULL DEFAULT NULL,
  `second_lang` TEXT NULL DEFAULT NULL,
  `language_options` TEXT NULL DEFAULT NULL,
  `bonus` TEXT NULL DEFAULT NULL,
  `bonus_option` TEXT NULL DEFAULT NULL,
  `subrace_name` TEXT NULL DEFAULT NULL,
  `proficiencies_start` TEXT NULL DEFAULT NULL,
  `traits` TEXT NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `d&d`.`combination`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `d&d`.`combination` (
  `id_races` INT NULL DEFAULT NULL,
  `id_class` INT NULL DEFAULT NULL,
  `combination` TEXT NULL DEFAULT NULL,
  INDEX `fk_combination_races1_idx` (`id_races` ASC) VISIBLE,
  CONSTRAINT `fk_combination_races1`
    FOREIGN KEY (`id_races`)
    REFERENCES `d&d`.`races` (`id_races`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `d&d`.`classes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `d&d`.`classes` (
  `id_class` INT NULL DEFAULT NULL,
  `class_name` TEXT NULL DEFAULT NULL,
  `health` INT NULL DEFAULT NULL,
  `proficiencies` TEXT NULL DEFAULT NULL,
  `start_equipment` TEXT NULL DEFAULT NULL,
  `class_level` TEXT NULL DEFAULT NULL,
  `subclasses` TEXT NULL DEFAULT NULL,
  `spellcasting` TEXT NULL DEFAULT NULL,
  `saving_throws` TEXT NULL DEFAULT NULL,
  INDEX `fk_classes_combination1_idx` (`id_class` ASC) VISIBLE,
  CONSTRAINT `fk_classes_combination1`
    FOREIGN KEY (`id_class`)
    REFERENCES `d&d`.`combination` (`id_class`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `d&d`.`equipment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `d&d`.`equipment` (
  `id_equipment` INT NULL DEFAULT NULL,
  `name` TEXT NULL DEFAULT NULL,
  `desc` TEXT NULL DEFAULT NULL,
  `category` TEXT NULL DEFAULT NULL,
  `gear_category` TEXT NULL DEFAULT NULL,
  `cost` TEXT NULL DEFAULT NULL,
  `weight` BIGINT NULL DEFAULT NULL,
  `speed` TEXT NULL DEFAULT NULL,
  `range` BIGINT NULL DEFAULT NULL,
  `capacity` BIGINT NULL DEFAULT NULL,
  `properties` TEXT NULL DEFAULT NULL,
  `damage` TEXT NULL DEFAULT NULL,
  `damage_type` TEXT NULL DEFAULT NULL,
  `category_range` TEXT NULL DEFAULT NULL,
  `throw_range` BIGINT NULL DEFAULT NULL,
  `weapon_category` BIGINT NULL DEFAULT NULL,
  `weapon_range` TEXT NULL DEFAULT NULL,
  `armor_category` BIGINT NULL DEFAULT NULL,
  `armor_class` TEXT NULL DEFAULT NULL,
  `tool_category` TEXT NULL DEFAULT NULL,
  `vehicle_category` TEXT NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `d&d`.`languages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `d&d`.`languages` (
  `id_languages` INT NULL DEFAULT NULL,
  `language_name` TEXT NULL DEFAULT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `type` TEXT NULL DEFAULT NULL,
  `speakers` TEXT NULL DEFAULT NULL,
  `script` TEXT NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `d&d`.`lotrpj`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `d&d`.`lotrpj` (
  `player_name` TEXT NULL DEFAULT NULL,
  `race_name` TEXT NULL DEFAULT NULL,
  INDEX `fk_lotrpj_races_idx` (`race_name` ASC) VISIBLE,
  CONSTRAINT `fk_lotrpj_races`
    FOREIGN KEY (`race_name`)
    REFERENCES `d&d`.`races` (`race_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `d&d`.`stats`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `d&d`.`stats` (
  `CHA` INT NULL DEFAULT NULL,
  `CHA_modifier` INT NULL DEFAULT NULL,
  `CON` INT NULL DEFAULT NULL,
  `CON_modifier` INT NULL DEFAULT NULL,
  `DEX` INT NULL DEFAULT NULL,
  `DEX_modifier` INT NULL DEFAULT NULL,
  `STR` INT NULL DEFAULT NULL,
  `STR_modifier` INT NULL DEFAULT NULL,
  `INT` INT NULL DEFAULT NULL,
  `INT_modifier` INT NULL DEFAULT NULL,
  `WIS` INT NULL DEFAULT NULL,
  `WIS_modifier` INT NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `d&d`.`subclass`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `d&d`.`subclass` (
  `id_subclass` INT NULL DEFAULT NULL,
  `subclass_name` TEXT NULL DEFAULT NULL,
  `class_name` TEXT NULL DEFAULT NULL,
  `description` TEXT NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `d&d`.`subraces`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `d&d`.`subraces` (
  `id_subrace` INT NULL DEFAULT NULL,
  `subrace_name` TEXT NULL DEFAULT NULL,
  `race_name` TEXT NULL DEFAULT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `bonus` TEXT NULL DEFAULT NULL,
  `proficiencies_start` TEXT NULL DEFAULT NULL,
  `language_options` TEXT NULL DEFAULT NULL,
  `ratial_traits` TEXT NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

USE `dnd` ;

-- -----------------------------------------------------
-- Table `dnd`.`classes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dnd`.`classes` (
  `id_class` INT NOT NULL,
  `class_name` TEXT NOT NULL,
  `health` INT NOT NULL,
  `proficiencies` TEXT NOT NULL,
  `start_equipment` TEXT NOT NULL,
  `class_level` TEXT NOT NULL,
  `subclasses` TEXT NOT NULL,
  `spellcasting` TEXT NOT NULL,
  `saving_throws` TEXT NOT NULL,
  PRIMARY KEY (`id_class`, `class_name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dnd`.`combination`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dnd`.`combination` (
  `id_races` INT NOT NULL,
  `id_class` INT NOT NULL,
  `combination` TEXT NOT NULL,
  INDEX `fk_combination_classes1_idx` (`id_class` ASC) VISIBLE,
  PRIMARY KEY (`id_races`, `id_class`),
  CONSTRAINT `fk_combination_classes1`
    FOREIGN KEY (`id_class`)
    REFERENCES `dnd`.`classes` (`id_class`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dnd`.`races`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dnd`.`races` (
  `id_races` INT NOT NULL,
  `race_name` TEXT NOT NULL,
  `size` TEXT NOT NULL,
  `speed` INT NOT NULL,
  `id_alignment` INT NOT NULL,
  `first_lang` TEXT NOT NULL,
  `second_lang` TEXT NOT NULL,
  `language_options` TEXT NOT NULL,
  `bonus` TEXT NOT NULL,
  `bonus_option` TEXT NOT NULL,
  `subrace_name` TEXT NOT NULL,
  `proficiencies_start` TEXT NOT NULL,
  `traits` TEXT NOT NULL,
  INDEX `fk_races_combination1_idx` (`id_races` ASC) VISIBLE,
  PRIMARY KEY (`id_races`, `race_name`),
  CONSTRAINT `fk_races_combination1`
    FOREIGN KEY (`id_races`)
    REFERENCES `dnd`.`combination` (`id_races`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dnd`.`alignment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dnd`.`alignment` (
  `id_races` INT NOT NULL,
  `lawful` TEXT NOT NULL,
  `chaotic` TEXT NOT NULL,
  `neutral` TEXT NOT NULL,
  `good` TEXT NOT NULL,
  `evil` TEXT NOT NULL,
  INDEX `fk_alignment_races1_idx` (`id_races` ASC) VISIBLE,
  PRIMARY KEY (`id_races`),
  CONSTRAINT `fk_alignment_races1`
    FOREIGN KEY (`id_races`)
    REFERENCES `dnd`.`races` (`id_races`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dnd`.`characteristics`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dnd`.`characteristics` (
  `id_char` INT NOT NULL,
  `name` TEXT NOT NULL,
  `abrv` TEXT NOT NULL,
  `description` TEXT NOT NULL,
  `skills` TEXT NOT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dnd`.`equipment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dnd`.`equipment` (
  `id_equipment` INT NOT NULL,
  `name` TEXT NOT NULL,
  `desc` TEXT NOT NULL,
  `category` TEXT NOT NULL,
  `gear_category` TEXT NOT NULL,
  `cost` TEXT NOT NULL,
  `weight` DOUBLE NOT NULL,
  `speed` TEXT NOT NULL,
  `range` TEXT NOT NULL,
  `capacity` TEXT NOT NULL,
  `properties` TEXT NOT NULL,
  `damage` TEXT NOT NULL,
  `damage_type` TEXT NOT NULL,
  `category_range` TEXT NOT NULL,
  `throw_range` TEXT NOT NULL,
  `weapon_category` TEXT NOT NULL,
  `weapon_range` TEXT NOT NULL,
  `armor_category` TEXT NOT NULL,
  `armor_class` TEXT NOT NULL,
  `tool_category` TEXT NOT NULL,
  `vehicle_category` TEXT NOT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dnd`.`languages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dnd`.`languages` (
  `id_languages` INT NOT NULL,
  `language_name` TEXT NOT NULL,
  `description` TEXT NOT NULL,
  `type` TEXT NOT NULL,
  `speakers` TEXT NOT NULL,
  `script` TEXT NOT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dnd`.`lotrpj`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dnd`.`lotrpj` (
  `player_name` TEXT NOT NULL,
  `race_name` TEXT NOT NULL,
  INDEX `fk_lotrpj_races_idx` (`race_name` ASC) VISIBLE,
  PRIMARY KEY (`race_name`),
  CONSTRAINT `fk_lotrpj_races`
    FOREIGN KEY (`race_name`)
    REFERENCES `dnd`.`races` (`race_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dnd`.`stats`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dnd`.`stats` (
  `class_name` TEXT NOT NULL,
  `CHA` INT NOT NULL,
  `CHA_modifier` INT NOT NULL,
  `CON` INT NOT NULL,
  `CON_modifier` INT NOT NULL,
  `DEX` INT NOT NULL,
  `DEX_modifier` INT NOT NULL,
  `STR` INT NOT NULL,
  `STR_modifier` INT NOT NULL,
  `INT` INT NOT NULL,
  `INT_modifier` INT NOT NULL,
  `WIS` INT NOT NULL,
  `WIS_modifier` INT NOT NULL,
  INDEX `fk_stats_classes1_idx` (`class_name` ASC) VISIBLE,
  PRIMARY KEY (`class_name`),
  CONSTRAINT `fk_stats_classes1`
    FOREIGN KEY (`class_name`)
    REFERENCES `dnd`.`classes` (`class_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dnd`.`subclass`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dnd`.`subclass` (
  `id_subclass` INT NOT NULL,
  `subclass_name` TEXT NOT NULL,
  `class_name` TEXT NOT NULL,
  `description` TEXT NOT NULL,
  INDEX `fk_subclass_classes1_idx` (`class_name` ASC) VISIBLE,
  PRIMARY KEY (`class_name`),
  CONSTRAINT `fk_subclass_classes1`
    FOREIGN KEY (`class_name`)
    REFERENCES `dnd`.`classes` (`class_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dnd`.`subraces`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dnd`.`subraces` (
  `id_subrace` INT NOT NULL,
  `subrace_name` TEXT NOT NULL,
  `race_name` TEXT NOT NULL,
  `description` TEXT NOT NULL,
  `bonus` TEXT NOT NULL,
  `proficiencies_start` TEXT NOT NULL,
  `language_options` TEXT NOT NULL,
  `ratial_traits` TEXT NOT NULL,
  INDEX `fk_subraces_races1_idx` (`race_name` ASC) VISIBLE,
  PRIMARY KEY (`race_name`),
  CONSTRAINT `fk_subraces_races1`
    FOREIGN KEY (`race_name`)
    REFERENCES `dnd`.`races` (`race_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

create table if not exists sheet
select lotrpj.player_name, lotrpj.race_name, classes.class_name, combination.combination, races.size, classes.health, stats.CHA, stats.CON, stats.DEX, stats.STR, stats.INT, stats.WIS, races.bonus, races.bonus_option, races.speed, classes.saving_throws, races.first_lang, races.second_lang, races.language_options, races.proficiencies_start, races.traits, alignment.lawful, alignment.chaotic, alignment.neutral, alignment.good, alignment.evil    
from lotrpj
inner join races
on lotrpj.race_name =races.race_name
inner join combination
on races.id_races = combination.id_races
inner join classes
on classes.id_class = combination.id_class
inner join stats
on stats.class_name = classes.class_name
inner join alignment
on alignment.id_races =races.id_races;

select * from sheet;