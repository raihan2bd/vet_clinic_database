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

ALTER TABLE animals 
    ADD foreign key (species_id) references species(id);
ALTER TABLE animals 
    ADD foreign key (owner_id) references owners(id);

-- create vets table to the database
CREATE TABLE vets (
    id bigserial PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    date_of_graduation DATE
);

-- create specializations join table to the database
CREATE TABLE specializations (
    id bigserial PRIMARY KEY,
    species_id INT REFERENCES species(id),
    vet_id INT REFERENCES vets(id)
);

-- create visits table to join animals table and vets table
CREATE TABLE visits (
    id bigserial PRIMARY KEY,
    animal_id INT REFERENCES animals(id),
    vet_id INT REFERENCES vets(id),
    visited_date date NOT NULL DEFAULT CURRENT_DATE
);