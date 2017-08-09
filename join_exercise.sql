USE employees;


-- WRITE a QUERY that shows EACH department along WITH the NAME of the current manager FOR that department.
SELECT d.dept_name AS "Department Name", CONCAT(e.first_name, ' ', e.last_name) AS "Department Manager"
FROM employees AS e
JOIN dept_manager AS dm
ON dm.emp_no = e.emp_no
JOIN departments AS d
ON d.dept_no = dm.dept_no
WHERE dm.to_date = '9999-01-01'
-- Find the name of all departments currently managed by women.
AND e.gender = 'F';

-- Find the current titles of employees currently working in the Customer Service department.
SELECT t.title AS Title, COUNT(t.title) AS Total
FROM employees AS e
JOIN dept_emp AS de
	ON e.emp_no = de.emp_no
JOIN departments AS d
	ON de.dept_no = d.dept_no
JOIN titles AS t 
	ON e.emp_no = t.emp_no
WHERE d.dept_name = 'Customer Service'
	AND de.to_date = '9999-01-01'
	AND t.to_date = '9999-01-01'
GROUP BY title;

-- Find the current salary of all current managers.
SELECT d.dept_name AS 'Department Name', CONCAT(e.first_name, ' ', e.last_name) AS 'Name', s.salary AS 'Salary'
FROM departments AS d 
JOIN dept_manager AS dm
	ON d.dept_no = dm.dept_no
JOIN employees AS e
	ON dm.emp_no = e.emp_no
JOIN salaries AS s
	ON e.emp_no = s.emp_no
WHERE dm.to_date = '9999-01-01' AND s.to_date = '9999-01-01';

-- Bonus Find the names of all current employees, their department name, and their current manager's name.
SELECT CONCAT(e.first_name, ' ', e.last_name) AS 'Employee Name', d.dept_name AS 'Department Name', CONCAT(dme.first_name, ' ', dme.last_name) AS 'Manager Name'
FROM employees AS e
JOIN dept_emp AS de
	ON e.emp_no = de.emp_no
JOIN departments AS d
	ON de.dept_no = d.dept_no 
JOIN dept_manager AS dm 
	ON d.dept_no = dm.dept_no
JOIN employees AS dme
	ON dm.emp_no = dme.emp_no
WHERE de.to_date = '9999-01-01' AND dm.to_date = '9999-01-01';

 
