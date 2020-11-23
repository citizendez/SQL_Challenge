select title, description, release_year
from film
order by title


/*

select distinct title, description, release_year, rating, replacement_cost
from film
where LOWER(description) like '%thrilling%'  
order by title


select distinct title, description, release_year, rating, replacement_cost
from film
where rating = 'R'
and replacement_cost BETWEEN 20 and 30
order by title

;

select distinct title, description, release_year, rating
from film
where rating in ('R','NC-17')
order by title
;

select distinct rating
from film
order by rating
;

select title, description, release_year, LENGTH(description)
from film
order by LENGTH(description) desc 
LIMIT 10 
;

select title, description, release_year, replacement_cost
from film
where rating = 'R' 
LIMIT 20 
;  

select  CONCAT( first_name, ' ' ,  last_name) as full_name
from actor
order by first_name, last_name
; 

select  CONCAT( first_name, ' ' ,  last_name) as full_name, email, username
from staff
order by first_name, last_name 
; 

select title, description, release_year
from film
order by title

*/