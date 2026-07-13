# Netflix Movies and TV Shows Analysis with PostgreSQL

![Netflix Logo](https://github.com/OlanrewajuTheAnalyst/netflix_postgresql_data_project/blob/main/download.png)

## Introduction

This project presents an exploratory analysis of Netflix's movies and TV shows dataset using SQL. The purpose of the analysis is to examine the platform's content library, identify meaningful trends, and answer a series of business-related questions through SQL queries. By working with real-world data, this project highlights how SQL can be used to transform raw information into valuable insights.

## Project Objectives
The main goals of this analysis include:
-  Comparing the number of movies and TV shows available on Netflix.
-  Identifying the most common content ratings across different content types.
-  Analyzing content by release year, country of origin, and duration.
-  Exploring genre distribution and keyword-based content classification.
-  Answering business questions using SQL queries and interpreting the results.

## Dataset

The analysis is based on the Netflix Movies and TV Shows dataset available on Kaggle. The dataset contains information such as title, content type, director, cast, country, release year, rating, duration, genre, and description.

## Dataset Source: Kaggle – Netflix Movies and TV Shows Dataset


### Create the Netflix Table

```sql
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
```
**Objective:**
Create a structured table in PostgreSQL to store the Netflix Movies and TV Shows dataset. The script first removes any existing `netflix_titles` table to prevent conflicts, then creates a new table with columns matching the dataset's attributes.










