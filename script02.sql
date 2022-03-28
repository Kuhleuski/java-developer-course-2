/*Как найти дубли в поле email?*/

CREATE DATABASE script02;

 USE script02;

CREATE TABLE person
 (
    id INT auto_increment,
    name VARCHAR(20) NOT NULL,
    surname VARCHAR(30) NOT NULL,
    age INT,
    email VARCHAR(64) not null,
    CONSTRAINT person_pk
    PRIMARY KEY (id)
 );

INSERT INTO person (name, surname, age, email) VALUES
 ('Олег', 'Петров', 22, 'petrov@mail.ru'),
 ('Игорь', 'Сидоров', 31, 'sidorov@mail.ru'),
 ('Виталий', 'Смолов', 34, 'petrov@mail.ru');


SELECT email, COUNT(email) FROM person GROUP BY email HAVING COUNT(email) > 1;


 


