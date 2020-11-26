/*Bonus (Optional)

Create a histogram to visualize the most common salary ranges for employees.*/
DROP VIEW IF EXISTS employee_salaries;
CREATE VIEW employee_salaries AS
SELECT
	salary
FROM salaries;