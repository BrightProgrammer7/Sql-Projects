CREATE DATABASE dbname;

USE dbname;

CREATE TABLE table_name;

ALTER TABLE table_name ADD UNIQUE PRIMARY KEY (id), ADD column_name TYPE, ADD record INT NOT NULL, ADD field TYPE;

INSERT INTO table_name VALUES(record_value);

UPDATE table_name SET column_name = new_value WHERE record = 0;

DELETE FROM table_name WHERE record = 0;

SELECT * FROM table_name WHERE (column_name != "record_value" OR record NOT BETWEEN 10) AND id IS NOT NULL; 

ALTER TABLE table_name ADD CONSTRAINT column_name CHECK (RANGE);

SELECT DISTINCT column_name FROM table_name ORDER BY id DESC LIMIT 3;

SELECT * FROM table_name WHERE column_name LIKE '%val%' AND field LIKE '__f' OR id IN ('55');

SELECT COUNT(*) FROM table_name;

SELECT MAX(LENGTH(column_name)) FROM table_name;

SELECT MIN(record) FROM table_name;

SELECT SUM(record) FROM table_name;

SELECT ROUND(AVG(record)) FROM table_name;

SELECT UCASE(field) FROM table_name;

SELECT LCASE(column_name) FROM table_name;