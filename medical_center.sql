-- - Design the schema for a medical center.

-- - A medical center employs several doctors (1:M relationship)
-- - A doctors can see many patients (1:M Relationship)
-- - A patient can be seen by many doctors (M:M Relationship)
-- - During a visit, a patient may be diagnosed to have one or more diseases. (M:M Relationship)


-- from the terminal run:
-- psql < medical_center.sql

DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE medical_center
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
);

CREATE TABLE doctors(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    specialty VARCHAR(50) NOT NULL,
)

CREATE TABLE patients(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    dob DATE NOT NULL
    insurance TEXT NOT NULL
)

CREATE TABLE visits(
    id SERIAL PRIMARY KEY,
    doctor_id REFERENCES doctors,
    patient_id REFERENCES patients,
    date_of_visit DATE NOT NULL
)

CREATE TABLE diseases(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT
)

CREATE TABLE diagnoses(
    id SERIAL PRIMARY KEY,
    visit_id REFERENCES visits,
    disease_id REFERENCES diseases
    notes TEXT
)
