/*
Write a solution to report the movies with an odd-numbered ID and a description that is not "boring".

Return the result table ordered by rating in descending order.
*/

SELECT id ,
MOVIE,
DESCRIPTION,
RATING
FROM 
CINEMA
WHERE
ID%2!=0
AND 
DESCRIPTION != 'boring'
ORDER BY RATING DESC;
