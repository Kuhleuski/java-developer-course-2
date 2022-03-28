/*При выборке из таблицы прибавьте к дате 1 день*/

 CREATE DATABASE script03;

 USE script03;

 CREATE TABLE person
 (
    id INT auto_increment,
    name VARCHAR(20) NOT NULL,
    surname VARCHAR(30) NOT NULL,
    age INT,
    dateOfCreation TIMESTAMP,
     CONSTRAINT person_pk
         PRIMARY KEY (id)
 );

INSERT INTO person (name, surname, age, dateOfCreation) VALUES
 ('Олег', 'Петров', 22, now()),
 ('Игорь', 'Сидоров', 31, now()),
 ('Виталий', 'Смолов', 34, now());

 SELECT name, surname, date_add(dateOfCreation,interval 1 day) 
     AS correctedDate FROM person;