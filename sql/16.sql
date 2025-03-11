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
    rank() OVER (ORDER BY revenue DESC) AS rank,
    title,
    revenue
FROM (
    SELECT F.title, COALESCE(SUM(p.amount), 0.00) AS revenue
    FROM film AS F
    LEFT JOIN inventory AS I ON F.film_id = I.film_id
    LEFT JOIN rental AS R ON I.inventory_id = R.inventory_id
    LEFT JOIN payment AS P ON R.rental_id = P.rental_id
    GROUP BY F.title
) AS film_revenue
ORDER BY rank, title;

