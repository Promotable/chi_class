CREATE TABLE airbnb AS
SELECT
room_id,
host_id,
room_type,
neighborhood,
reviews,
overall_satisfaction,
accommodates,
bedrooms,
bathrooms,
price,
minstay,
name,
CAST(created_date AS DATE) AS created_date
FROM `TABLE 5`;

/*
Exercise 1
*/
SELECT MAX(price), MIN(price) FROM airbnb;
SELECT SUM(bedrooms), COUNT(*) FROM airbnb WHERE neighborhood = 'Girdwood';
SELECT AVG(reviews) FROM airbnb;
SELECT AVG(overall_satisfaction) FROM airbnb where overall_satisfaction!=0;

/*
Exercise 2
*/
SELECT AVG(price), MAX(price), room_type, accommodates
FROM airbnb
WHERE neighborhood = 'Girdwood'
GROUP BY room_type, accommodates;

SELECT MAX(reviews), neighborhood
FROM airbnb
GROUP BY neighborhood
ORDER BY MAX(reviews);

SELECT AVG(overall_satisfaction), neighborhood
FROM airbnb
WHERE overall_satisfaction>0
GROUP BY neighborhood;

SELECT AVG(overall_satisfaction), neighborhood
FROM airbnb
WHERE overall_satisfaction>0
GROUP BY neighborhood
HAVING AVG(overall_satisfaction) >= 3;

/*
Exercise 3
*/
SELECT * FROM airbnb WHERE EXTRACT(MONTH FROM created_date) = 2;

SELECT
  datediff(now(), created_date) AS days_creation,
  created_date,
  now() as curr_date
FROM airbnb;

SELECT *, datediff(CAST('2017-03-15' AS DATE), created_date)
FROM airbnb
WHERE datediff(CAST('2017-03-15' AS DATE), created_date) BETWEEN -5 AND 5;

/*
Exercise 4
*/

SELECT *
FROM airbnb
WHERE name LIKE '%cozy%';

SELECT UPPER(room_type), UPPER(neighborhood)
FROM airbnb;

SELECT LEFT(name, 50) FROM airbnb WHERE neighborhood='Girdwood';
