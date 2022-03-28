CREATE DATABASE People;

  CREATE TABLE Person
 (
     id             INT(11) AUTO_INCREMENT NOT NULL PRIMARY KEY,
     age            INT(3),
     salary         DECIMAL(7),
     passport       CHAR(10),
     address        VARCHAR(200),
     dateOfBirthday DATE,
     dateTimeCreate DATETIME,
     timeToLunch    TIME,
     letter         BLOB
 );

  INSERT INTO People.person (age, salary, passport, address, dateOfBirthday, dateTimeCreate, timeToLunch, letter) VALUES
   (28, 2500, 'MP456543', 'Кедышко, 34-122', '1993-06-25', '2022-03-22 12:00:00', '14:00:00', 'Какое-то описание'), 
   (34, 3600, 'MP459803', 'Есенина 11-2', '1998-03-02', '2022-02-05 11:22:00', '14:00:00', 'Какое-то описание'), 
   (41, 1120, 'MP342367', 'Некрасова 5а-145', '2001-04-17', '2020-05-05 09:35:00', '14:00:00', 'Какое-то описание'), 
   (39, 2200, 'MP399077', 'Немига 3-12', '1989-09-04', '2020-01-09 10:00:00','14:00:00', 'Какое-то описание'),
   (22, 1900, 'MP010123', 'Ватутина 42-35', '1999-02-25', '2019-09-01 11:15:00', '14:00:00', 'Какое-то описание');

  SELECT * FROM person WHERE age > 21 ORDER BY dateTimeCreate;
