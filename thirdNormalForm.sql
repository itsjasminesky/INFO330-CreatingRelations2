

-- third normal form
	-- creating a new table with against columns to elimate transitive dependicis
CREATE TABLE pokemon_against AS
	SELECT pokedex_number,
	against_bug , against_dark, against_dragon,     against_electric, against_fairy,
	against_fight , against_fire , against_flying,
	against_ghost ,  against_grass , against_ground,
	against_ice  against_normal, against_poison,
	against_psychic ,  against_rock ,  against_steel ,  against_water
	FROM imported_pokemon;
	-- add a primary key
	ALTER TABLE pokemon_against
	ADD COLUMN type_id INTEGER PRIMARY KEY;

ALTER TABLE pokemon_against DROP COLUMN pokedex_number;
-- add primary key
ALTER TABLE pokemon_against
ADD PRIMARY KEY (pokedex_number, type_id);

-- add foreign key
ALTER TABLE pokemon_against
ADD FOREIGN KEY (pokedex_number) REFERENCES imported_pokemon (pokedex_number);

ALTER TABLE pokemon_against
ADD FOREIGN KEY (type_id) REFERENCES pokemon_types (type_id);

CREATE TABLE type1 AS
SELECT
    type1 TEXT,
    type2 TEXT
	FROM imported_pokemon;

   -- add primary key
   ALTER TABLE type1
	ADD COLUMN type_id INTEGER PRIMARY KEY AUTOINCREMENT;
-- delete original against columns
	ALTER TABLE  imported_pokemon DROP COLUMN against_bug;
	ALTER TABLE  imported_pokemon DROP COLUMN against_dark;
	ALTER TABLE imported_pokemon DROP COLUMN against_dragon;
	ALTER TABLE imported_pokemon DROP COLUMN against_electric;
	ALTER TABLE imported_pokemon DROP COLUMN against_fairy;
	ALTER TABLE imported_pokemon  DROP COLUMN against_fight;
	ALTER TABLE imported_pokemon DROP COLUMN against_fire;
	ALTER TABLE imported_pokemon DROP COLUMN against_flying;
	ALTER TABLE imported_pokemon DROP COLUMN against_ghost;
	ALTER TABLE imported_pokemon DROP COLUMN against_grass;
	ALTER TABLE imported_pokemon DROP COLUMN against_ground;
	ALTER TABLE  imported_pokemon DROP COLUMN against_ice;
	ALTER TABLE  imported_pokemon DROP COLUMN against_normal;
	ALTER TABLE imported_pokemon DROP COLUMN against_poison;
	ALTER TABLE imported_pokemon DROP COLUMN against_psychic;
	ALTER TABLE imported_pokemon DROP COLUMN against_rock;
	ALTER TABLE imported_pokemon DROP COLUMN against_steel;
	ALTER TABLE imported_pokemon DROP COLUMN against_water;
