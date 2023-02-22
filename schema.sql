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
