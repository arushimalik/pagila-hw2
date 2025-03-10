/*
 * Select the titles of all films that the customer with customer_id=1 has rented more than 1 time.
 *
 * HINT:
 * It's possible to solve this problem both with and without subqueries.
 */

SELECT F.title
FROM film F
JOIN inventory I ON F.film_id = I.film_id 
JOIN rental R ON I.inventory_id = R.inventory_id
WHERE R.customer_id = 1
GROUP BY F.title
HAVING COUNT(r.rental_id) > 1;
