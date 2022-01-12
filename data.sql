/* Populate database with sample data. */
INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES(1, 'Agumon', '2020-02-03', 0, true, 10.23);
INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES(2, 'Gabumon', '2018-11-15', 2, true, 8);
INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES(3, 'Pikachu', '2021-01-07', 1, false, 15.04);
INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES(4, 'Devimon', '2017-05-12', 5, true, 11);
INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES(5, 'Charmander', '2020-02-08', 0, false, -11);
INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES(6, 'Plantmon', '2022-11-15', 2, true, -5.7);
INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES(7, 'Squirtle', '1993-04-02', 3, false, -12.13);
INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES(8, 'Angemon', '2005-06-12', 1, true, -45);
INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES(9, 'Boarmon', '2005-06-07', 7, true, 20.4);
INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES(10, 'Blossom', '1998-10-13', 3, true, 17);

-- Insert new record into owners 
-- In here use the syntax to insert multiple rows at once
INSERT INTO owners(full_name, age) VALUES('Sam Smith', 34), ('Jennifer Orwell', 19), ('Bob', 45), ('Melody Pond', 77), ('Dean Winchester', 14), ('Jodie Whittaker', 38);

-- Insert pokemon and digimon record into species table
INSERT INTO species(name) VALUES ('Pokemon'), ('Digimon');

-- Update animals table, so species_id will be 2 if animal name ends with mon
UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';

-- Update animals table, so species_id will be 1 where species_id = NULL
UPDATE animals SET species_id = 1 WHERE species_id IS NULL;

-- Sam smith(id = 1) owns agumon
UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';

-- Jennifer orwell(id = 2) owns gabumon and pikachu
UPDATE animals SET owner_id = 2 WHERE name = 'Gabumon' OR name = 'Pikachu';

-- Bob(id = 3) owns devimon and plantmon
UPDATE animals SET owner_id = 3 WHERE name = 'Devimon' OR name = 'Plantmon';

-- Melody pond(id = 4) owns charmander, squirtle and blossom
UPDATE animals SET owner_id = 4 WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';

-- Dean winchester(id = 5) owns angemon and boarmon
UPDATE animals SET owner_id = 5 WHERE name = 'Angemon' OR name = 'Boarmon';