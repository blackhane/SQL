#날짜 : 2022 08 23
#이름 : 박진휘
#내용 : 제2장 테이블 제약조건과 수정

#실습 2-1
create table `User2` (
	`uid` 	varchar(10) primary key,
    `name` 	varchar(10),
    `hp` 	char(13),
    `age` 	tinyint
);

#실습 2-2
insert into `User2` values('a101','가나다','010-1234-1001','25');
insert into `User2` values('a102','마바사','010-1234-1002','23');

#실습 2-3
create table `User3`(
	`uid` 	varchar(10) primary key,
    `name` 	varchar(10),
    `hp` 	char(13) unique,
    `age` 	tinyint
);

#실습 2-4
insert into `User3` values('a101','가나다','010-1234-1001','25');
insert into `User3` values('a102','마바사','010-1234-1002','23');

#실습 2-5
create table `parent`(
	`pid` 	varchar(10) primary key,
    `name` 	varchar(10),
    `hp` 	char(13) unique
);
create table `child`(
	`cid` 	varchar(10) primary key,
    `name` 	varchar(10),
    `hp` 	char(13) unique,
    `pid` 	varchar(10),
    foreign key(`pid`) references `parent` (`pid`)
);

#실습 2-6
insert into `parent` values ('p101','나','010-123-1111');
insert into `child` values ('c101','가','010-1234-1001','p101');

#실습 2-7
create table `User4`(
	`seq`	int auto_increment primary key,
    `name`	varchar(10),
    `gender`tinyint,	
    `age`	int,
    `addr`	varchar(255)
);

#실습 2-8
insert into `User4` (`name`,`gender`,`age`,`addr`) values ('가',1,25,'부산');
insert into `User4` (`name`,`gender`,`age`,`addr`) values ('나',1,23,'서울');
insert into `User4` (`name`,`gender`,`age`,`addr`) values ('다',2,21,'울산');
delete from `User4` where `name` = '다';

#실습 2-9
create table `User5`(
	`name`	varchar(10) not null,
    `gender`tinyint,	
    `age`	int default 1,
    `addr`	varchar(255)
);

#실습 2-10
insert into `User5` values ('가',1,25,'부산');
insert into `User5` set `name`='나';

#실습 2-11
#실습 2-12
#실습 2-13
#실습 2-14
#실습 2-15
