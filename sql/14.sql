/*
 * Create a report that shows the total revenue per month and year.
 *
 * HINT:
 * This query is very similar to the previous problem,
 * but requires an additional JOIN.
 */

SELECT
    EXTRACT(YEAR FROM R.rental_date) AS "Year",
    EXTRACT(MONTH FROM R.rental_date) AS "Month",
    SUM(P.amount) AS "Total Revenue"
FROM rental R
JOIN payment P ON R.rental_id = P.rental_id
GROUP BY ROLLUP(EXTRACT(YEAR FROM R.rental_date), EXTRACT(MONTH FROM R.rental_date))
ORDER BY "Year", "Month";

