/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth >= '2016-01-01' AND date_of_birth <= '2019-12-31';
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT name FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT name FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;


/* Query to update and read the animals table data */

BEGIN;
UPDATE animals
SET species = 'unspecified';
ROLLBACK;

BEGIN;
UPDATE animals
SET species = 'digimon'
WHERE name Like '%mon';

UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL;
COMMIT;

BEGIN;
DELETE FROM animals;
ROLLBACK;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT here;
UPDATE animals
SET weight_kg = weight_kg * -1;
ROLLBACK TO here;
UPDATE animals
SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;

/* Query to select animals table data with specific condition and also count them */

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT ROUND(AVG(weight_kg)::numeric, 2) FROM animals;
SELECT name FROM animals 
  WHERE escape_attempts = (SELECT MAX(escape_attempts) FROM animals);
SELECT species, MIN(weight_kg), MAX(weight_kg) 
  FROM animals GROUP BY species;
SELECT species, ROUND(AVG(escape_attempts)::numeric, 0) FROM animals 
  WHERE date_of_birth >= '1990-01-01' AND date_of_birth <= '2000-12-31' GROUP BY species;

/* Write queries (using JOIN) to answer the following questions */

-- What animals belong to Melody Pond?
SELECT animals.name,owners.full_name FROM animals 
  JOIN owners ON animals.owner_id = owners.id 
  WHERE owners.full_name = 'Melody Pond';

-- List of all animals that are pokemon (their type is Pokemon).
SELECT animals.name, species.name FROM animals
  JOIN species ON animals.species_id = species.id
  WHERE species.name = 'Pokemon';

-- List all owners and their animals, remember to include those that don't own any animal.
SELECT owners.full_name, animals.name FROM animals 
  RIGHT JOIN owners ON animals.owner_id = owners.id;

-- How many animals are there per species?
SELECT count(animals.name), species.name FROM animals 
  JOIN species ON animals.species_id = species.id 
  GROUP BY species.name;

-- List all Digimon owned by Jennifer Orwell.
SELECT owners.full_name, species.name FROM animals 
  JOIN owners ON animals.owner_id = owners.id 
  JOIN species ON animals.species_id = species.id
  WHERE species.name = 'Digimon'
  and owners.full_name = 'Jennifer Orwell';

-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT animals.name, owners.full_name FROM animals
  JOIN owners ON animals.owner_id = owners.id
  WHERE animals.escape_attempts=0
  and owners.full_name = 'Dean Winchester';

-- Who owns the most animals?
SELECT count(*), owners.full_name FROM animals 
  JOIN owners ON animals.owner_id = owners.id
  GROUP BY owners.full_name ORDER BY count desc;