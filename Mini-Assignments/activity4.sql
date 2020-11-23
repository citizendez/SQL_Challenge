SELECT
	title,
	description,
	release_year,
	replacement_cost,
	rating
FROM film
WHERE 
	rating = 'R'
ORDER BY 
	replacement_cost DESC;
	
SELECT
	title,
	description,
	release_year,
	LENGTH(description) as len_descript

FROM film
ORDER BY
	len_descript DESC
LIMIT 10	
