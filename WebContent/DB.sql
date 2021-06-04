create table tbl_a(
	id char(4) primary key,
	name varchar2(20),
	birth char(8),
	gender char(1) check(gender in('M','F')),
	talent char(1) check(talent in('1','2','3')),
	agency varchar2(20)
)

create table tbl_m(
	mid char(4) primary key,
	mname varchar2(20)
)

create table tbl_p(
	sno char(4) primary key,
	id varchar2(20),
	mid char(4),
	point number(3)
)

insert into tbl_a values('A001','황스타','19970101','F','1','A');
insert into tbl_a values('A002','황스타','19980201','M','2','B');
insert into tbl_a values('A003','황스타','19990301','M','3','C');
insert into tbl_a values('A004','황스타','20000401','M','1','D');
insert into tbl_a values('A005','황스타','20010501','F','2','E');

insert into tbl_m values('J001','아멘토');
insert into tbl_m values('J002','안멘토');
insert into tbl_m values('J003','한멘토');

insert into tbl_p values('P001','A001','J001',84);
insert into tbl_p values('P002','A001','J002',94);
insert into tbl_p values('P003','A001','J003',44);

insert into tbl_p values('P004','A002','J001',24);
insert into tbl_p values('P005','A002','J002',64);
insert into tbl_p values('P006','A002','J003',74);

insert into tbl_p values('P007','A003','J001',24);
insert into tbl_p values('P008','A003','J002',14);
insert into tbl_p values('P009','A003','J003',44);

insert into tbl_p values('P010','A004','J001',94);
insert into tbl_p values('P011','A004','J002',74);
insert into tbl_p values('P012','A004','J003',84);

insert into tbl_p values('P013','A005','J001',54);
insert into tbl_p values('P014','A005','J002',64);
insert into tbl_p values('P015','A005','J003',74);

select id, name, birth, decode(gender, 'M','남성','F','여성') gender, decode(talent, '1','보컬','2','댄스','3','랩') talent, agency from tbl_a

select a.id, name, birth, sum(point) point, mname from tbl_a a, tbl_m m, tbl_p p where a.id = p.id and p.mid = m.mid group by a.id, name, birth, mname order by a.id asc

select a.id, name, sum(point) sum, round(avg(point),2) avg from tbl_a a, tbl_p p where a.id = p.id group by a.id, name order by sum desc

select * from tbl_a where id='A006'

update TBL_A set name='서준호', birth='20030502', gender='M', talent='2', agency='A엔터테이먼트' where id='A006' 

delete TBL_A where id='A006'