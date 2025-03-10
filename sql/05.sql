/*
 * Management wants to advertise to actors,
 * and needs a list of all actors who are not also customers.
 *
 * Assume that if an entry in the customer and actor table share a first_name and last_name,
 * then they represent the same person.
 * Then select all actors who are not also customers.
 *
 * NOTE:
 * This can be solved by either using a LEFT JOIN or by using the NOT IN clause and a subquery.
 * For this problem, you should use the NOT IN clause;
 * in problem 05b you will use the LEFT JOIN clause.
 */

SELECT A.last_name, A.first_name
FROM actor A
WHERE (A.first_name, A.last_name) NOT IN (
    SELECT C.first_name, C.last_name
    FROM customer C
)
ORDER BY A.last_name, A.first_name;
