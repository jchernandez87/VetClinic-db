/* Database schema to keep the structure of entire database. */

-- Create vet_clinic DB
CREATE DATABASE vet_clinic;

-- Create animals table
CREATE TABLE animals (
  id INT, 
  name VARCHAR(50), 
  date_of_birth DATE, 
  escape_attempts INT, 
  neutered BOOLEAN, 
  weight_kg DECIMAL, 
  PRIMARY KEY(id)
);

-- Add species column to animals table
ALTER TABLE animals ADD COLUMN species VARCHAR(50);

-- Create owners table
CREATE TABLE owners (
  id INT GENERATED ALWAYS AS IDENTITY, 
  full_name VARCHAR(50), 
  age INT, PRIMARY KEY(id)
);

-- Create species table
CREATE TABLE species (
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(50), 
  PRIMARY KEY(id)
);

-- Add autoicrement to animals primary key(id)
ALTER TABLE animals ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY;

-- Remove species column from animals table
ALTER TABLE animals DROP COLUMN species;

-- Add species_id column to aniamls table and make it a foreign key
ALTER TABLE animals ADD COLUMN species_id INT;
ALTER TABLE animals ADD CONSTRAINT fk_species_id FOREIGN KEY(species_id) REFERENCES species(id) ON DELETE CASCADE;

-- Add owner_id column to animals and make it a foreign key
ALTER TABLE animals ADD COLUMN owner_id INT;
ALTER TABLE animals ADD CONSTRAINT fk_owner_id FOREIGN KEY(owner_id) REFERENCES owners(id) ON DELETE CASCADE;
