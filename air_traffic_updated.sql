-- from the terminal run:
-- psql < air_traffic_updated.sql

DROP DATABASE IF EXISTS air_traffic_updated;

CREATE DATABASE air_traffic_updated;

\c air_traffic_updated;

CREATE TABLE airlines(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
)

CREATE TABLE countries( 
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
)

CREATE TABLE cities(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    country_id INTEGER REFERENCES countries
)

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline_id INTEGER REFERENCES airlines,
  from_city_id INTEGER REFERENCES cities,
  to_city_id INTEGER REFERENCES cities
);

-- Insert data into countries
INSERT INTO countries (name) VALUES ('United States'), ('Japan'), ('United Kingdom'), ('Mexico'), ('France'), ('Morocco'), ('UAE'), ('China'), ('Brazil'), ('Chile');

-- Insert data into cities
INSERT INTO cities (name, country_id) VALUES ('Washington DC', 1), ('Seattle', 1), ('Tokyo', 2), ('London', 3), ('Los Angeles', 1), ('Las Vegas', 1), ('Paris', 5), ('Casablanca', 6), ('Dubai', 7), ('Beijing', 8), ('New York', 1), ('Charlotte', 1), ('Cedar Rapids', 1), ('Chicago', 1), ('New Orleans', 1), ('Sao Paolo', 9), ('Santiago', 10), ('Mexico City', 4);

-- Insert data into airlines
INSERT INTO airlines (name) VALUES ('United'), ('British Airways'), ('Delta'), ('TUI Fly Belgium'), ('Air China'), ('American Airlines'), ('Avianca Brasil');

-- Insert data into tickets
INSERT INTO tickets (first_name, last_name, seat, departure, arrival, airline_id, from_city_id, to_city_id)
VALUES
  ('Jennifer', 'Finch', '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 1, 2),
  ('Thadeus', 'Gathercoal', '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 2, 3, 4),
  ('Sonja', 'Pauley', '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 3, 5, 6),