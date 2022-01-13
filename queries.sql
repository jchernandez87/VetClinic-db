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

-- Animals that belongs to melody pond
SELECT name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Melody Pond';

-- Select animals with pokemon as specie
SELECT animals.name, species.name FROM animals JOIN species ON species.id = animals.species_id WHERE species.name = 'Pokemon';

-- List all owners and their animals even if they own none
SELECT owners.full_name AS owner, animals.name AS animal FROM animals RIGHT JOIN owners ON owners.id = animals.owner_id;

-- Number of animals per specie
SELECT species.name AS species, COUNT(animals.species_id) AS num_of_animals FROM animals JOIN species ON animals.species_id = species.id GROUP BY species.id;

-- Select digimon owner by jennifer orwell
SELECT animals.name FROM animals JOIN owners ON animals.owner_id = owners.id JOIN species ON animals.species_id = species.id WHERE owners.full_name = 'Jennifer Orwell' AND species.name = 'Digimon';

-- Animals owned by dean winchester with 0 escape_attempts
SELECT animals.name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE animals.escape_attempts = 0 AND owners.full_name = 'Dean Winchester';

-- Who owns the most
SELECT owners.full_name AS owner, COUNT(*) AS owned_animals FROM owners JOIN animals ON owners.id = animals.owner_id GROUP BY owners.full_name ORDER BY COUNT(*) DESC LIMIT 1;


-- Number of animals stephanie mendez see
SELECT COUNT(animals.name) FROM animals JOIN visits ON animals.id = visits.animal_id JOIN vets ON visits.vet_id = vets.id WHERE vets.name = 'Stephanie Mendez';

-- Last animal visited by william tatcher;
SELECT animals.name, visits.date_of_visit FROM animals JOIN visits ON animals.id = visits.animal_id JOIN vets ON vets.id = visits.vet_id WHERE vets.name = 'William Tatcher' ORDER BY visits.date_of_visit DESC LIMIT 1;

-- All vets and their specialization
SELECT vets.name, species.name FROM vets LEFT JOIN specializations ON vets.id = specializations.vet_id LEFT JOIN species ON species.id = specializations.species_id;

-- Animals that visited stephanie mendez between April 1st and August 30th, 2020.
SELECT animals.name, visits.date_of_visit FROM animals JOIN visits ON animals.id = visits.animal_id JOIN vets ON vets.id = visits.vet_id WHERE vets.name = 'Stephanie Mendez' AND visits.date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';

-- Animal with most visits
SELECT animals.name, COUNT(animals.name) AS num_of_visits FROM animals JOIN visits ON animals.id = visits.animal_id GROUP BY animals.name ORDER BY COUNT(animals.name) DESC LIMIT 1;

-- Maisy's smith first animal
SELECT animals.name, visits.date_of_visit FROM animals JOIN visits ON animals.id = visits.animal_id JOIN vets ON visits.vet_id = vets.id WHERE vets.name = 'Maisy Smith' ORDER BY visits.date_of_visit LIMIT 1;

-- Latest visit
SELECT animals.name, vets.name, visits.date_of_visit FROM animals JOIN visits ON animals.id = visits.animal_Id JOIN vets ON vets.id = visits.vet_id ORDER BY date_of_visit DESC LIMIT 1;

