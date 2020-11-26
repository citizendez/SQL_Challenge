/*
** Describe the different types of join clauses supported in SQL

INNER JOIN: for each row an inner join takes only matching values based on the joined columns

LEFT JOIN: returns all the records from left table and takes matched records
from right, and umatched will be null

RIGHT JOIN: returns all the records from right table and takes matched records
from the left.

FULL OUTER JOIN: returns records that don't match, or to say it another way, this is used when neither 
table has matching values

PART 2
ANSWER is they used a left joint to combine tables

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

/*
DRILL 3 DML & DDL
PART 1
What is the difference between DML and DDL in SQL?
DML: data manipulation languge. Updates the data itself
DDL: data definition language. Defines the structure(ie. columns, tables, data types)

PART 2
Demonstrate a use of DML in the following table:
**adding a record, delet a record, update a record*/
CREATE TABLE vendor_table (
  ID SERIAL PRIMARY KEY,
  vendor_name VARCHAR(30) NOT NULL,
  vendor_country VARCHAR(10) NOT NULL);

INSERT INTO vendor_table  (vendor_name, vendor_country)
VALUES ('Carlton', 'Turkey'),
  ('Cascade Yarns', 'USA'),
  ('Debbie Bliss', 'England'),
  ('Tahki', 'Greece');
  
--update a value	
UPDATE vendor_table
SET vendor_name = 'Desire'
WHERE id = 2;

--delete a row
DELETE FROM vendor_table
WHERE id = 2;

--add a record
INSERT INTO vendor_table(vendor_name, vendor_country)
VALUES 
  ('Desiree Rules', 'USA'),
  ('Another Row', 'LaLa Land');

SELECT *
FROM vendor_table


/*
DRILL 4 Duplicates
PART 1
How do you locate a duplicate record with one field? 
Using the table below, write a query to demonstrate.*/
CREATE TABLE yarn_table (
  ID SERIAL PRIMARY KEY,
  yarn_name VARCHAR(30) NOT NULL,
  yarn_type VARCHAR(10) NOT NULL,
  grams INT,
  color VARCHAR(20) NOT NULL,
  lot INT,
  qty INT,
  vendor_id INT);

INSERT INTO yarn_table  (yarn_name, yarn_type, grams, color, lot, qty, vendor_id )
VALUES ('Merino Supreme', 'Worsted', 50, 8, 76123, 1, 1),
  ('Cartwheel', 'Bulky', 200, 2, 1801, 2, 2),
  ('Paloma Tweed', 'Sup Bulky', 50, 42513, 63978, 2, 3),
  ('Heritage', 'Sock', 100, 5640, 1707058, 1, 2),
  ('Heritage', 'Sock', 100, 5640, 1707058, 1, 2),
  ('Carwheel', 'Bulky', 200, 2, 1801, 2, 2);
 
 UPDATE yarn_table
 SET yarn_name = 'Cartwheel'
 WHERE yarn_name = 'Carwheel'
 
 SELECT *
 FROM yarn_table
  
--locate record with single field
SELECT COUNT(yarn_name)
FROM yarn_table;

SELECT yarn_name, COUNT(vendor_id)
FROM yarn_table
GROUP BY yarn_name HAVING COUNT (vendor_id )> 1;
/*
PART 2
how do you find duplicate records using more than one field?*/
SELECT yarn_name, vendor_id, COUNT(*)
FROM yarn_table
GROUP BY yarn_name, vendor_id HAVING COUNT (* )> 1;

/*DRILL 5 GROUPBY
-The below are a pandas data frame preview and a query for the total duration 
(in seconds) of UFO sightings by state, respectively.
-What is an equivalent SQL query? Instead of the sum, find the mean duration by state.*/


--ANSWER: if i had access to the database this is the query I would have run to run an equivialant SQL query 
--fo find the mean duration by state.
SELECT 
	state,
	AVG(duration)
FROM ufo_by_state
GROUP BY state;