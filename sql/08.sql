/*
 * Select the title of all 'G' rated movies that have the 'Trailers' special feature.
 * Order the results alphabetically.
 *
 * HINT:
 * Use `unnest(special_features)` in a subquery.
 */

SELECT F.title
FROM film F
WHERE F.rating = 'G'
AND 'Trailers' = ANY (
    SELECT unnest(F.special_features)
)
ORDER BY F.title;

