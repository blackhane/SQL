#날짜 : 2022 08 24
#이름 : 박진휘
#내용 : SQL 고급

#실습 4-1
create table `Member`(
	`uid` varchar(10) primary key,
    `name` varchar(10) not null,
    `hp` varchar(13) unique not null,
    `pos` varchar(10) not null,
    `dep` int,
    `rdate` date not null
);
create table `Department`(
	`depNo` int primary key,
    `name` varchar(10) not null,
    `tel` varchar(12) unique not null
);
create table `Sales`(
	`seq` int auto_increment primary key,
    `uid` varchar(10) not null,
    `year` year not null,
    `month` int not null,
    `sale` int not null
);

#실습 4-2
insert into `Member` values ('a101','박혁거세','010-1234-1001','부장',101,now());
insert into `Member` values ('a102','김유신','010-1234-1002','차장',101,now());
insert into `Member` values ('a103','김춘추','010-1234-1003','사원',101,now());
insert into `Member` values ('a104','장보고','010-1234-1004','대리',102,now());
insert into `Member` values ('a105','강감찬','010-1234-1005','과장',102,now());
insert into `Member` values ('a106','이성계','010-1234-1006','차장',103,now());
insert into `Member` values ('a107','정철','010-1234-1007','차장',103,now());
insert into `Member` values ('a108','이순신','010-1234-1008','부장',104,now());
insert into `Member` values ('a109','허균','010-1234-1009','부장',104,now());
insert into `Member` values ('a110','정약용','010-1234-1010','사원',105,now());
insert into `Member` values ('a111','박지원','010-1234-1011','사원',105,now());

insert into `department` values (101,'영업1부','051-512-1001');
insert into `department` values (102,'영업2부','051-512-1002');
insert into `department` values (103,'영업3부','051-512-1003');
insert into `department` values (104,'영업4부','051-512-1004');
insert into `department` values (105,'영업5부','051-512-1005');
insert into `department` values (106,'영업지원부','051-512-1006');
insert into `department` values (107,'인사','051-512-1007');

insert into `sales` set `uid`='a101', `year`=2018, `month`=1, `sale`=98100;
insert into `sales` set `uid`='a102', `year`=2018, `month`=1, `sale`=136000;
insert into `sales` set `uid`='a103', `year`=2018, `month`=1, `sale`=80100;
insert into `sales` set `uid`='a104', `year`=2018, `month`=1, `sale`=78000;
insert into `sales` set `uid`='a105', `year`=2018, `month`=1, `sale`=93000;
insert into `sales` set `uid`='a101', `year`=2018, `month`=2, `sale`=23500;
insert into `sales` set `uid`='a102', `year`=2018, `month`=2, `sale`=126000;
insert into `sales` set `uid`='a103', `year`=2018, `month`=2, `sale`=18500;
insert into `sales` set `uid`='a105', `year`=2018, `month`=2, `sale`=19000;
insert into `sales` set `uid`='a106', `year`=2018, `month`=2, `sale`=53000;

insert into `sales` set `uid`='a101', `year`=2019, `month`=1, `sale`=24000;
insert into `sales` set `uid`='a102', `year`=2019, `month`=1, `sale`=109000;
insert into `sales` set `uid`='a103', `year`=2019, `month`=1, `sale`=101000;
insert into `sales` set `uid`='a104', `year`=2019, `month`=1, `sale`=53500;
insert into `sales` set `uid`='a107', `year`=2019, `month`=1, `sale`=24000;
insert into `sales` set `uid`='a102', `year`=2019, `month`=2, `sale`=160000;
insert into `sales` set `uid`='a103', `year`=2019, `month`=2, `sale`=101000;
insert into `sales` set `uid`='a104', `year`=2019, `month`=2, `sale`=43000;
insert into `sales` set `uid`='a105', `year`=2019, `month`=2, `sale`=24000;
insert into `sales` set `uid`='a106', `year`=2019, `month`=2, `sale`=109000;

insert into `sales` set `uid`='a102', `year`=2020, `month`=1, `sale`=201000;
insert into `sales` set `uid`='a104', `year`=2020, `month`=1, `sale`=63000;
insert into `sales` set `uid`='a105', `year`=2020, `month`=1, `sale`=74000;
insert into `sales` set `uid`='a106', `year`=2020, `month`=1, `sale`=122000;
insert into `sales` set `uid`='a107', `year`=2020, `month`=1, `sale`=111000;
insert into `sales` set `uid`='a102', `year`=2020, `month`=2, `sale`=120000;
insert into `sales` set `uid`='a103', `year`=2020, `month`=2, `sale`=93000;
insert into `sales` set `uid`='a104', `year`=2020, `month`=2, `sale`=84000;
insert into `sales` set `uid`='a105', `year`=2020, `month`=2, `sale`=180000;
insert into `sales` set `uid`='a108', `year`=2020, `month`=2, `sale`=76000;

#실습 4-3
SELECT * FROM `Member` WHERE `name` = '김유신';
SELECT * FROM `Member` WHERE `pos`='차장' and dep=101;
SELECT * FROM `Member` WHERE `pos`='차장' or dep=101;
SELECT * FROM `Member` WHERE `name` != '김춘추';
SELECT * FROM `Member` WHERE `name` <> '김춘추';
SELECT * FROM `Member` WHERE `pos`='사원' or `pos`='대리';
SELECT * FROM `Member` WHERE `pos` IN('사원', '대리'); 
SELECT * FROM `Member` WHERE `dep` in(101, 102, 103);
SELECT * FROM `Member` WHERE `name` LIKE '%신';
SELECT * FROM `Member` WHERE `name` LIKE '김%';
SELECT * FROM `Member` WHERE `name` LIKE '김__';
SELECT * FROM `Member` WHERE `name` LIKE '_성_';
SELECT * FROM `Member` WHERE `name` LIKE '정_';
select * from `sales` where `sale` > 50000;
select * from `sales` where `sale` >= 50000 and `sale` < 100000 and `month`=1;
select * from `sales` where `sale` between 50000 and 100000;
select * from `sales` where `sale` not between 50000 and 100000;
select * from `sales` where `sale` in(2020);
select * from `sales` where `sale` in(1,2);

#실습 4-4
select * from `sales` order by `sale`;
select * from `sales` order by `sale` asc;
select * from `sales` order by `sale` desc;
select * from `Member` order by `name`;
select * from `Member` order by `name` desc;
select * from `Member` order by `rdate` asc;
select * from `sales` where `sale` > 50000 order by `sale` desc;
select * from `sales` where `sale` > 50000 order by `year`,`month`,`sale` desc;

#실습 4-5
select * from `sales` limit 3;
select * from `sales` limit 0, 3;
select * from `sales` limit 1, 2;
select * from `sales` limit 5, 3;
select * from `sales` order by `sale` desc limit 3, 5;
select * from `sales` where `sale` < 50000 order by `sale` desc limit 3;
select * from `sales` where `sale` > 50000 order by `year` desc, `month`, `sale` desc limit 5;

#실습 4-6

#실습 4-7

#실습 4-8

#실습 4-9

#실습 4-10

#실습 4-11

#실습 4-12

#실습 4-13

#실습 4-14

#실습 4-15

#실습 4-16

#실습 4-17