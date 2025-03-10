/*
 * Compute the total revenue for each film.
 */

SELECT F.title,
       COALESCE(SUM(P.amount), 0.0) AS "revenue"
FROM film F
LEFT JOIN inventory I ON F.film_id = I.film_id
LEFT JOIN rental R ON I.inventory_id = R.inventory_id
LEFT JOIN payment P ON R.rental_id = P.rental_id
GROUP BY F.title
ORDER BY "revenue" DESC, title ASC;

