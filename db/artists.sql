DROP TABLE IF EXISTS collectors;
DROP TABLE IF EXISTS songs;
DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS artists;


CREATE TABLE artists (
  id SERIAL8 primary key,
  name VARCHAR(255) NOT NULL,
  nationality VARCHAR(255)
);


CREATE TABLE albums (
  id SERIAL8 primary key,
  title VARCHAR(255) NOT NULL,
  genre VARCHAR(255) NOT NULL,
  artist_id INT8 references artists(id),
  price SERIAL8
);


CREATE TABLE songs (
  id SERIAL8 primary key,
  song_title VARCHAR(255) NOT NULL,
  album_id INT8 references albums(id)
);

CREATE TABLE collectors(
  id SERIAL8 primary key,
  name VARCHAR(255),
  money_own INT8,
  nationality VARCHAR(255),
  album_id INT8 references albums(id)
  )