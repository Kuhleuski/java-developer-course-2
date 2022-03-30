/*Даны таблицы workers и departments. Найдите все департаменты без единого сотрудника*/

 CREATE DATABASE script07;

 USE script07;

 CREATE TABLE departments (
     id INT AUTO_INCREMENT NOT NULL,
     name VARCHAR(50),
     CONSTRAINT departments_id_pk
     PRIMARY KEY (id)
 );

 INSERT INTO departments
 (name) values
 ('Sales Department'),
 ('Production Department'),
 ('Planning Department'),
 ('Marketing Department');

 CREATE TABLE workers (
     id INT AUTO_INCREMENT,
     surname VARCHAR(50) not null,
     department_id INT,
     CONSTRAINT workwers_id_pk
     primary key (id),
     CONSTRAINT workers_departments_id_fk
     FOREIGN KEY (department_id) REFERENCES departments(id)
 );

INSERT INTO workers (surname, department_id) VALUES
 ('Петров', 1),
 ('Романов', 2),
 ('Мичурин', 2),
 ('Сидоров', 1);

SELECT sample.name FROM (SELECT surname, name FROM workers RIGHT JOIN departments ON  
workers.department_id = departments.id) AS sample WHERE sample.surname IS NULL;