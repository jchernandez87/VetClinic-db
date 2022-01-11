/*Queries that provide answers to the questions from all projects.*/

-- Animals that name ends with mon
SELECT * FROM animals WHERE name LIKE '%mon';

-- Animals born between 2016 and 2019
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

-- Animals neutered and with less than 3 escape attempts
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;

-- Date of birth animals named Pikachu or agumon
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';

-- Name and escape_attempts from animals that weigh less than 10.5kg
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

-- Neutered animals
SELECT * FROM animals WHERE neutered = true;

-- Animals not named gabumon
SELECT * FROM animals WHERE name != 'Gabumon';

-- Animals with weight more or equal to 10.4 and less or equal to 17.3
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

-- Transactions

-- Set species to unspecified for all animals then rollback;
BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

-- Set species = digimon for animals that name ends with mon and species = pokemon for animals with species = null
BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
COMMIT;
SELECT * FROM animals;

-- Delete all records from animals then rollback
BEGIN;
DELETE FROM animals;
ROLLBACK;
SELECT * FROM animals;

-- Delete, update, savepoint, rollback to savepoint
BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT sp1;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO SAVEPOINT sp1;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;

-- Num of records
SELECT COUNT(*) FROM animals;

-- Num of animals with 0 escape attempts
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;

-- Avg weight
SELECT AVG(weight_kg) FROM animals;

-- Max escape attempts from neutered or not neutered animals
SELECT name MAX(escape_attempts) FROM animals WHERE neutered = true OR neutered = false;

-- Min and max weight group by species
SELECT MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;

-- Avg escape attempts from animals born between 1900 and 2000
SELECT AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1900-01-01' AND '1999-12-31';

