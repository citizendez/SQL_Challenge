/*Bonus (Optional)

Create a histogram to visualize the most common salary ranges for employees.*/
DROP VIEW IF EXISTS employee_salaries;
CREATE VIEW employee_salaries AS
SELECT
	salary
FROM salaries;

-- SELECT salary FROM salaries;
--Create a bar chart of average salary by title.
DROP VIEW IF EXISTS salary_title;
CREATE VIEW salary_title AS
SELECT
	t.title,
	AVG(s.salary) as Avg_Salary
FROM 
	employees e
	INNER JOIN titles t
	ON e.emp_title_id = t.title_id
	INNER JOIN salaries s
	ON s.emp_no = e.emp_no
GROUP BY t.title;

SELECT * FROM salary_title;

/*Epilogue
employee ID number is 499942.*/
SELECT *
FROM employees
WHERE emp_no = 499942;