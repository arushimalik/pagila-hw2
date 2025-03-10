/*
 * Compute the total revenue for each film.
 * The output should include another new column "total revenue" that shows the sum of all the revenue of all previous films.
 *
 * HINT:
 * My solution starts with the solution to problem 16 as a subquery.
 * Then I combine the SUM function with the OVER keyword to create a window function that computes the total.
 * You might find the following stackoverflow answer useful for figuring out the syntax:
 * <https://stackoverflow.com/a/5700744>.
 */

SELECT
    RANK() OVER (ORDER BY SUM(CASE WHEN P.amount IS NULL THEN 0.0 ELSE P.amount END) DESC) AS "rank",
    F.title,
    SUM(CASE WHEN P.amount IS NULL THEN 0.0 ELSE P.amount END) AS "revenue",
    SUM(SUM(CASE WHEN P.amount IS NULL THEN 0.0 ELSE P.amount END))
        OVER (ORDER BY SUM(CASE WHEN P.amount IS NULL THEN 0.0 ELSE P.amount END) DESC) AS "total revenue"
FROM film F
LEFT JOIN inventory I ON F.film_id = I.film_id
LEFT JOIN rental R ON I.inventory_id = R.inventory_id
LEFT JOIN payment P ON R.rental_id = P.rental_id
GROUP BY F.title
ORDER BY "revenue" DESC, title ASC;

