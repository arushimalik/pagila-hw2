/*
 * This problem is the same as 06.sql,
 * but instead of using the NOT IN operator, you are to use a LEFT JOIN.
 */

SELECT F.title
FROM film F
LEFT JOIN inventory I
ON F.film_id = I.film_id
WHERE I.film_id IS NULL; 
