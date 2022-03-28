/*А теперь получите список сотрудников с зарплатой выше средней*/

CREATE DATABASE script06;

 USE script06;

 CREATE TABLE person (
         id INT auto_increment,
         surname VARCHAR(30) not null,
         name VARCHAR(20) not null,
         salary FLOAT (6,2),
         CONSTRAINT person_pk
         PRIMARY KEY(id)
 );

 INSERT INTO person (name, surname, salary) VALUES
 ('Олег', 'Петров', 4000.40),
 ('Игорь', 'Сидоров', 1000.90),
 ('Виталий', 'Смолов', 1500.10),
 ('Екатерина', 'Иванова', 2100.20),
 ('Светлана', 'Петрова', 7400.70),
 ('Андрей', 'Смольский', 8000.40);

SELECT * FROM person WHERE salary > (SELECT AVG(salary) FROM person);