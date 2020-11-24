--Create departments table and read in data
DROP TABLE IF EXISTS departments;
CREATE TABLE departments (
  dept_no VARCHAR(50) PRIMARY KEY NOT NULL,
  dept_name VARCHAR(250) NULL);
  
 COPY departments(dept_no, dept_name)
 FROM 'c:\data\departments.csv' DELIMITER ',' CSV HEADER;
 
 SELECT *
 FROM departments
 
--Create titles table and read in data
DROP TABLE IF EXISTS titles;
CREATE TABLE titles (
  title_id VARCHAR(50) PRIMARY KEY NOT NULL,
  title VARCHAR(250) NULL);
  
 COPY titles(title_id, title)
 FROM 'c:\data\titles.csv' DELIMITER ',' CSV HEADER;
 
 SELECT *
 FROM titles
 
--Create epmloyees table and read in data
DROP TABLE IF EXISTS employees;
CREATE TABLE employees (
  emp_no INT PRIMARY KEY NOT NULL,
  emp_title_id VARCHAR(250),
  birth_date DATE,
  first_name VARCHAR(250) NOT NULL,
  last_name VARCHAR(250) NOT NULL,
  sex VARCHAR(10),
  hire_date DATE,
  CONSTRAINT emp_title_id_fkey FOREIGN KEY (emp_title_id) 
        REFERENCES titles(title_id)
);
  
 COPY employees(emp_no, emp_title_id, birth_date, first_name, last_name, sex, hire_date)
 FROM 'c:\data\employees.csv' DELIMITER ',' CSV HEADER;
 
 SELECT *
 FROM employees
 
 --Create dept_manager table and read in data
DROP TABLE IF EXISTS dept_manager;
CREATE TABLE dept_manager (
  dept_no VARCHAR(250) NOT NULL,
  emp_no INT NOT NULL,
  CONSTRAINT dept_no_fkey FOREIGN KEY (dept_no) 
        REFERENCES departments(dept_no),
  CONSTRAINT emp_no_fkey FOREIGN KEY (emp_no) 
        REFERENCES employees(emp_no),
  CONSTRAINT dept_manager_pkey PRIMARY KEY (emp_no, dept_no) 
);
  
 COPY dept_manager(dept_no,emp_no)
 FROM 'c:\data\dept_manager.csv' DELIMITER ',' CSV HEADER;
 
 SELECT *
 FROM dept_manager
 
 
--Create dept_emp table and read in data
DROP TABLE IF EXISTS dept_emp;
CREATE TABLE dept_emp (
  emp_no INT NOT NULL,
  dept_no VARCHAR(250) NOT NULL,
  CONSTRAINT dept_no_fkey FOREIGN KEY (dept_no) 
        REFERENCES departments(dept_no),
  CONSTRAINT emp_no_fkey FOREIGN KEY (emp_no) 
        REFERENCES employees(emp_no),
  CONSTRAINT dept_emp_pkey PRIMARY KEY (emp_no, dept_no) 
);
  
 COPY dept_emp(emp_no,dept_no)
 FROM 'c:\data\dept_emp.csv' DELIMITER ',' CSV HEADER;
 
 SELECT *
 FROM dept_emp
 
--Create salaries table and read in data
DROP TABLE IF EXISTS salaries;
CREATE TABLE salaries (
  salary_id SERIAL PRIMARY KEY,
  emp_no INT NOT NULL,
  salary INT,
  CONSTRAINT emp_no_fkey FOREIGN KEY (emp_no) 
        REFERENCES employees(emp_no)
);
  
 COPY salaries(emp_no,salary)
 FROM 'c:\data\salaries.csv' DELIMITER ',' CSV HEADER;
 
 SELECT *
 FROM salaries