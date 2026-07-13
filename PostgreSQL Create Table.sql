-- A NETFLIX DATA ANALYSIS PROJECT DONE ON POSTGRESQL WITH 15 BUSINESS QUESTIONS 


DROP TABLE IF EXISTS netflix_titles;


CREATE TABLE netflix_titles
(
	show_id		VARCHAR (10),
	type		VARCHAR (15),
	title		VARCHAR (150),
	director	VARCHAR (220),
	casts		VARCHAR (1100),
	country		VARCHAR (150),
	date_added	VARCHAR (70),
	release_year	INT,
	rating		VARCHAR (20),
	duration	VARCHAR (20),
	listed_in	VARCHAR (100),
	description	VARCHAR (250)
);
