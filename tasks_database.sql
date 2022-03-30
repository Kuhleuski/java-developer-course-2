create database tasks;
use tasks;
create table executor
(
    executor_id int auto_increment
        constraint `PRIMARY`
        primary key,
    name        varchar(30) not null,
    surname     varchar(50) not null,
    lastname    varchar(50) null
);

create table project
(
    project_id         int         not null
        constraint `PRIMARY`
        primary key,
    project_name       varchar(30) not null,
    project_lead_time  smallint    not null,
    project_complexity varchar(20) null,
    executor_id        int         not null,
    constraint project___fk
        foreign key (executor_id) references tasks.executor (executor_id)
);

create table task
(
    task_id        int         not null
        constraint `PRIMARY`
        primary key,
    task_name      varchar(30) not null,
    task_lead_time smallint    not null,
    task_price     int         not null,
    executor_id    int         not null,
    project_id     int         null,
    constraint task___fk
        foreign key (executor_id) references tasks.executor (executor_id),
    constraint task___fk_2
        foreign key (project_id) references tasks.project (project_id)
);

INSERT INTO task (task_id, task_name, task_lead_time, task_price, executor_id, project_id)
 VALUES (1, 'Задача 1', 4, 2000, 1, 1),
        (2, 'Задача 2', 8, 2500, 2, 1),
        (3, 'Задача 3', 4, 1000, 2, 1),
        (4, 'Задача 4', 5, 3000, 3, 2),
        (5, 'Задача 5', 3, 500, 1, 2);

INSERT INTO project (project_id, project_name, project_lead_time, project_complexity, executor_id)
 VALUES (1, 'Проект 1', 2, 'Сложный', 2),
        (2, 'Проект 2', 1, 'Лёгкий', 3);        

INSERT INTO tasks.executor (executor_id, name, surname, lastname)
 VALUES (1, 'Петя', 'Петров', 'Сергеевич'),
        (2, 'Сергей', 'Смирнов', 'Сергеевич'),
        (3, 'Сергей', 'Фёдоров', 'Юрьевич');

/*Вывести на экран все задачи у проектов со сложностью "Сложный"*/
select task_name as Название_задачи, project_complexity as Сложность_проекта
from task
         join
     project on task.project_id = project.project_id
where project_complexity like 'Сложный';

/*Вывести цену каждого проекта (сумма цен всех задач проекта)*/
select project_name as Название_проекта, sum(task_price) as Цена_за_проект
from project
         join
     task on task.project_id = project.project_id
group by project_name;

/*Вывести на экран проекты ценой больше 4000*/
select project_name as Название_проекта, sum(task_price) as Цена_за_проект
from project
         join
     task on task.project_id = project.project_id
group by project_name
having sum(task_price) > 4000;


/*Поменять название "Проект 1" на  "Проект 25"*/
update project
set project_name = 'Проект 25'
where project_name like 'Проект 1';
select *
from project;        