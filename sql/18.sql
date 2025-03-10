/*
 * Compute the total revenue for each film.
 * The output should include another new column "revenue percent" that shows the percent of total revenue that comes from the current film and all previous films.
 * That is, the "revenue percent" column is 100*"total revenue"/sum(revenue)
 *
 * HINT:
 * The `to_char` function can be used to achieve the correct formatting of your percentage.
 * See: <https://www.postgresql.org/docs/current/functions-formatting.html#FUNCTIONS-FORMATTING-EXAMPLES-TABLE>
 */

SELECT
    RANK() OVER (ORDER BY SUM(CASE WHEN P.amount IS NULL THEN 0.0 ELSE P.amount END) DESC) AS "rank",
    F.title,
    SUM(CASE WHEN P.amount IS NULL THEN 0.0 ELSE P.amount END) AS revenue,
    SUM(SUM(CASE WHEN P.amount IS NULL THEN 0.0 ELSE P.amount END))
        OVER (ORDER BY SUM(CASE WHEN P.amount IS NULL THEN 0.0 ELSE P.amount END) DESC) AS "total revenue",
    TO_CHAR(
        100 * SUM(SUM(CASE WHEN P.amount IS NULL THEN 0.0 ELSE P.amount END))    
        OVER (ORDER BY SUM(CASE WHEN P.amount IS NULL THEN 0.0 ELSE P.amount END) DESC)
        / SUM(SUM(CASE WHEN P.amount IS NULL THEN 0.0 ELSE P.amount END)) OVER (),
    'FM990.00'
    ) AS "revenue percent"
FROM film F
LEFT JOIN inventory I ON F.film_id = I.film_id
LEFT JOIN rental R ON I.inventory_id = R.inventory_id
LEFT JOIN payment P ON R.rental_id = P.rental_id
GROUP BY F.title
ORDER BY revenue DESC, title ASC;

