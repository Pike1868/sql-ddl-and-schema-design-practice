-- Design a schema for Craigslist! Your schema should keep track of the following

-- - The region of the craigslist post (San Francisco, Atlanta, Seattle, etc)
-- - Users and preferred region
-- - Posts: contains title, text, the user who has posted, the location of the posting, the region of the posting
-- - Categories that each post belongs to


-- from the terminal run:
-- psql < craigslist.sql

DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

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
