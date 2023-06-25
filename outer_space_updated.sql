-- from the terminal run:
-- psql < outer_space_updated.sql

DROP DATABASE IF EXISTS outer_space_updated;
CREATE DATABASE outer_space_updated;
\ c outer_space_updated 

CREATE TABLE galaxies (
    id SERIAL PRIMARY KEY,
     name TEXT NOT NULL
     );
CREATE TABLE planets(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    orbital_period_in_years FLOAT NOT NULL,
    orbits_around VARCHAR(50) NOT NULL,
    galaxy_id INTEGER REFERENCES galaxies
);

CREATE TABLE moons(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    planet_id INTEGER REFERENCES planets
);

-- Insert galaxies
INSERT INTO galaxies (name)
VALUES ('Milky Way');
-- Insert planets
INSERT INTO planets (
        name,
        orbital_period_in_years,
        orbits_around,
        galaxy_id
    )
VALUES ('Earth', 1.00, 'The Sun', 1);
INSERT INTO planets (
        name,
        orbital_period_in_years,
        orbits_around,
        galaxy_id
    )
VALUES ('Mars', 1.88, 'The Sun', 1);
INSERT INTO planets (
        name,
        orbital_period_in_years,
        orbits_around,
        galaxy_id
    )
VALUES ('Venus', 0.62, 'The Sun', 1);
INSERT INTO planets (
        name,
        orbital_period_in_years,
        orbits_around,
        galaxy_id
    )
VALUES ('Neptune', 164.8, 'The Sun', 1);
INSERT INTO planets (
        name,
        orbital_period_in_years,
        orbits_around,
        galaxy_id
    )
VALUES (
        'Proxima Centauri b',
        0.03,
        'Proxima Centauri',
        1
    );
INSERT INTO planets (
        name,
        orbital_period_in_years,
        orbits_around,
        galaxy_id
    )
VALUES ('Gliese 876 b', 0.23, 'Gliese 876', 1);
-- Insert moons
INSERT INTO moons (name, planet_id)
VALUES ('The Moon', 1);
INSERT INTO moons (name, planet_id)
VALUES ('Phobos', 2);
INSERT INTO moons (name, planet_id)
VALUES ('Deimos', 3);
INSERT INTO moons (name, planet_id)
VALUES ('Naiad', 4);
