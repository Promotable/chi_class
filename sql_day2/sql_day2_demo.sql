/*
mysql-ctl install
phpmyadmin-ctl install
mysql-ctl start
ALTER TABLE `TABLE 3` RENAME TO office_supplies
*/
 -- Use the office_supplies.csv dataset

/*
Demo 1
*/
SELECT * FROM office_supplies;
SELECT region, rep, item FROM office_supplies;

SELECT DISTINCT rep FROM office_supplies;


SELECT * FROM office_supplies WHERE rep = 'James';
SELECT * FROM office_supplies WHERE units>=10;
SELECT * FROM office_supplies WHERE rep <> 'James';
SELECT * FROM office_supplies WHERE unit_price BETWEEN 10 AND 20;
SELECT * from office_supplies WHERE rep IN ('James', 'Bill');

SELECT * FROM office_supplies WHERE rep = 'James' OR item = 'Binder';
SELECT * FROM office_supplies WHERE rep = 'James' AND item = 'Binder';
SELECT * from office_supplies WHERE rep NOT IN ('James', 'Bill');


/*
Demo 2
*/
SELECT * FROM office_supplies ORDER BY region;
SELECT * FROM office_supplies ORDER BY region DESC;

INSERT INTO office_supplies (order_date, region, rep, item, units, unit_price)
VALUES ('4-Jul-16', 'West', 'Liz', 'Desk', 3, 200.0);

UPDATE office_supplies SET rep = 'Lizard' WHERE rep = 'Liz';

DELETE FROM office_supplies WHERE rep = 'Lizard';

SELECT * FROM office_supplies LIMIT 5;

SELECT * FROM office_supplies WHERE item LIKE '%en%';
SELECT * FROM office_supplies WHERE item LIKE '_i%';


/*
Demo 3
*/
CREATE TABLE region_offices(
  region varchar(10),
  number_of_offices int
);

INSERT INTO region_offices(region, number_of_offices)
VALUES ('East', 3);
INSERT INTO region_offices(region, number_of_offices)
VALUES ('West', 1);
INSERT INTO region_offices(region, number_of_offices)
VALUES ('North', 5);

CREATE TABLE region_employees(
  region varchar(10),
  number_of_employees int
);

INSERT INTO region_employees(region, number_of_employees)
VALUES ('East', 30);
INSERT INTO region_employees(region, number_of_employees)
VALUES ('West', 10);
INSERT INTO region_employees(region, number_of_employees)
VALUES ('Central', 50);

SELECT * FROM
region_employees emps
INNER JOIN
region_offices offs
ON emps.region = offs.region;

SELECT * FROM
region_employees emps
LEFT JOIN
region_offices offs
ON emps.region = offs.region;

SELECT * FROM
region_employees emps
RIGHT JOIN
region_offices offs
ON emps.region = offs.region;
