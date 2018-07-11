/*
Exercise 1
*/

CREATE DATABASE db_test;
-- drop db does not work in cloud9 in this setup
DROP DATABASE db_test;

USE c9;
SHOW tables;

USE c9;
DESCRIBE airbnb;

USE c9;
SHOW COLUMNS FROM airbnb;

CREATE TABLE airbnb_subset AS
SELECT room_id, room_type, price, name
FROM airbnb
WHERE name in ('Sand Lake', 'Hillside East');

CREATE TABLE airbnb_2_3_bed AS
SELECT room_id, room_type, neighborhood, price
FROM airbnb
WHERE bedrooms = 3;

INSERT INTO airbnb_2_3_bed
SELECT room_id, room_type, neighborhood, price
FROM airbnb
WHERE bedrooms = 2;

/*
Exercise 4
*/
DROP TABLE oscar_winners_meryl;
CREATE TABLE oscar_winners_meryl AS
SELECT *,
CASE WHEN name = 'Meryl Streep' THEN 1 ELSE 0 END AS meryl
FROM oscar_winners;

DROP TABLE oscar_winners_year;
CREATE TABLE oscar_winners_year AS
SELECT *,
CONCAT(movie, name) AS movie_name
FROM oscar_winners;
