-- create new table to eliminate depedicies between pokedex_numner and abilities
CREATE TABLE pokemon_data  AS
	SELECT pokedex_number, split_value
	FROM pokemon_cleaned;

  ALTER TABLE imported_pokemon DROP COLUMN abilities;
