USE campusx;

SELECT * FROM movies;

SELECT MAX(score)
FROM movies;

SELECT * FROM movies
WHERE score = 9.3;

SELECT * FROM movies
WHERE score = (SELECT MAX(score) FROM movies);

-- Types of Sub-queries
-- 1. The result it returns
-- a). scalar subquery   b). row subquery   c). table subquery

-- 2. Based on working
-- a). Independent subquery   b). correlated subquery


-- a). scalar subquery
-- Find the movie with highest profit
SELECT * FROM movies
WHERE (gross - budget) = (SELECT MAX(gross - budget) FROM movies);

SELECT * FROM movies
ORDER BY (gross - budget) DESC
LIMIT 1;

-- Find how many movies have a rating > the average of all movie ratings
-- (Count of above avg movies)

SELECT AVG(score) FROM movies;

SELECT COUNT(*) FROM movies
WHERE score > (SELECT AVG(score) FROM movies);

-- Find the highest rated movie of 2000
SELECT MAX(score) AS highest_rated
FROM movies
WHERE year = 2000;

SELECT * FROM movies
WHERE year = 2000 AND score = (SELECT MAX(score) AS highest_rated
					FROM movies
					WHERE year = 2000);
                    
                    
-- Find the highest rated movie among all movies whose 
-- number of votes are > the above avg votes
SELECT ROUND(AVG(votes), 2) FROM movies; 

SELECT MAX(score) FROM movies
WHERE votes > (SELECT ROUND(AVG(votes), 3) FROM movies);

SELECT * FROM movies
WHERE score = (SELECT MAX(score) FROM movies
				WHERE votes > (SELECT ROUND(AVG(votes), 3) 
								FROM movies));
                                

-- b). Independent Subquery -> row subquery
-- Find all users who never ordered
SELECT DISTINCT(user_id) FROM orders1;

SELECT * FROM users5
WHERE user_id NOT IN (SELECT DISTINCT(user_id) 
						FROM orders1);


-- Find all movies made by top 3 directors (in terms of total gross income);
SELECT director
FROM movies
GROUP BY director
ORDER BY SUM(gross) DESC
LIMIT 3;

SELECT * FROM movies
WHERE director IN (SELECT director
					FROM movies
					GROUP BY director
					ORDER BY SUM(gross) DESC
					LIMIT 3);
                    
SELECT * FROM movies
WHERE director IN (
		SELECT director FROM (
			SELECT director
			FROM movies
			GROUP BY director
			ORDER BY SUM(gross) DESC
			LIMIT 3
		) AS top_directors
);


-- Using CTE
WITH top_directors AS (
    SELECT director
    FROM movies
    GROUP BY director
    ORDER BY SUM(gross) DESC
    LIMIT 3
)
SELECT * FROM movies
WHERE director IN (SELECT director FROM top_directors);

-- Find all movies of all those actors whose filmography's avg rating > 8.5
-- (take 25000 votes as cutoff)

SELECT star, AVG(score) AS avg_score
FROM movies
WHERE votes > 25000
GROUP BY star
HAVING avg_score > 8.5;

SELECT * FROM movies
WHERE star IN (SELECT star
				FROM movies
				WHERE votes > 25000
				GROUP BY star
				HAVING AVG(score) > 8.5);


-- Independent Subquery -> Table Subquery

-- Find most profitable movie of each year
SELECT * FROM movies
WHERE (year, gross - budget) IN (SELECT DISTINCT(year), 
				MAX(gross - budget)
				FROM movies
				GROUP BY year);

SELECT DISTINCT(year), MAX(gross - budget)
FROM movies
GROUP BY year;


-- Find highest rated movie of each genre votes cutoff of 25000
SELECT genre, MAX(score)
FROM movies
WHERE votes > 25000
GROUP BY genre;

SELECT * FROM movies
WHERE (genre, score) IN (SELECT genre, MAX(score)
							FROM movies
							WHERE votes > 25000
							GROUP BY genre)
AND votes > 25000;


-- Find the highest grossing movies of top 5 actor/director combo
-- in terms of total gross income

SELECT star, director, MAX(gross) AS max_profit
FROM movies
GROUP BY star, director
ORDER BY SUM(gross) DESC
LIMIT 5;

WITH top_duos AS (SELECT star, director, 
					MAX(gross) AS max_profit
					FROM movies
					GROUP BY star, director
					ORDER BY SUM(gross) DESC
					LIMIT 5
)
SELECT * FROM movies
WHERE (star, director, gross) IN (SELECT * FROM top_duos);


