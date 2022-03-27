create table People.person
(
    id             int auto_increment
        primary key,
    age            int                     not null,
    salary         decimal                 null,
    passport       char(10)                not null,
    address        varchar(200)            not null,
    dateOfBirthday date                    null,
    dateTimeCreate timestamp               null,
    timeToLunch    time default '17:00:00' null,
    letter         text                    null
);


