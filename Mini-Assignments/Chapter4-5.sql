/* Exercise 4-1
Which of the transaction IDs would be returned by the following filter conditions?
txn_date < '2005-02-26' AND (txn_type_cd = 'DBT' OR amount > 100) */
1, 2, 3, 5, 6,7


/* Exercise 4-2
Which of the transaction IDs would be returned by the following filter conditions?
account_id IN (101,103) AND NOT (txn_type_cd = 'DBT' OR amount > 100) */
4, 9
WHERE account_id IN (101,103) AND NOT (txn_type_cd = 'DBT' OR amount > 100);

/* Exercise 4-3
Construct a query that retrieves all accounts opened in 2002. */
SELECT 
	account_id, Open_date
FROM 
	account
WHERE open_date BETWEEN '2002-01-01' AND '2002-12-31'; 

/* Exercise 4-4
Construct a query that finds all nonbusiness customers whose last name contains an
a in the second position and an e anywhere after the a. */
SELECT
	cust_id,
	lname,
	fname
FROM individual
WHERE
	lname LIKE '_a%e%'
	
/* Exercise 5-1
Fill in the blanks (denoted by <#>) for the following query to obtain the results that
follow: */
SELECT e.emp_id, e.fname, e.lname, b.name
FROM employee e INNER JOIN branch b
ON e.assigned_branch_id = b.branch_id;

/*Exercise 5-2
Write a query that returns the account ID for each nonbusiness customer
(customer.cust_type_cd = 'I') with the customer’s federal ID (customer.fed_id) and
the name of the product on which the account is based (product.name).*/
SELECT 
	a.account_ID,
	c.fed_id,
	p.name
FROM account a INNER JOIN customer c
ON a.cust_id = c.cust_id
INNER JOIN product p
ON a.product_cd = p.product_cd
WHERE c.cust_type_cd = 'I';

/* Exercise 5-3
Construct a query that finds all employees whose supervisor is assigned to a different
department. Retrieve the employees’ ID, first name, and last name. */
SELECT
	e.emp_id,
	e.fname,
	e.lname,  
	sup.fname,
	sup.lname,
	e.dept_id,
	sup.dept_id
FROM employee e INNER JOIN employee sup
ON e.superior_emp_id = sup.emp_id
WHERE e.dept_id != sup.dept_id;
