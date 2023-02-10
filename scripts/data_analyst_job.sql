-- The dataset for this exercise has been derived from the `Indeed Data Scientist/Analyst/Engineer` [dataset](https://www.kaggle.com/elroyggj/indeed-dataset-data-scientistanalystengineer) on kaggle.com. 

-- Before beginning to answer questions, take some time to review the data dictionary and familiarize yourself with the data that is contained in each column.

-- #### Provide the SQL queries and answers for the following questions/tasks using the data_analyst_jobs table you have created in PostgreSQL:

-- 1.	How many rows are in the data_analyst_jobs table?
select count(*)
From data_analyst_jobs;
--1793 rows. 
-- 2.	Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?
Select *
From data_analyst_jobs
Limit 10;
-- 3.	How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?
select count(*)
from data_analyst_jobs
Where location= 'TN';
-- 4.	How many postings in Tennessee have a star rating above 4?
select *
from data_analyst_jobs
Where location ='TN' AND star_rating > 4;
-- 5.	How many postings in the dataset have a review count between 500 and 1000?
select *
from data_analyst_jobs
where review_count
between 500 AND 1000;
-- 6.	Show the average star rating for companies in each state. The output should show the state as `state` and the average rating for the state as `avg_rating`. Which state shows the highest average rating?
select 
location,
AVG(star_rating) AS Avg_Rating
from data_analyst_jobs
group by location
order by AVG_rating Desc;
-- 7.	Select unique job titles from the data_analyst_jobs table. How many are there?
select distinct title
from data_analyst_jobs;
-- 8.	How many unique job titles are there for California companies?
select title
from data_analyst_jobs
Where location ='CA';
-- 9.	Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. How many companies are there with more that 5000 reviews across all locations?
Select 
company,
AVG(star_rating) AS Avg_rating
from data_analyst_jobs
WHERE review_count >5000
group by company ;
-- 10.	Add the code to order the query in #9 from highest to lowest average star rating. Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?
Select 
company,
AVG(star_rating) AS Avg_rating
from data_analyst_jobs
WHERE review_count >5000
group by company
order by AVG_rating desc;
-- 11.	Find all the job titles that contain the word ‘Analyst’. How many different job titles are there? 
select title
from data_analyst_jobs
where title like '%Analyst%';
-- 12.	How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? What word do these positions have in common?
select title
from data_analyst_jobs
where title NOT LIKE '%Analyst%' 
-- **BONUS:**
-- You want to understand which jobs requiring SQL are hard to fill. Find the number of jobs by industry (domain) that require SQL and have been posted longer than 3 weeks. 
--  - Disregard any postings where the domain is NULL. 
--  - Order your results so that the domain with the greatest number of `hard to fill` jobs is at the top. 
--   - Which three industries are in the top 4 on this list? How many jobs have been listed for more than 3 weeks for each of the top 4?
