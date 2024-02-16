--=======CREACCION DE LA BASE DE DATOS=======

CREATE DATABASE blo_db;

--========CREACION DE TABLAS  USERS Y AÑADIR  USUARIOS==============

CREATE TABLE users (
  id serial PRIMARY KEY,
  firstname varchar(50),
  lastname varchar(50),
  email varchar(100)
);

INSERT INTO users(firstname, lastname, email) values
('Luis','Catalan', 'luiscatalan@gmail.com'),		--1
('Daniel','Catalan','danielcatalan@gmail.com'),		--2
('Ruben', 'Catalan', 'rubencatalan@gmail.com'),		--3
('Victor','Catalan', 'victorcatalan@gmail.com'),	--4
('Diana','Catalan','dianacatalan@gmail.com');		--5

ALTER TABLE users RENAME COLUMN id TO id_users;

SELECT * FROM users;

--========CREACION DE TABLAS  POSTS Y AÑADIR  USUARIOS==============

CREATE TABLE posts (
  id serial PRIMARY KEY,
  creator_id int references users (id) ,
  title varchar(50),
  text text
);

INSERT INTO posts (creator_id, title, text) values
(1,'Post #1', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),						--1
(2,'Post #2', 'Donec volutpat mi eget mauris sagittis, vitae tempor metus ornare.'),			--2
(3,'Post #3', 'Ut ac ex massa. Maecenas vestibulum, metus tincidunt molestie posuere.'),		--3
(4,'Post #4', 'Magna risus fringilla risus, sit amet dapibus tortor tellus sit amet lacus.'),	--4
(5,'Post #5', 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices.'),				--5
(1,'Post #6', 'Morbi tempor pharetra dolor quis ultrices.'),									--6
(2,'Post #7', 'Nam cursus eget tellus eget fermentum. Donec vitae mauris turpis.'),				--7
(3,'Post #8', 'In hac habitasse platea dictumst. Nam in molestie enim.'),						--8
(4,'Post #9', 'In sit amet nulla imperdiet, pellentesque nisl vitae, laoreet orci.'),			--9
(5,'Post #10', 'Ut imperdiet consectetur nisi, non accumsan turpis tincidunt sit amet.');		--10

ALTER TABLE posts RENAME COLUMN id TO id_posts;

SELECT * FROM posts;

--========CREACION DE TABLAS  LIKES Y AÑADIR  LIKES================

CREATE TABLE likes (
  id serial PRIMARY KEY,
  user_id int references users (id),
  post_id int references posts (id)
);

INSERT INTO likes(user_id, post_id) VALUES
	(1,2),
	(1,3),
	(1,4),
	(1,5),
	(1,7),
	(2,1),
	(2,3),
	(2,4),
	(2,5),
	(2,6),
	(3,1),
	(3,2),
	(3,4),
	(3,5),
	(3,8),
	(4,1),
	(4,2),
	(4,3),
	(4,5),
	(4,10),
	(5,1),
	(5,2),
	(5,3),
	(5,4),
	(5,9);
	
ALTER TABLE likes RENAME COLUMN id TO id_likes;
	
--========TRAER TODOS LOS POSTS Y LA INFORMACIÓN DEL USUARIO DEL CAMPO CREATOR_ID ================

SELECT posts.id_posts,users.firstname || ' ' || users.lastname AS Creator, posts.title, posts.text
FROM posts INNER JOIN users ON posts.creator_id = users.id_users;

--========TRAER TODOS LOS POSTS,CON LA INFORMACIÓN DE LOS USUARIOS QUE LES DIERON LIKE ================

SELECT users.id_users,posts.id_posts,posts.title,posts.text,users.firstname || ' ' || users.lastname AS users_likes
FROM posts 
INNER JOIN likes ON likes.post_id = posts.id_posts
INNER JOIN users ON likes.user_id = users.id_users;




