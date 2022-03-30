/*Выберите только уникальные имена*/

CREATE DATABASE script04;

 USE script04;

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
 ( 'Сидоров', 19),
 ( 'Абрамович', 33),
 ( 'Пушкин', 26),
 ( 'Пушкин', 45);

SELECT DISTINCT surname FROM person;