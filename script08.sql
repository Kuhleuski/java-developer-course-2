/*Замените в таблице зарплату работника на 1000, если она равна 900, и на 1500 в остальных случаях*/

 CREATE DATABASE script08;

 USE script08;

 CREATE TABLE employees (
         id INT AUTO_INCREMENT,
         surname VARCHAR(30) NOT NULL,
         name VARCHAR(20) NOT NULL,
         salary decimal(8.2),
         CONSTRAINT employees_id_pk
         PRIMARY KEY(id)
 );

 INSERT INTO employees
 (surname, name, salary) VALUES
 ('Иванов', 'Сергей', 4050.27),
 ('Петров', 'Иван', 900.00),
 ('Соколов', 'Андрей', 2340.34),
 ('Абрамович', 'Михаил', 4310.78),
 ('Лаптев', 'Николай', 900.00),
 ('Милохин', 'Антон', 2000.93);

 SELECT * FROM employees;

update employees set salary = case when salary = 900 then 1000 else 1500 end;

 SELECT * FROM employees;

 /*Так и не понял почему не заработало условие при котором salary = 900 */