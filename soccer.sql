-- Design a schema for a simple sports league. Your schema should keep track of

-- - All of the teams in the league
-- - All of the goals scored by every player for each game
-- - All of the players in the league and their corresponding teams
-- - All of the referees who have been part of each game
-- - All of the matches played between teams
-- - All of the start and end dates for season that a league has
-- - The standings/rankings of each team in the league (This doesn’t have to be its own table if the data can be captured somehow).

-- from the terminal run:
-- psql < soccer.sql

DROP DATABASE IF EXISTS soccer;

CREATE DATABASE soccer;

\c soccer

CREATE TABLE teams(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL
)

CREATE TABLE referees(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
)

CREATE TABLE players(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    birthday DATE NOT NULL,
    height INTEGER,
    current_team_id INTEGER REFERENCES teams
)


CREATE TABLE season(
    id SERIAL PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
)

CREATE TABLE matches(
    id SERIAL PRIMARY KEY,
    home_team_id INTEGER REFERENCES teams,
    away_team_id INTEGER REFERENCES teams,
    location VARCHAR(50),
    date DATE NOT NULL,
    start_time TIME NOT NULL,
    season_id INTEGER REFERENCES season,
    head_referee_1_id INTEGER REFERENCES referees,
    head_referee_2_id INTEGER REFERENCES referees,
    assistant_referee_1_id INTEGER REFERENCES referees,
    assistant_referee_2_id INTEGER REFERENCES referees
)

CREATE TABLE goals(
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES players,
    match_id INTEGER REFERENCES matches
)

CREATE TABLE results(
    id SERIAL PRIMARY KEY,
    goals_for INTEGER DEFAULT 0,
    goals_against INTEGER DEFAULT 0,
    team_id INTEGER REFERENCES teams,
    match_id INTEGER REFERENCES matches
);


-- Insert teams
INSERT INTO teams (name, city) VALUES ('Barcelona', 'Barcelona');
INSERT INTO teams (name, city) VALUES ('Real Madrid', 'Madrid');

-- Insert referees
INSERT INTO referees (name) VALUES ('John Doe');
INSERT INTO referees (name) VALUES ('Robert Smith');
INSERT INTO referees (name) VALUES ('Jane Doe');
INSERT INTO referees (name) VALUES ('Wendy Smith');

-- Insert players
INSERT INTO players (name, birthday, height, current_team_id) VALUES ('Lionel Messi', '1990-01-01', 180, 1);
INSERT INTO players (name, birthday, height, current_team_id) VALUES ('Rafael Marquez', '1990-02-02', 182, 1);
INSERT INTO players (name, birthday, height, current_team_id) VALUES ('Cristiano Ronaldo', '1990-03-03', 183, 2);
INSERT INTO players (name, birthday, height, current_team_id) VALUES ('Sergio Ramos', '1990-04-04', 184, 2);

-- Insert season
INSERT INTO season (start_date, end_date) VALUES ('2023-01-01', '2023-12-31');

-- Insert matches
INSERT INTO matches (home_team_id, away_team_id, location, date, start_time, season_id, head_referee_1_id, head_referee_2_id, assistant_referee_1_id, assistant_referee_2_id) VALUES (1, 2, 'Barcelona Stadium', '2023-06-01', '15:00', 1, 1, 2, 3, 4);

-- Insert goals
INSERT INTO goals (player_id, match_id) VALUES (1, 1); -- Player 1 scored a goal in match 1
INSERT INTO goals (player_id, match_id) VALUES (3, 1); -- Player 3 scored a goal in match 1

-- Insert results
INSERT INTO results (goals_for, goals_against, team_id, match_id) VALUES (1, 1, 1, 1); -- Barcelona scored 1 goal and conceded 1 goal in match 1
INSERT INTO results (goals_for, goals_against, team_id, match_id) VALUES (1, 1, 2, 1); -- Real Madrid scored 1 goal and conceded 1 goal in match 1
