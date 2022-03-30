/*Как выбрать записи с нечётными Id?*/

CREATE DATABASE script01;

 USE script01;

CREATE TABLE person
 (
   id INT auto_increment,
   surname VARCHAR(30) NOT NULL,
   age INT,
   CONSTRAINT person_pk
   PRIMARY KEY (id)
 );

INSERT INTO person ( surname, age) VALUES
 ( 'Петров', 25),
 ( 'Сидоров', 44),
 ( 'Матроскин', 19),
 ( 'Абрамович', 33),
 ( 'Дубровский', 26),
 ( 'Пушкин', 45);


SELECT * FROM person
 WHERE id % 2 != 0;