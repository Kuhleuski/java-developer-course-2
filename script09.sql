/*При выборке из таблицы пользователей создайте поле, которое будет включать в себя и имена, и зарплату*/

 create database script09;

 use script09;

 CREATE TABLE employees (
         id INT AUTO_INCREMENT,
         surname VARCHAR(30) NOT NULL,
         name VARCHAR(20) NOT NULL,
         salary FLOAT (6,2),
         CONSTRAINT employees_id_pk
         PRIMARY KEY(id)
 );

 INSERT INTO employees
 (surname, name, salary) VALUES
 ('Иванов', 'Сергей', 4050.10),
 ('Петров', 'Иван', 900.00),
 ('Соколов', 'Андрей', 2340.20),
 ('Абрамович', 'Михаил', 4310.99),
 ('Лаптев', 'Николай', 900.00),
 ('Милохин', 'Антон', 2000.40);

 SELECT CONCAT(name,' ', salary) AS sample FROM employees;