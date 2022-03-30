/*Найдите в таблице среднюю зарплату работников*/

CREATE DATABASE script05;

 USE script05;

 CREATE TABLE person (
         id INT auto_increment,
         surname VARCHAR(30) not null,
         name VARCHAR(20) not null,
         salary FLOAT (6,2),
         CONSTRAINT person_pk
         PRIMARY KEY(id)
 );

 INSERT INTO person
 (name, surname, salary) VALUES
 ('Олег', 'Петров', 2000.40),
 ('Игорь', 'Сидоров', 3000.90),
 ('Виталий', 'Смолов', 3500.10),
 ('Екатерина', 'Иванова', 2100.20),
 ('Светлана', 'Петрова', 3400.70),
 ('Андрей', 'Смольский', 2000.40);

 SELECT AVG(salary) FROM person;