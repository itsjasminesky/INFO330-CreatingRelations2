CREATE TABLE `split_abilities`(
    `abilities (split_value)` TEXT NOT NULL,
    `column_2` BIGINT NOT NULL
);
ALTER TABLE
    `split_abilities` ADD PRIMARY KEY(`abilities (split_value)`);
CREATE TABLE `imported_pokemon`(
    `Attack` INT NOT NULL,
    `base_egg_steps` INT NOT NULL,
    `base_happiness` INT NOT NULL,
    `base_total` INT NOT NULL,
    `capture_rate` INT NOT NULL,
    `classification` CHAR(255) NOT NULL,
    `defense` INT NOT NULL,
    `experience_growth` INT NOT NULL,
    `height_m` DOUBLE NOT NULL,
    `hp` INT NOT NULL,
    `name` CHAR(255) NOT NULL,
    `percentage_male` INT NOT NULL,
    `pokedex_number` INT NOT NULL,
    `sp_attack` INT NOT NULL,
    `sp_defense` INT NOT NULL,
    `speed` INT NOT NULL,
    `weight_kg` INT NOT NULL,
    `generation` INT NOT NULL,
    `is_legendary` INT NOT NULL
);
CREATE TABLE `pokemon_type`(
    `pokedex_number` INT NOT NULL COMMENT 'Foreign Key',
    `type1` TEXT NOT NULL,
    `type2` TEXT NOT NULL
);
ALTER TABLE
    `pokemon_type` ADD PRIMARY KEY(`pokedex_number`);
CREATE TABLE `pokemon_against`(
    `pokedex_number` INT NOT NULL,
    `against_bug` DOUBLE(8, 2) NOT NULL,
    `against_dark` DOUBLE(8, 2) NOT NULL,
    `against_dragon` DOUBLE(8, 2) NOT NULL,
    `against_electric` DOUBLE(8, 2) NOT NULL,
    `against_fairy` DOUBLE(8, 2) NOT NULL,
    `against_fire` DOUBLE(8, 2) NOT NULL,
    `against_flying` DOUBLE(8, 2) NOT NULL,
    `against_ghost` DOUBLE(8, 2) NOT NULL,
    `against_fight` DOUBLE(8, 2) NOT NULL,
    `against_grass` DOUBLE(8, 2) NOT NULL,
    `against_ground` DOUBLE(8, 2) NOT NULL,
    `against_ice` DOUBLE(8, 2) NOT NULL,
    `against_normal` DOUBLE(8, 2) NOT NULL,
    `against_poison` DOUBLE(8, 2) NOT NULL,
    `against_psychic` DOUBLE(8, 2) NOT NULL,
    `against_rock` DOUBLE(8, 2) NOT NULL,
    `against_steel` DOUBLE(8, 2) NOT NULL,
    `against_water` BIGINT NOT NULL
);
ALTER TABLE
    `pokemon_against` ADD PRIMARY KEY(`pokedex_number`);
ALTER TABLE
    `imported_pokemon` ADD CONSTRAINT `imported_pokemon_defense_foreign` FOREIGN KEY(`defense`) REFERENCES `pokemon_against`(`pokedex_number`);
ALTER TABLE
    `imported_pokemon` ADD CONSTRAINT `imported_pokemon_generation_foreign` FOREIGN KEY(`generation`) REFERENCES `pokemon_type`(`type1`);
ALTER TABLE
    `imported_pokemon` ADD CONSTRAINT `imported_pokemon_base_total_foreign` FOREIGN KEY(`base_total`) REFERENCES `split_abilities`(`abilities (split_value)`);