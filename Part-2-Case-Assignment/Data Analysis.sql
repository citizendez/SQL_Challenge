/*Data Analysis
List the following details of each employee: 
employee number, last name, first name, sex, and salary.*/
SELECT 
  e.emp_no,
  e.last_name,
  e.first_name,
  e.sex,
  s.salary
FROM
	employees e
	INNER JOIN salaries s
	ON e.emp_no = s.emp_no;


--List first name, last name, and hire date for employees who were hired in 1986.
SELECT 
  first_name,
  last_name,
  hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = '1986';

--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.
SELECT
	d.dept_no,
	d.dept_name,
	dm.emp_no,
	e.last_name,
	e.first_name
FROM
	departments d
	INNER JOIN dept_manager dm
	ON d.dept_no = dm.dept_no
	INNER JOIN employees e
	ON dm.emp_no = e.emp_no;

--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
SELECT
	de.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM
	departments d
	INNER JOIN dept_emp de
	ON d.dept_no = de.dept_no
	INNER JOIN employees e
	ON de.emp_no = e.emp_no;
	
--List first name, last name, and sex for employees whose 
--first name is "Hercules" and last names begin with "B."
SELECT
  first_name,
  last_name,
  sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--List all employees in the Sales department, including their 
--employee number, last name, first name, and department name.
--checked to confirm managers are in the dept_emp mapping table
SELECT *
FROM dept_manager LIMIT 5

SELECT *
FROM dept_emp
WHERE emp_no = 110022

SELECT
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM
	departments d
	INNER JOIN dept_emp de
	ON d.dept_no = de.dept_no
	INNER JOIN employees e
	ON e.emp_no = de.emp_no
WHERE d.dept_no = 'd007';

--List all employees in the Sales and Development departments, including their 
--employee number, last name, first name, and department name.
SELECT
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM
	departments d
	INNER JOIN dept_emp de
	ON d.dept_no = de.dept_no
	INNER JOIN employees e
	ON e.emp_no = de.emp_no
WHERE d.dept_no IN ('d007','d005');

SELECT * FROM departments

--In descending order, list the frequency count of employee last names, i.e., 
--how many employees share each last name.
SELECT 
	COUNT(last_name),
	last_name
FROM
	employees
GROUP BY last_name
ORDER BY last_name DESC;

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

