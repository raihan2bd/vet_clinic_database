/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id NOT NULL PRIMARY KEY,
    name  VARCHAR(100) NOT NULL,
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg Decimal
);
