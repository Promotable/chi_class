/*
DDL Exercise
*/

/*
Exercise 1 (Use DDL):
Create an empty table called “movies” with the following columns
  movie_name (varchar(30), non-null primary key)
  length (float, non-null)
  number_of_minutes (float)
  director (varchar(30))
Add a column “producer” (varchar(50))
Drop the “number_of_minutes” column
Change director to have varchar(50)
*/
CREATE TABLE `movies` (
    movie_name VARCHAR(30) NOT NULL,
    length FLOAT NOT NULL,
    number_of_minutes FLOAT,
    director VARCHAR(30),
    PRIMARY KEY (movie_name)
);

ALTER TABLE `movies`
ADD producer VARCHAR(50);

ALTER TABLE `movies`
DROP COLUMN number_of_minutes;

ALTER TABLE `movies`
MODIFY COLUMN director VARCHAR(50);

/*
Exercise 2 (Use DDL):
Create an empty table called “actors” with the following columns:
name: varchar(50)
awards: varchar(30)
Change “awards” to a varchar(50)
Truncate “actors”
Drop “actors”
*/

CREATE TABLE `actors` (
    name VARCHAR(50),
    awards VARCHAR(30)
);

ALTER TABLE `actors`
MODIFY COLUMN awards VARCHAR(50);

TRUNCATE TABLE `actors`;
DROP TABLE `actors`;

/*
Exercise 2 (Use DML):
Insert the following movies into the movies table
  "Dark Knight", 152, "Chris Nolan", "Chris Nolan"
  "Incredibles 2", 125, "Brad Bird", "John Lasseter"
  "Jurassic World", 124, "Colin Trevorrow", "Colin Trevorrow"
  "Ocean's 8", 111, "Gary Ross", "George Clooney"
  "Tag", 105, "Jeff Tomsic", "Walter Hamada"
Select all movies from the movies table
Update the length of "Ocean's 8" to 211
Delete records with “Jeff Tomsic” as director
*/

INSERT INTO `movies` (movie_name, length, director, producer)
VALUES ("Dark Knight", 152, "Chris Nolan", "Chris Nolan");
INSERT INTO `movies` (movie_name, length, director, producer)
VALUES ("Incredibles 2", 125, "Brad Bird", "John Lasseter");
INSERT INTO `movies` (movie_name, length, director, producer)
VALUES ("Jurassic World", 124, "Colin Trevorrow", "Colin Trevorrow");
INSERT INTO `movies` (movie_name, length, director, producer)
VALUES ("Ocean's 8", 0, "Gary Ross", "George Clooney");
INSERT INTO `movies` (movie_name, length, director, producer)
VALUES ("Tag", 105, "Jeff Tomsic", "Walter Hamada");

SELECT * FROM `movies`;

UPDATE `movies`
SET length = 111
WHERE movie_name = "Ocean's 8";

DELETE FROM `movies`
WHERE director = "Jeff Tomsic";

/*
DCL Exercise
Grant all privileges  to “user1” to “movies”
Grant delete privileges to “user2” to “movies”
Revoke both privileges
*/

GRANT ALL PRIVILEGES ON `movies` TO 'user1';
GRANT DELETE ON `movies` TO 'user2';

REVOKE ALL PRIVILEGES ON `movies` FROM 'user1';
REVOKE DELETE ON `movies` FROM 'user2';

/*
TCL Exercise
Insert a row (any movie)/Commit
"Deadpool", 109, "Tim Miller", "Ryan Reynolds"

Insert a row and rollback
"Solo", 135, "Ron Howard", "Kathleen Kennedy"
Select all movies
Verify that "Deadpool" is in there, but "Solo" is not
*/

START TRANSACTION;
INSERT INTO `movies` (movie_name, length, director, producer)
VALUES ("Deadpool", 109, "Tim Miller", "Ryan Reynolds");
COMMIT;

START TRANSACTION;
INSERT INTO `movies` (movie_name, length, director, producer)
VALUES ("Solo", 135, "Ron Howard", "Kathleen Kennedy");
ROLLBACK;

SELECT * FROM `movies`;
