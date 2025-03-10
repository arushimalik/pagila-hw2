/*
 * List the name of all actors who have appeared in a movie that has the 'Behind the Scenes' special_feature
 */

SELECT DISTINCT A.first_name || ' ' || A.last_name AS "Actor Name"
FROM actor A
JOIN film_actor FA ON A.actor_id = FA.actor_id
JOIN film F ON FA.film_id = F.film_id
WHERE 'Behind the Scenes' = ANY (F.special_features)
ORDER BY "Actor Name";

