/*
 * A group of social scientists is studying American movie watching habits.
 * To help them, select the titles of all films that have never been rented by someone who lives in the United States.
 *
 * NOTE:
 * Not every film in the film table is available in the store's inventory,
 * and you should only return films in the inventory.
 *
 * NOTE:
 * This can be solved by either using a LEFT JOIN or by using the NOT IN clause and a subquery.
 * For this problem, you should use the NOT IN clause;
 * in problem 07b you will use the LEFT JOIN clause.
 *
 * NOTE:
 * This is the last problem that will require you to use a particular method to solve the query.
 * In future problems, you may choose whether to use the LEFT JOIN or NOT IN clause if they are more applicable.
 */

SELECT DISTINCT F.title 
FROM film F
JOIN inventory I ON F.film_id = I.film_id
WHERE F.film_id NOT IN (
    SELECT DISTINCT I.film_id
    FROM inventory I
    JOIN rental R ON I.inventory_id = R.inventory_id
    JOIN customer C ON R.customer_id = C.customer_id
    JOIN address A ON C.address_id = A.address_id
    JOIN city CI ON A.city_id = CI.city_id
    JOIN country CO ON CI.country_id = CO.country_id
    WHERE CO.country = 'United States'
    AND I.film_id IS NOT NULL
)
ORDER BY F.title;
