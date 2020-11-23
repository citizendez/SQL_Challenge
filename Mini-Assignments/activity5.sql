--drill 1
SELECT DISTINCT
	rating 
FROM film
ORDER BY
	rating;

--drill 2
SELECT 
	title,
	description,
	release_year,
	rating
FROM film
WHERE rating in('R', 'NC-17') 
ORDER BY
	title;
	
--drill 3
SELECT 
	title,
	description,
	release_year,
	rating,
	replacement_cost
	
FROM film
WHERE rating = 'R' AND replacement_cost BETWEEN 20 AND 30
ORDER BY
	replacement_cost DESC,
	title;
	
--drill 4
SELECT 
	title,
	description,
	release_year,
	rating,
	replacement_cost
	
FROM film
WHERE LOWER(title) LIKE '%thrilling%'
ORDER BY
	title;