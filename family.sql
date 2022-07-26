CREATE TABLE family(id INT NOT NULL, name TEXT);

ALTER TABLE family
ADD age INT,
ADD job VARCHAR(20) NOT NULL; 

INSERT INTO family
VALUES(1, 'ABDO', 20, Student);

SELECT *
FROM family;

-- SELECT name 
-- FROM family
-- WHERE name = 'Mom'; 