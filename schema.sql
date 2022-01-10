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
