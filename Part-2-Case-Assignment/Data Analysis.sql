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
As you examine the data, you are overcome with a creeping suspicion that the dataset is fake. 
You surmise that your boss handed you spurious data in order to test the data engineering skills of a 
new employee. To confirm your hunch, you decide to take the following steps to generate a visualization 
of the data, with which you will confront your boss:

Import the SQL database into Pandas. (Yes, you could read the CSVs directly in Pandas, but you are, after 
all, trying to prove your technical mettle.) This step may require some research. 
Feel free to use the code below to get started. Be sure to make any necessary modifications for your 
username, password, host, port, and database name:

from sqlalchemy import create_engine
engine = create_engine('postgresql://localhost:5432/<your_db_name>')
connection = engine.connect()
Consult SQLAlchemy documentation for more information.

If using a password, do not upload your password to your GitHub repository. See https://www.youtube.com/watch?v=2uaTPmNvH0I and https://help.github.com/en/github/using-git/ignoring-files for more information.

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
Evidence in hand, you march into your boss's office and present the visualization. 
With a sly grin, your boss thanks you for your work. On your way out of the office, 
you hear the words, "Search your ID number." You look down at your badge to see that your 
employee ID number is 499942.*/
SELECT *
FROM employees
WHERE emp_no = 499942;

/*Submission
Create an image file of your ERD.

Create a .sql file of your table schemata.

Create a .sql file of your queries.

(Optional) Create a Jupyter Notebook of the bonus analysis.

Create and upload a repository with the above files to GitHub and post a link on BootCamp Spot.

Ensure your repository has regular commits (i.e. 20+ commits) and a thorough README.md file