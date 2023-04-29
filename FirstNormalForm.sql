-- create a new table which splits apart abilities
CREATE TABLE split_abilities AS
SELECT DISTINCT abilities,
  trim(value) AS split_value
FROM imported_pokemon,
--one row for each element
json_each ('["'|| replace (abilities, ',', '","') || '"]')
WHERE split_value <> '';

SELECT * FROM imported_pokemon JOIN split_abilities;

--remove duplicates

DELETE FROM split_abilities
WHERE ROWID NOT IN (
SELECT MIN(ROWID)
FROM split_abilities
GROUP BY abilities, split_value);

--remove square brackets

UPDATE split_abilities SET split_value = TRIM
(split_value,  '[');
UPDATE split_abilities SET split_value = TRIM
(split_value,  ']');
--git rid of single quotes
UPDATE split_abilities SET split_value = TRIM
(split_value,  " ' ");

-- create new table which has the a one to one column 
CREATE TABLE pokemon_cleaned AS
SELECT against_bug, against_dark, against_dragon, against_electric,
against_fairy, against_fight, against_fire, against_flying, against_ghost,
against_grass, against_ground, against_ice, against_normal, against_poison,
against_psychic, against_rock, against_steel, against_water, attack, base_egg_steps,
base_happiness, base_total, capture_rate, classfication, defense, experience_growth,
height_m, hp, name, percentage_male, pokedex_number, sp_attack, sp_defense,
speed, type1, type2, weight_kg, generation, is_legendary, split_value
FROM pokemon_data_cleaned;
