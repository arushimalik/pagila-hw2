/*
 * This problem is the same as 07.sql,
 * but instead of using the NOT IN operator, you are to use a LEFT JOIN.
 */

SELECT DISTINCT F.title
FROM film F
JOIN inventory I ON F.film_id = I.film_id
WHERE F.film_id NOT IN (
    SELECT DISTINCT I.film_id
    FROM inventory I
    LEFT JOIN rental R ON I.inventory_id = R.inventory_id
    LEFT JOIN customer C ON R.customer_id = C.customer_id
    LEFT JOIN address A ON C.address_id = A.address_id
    LEFT JOIN city CI ON A.city_id = CI.city_id
    LEFT JOIN country CO ON CI.country_id = CO.country_id
    WHERE CO.country = 'United States'
    AND I.film_id IS NOT NULL
)
ORDER BY F.title;

