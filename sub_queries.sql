USE employees;

SELECT first_name, last_name, birth_date
FROM employees
WHERE emp_no IN (
	SELECT emp_no
	FROM dept_manager)
LIMIT 10;

-- Find all the employees with the same hire date as employee 101010 using a sub-query.
SELECT CONCAT(first_name, " ", last_name) AS "Employee Name", hire_date AS "Hire Date"
FROM employees
WHERE hire_date IN(
	SELECT hire_date
	FROM employees
	WHERE emp_no = '101010');
	
-- Find all the titles held by all employees with the first name Aamod.
SELECT title 
FROM titles 
WHERE emp_no IN (
	SELECT emp_no
	FROM employees
	WHERE first_name = 'Aamod');
	
-- Find all the current department managers that are female.
SELECT first_name, last_name, gender 
FROM employees 
WHERE emp_no IN (
	SELECT emp_no
	FROM dept_manager
	WHERE gender = 'F' AND to_date > now());
	
-- BONUS Find all the department names that currently have female managers.	
SELECT dept_name 
FROM departments 
WHERE dept_no IN (
	SELECT dept_no
	FROM dept_manager
	WHERE emp_no IN(
	SELECT emp_no
	FROM employees
	WHERE gender = 'F')
	AND to_date > now()
	);