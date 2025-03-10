/*
 * Management wants to send coupons to customers who have previously rented one of the top-5 most profitable movies.
 * Your task is to list these customers.
 *
 * HINT:
 * In problem 16 of pagila-hw1, you ordered the films by most profitable.
 * Modify this query so that it returns only the film_id of the top 5 most profitable films.
 * This will be your subquery.
 * 
 * Next, join the film, inventory, rental, and customer tables.
 * Use a where clause to restrict results to the subquery.
 */

SELECT DISTINCT C.customer_id
FROM customer C
JOIN rental R ON C.customer_id = R.customer_id
JOIN inventory I ON R.inventory_id = I.inventory_id
JOIN film F ON I.film_id = F.film_id
WHERE F.film_id IN (
    SELECT film_id
    FROM (
        SELECT F.film_id
        FROM film F
        JOIN inventory I ON F.film_id = I.film_id
        JOIN rental R ON I.inventory_id = R.inventory_id
        JOIN payment P ON R.rental_id = P.rental_id
        GROUP BY F.film_id
        ORDER BY SUM(P.amount) DESC
        LIMIT 5
    ) AS top_films
)
ORDER BY C.customer_id; 
