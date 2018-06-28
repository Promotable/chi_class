/* SQL Day 1 demo
A few things to remember:
End each query with a ;
Make sure to close all your parentheses
This is a multi line comment
Single line comments can be created with "--"
*/


/*
DEMO1
*/

-- create table (syntax is important!)
CREATE TABLE `sales` (order_id INT);

CREATE TABLE `sales` (
    order_id INT,
    customer VARCHAR(5) NOT NULL,
    item_id INT,
    item VARCHAR(100),
    units INT,
    PRIMARY KEY (order_id)
);

-- add a new column with varchar(30)
ALTER TABLE `sales`
ADD new_column VARCHAR(30);

-- remove a column
ALTER TABLE `sales`
DROP COLUMN new_column;

-- change the datatype of a column
ALTER TABLE `sales`
MODIFY COLUMN customer VARCHAR(50);

-- drop/truncate table
CREATE TABLE `customers` (
    customer VARCHAR(5),
    city VARCHAR(30)
);

-- remove all values from the table
TRUNCATE TABLE `customers`;

-- remove table
DROP TABLE `customers`;

/*DEMO2*/
-- insert values into an existing table
INSERT INTO sales (order_id, customer, item_id, item, units)
VALUES (1, 'Bob', 0, 'Pen', 5);
INSERT INTO sales (order_id, customer, item_id, item, units)
VALUES (2, 'Bob', 0, 'Pen', 20);
INSERT INTO sales (order_id, customer, item_id, item, units)
VALUES (3, 'Anne', 1, 'Pencil', 15);
INSERT INTO sales (order_id, customer, item_id, item, units)
VALUES (4, 'Anne', 1, 'Pencil', 3);
INSERT INTO sales (order_id, customer, item_id, item, units)
VALUES (5, 'Bob', 1, 'Pencil', 10);

-- pull all rows from a table
SELECT * FROM sales;

-- update
UPDATE sales
SET item = 'Red Pen'
WHERE item_id = 0;

-- insert and delete a specific row
INSERT INTO sales (order_id, customer, item_id, item, units)
VALUES (10, 'Anne', 2, 'Pen', 5);

DELETE FROM sales
WHERE order_id=10;

/*
DEMO 3
*/
-- grant privileges
GRANT ALL PRIVILEGES ON sales TO 'username';
GRANT SELECT ON sales TO 'username1';

-- revoke privileges
REVOKE ALL PRIVILEGES ON sales FROM 'username';
REVOKE SELECT ON sales FROM 'username1';


/*
DEMO 4
*/
-- commit
START TRANSACTION;
INSERT INTO sales (order_id, customer, item_id, item, units)
VALUES (11, 'Hal', 2, 'Pencil', 10);
COMMIT;

-- rollback
START TRANSACTION;
INSERT INTO sales (order_id, customer, item_id, item, units)
VALUES (12, 'Hal', 2, 'Pen', 5);
ROLLBACK;
