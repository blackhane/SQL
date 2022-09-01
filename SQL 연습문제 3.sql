#날짜 : 2022 09 01
#이름 : 박진휘
#내용 : SQL 연습문제 3

#실습3-1
create database `java1_college`;
create user 'java1_admin3'@'%' identified by '1234';
grant all privileges on `java1_college`.* to 'java1_admin3'@'%';
flush privileges;

#실습3-2
create table `Student`(
	`stdNo` varchar(8) primary key,
    `stdName` varchar(20) not null,
    `stdHp` varchar(13) not null,
    `stdYear` int not null,
    `stdAddress` varchar(100)
);
create table `Lecture`(
	`lecNo` int primary key,
    `lecName` varchar(20) not null,
    `lecCredit` int not null,
    `lecTime` int not null,
    `lecClass` varchar(10)
);
create table `Register`(
	`regStdNo` varchar(8) not null,
    `regLecNo` int not null,
    `regMidScore` int,
    `regFinalScore` int,
    `regTotalScore` int,
    `regGrade` varchar(1)
);

#실습3-3
insert into `student` (`stdNo`,`stdName`,`stdHp`,`stdYear`) values (20201016,'김유신','010-1234-1001',3);
insert into `student` values (20201126,'김춘추','010-1234-1002',3,'경상남도 경주시');
insert into `student` values (20210216,'장보고','010-1234-1003',2,'전라남도 완도시');
insert into `student` values (20210326,'강감찬','010-1234-1004',2,'서울시 영등포구');
insert into `student` values (20220416,'이순신','010-1234-1005',1,'부산시 부산진구');
insert into `student` values (20220521,'송상현','010-1234-1006',1,'부산시 동래구');

insert into `lecture` values (159,'인지행동심리학',3,40,'본304');
insert into `lecture` values (167,'운영체제론',3,25,'본B05');
insert into `lecture` values (234,'중급 영문법',3,20,'본201');
insert into `lecture` values (239,'세법개론',3,40,'본204');
insert into `lecture` values (248,'빅데이터 개론',3,20,'본B01');
insert into `lecture` values (253,'컴퓨팅사고와 코딩',2,10,'본B02');
insert into `lecture` values (349,'사회복지 마케팅',2,50,'본301');

insert into `register` (`regStdNo`,`regLecNo`) values (20201126,234);
insert into `register` (`regStdNo`,`regLecNo`) values (20201016,248);
insert into `register` (`regStdNo`,`regLecNo`) values (20201016,253);
insert into `register` (`regStdNo`,`regLecNo`) values (20201126,239);
insert into `register` (`regStdNo`,`regLecNo`) values (20210216,349);
insert into `register` (`regStdNo`,`regLecNo`) values (20210326,349);
insert into `register` (`regStdNo`,`regLecNo`) values (20201016,167);
insert into `register` (`regStdNo`,`regLecNo`) values (20220416,349);

#실습3-4
select * from `lecture`;

#실습3-5
select * from `student`;

#실습3-6
select * from `register`;

#실습3-7
select * from `student` where `stdyear` = 3;

#실습3-8
select * from `lecture` where `leccredit` = 2;

#실습3-9
update `register` set `regmidscore` = 36, `regfinalscore` = 42 
where `regstdno` = '20201126' and `reglecno` = 234;
update `register` set `regmidscore` = 24, `regfinalscore` = 62 
where `regstdno` = '20201016' and `reglecno` = 248;
update `register` set `regmidscore` = 28, `regfinalscore` = 40
where `regstdno` = '20201016' and `reglecno` = 253;
update `register` set `regmidscore` = 37, `regfinalscore` = 57
where `regstdno` = '20201126' and `reglecno` = 239;
update `register` set `regmidscore` = 28, `regfinalscore` = 68
where `regstdno` = '20210216' and `reglecno` = 349;
update `register` set `regmidscore` = 16, `regfinalscore` = 65
where `regstdno` = '20210326' and `reglecno` = 349;
update `register` set `regmidscore` = 18, `regfinalscore` = 38
where `regstdno` = '20201016' and `reglecno` = 167;
update `register` set `regmidscore` = 25, `regfinalscore` = 58
where `regstdno` = '20220416' and `reglecno` = 349;
select * from `register`;

#실습3-10
update `register` set
`regTotalScore` = `regMidScore` + `regFinalScore`;

update `register` set `regGrade` = 
if(`regTotalScore` >= 90, 'A', 
if(`regTotalScore` >= 80, 'B', 
if(`regTotalScore` >= 70, 'C', 
if(`regTotalScore` >= 60, 'D', 'F'))));

#실습3-11
select * from `register` order by `regTotalScore` desc;

#실습3-12
select * from `register` where `regLecNo` = 349 order by `regTotalScore` desc;

#실습3-13
select * from `lecture` where `lecTime` >= 30;

#실습3-14
select `lecName`,`lecClass` from `lecture`;

#실습3-15
select `stdNo`,`stdName` from `student`;

#실습3-16
select * from `student` where `stdAddress` is null;

#실습3-17
select * from `student` where `stdAddress` like '부산시%';

#실습3-18
select * from `student` as a
left join `register` as b
on a.stdno = b.regstdno;

#실습3-19
select `stdNo`,`stdName`,`regLecNo`,`regMidScore`,`regFinalScore`,`regTotalScore`,`regGrade` 
from `student` as a
join `register` as b
on a.stdno = b.regstdno;

#실습3-20
select `stdName`,`stdNo`,`regLecNo` 
from `student` as a
join `register` as b
on a.stdno = b.regstdno
where regLecNo = 349;

#실습3-21
select `stdNo`,`stdName`,count(`stdNo`) as '수강신청 건수',sum(`regTotalScore`) as '종합점수',sum(`regTotalScore`)/count(`stdNo`) as '평균'
from `student` as a
join `register` as b
on a.stdno = b.regStdNo
group by `stdName`;

#실습3-22
select * from `register` as a
join `lecture` as b
on a.reglecno = b.lecno;

#실습3-23
select `regStdNo`,`regLecNo`,`lecName`,`regMidScore`,`regFinalScore`,`regTotalScore`,`regGrade`
from `register` as a
join `lecture` as b
on a.regLecNo = b.lecNo;

#실습3-24
select count(*) as '사회복지 마케팅 수강 신청건수',avg(`regTotalScore`) as '사회복지 마케팅 평균'
from `register` as a
join `lecture` as b
on a.regLecNo = b.lecNo
where `lecName` = '사회복지 마케팅';

#실습3-25
select `regStdNo`,`lecName`
from `register` as a
join `lecture` as b
on a.regLecNo = b.lecNo
where `regGrade` = 'A';

#실습3-26
select * from `student` as a
join `register` as b
on a.stdno = b.regstdno
join `lecture` as c
on b.reglecno = c.lecno;

#실습3-27
select `stdNo`,`stdName`,`lecNo`,`lecName`,`regMidScore`,`regFinalScore`,`regTotalScore`,`regGrade`
from `student` as a
join `register` as b
on a.stdno = b.regstdno
join `lecture` as c
on b.reglecno = c.lecno
order by `regGrade` asc, `regFinalScore` desc;

#실습3-28
select `stdNo`,`stdName`,`lecName`,`regTotalScore`,`regGrade`
from `student` as a
join `register` as b
on a.stdno = b.regstdno
join `lecture` as c
on b.reglecno = c.lecno
where `regGrade` = 'F';

#실습3-29
select `stdNo`,`stdName`,sum(`lecCredit`) as '이수학점'
from `student` as a
join `register` as b
on a.stdno = b.regstdno
join `lecture` as c
on b.reglecno = c.lecno
where `regGrade` <> 'F'
group by `stdName`
order by `stdNo`;


#실습3-30
select `stdNo`,`stdName`,group_concat(`lecName`) as '신청과목',group_concat(if(`regTotalScore` >= 60,`lecName`,null)) as '이수과목'
from `student` as a
join `legister` as b
on a.stdno = b.regstdno
join `lecture` as c
on b.reglecno = c.lecno
group by `stdName`
order by `stdNo` asc;