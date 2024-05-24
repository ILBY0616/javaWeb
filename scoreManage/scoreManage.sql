create database javaWeb;

use javaWeb;

create table score
(
    id bigint(20) primary key,
    name varchar(255),
    mathScore double,
    englishScore double,
    programScore double,
    databaseScore double
);

insert into score(id, name, mathScore, englishScore, programScore, databaseScore)
VALUES (201817010801,'赵丽名',78,89,98,88),
       (201817010802,'李三民',87,86,88,90),
       (201817010803,'徐辉灿',78,89,98,88),
       (201817010804,'李明启',89,85,69,84);

select * from score;