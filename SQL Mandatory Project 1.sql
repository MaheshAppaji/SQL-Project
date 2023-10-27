use mavenmovies;

-- Question 1 ) Write a SQL query to count the number of characters except for the spaces for each actor.
-- 				Return the first 10 actors' name lengths along with their names.

SELECT 
	first_name, last_name,
    LENGTH(CONCAT(first_name, last_name)) AS name_length_no_spaces
FROM
    actor
LIMIT 10;


-- Question 2) List all Oscar awardees(Actors who received the Oscar award) 
-- 			   with their full names and the length of their names.

SELECT 
	CONCAT(first_name, ' ', last_name) AS actor_full_name,
    length(CONCAT(first_name, ' ', last_name)) AS name_length
FROM
	actor_award
WHERE
	awards like '%Oscar%'; -- checks whether awards Field contains Oscar
    

-- Question 3) Find the actors who have acted in the film ‘Frost Head.’

SELECT 
	a.actor_id, first_name, last_name
FROM
	actor a JOIN film_actor fa JOIN film f
    ON a.actor_id = fa.actor_id 
    AND f.film_id = fa.film_id
WHERE
	f.title LIKE 'Frost Head';

    
-- Question 4) Pull all the films acted by the actor ‘Will Wilson.’ 
   
SELECT 
	f.title
FROM
	actor a JOIN film_actor fa JOIN film f
    ON a.actor_id = fa.actor_id 
    AND f.film_id = fa.film_id
WHERE
	a.first_name = 'Will' AND a.last_name = 'Wilson';
    
    
-- Question 5) Pull all the films which were rented and return them in the month of May

SELECT 
	f.title
FROM 
	film f JOIN inventory inv JOIN rental r 
    ON f.film_id = inv.film_id
    AND inv.inventory_id = r.inventory_id
WHERE
	EXTRACT(month FROM r.rental_date) = 5 AND EXTRACT(month FROM r.return_date) = 5;
	


-- Question 6) Pull all the films with ‘Comedy’ category.

SELECT
	f.title
FROM 
	category c JOIN film_category fc JOIN film f
    ON c.category_id = fc.category_id
    AND fc.film_id = f.film_id
WHERE
	c.name LIKE 'Comedy';
    






