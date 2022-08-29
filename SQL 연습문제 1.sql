#날짜 : 2022 08 29
#이름 : 박진휘
#내용 : SQL 연습문제1

#실습 1-1
create database `Java1_Shop`;
create user 'Java1_admin1'@'%'identified by '1234';
grant all privileges on `Java1_Shop` to 'Java1_admin1'@'%';
flush privileges;

#실습 1-2
create table `Customer`(
	`custid` varchar(10) primary key,
	`name` varchar(10) not null,
    `hp` varchar(13),
    `addr` varchar(100),
    `rdate` date not null
);

create table `Product`(
	`prodNo` int primary key,
    `prodName` varchar(10) not null,
    `stock` int default 0,
    `price` int,
    `company` varchar(20) not null
);

create table `Order`(
	`orderNo` int primary key,
    `orderId` varchar(10) not null,
    `orderProduct` int not null,
    `orderCount` int default 0,
    `orderDate` datetime
);

#실습 1-3
insert into `customer` values ('c101','김유신','010-1234-1001','김해시 봉황동','2022-08-28');
insert into `customer` values ('c102','김춘추','010-1234-1002','경주시 보문동',now());
insert into `customer` values ('c103','장보고','010-1234-1003','완도군 청산면',now());
insert into `customer` values ('c104','강감찬','010-1234-1004','서울시 마포구',now());
insert into `customer` (`custid`,`name`,`rdate`) values ('c105','이성계',now());
insert into `customer` values ('c106','정철','010-1234-1006','경기도 용인시',now());
insert into `customer` (`custid`,`name`,`rdate`) values ('c107','허준',now());
insert into `customer` values ('c108','이순신','010-1234-1008','서울시 영등포구',now());
insert into `customer` values ('c109','송상현','010-1234-1009','부산시 동래구',now());
insert into `customer` values ('c110','정약용','010-1234-1010','경기도 광주시',now());

insert into `product` values (1,'새우깡',5000,1500,'농심');
insert into `product` values (2,'초코파이',2500,2500,'오리온');
insert into `product` values (3,'포카칩',3600,1700,'오리온');
insert into `product` values (4,'양파링',1250,1800,'농심');
insert into `product` (`prodNo`,`prodName`,`stock`,`company`) values (5,'죠리퐁',2200,'크라운');
insert into `product` values (6,'마카렛트',3500,3500,'롯데');
insert into `product` values (7,'뿌셔뿌셔',1650,1200,'오뚜기');

insert into `order` values (1,'c102',3,2,'2022-08-28 13:15:10');
insert into `order` values (2,'c101',4,1,now());
insert into `order` values (3,'c108',1,1,now());
insert into `order` values (4,'c109',6,5,now());
insert into `order` values (5,'c102',2,1,'2022-07-03 09:15:37');
insert into `order` values (6,'c101',7,3,now());
insert into `order` values (7,'c110',1,2,now());
insert into `order` values (8,'c104',2,4,now());
insert into `order` values (9,'c102',1,3,now());
insert into `order` values (10,'c107',6,1,now());

#실습 1-4
select * from `customer`;

#실습 1-5
select `custid`, `name`, `hp` from `customer`;

#실습 1-6
select * from `product`;

#실습 1-7
select `company` from `product`;

#실습 1-8
select `company` from `product` group by `company`;

#실습 1-9
select `prodname`,`price` from `product`;

#실습 1-10
select `prodname`,`price`+500 from `product`;

#실습 1-11
select `prodname`,`stock`,`price` from `product` where `company` = '오리온';

#실습 1-12
select `orderproduct`,`ordercount`,`orderdate` from `order` where `orderid` = 'c102';

#실습 1-13
select `orderproduct`,`ordercount`,`orderdate` from `order` where `orderid` = 'c102' and `ordercount` >= 2;

#실습 1-14
select * from `product` where `price` >= 1000 and `price` <= 2000;

#실습 1-15
select `custid`,`name`,`hp`,`addr` from `customer` where `name` like '김%';

#실습 1-16
select `custid`,`name`,`hp`,`addr` from `customer` where `name` like '__'; 

#실습 1-17
select * from `customer` where `hp` is null;

#실습 1-18
select * from `customer` where `addr` is not null;

#실습 1-19
select * from `customer` order by `rdate` desc;

#실습 1-20
select * from `order` where `ordercount` >= 3 order by `ordercount` desc, `orderProduct` asc;

#실습 1-21
select avg(`price`) as '평균' from `product`;

#실습 1-22
select sum(`stock`) as '함계' from `product` where `company` = '농심';

#실습 1-23
select count(`custid`) as '고객수' from `customer`;

#실습 1-24
select count(distinct `company`) as '제조업체수' from `product`;

#실습 1-25
select `orderproduct` as '주문 상품번호', sum(`ordercount`) as '총 주문수량' from `order`
group by `주문 상품번호` order by `주문 상품번호` asc;

#실습 1-26
select `company` as '제조업체', count(*) as '제품수', max(`price`) as '최고가' from `product`
group by `제조업체` order by `제조업체` asc;

#실습 1-27
select `company` as '제조업체', count(*) as '제품수', max(`price`) as '최고가' from `product`
group by `company` limit 2;

#실습 1-28
select `orderproduct`, `orderid`, sum(`ordercount`) as '총 주문수량' from `order`
group by `orderproduct`, `orderid` order by `orderproduct` asc;

#실습 1-29
select a.orderid, b.prodname from `order` as a
join `product` as b
on a.orderno = b.prodno
where `orderid` = 'c102';

#실습 1-30
select `orderid`,`name`,`prodname`,`orderdate` from `order` as a
join `customer` as b
on a.orderid = b.custid
join `product` as c
on a.orderProduct = c.prodno
where `orderdate` between '2022-07-03 00:00:00' and '2022-08-28 23:59:00';