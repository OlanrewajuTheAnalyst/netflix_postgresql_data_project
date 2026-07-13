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

## Exploring the Data Set
```sql
SELECT * FROM netflix_titles;

SELECT 
COUNT(*) AS total_content
FROM netflix_titles;

SELECT 
DISTINCT TYPE
FROM netflix_titles
```

## The 15 Business Problems and their Solutions

### 1.		Count the number of Movies vs TV Shows
```sql
SELECT 
	type,
	COUNT(*) AS total_content
FROM netflix_titles
GROUP BY type;
```
**Objective:**
Determine the total number of Movies and TV Shows available in the Netflix dataset to understand the distribution of content by type.

### 2.		Find the most common rating for movies and TV shows (Using a Window Function especially RANK())
```sql
SELECT
	type,
	rating
FROM
(
SELECT 
	type,
	rating,
	COUNT(*),
RANK() OVER(PARTITION BY type ORDER BY COUNT(*)DESC) AS ranking
FROM netflix_titles
GROUP BY 1,2
) AS t1
 WHERE 
 	ranking = 1;
```
**Objective:**
Identify the most common content rating for Netflix Movies and TV Shows by analyzing the frequency of each rating category. This query uses the `RANK()` window function to rank ratings within each content type and determine the highest-occurring rating for Movies and TV Shows.

### 3. List all movies released in a specific year (e.g., 2020)
-- Filter 2020
-- movies
```sql
SELECT *
FROM netflix_titles
WHERE type = 'Movie'
AND release_year = 2020
```

### 4. Find the top 5 countries with the most content on Netflix.
```sql
SELECT 
	UNNEST (STRING_TO_ARRAY(country, ',')) AS new_country,
	COUNT(show_id) AS total_content
FROM netflix_titles
GROUP BY 1
ORDER BY total_content DESC
LIMIT 5


--SELECT 
--	country,
--	COUNT(show_id) AS total_content
--FROM netflix_titles
--GROUP BY 1
--ORDER BY total_content DESC
--LIMIT 5
```

### 5. Identify the longest movie or TV show duration
```sql
SELECT *
FROM netflix_titles
WHERE 
	type = 'Movie'
AND duration = (SELECT MAX(duration) FROM netflix_titles)
```

### 6. Find content added in the last 5 years
```sql
SELECT 
	*,
	TO_DATE(date_added, 'Month DD, YYYY')
FROM netflix_titles
WHERE 
	date_added >= CURRENT_DATE - INTERVAL '5 years'

SELECT CURRENT_DATE - INTERVAL '5 years' 


SELECT * FROM netflix_titles
WHERE 
	TO_DATE(date_added, 'Month DD, YYYY') >= CURRENT_DATE - INTERVAL '5 years'
```

### 7. Find all the movies/TV shows by director 'Rajiv Chilaka'
```sql
SELECT * FROM netflix_titles
WHERE director ILIKE '%Rajiv Chilaka%'
```

### 8. List all TV shows with more than 5 seasons
```sql
SELECT *,
	SPLIT_PART(duration,' ',1) AS sessions
FROM netflix_titles
WHERE 
	type ='TV Show'
	AND
	SPLIT_PART(duration,' ',1)::numeric > 5 
```

### 9. Count the number of content items in each genre.
```sql
SELECT 
	UNNEST(STRING_TO_ARRAY(listed_in, ',')) AS genre,
	COUNT(show_id) AS total_content
FROM netflix_titles
GROUP BY 1
```

### 10. Find each year and the average number of content release by india on Netflix, return top 5 year with highest avg content release
```sql
SELECT 
	EXTRACT(YEAR FROM TO_DATE(date_added,'Month DD, YYYY')) AS YEAR,
	COUNT(*) yearly_content,
	ROUND(
	COUNT(*)::numeric/(SELECT COUNT(*) FROM netflix_titles WHERE country = 'India')::numeric * 100
	,2) AS avg_content_per_year
FROM netflix_titles
WHERE country = 'India'
GROUP BY 1
```

### 11. List all movies that are documentaries
```sql
SELECT * FROM netflix_titles
WHERE 
	listed_in ILIKE '%documentaries%'
```

### 12. Find all content without a director
```sql
SELECT * FROM netflix_titles
WHERE 
	director IS NULL
```

### 13. Find how many movies actor 'Salman Khan' appeared in during the last 10 years
```sql
SELECT * FROM netflix_titles
WHERE 
	casts ILIKE '%Salman Khan%'
	AND release_year > EXTRACT(YEAR FROM CURRENT_DATE) - 10
```

### 14. Find the top 10 actors who have appeared in the highest number of movies produced in India
```sql
SELECT 
UNNEST(STRING_TO_ARRAY(casts, ',')) actors,
COUNT(*) total_content
FROM netflix_titles
WHERE country ILIKE '%india'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10
```

### 15. Categorize the content based on the presence of the keywords 'kill' and 'violence' in 
the description field. Label content containing these keywords as 'Bad' and all other 
content as 'Good'. Count how many items fall into each category
```sql
SELECT * 
FROM netflix_titles
	WHERE 
		description ILIKE '%kill%'
		OR description ILIKE '%violence%'

WITH new_table
AS
(
SELECT *,
	CASE 
	WHEN description ILIKE '%kill%' 
	OR description ILIKE '%violence%' THEN 'Bad_Content'
	ELSE 'Good Content'
	END category
FROM netflix_titles
)
SELECT 
	category,
	COUNT(*) AS total_content
FROM new_table
GROUP BY 1
```



