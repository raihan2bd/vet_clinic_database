/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
   id bigserial PRIMARY KEY,
    name  VARCHAR(100) NOT NULL,
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg Decimal
);

ALTER TABLE animals
    ADD species VARCHAR(255);

CREATE TABLE owner (
    id bigserial PRIMARY KEY,
    full_name VARCHAR(100),
    age INT
);

CREATE TABLE species (
    id bigserial PRIMARY KEY,
    name VARCHAR(100)
);

ALTER TABLE animals 
    DROP COLUMN species;
ALTER TABLE animals
    ADD species_id INT;
ALTER TABLE animals
    ADD owner_id INT;

