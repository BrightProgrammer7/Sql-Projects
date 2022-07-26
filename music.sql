CREATE DATABASE musicdb;

USE musicdb;

CREATE TABLE playlist(id INT NOT NULL, song_title TEXT NOT NULL, length INT, album_id INT);

ALTER TABLE playlist ADD UNIQUE (id);

ALTER TABLE playlist ADD CONSTRAINT length CHECK (length >= 3);

ALTER TABLE playlist ADD played BOOLEAN DEFAULT true;

ALTER TABLE playlist DROP length;

ALTER TABLE playlist ADD PRIMARY KEY (id);

INSERT INTO playlist(id, song_title, album_id) VALUES(1, 'Save Me', 2), (2, 'Dont Stop Me Now', 1), (3, 'Bicycle Race', 1);

SELECT * FROM playlist ORDER BY album_id ASC;

DELETE FROM playlist WHERE id >= 1;




CREATE TABLE albums(id INT PRIMARY KEY, name TEXT NOT NULL, year INT, artist TEXT);

ALTER TABLE playlist ADD FOREIGN KEY (album_id) REFERENCES albums(id);

ALTER TABLE albums ALTER COLUMN artist SET TEXT NOT NULL ;

ALTER TABLE albums MODIFY artist TEXT NOT NULL ;

INSERT INTO albums(id, name, year, artist) VALUES(1, 'Jazz', 1998, 'Queen'), (2, 'The Game', 1980, 'Queen');

SELECT * FROM albums ORDER BY id ASC;







