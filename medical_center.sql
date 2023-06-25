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


-- Insert medical centers
INSERT INTO medical_center (name) VALUES ('Healthcare Clinic');
INSERT INTO medical_center (name) VALUES ('Wellness Medical Center');

-- Insert doctors
INSERT INTO doctors (first_name, last_name, specialty) VALUES ('John', 'Doe', 'Cardiology');
INSERT INTO doctors (first_name, last_name, specialty) VALUES ('Jane', 'Smith', 'Neurology');

-- Insert patients
INSERT INTO patients (first_name, last_name, dob, insurance) VALUES ('Alice', 'Johnson', '1980-05-15', 'Medicare');
INSERT INTO patients (first_name, last_name, dob, insurance) VALUES ('Bob', 'Brown', '1992-11-23', 'Blue Cross');

-- Insert visits
-- Assuming the IDs of Dr. John Doe, Dr. Jane Smith, Alice Johnson and Bob Brown are 1, 2, 1, and 2 respectively.
INSERT INTO visits (doctor_id, patient_id, date_of_visit) VALUES (1, 1, '2023-06-01');
INSERT INTO visits (doctor_id, patient_id, date_of_visit) VALUES (2, 2, '2023-06-05');

-- Insert diseases
INSERT INTO diseases (name, description) VALUES ('Hypertension', 'A condition in which the force of the blood against the artery walls is too high.');
INSERT INTO diseases (name, description) VALUES ('Migraine', 'A headache of varying intensity, often accompanied by nausea and sensitivity to light and sound.');

-- Insert diagnoses
-- Assuming the IDs of the visits and diseases are 1 and 1 for the first visit, and 2 and 2 for the second visit.
INSERT INTO diagnoses (visit_id, disease_id, notes) VALUES (1, 1, 'Patient to reduce salt intake and monitor blood pressure.');
INSERT INTO diagnoses (visit_id, disease_id, notes) VALUES (2, 2, 'Prescribed pain relief medication.');
