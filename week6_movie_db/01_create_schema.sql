-- 01_create_schema.sql  (Forward Engineer çalışmazsa yedek)
DROP SCHEMA IF EXISTS movie_db;
CREATE SCHEMA movie_db DEFAULT CHARACTER SET utf8mb4;
USE movie_db;

CREATE TABLE countries (
  country_id TINYINT NOT NULL,
  country_name VARCHAR(20) NOT NULL,
  PRIMARY KEY (country_id));

CREATE TABLE movies (
  movie_id TINYINT NOT NULL,
  title VARCHAR(90) NOT NULL,
  ranking TINYINT NOT NULL,
  rating FLOAT NOT NULL,
  year YEAR NOT NULL,
  votes MEDIUMINT NOT NULL,
  duration SMALLINT NOT NULL,
  oscars TINYINT NULL,
  budget INT NOT NULL,
  PRIMARY KEY (movie_id));

CREATE TABLE directors (
  director_id TINYINT NOT NULL,
  country_id TINYINT NOT NULL,
  director_name VARCHAR(45) NOT NULL,
  PRIMARY KEY (director_id),
  CONSTRAINT fk_directors_countries1 FOREIGN KEY (country_id) REFERENCES countries (country_id));

CREATE TABLE stars (
  star_id SMALLINT NOT NULL,
  country_id TINYINT NOT NULL,
  star_name VARCHAR(45) NOT NULL,
  PRIMARY KEY (star_id),
  CONSTRAINT fk_stars_countries1 FOREIGN KEY (country_id) REFERENCES countries (country_id));

CREATE TABLE movie_directors (
  movie_id TINYINT NOT NULL,
  director_id TINYINT NOT NULL,
  PRIMARY KEY (movie_id, director_id),
  CONSTRAINT fk_movie_directors_movies1 FOREIGN KEY (movie_id) REFERENCES movies (movie_id),
  CONSTRAINT fk_movie_directors_directors1 FOREIGN KEY (director_id) REFERENCES directors (director_id));

CREATE TABLE movie_stars (
  movie_id TINYINT NOT NULL,
  star_id SMALLINT NOT NULL,
  PRIMARY KEY (movie_id, star_id),
  CONSTRAINT fk_movie_stars_movies1 FOREIGN KEY (movie_id) REFERENCES movies (movie_id),
  CONSTRAINT fk_movie_stars_stars1 FOREIGN KEY (star_id) REFERENCES stars (star_id));

CREATE TABLE producer_countries (
  movie_id TINYINT NOT NULL,
  country_id TINYINT NOT NULL,
  PRIMARY KEY (movie_id, country_id),
  CONSTRAINT fk_producer_countries_movies FOREIGN KEY (movie_id) REFERENCES movies (movie_id),
  CONSTRAINT fk_producer_countries_countries1 FOREIGN KEY (country_id) REFERENCES countries (country_id));

CREATE TABLE genres (
  movie_id TINYINT NOT NULL,
  genre_name VARCHAR(20) NOT NULL,
  PRIMARY KEY (movie_id, genre_name),
  CONSTRAINT fk_genres_movies1 FOREIGN KEY (movie_id) REFERENCES movies (movie_id));

CREATE TABLE languages (
  movie_id TINYINT NOT NULL,
  language_name VARCHAR(20) NOT NULL,
  PRIMARY KEY (movie_id, language_name),
  CONSTRAINT fk_languages_movies1 FOREIGN KEY (movie_id) REFERENCES movies (movie_id));
