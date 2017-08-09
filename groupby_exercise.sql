USE employees;

-- use DISTINCT to find the unique titles in the titles table.
SELECT DISTINCT	title FROM titles;

-- Update the previous query to sort the results alphabetically.
SELECT DISTINCT title FROM titles GROUP BY title;

-- Find your query for employees whose last names start and end with 'E'. Update the query find just the unique last names that start and end with 'E' using GROUP BY
SELECT DISTINCT	last_name FROM employees 
	WHERE last_name LIKE 'E%E'
	GROUP BY last_name;
	
-- Update your previous query to now find unique combinations of first and last name where the last name starts and ends with 'E'. You should get 846 rows

SELECT first_name, last_name FROM employees 
	WHERE last_name LIKE 'E%E';