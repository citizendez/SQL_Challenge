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
