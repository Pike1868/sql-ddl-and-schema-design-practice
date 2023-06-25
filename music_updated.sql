-- from the terminal run:
-- psql < music_updated.sql

DROP DATABASE IF EXISTS music_updated;

CREATE DATABASE music_updated;

\c music_updated


CREATE TABLE artists(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
)


CREATE TABLE albums(
    id SERIAL PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    release_date DATE NOT NULL
)

CREATE TABLE producers(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
)

CREATE TABLE songs(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  primary_artist_id INTEGER REFERENCES artists,
  album_id INTEGER REFERENCES albums,
  producers_id INTEGER REFERENCES producers
);

CREATE TABLE songs_featured_artists(
    song_id INTEGER REFERENCES songs,
    artist_id INTEGER REFERENCES artists,
    PRIMARY KEY( song_id, artist_id)
)


-- Insert Artists
INSERT INTO artists (name) VALUES ('Lady Gaga');
INSERT INTO artists (name) VALUES ('Bradley Cooper');
INSERT INTO artists (name) VALUES ('Queen');
INSERT INTO artists (name) VALUES ('Bohemian Rhapsody Producer');

-- Insert Albums
INSERT INTO albums (title, release_date) VALUES ('A Star Is Born', '2018-10-05');
INSERT INTO albums (title, release_date) VALUES ('A Night at the Opera', '1975-11-21');

-- Insert Producers
INSERT INTO producers (name) VALUES ('Benjamin Rice');
INSERT INTO producers (name) VALUES ('Roy Thomas Baker');

-- Insert Songs
-- Assuming the IDs of Lady Gaga, Bradley Cooper, A Star Is Born and Benjamin Rice are 1, 2, 1 and 1 respectively.
INSERT INTO songs (title, duration_in_seconds, album_id, primary_artist_id, producer_id)
VALUES ('Shallow', 216, 1, 1, 1);

-- Assuming the IDs of Queen, A Night at the Opera, and Roy Thomas Baker are 3, 2, and 2 respectively.
INSERT INTO songs (title, duration_in_seconds, album_id, primary_artist_id, producer_id)
VALUES ('Bohemian Rhapsody', 355, 2, 3, 2);

-- Insert Song Artists for featured artists
-- Assuming the IDs of the songs Shallow and Bohemian Rhapsody are 1 and 2 respectively.
-- Bradley Cooper is a featured artist in Shallow.
INSERT INTO song_artists (song_id, artist_id) VALUES (1, 2);

-- No featured artists in Bohemian Rhapsody in this example.
