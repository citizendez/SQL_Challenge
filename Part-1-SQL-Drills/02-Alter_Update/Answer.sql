/*
DRILL 2 ALTER vs. UPDATE
PART 1
Explain the difference between alter and update in SQL statements.
ANSWER:
Alter is a definition language command - allows you to modify the data structure(tables, columns, constraints, data types)
Update is data manipulation language command - allows you to modify data in a table

PART 2
You are given the following table:*/

CREATE TABLE department (
  employee_id  INT,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(10) NOT NULL,
  department_id INT);

INSERT INTO department (employee_id, first_name, last_name, department_id)
VALUES (3, 'Chris', 'Christian', 25),
  (14, 'Jan', 'Jansson', 45),
  (17, 'Sam', 'Samuels', 45);
  
/*Change the name of the column from department_id to dept_id.*/
ALTER TABLE department
RENAME COLUMN department_id TO dept_id;


--Add a column named annual_salary to the table.
ALTER TABLE department
ADD COLUMN annual_salary NUMERIC(6,2) ;

SELECT *
FROM department
