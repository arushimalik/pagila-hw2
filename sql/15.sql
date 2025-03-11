/*
 * Compute the total revenue for each film.
 */

SELECT F.title, COALESCE(R.revenue, 0.00) AS "revenue"
FROM film AS F
LEFT JOIN (
    SELECT I.film_id, SUM(P.amount) AS revenue
    FROM inventory AS I
    LEFT JOIN rental AS R ON I.inventory_id = R.inventory_id
    LEFT JOIN payment AS P ON R.rental_id = P.rental_id
    GROUP BY I.film_id
) AS R ON F.film_id = R.film_id
ORDER BY
    CASE WHEN COALESCE(R.revenue, 0.00) = 0 THEN 1 ELSE 0 END,
    COALESCE(R.revenue, 0.00) DESC,
    F.title;

