# Netflix Movies and TV Shows Analysis with PostgreSQL

![Netflix Logo](https://github.com/OlanrewajuTheAnalyst/netflix_postgresql_data_project/blob/main/download.png)

## Introduction

An exploratory analysis of Netflix's movies and TV shows dataset using PostgreSQL and SQL to uncover content trends, audience patterns, geographic distribution, and catalog characteristics.

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

**The analysis explores questions such as:**
- How many Movies vs. TV Shows are available?
- Which content ratings are most common?
- Which countries contribute the most content?
- Which genres dominate Netflix's catalog?
- How has Netflix's content library changed over time?
- Which TV shows have the most seasons?
- Which actors and directors contribute most to the catalog?
- What proportion of content falls into specific keyword-based categories?

## 📊Analysis Areas
- Content Distribution — Movies vs. TV Shows
- Ratings & Genres — Popular ratings and content categories
- Geographic Analysis — Content by country
- Time Trends — Release years and recent additions
- People Analysis — Directors and actors
- Content Characteristics — Duration and number of seasons
- Text Analysis — Keyword-based content classification

## 💡Key Findings
- Netflix's catalog contains significantly more Movies than TV Shows.
- Content is distributed across a wide range of genres, ratings, and countries.
- Country-level analysis highlights major contributors to Netflix's global catalog.
- Release-year analysis reveals how Netflix's content library has evolved over time.
- SQL text and string functions can be used to extract insights from fields containing multiple values, such as countries, genres, and cast members.

## 🛠️ SQL Techniques
PostgreSQL • Aggregations • GROUP BY • Subqueries • CTEs • Window Functions • RANK() • CASE Statements • String Functions • UNNEST() • Date Functions • ILIKE
🗄️ Data

**The analysis uses the Netflix Movies and TV Shows dataset containing information on:**
Title • Content type • Director • Cast • Country • Release year • Rating • Duration • Genre • Description

## 🔄 Analysis Workflow
Raw Dataset → PostgreSQL → Data Exploration → SQL Analysis → Business Insights

The dataset was loaded into PostgreSQL and analyzed through a series of business questions covering content distribution, trends, geography, people, genres, and text-based classification.
**📂 Repository Structure**
- data/       → Dataset
- sql/        → Analysis queries
- README.md   → Documentation

## 🚀 Outcome
Demonstrates how PostgreSQL and SQL can be used to transform a raw entertainment dataset into meaningful insights through structured business questions and analytical queries.

**The full set of SQL queries used for the analysis is available in the repository.**

### This analysis provides a comprehensive view of Netflix's content and can help inform content strategy and decision-making.
