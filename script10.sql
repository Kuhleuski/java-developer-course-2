/*Переименуйте таблицу*/

CREATE DATABASE script10;

 USE script10;


 CREATE TABLE first_name
 (
     id INT AUTO_INCREMENT PRIMARY KEY,
     some_value VARCHAR(50)
 );

ALTER TABLE first_name RENAME second_name;
