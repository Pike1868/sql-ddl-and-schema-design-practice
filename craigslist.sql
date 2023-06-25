-- Design a schema for Craigslist! Your schema should keep track of the following

-- - The region of the craigslist post (San Francisco, Atlanta, Seattle, etc)
-- - Users and preferred region
-- - Posts: contains title, text, the user who has posted, the location of the posting, the region of the posting
-- - Categories that each post belongs to


-- from the terminal run:
-- psql < craigslist.sql

DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE region(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
)


CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    encrypted_password VARCHAR(50),
    preferred_region INTEGER REFERENCES region
)


CREATE TABLE categories(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
)

CREATE TABLE posts(
    id SERIAL PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    text TEXT NOT NULL,
    location VARCHAR(50) NOT NULL,
    user_id INTEGER REFERENCES users,
    region_id INTEGER REFERENCES region
    category_id INTEGER REFERENCES category
)


-- Insert regions
INSERT INTO region (name) VALUES ('San Francisco');
INSERT INTO region (name) VALUES ('Atlanta');
INSERT INTO region (name) VALUES ('Seattle');

-- Insert users
INSERT INTO users (username, encrypted_password, preferred_region) VALUES ('johnDoe', 'password123', 1);
INSERT INTO users (username, encrypted_password, preferred_region) VALUES ('janeDoe', 'securePass', 2);

-- Insert categories
INSERT INTO categories (name) VALUES ('Electronics');
INSERT INTO categories (name) VALUES ('Cars');

-- Insert posts
INSERT INTO posts (title, text, location, user_id, region_id, category_id) VALUES ('Selling iPhone 12', 'Brand new iPhone 12 for sale. Contact me for details.', 'San Francisco', 1, 1, 1);
INSERT INTO posts (title, text, location, user_id, region_id, category_id) VALUES ('Used Car for Sale', '2010 Honda Civic in good condition. Price negotiable.', 'Atlanta', 2, 2, 2);
