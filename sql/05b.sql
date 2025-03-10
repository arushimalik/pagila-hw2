/*
 * This problem is the same as 05.sql,
 * but instead of using the NOT IN operator, you are to use a LEFT JOIN.
 */

SELECT A.last_name, A.first_name
FROM actor A
LEFT JOIN customer C
ON A.last_name = C.last_name AND A.first_name = C.first_name
WHERE C.customer_id IS NULL
ORDER BY A.last_name, A.first_name;
