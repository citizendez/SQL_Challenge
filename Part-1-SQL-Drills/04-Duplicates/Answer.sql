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
