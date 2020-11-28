CREATE DATABASE mflix; 
USE mflix;
CREATE TABLE IF NOT EXISTS movies(
	id_pelicula INT,
	title VARCHAR(100),
    category VARCHAR(100)
);

SELECT * FROM movies;
