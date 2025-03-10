/*
 * Compute the total revenue for each film.
 * The output should include a new column "rank" that shows the numerical rank
 *
 * HINT:
 * You should use the `rank` window function to complete this task.
 * Window functions are conceptually simple,
 * but have an unfortunately clunky syntax.
 * You can find examples of how to use the `rank` function at
 * <https://www.postgresqltutorial.com/postgresql-window-function/postgresql-rank-function/>.
 */

SELECT 
    RANK() OVER (ORDER BY SUM(CASE WHEN P.amount IS NULL THEN 0.0 ELSE P.amount END) DESC) AS "rank",
    F.title,
    SUM(CASE WHEN P.amount IS NULL THEN 0.0 ELSE P.amount END) AS "revenue"
FROM film F
LEFT JOIN inventory I ON F.film_id = I.film_id
LEFT JOIN rental R ON I.inventory_id = R.inventory_id
LEFT JOIN payment P ON R.rental_id = P.rental_id
GROUP BY F.title
ORDER BY "revenue" DESC, title ASC;

