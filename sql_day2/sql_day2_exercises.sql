/*
Exercise 1
Using titanic.csv:
Import the titanic.csv data to Cloud9
Rename the table to titanic
Select all values from the TABLE
Select just the name and home destination
Select passengers with home destination of "New York, NY"
Select the distinct pclass values
Select all passengers with home destination of "St Louis, MO" with pclass of 1
*/


ALTER TABLE `TABLE 4` RENAME TO titanic;

SELECT * FROM titanic;

SELECT name, home_dest from titanic;

SELECT * FROM titanic WHERE home_dest = "New York, NY";

SELECT DISTINCT pclass FROM titanic;

SELECT * FROM titanic where pclass = 1 and home_dest = "St Louis, MO";

/*
Exercise 2
Using titanic dataset
Modify the age column to be an int
Select all passengers and order by their age
Select 5 passengers from the table
Delete passenger with the name "Anderson, Mr. Harry"
Select passengers with the string "Hudson" in their name
Update passenger "Bird, Miss. Ellen" to have a pclass of 3
*/

ALTER TABLE titanic
MODIFY COLUMN age INT;

SELECT * FROM titanic ORDER BY age;

SELECT * FROM titanic LIMIT 5;

DELETE FROM titanic WHERE name = "Anderson, Mr. Harry";

SELECT * FROM titanic WHERE name LIKE "%Hudson%";


/*
Exercise 3
Using titanic dataset:
Create a table called state_beer with columns state varchar(30) and state_beer varchar(30)
Add the following values to the table:
(Illinois, Blue Moon), (Hawaii, Aloha), (Washington, Rainier), (Missouri, Yuenling)
Create a table called state_snack with columns state varchar(30) and snack varchar(30)
Add the following values to the table:
(Illinois, Popcorn), (Missouri, Ice Cream Cone), (Louisiana, Gumbo)
Do an inner, left, and right join of state_beer and state_snack
Note: Snack and beer are according to Google and Bon Appetite
*/

CREATE TABLE state_beer(
  state varchar(30),
  state_beer varchar(30)
);

INSERT INTO state_beer(state, state_beer)
VALUES ('Illinois', 'Blue Moon');
INSERT INTO state_beer(state, state_beer)
VALUES ('Hawaii', 'Aloha');
INSERT INTO state_beer(state, state_beer)
VALUES ('Washington', 'Rainier');
INSERT INTO state_beer(state, state_beer)
VALUES ('Missouri', 'Yuenling');

CREATE TABLE state_snack(
  state varchar(30),
  snack varchar(30)
);

INSERT INTO state_snack(state, snack)
VALUES ('Illinois', 'Popcorn');
INSERT INTO state_snack(state, snack)
VALUES ('Missouri', 'Ice Cream Cone');
INSERT INTO state_snack(state, snack)
VALUES ('Louisiana', 'Gumbo');

SELECT * FROM
state_snack snk
INNER JOIN
state_beer beer
ON snk.state = beer.state;

SELECT * FROM
state_snack snk
LEFT JOIN
state_beer beer
ON snk.state = beer.state;

SELECT * FROM
state_snack snk
RIGHT JOIN
state_beer beer
ON snk.state = beer.state;
