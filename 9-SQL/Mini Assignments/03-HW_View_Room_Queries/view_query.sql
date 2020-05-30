SELECT * FROM film

SELECT
	f.title
	,COUNT(i.film_id) AS "Number of Copies"
FROM
	film AS f
  	INNER JOIN inventory AS i
  	ON (f.film_id = i.film_id)
GROUP BY
	f.film_id;    
	
--SUBquery

SELECT f.title,
       (SELECT COUNT(i.film_id)
		FROM inventory i
		WHERE i.film_id = f.film_id) AS "Number of Copies"
  FROM film f
  ORDER BY f.title;
  
--VIEW

CREATE VIEW title_count AS
SELECT f.title,
       (SELECT COUNT(i.film_id)
		FROM inventory i
		WHERE i.film_id = f.film_id) AS "Number of Copies"
  FROM film f
  ORDER BY f.title;

SELECT * FROM title_count

--Films with 7 copies in inventory
SELECT * 
FROM title_count 
WHERE "Number of Copies"=7


