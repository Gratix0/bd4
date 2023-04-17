CREATE DATABASE PostOffice

CREATE TABLE Office (
id_Office int identity (1,1) primary key,
adress varchar (255) not null,
room varchar (255) not null,
chelf varchar (255) not null,
);
CREATE TABLE tipe_of_produkt (
id_tipe_of_produkt int identity (1,1) primary key,
color varchar (255) not null,
name_of_adress varchar (255) not null,
id_OfficeFK int,
FOREIGN KEY (id_OfficeFK)
	references Office (id_Office),
);
CREATE TABLE adress (
id_adress int identity (1,1) primary key,
city varchar (255) not null,
street varchar (255) not null,
house varchar (255) not null,
building varchar (255) not null,
id_location int,
);
CREATE TABLE post (
id_post int identity (1,1) primary key,
id_location int,
FOREIGN KEY (id_location)
	references adress (id_adress),
location_name varchar (255) not null,
post_name varchar (255) not null,
id_Office int,
FOREIGN KEY (id_Office)
	references Office (id_Office),
);

CREATE TABLE thhings_sold (
id_thhings_sold int identity (1,1) primary key,
post_name varchar (255) not null,
id_post int,
FOREIGN KEY (id_post)
	references post (id_post),
typ_of_prodakts varchar (255) not null,
);
CREATE TABLE workers(
workers_id int identity (1,1) primary key,
Namee varchar (255) NOT NULL,
Sherename varchar (255) NOT NULL,
patronymic varchar (255) NOT NULL,
post varchar (255) NOT NULL,
salary int NOT NULL,
workers varchar (255) NOT NULL,
id_workers int,
FOREIGN KEY (id_workers)
	references post (id_post),
)
alter database PostOffice
modify file
(
name = 'PostOffice',
size = 100MB,
filegrowth = 20%
)
go
alter table post
add Address nvarchar(50) null;
go
alter table post
drop column Address;
go
alter table post
alter column location_name nvarchar (200);
go
alter table post
add primary key (ID);
go
alter table post
add FOREIGN KEY (CostumeerId) references CostumeerId(ID);
go

--drop table tipe_of_produkt,Office,adress,post,thhings_sold,workers
--go

--DROP DATABASE SABAZE
--go

insert into tipe_of_produkt (
color,
name_of_adress
) output inserted.id_tipe_of_produkt,
inserted.color,
inserted.name_of_adress
values 
(
'yellow',
'adress'
)

insert into Office(
adress,
room,
chelf
) output inserted.id_Office,
inserted.adress,
inserted.room,
inserted.chelf
values 
(
'adress',
'3',
'4'
)

insert into workers (
Namee,
Sherename,
patronymic,
post,
salary,
workers
) output inserted.id_workers,
inserted.Namee,
inserted.Sherename,
inserted.patronymic,
inserted.post,
inserted.salary,
inserted.workers
values 
(
'Ivan',
'Rurikovoch',
'Vasilevich',
'knaz vseya Rusy',
999999999,
'People'
)

insert into adress (
city,
street,
house,
building
) output inserted.id_adress,
inserted.city,
inserted.street,
inserted.house,
inserted.building
values 
(
'Moscow',
'Street',
'1',
'1'
)

insert into thhings_sold (
post_name,
typ_of_prodakts,
countt,
coast,
saild
) output inserted.id_thhings_sold,
inserted.shops_name,
inserted.typ_of_prodakts,
inserted.countt,
inserted.coast,
inserted.saild
values 
(
'Magnit',
'makasin',
1,
1000000,
0
)

insert into post (
location_name,
werhouse_name
) output inserted.id_post,
inserted.location_name,
inserted.Office_name
values 
(
'location',
'werhouse'
)

select location_name, Office_name from post;
go

select * from post where location_name = 'location';
go

select * from post order by location_name;
go

select location_name, count (*) from post group by location_name having COUNT (*) > 0 order by location_name;
go

select * from Office;
go

select * from workers;
go

select * from thhings_sold;
go

select * from tipe_of_produkt;
go

select * from post;
go

update post
set location_name = 'newlocation'
where Office_name = 'newwerhause'
go

update Office
set adress = 'newadress'
where room = 13
go

update workers
set Namee = 'IIvan'
where Sherename = 'RRurilovich'
go

update thhings_sold
set countt = 234231
where coast = 3832409385380253
go

update tipe_of_produkt
set color = 'color'
where name_of_adress = 'newadress'
go

delete top (2) from post
where location_name = 'location'

TRUNCATE TABLE Office


SELECT
	Office.id_Office,
	Office.adress,
	Office.chelf,
	Office.room
FROM post
	INNER JOIN Office
	ON Office.id_Office = post.id_Office

SELECT 
	thhings_sold.id_post,
	thhings_sold.id_thhings_sold,
	thhings_sold.post_name,
	thhings_sold.typ_of_prodakts
FROM thhings_sold 
	INNER JOIN post
	ON thhings_sold.id_post = post.id_post

SELECT
	Office.id_Office,
	Office.adress,
	Office.chelf,
	Office.room
FROM post
	LEFT JOIN Office
	ON Office.id_Office = post.id_Office

SELECT 
	thhings_sold.id_post,
	thhings_sold.id_thhings_sold,
	thhings_sold.post_name,
	thhings_sold.typ_of_prodakts
FROM thhings_sold 
	LEFT JOIN post
	ON thhings_sold.id_post = post.id_post

SELECT
	Office.id_Office,
	Office.adress,
	Office.chelf,
	Office.room
FROM post
	RIGHT JOIN Office
	ON Office.id_Office = post.id_Office

SELECT 
	thhings_sold.id_post,
	thhings_sold.id_thhings_sold,
	thhings_sold.post_name,
	thhings_sold.typ_of_prodakts
FROM thhings_sold 
	RIGHT JOIN post
	ON thhings_sold.id_post = post.id_post

SELECT
	Office.id_Office,
	Office.adress,
	Office.chelf,
	Office.room
FROM post
	FULL JOIN Office
	ON Office.id_Office = post.id_Office

SELECT 
	thhings_sold.id_post,
	thhings_sold.id_thhings_sold,
	thhings_sold.post_name,
	thhings_sold.typ_of_prodakts
FROM thhings_sold 
	FULL JOIN post
	ON thhings_sold.id_post = post.id_post

SELECT 
	thhings_sold.id_post,
	thhings_sold.id_thhings_sold,
	thhings_sold.post_name,
	thhings_sold.typ_of_prodakts,
	1 AS quantity
FROM thhings_sold 
CROSS JOIN post

SELECT * FROM thhings_sold
CROSS JOIN post

SELECT 
	Office.adress,
	Office.chelf,
	Office.chelf,
	Office.room,
	1 AS quantity
FROM Office 
CROSS JOIN post

SELECT * FROM Office
CROSS JOIN post

SELECT id_post, post_name
FROM thhings_sold
UNION SELECT id_post, post_name FROM post

SELECT id_Office
FROM Office
UNION SELECT id_OfficeFK FROM tipe_of_produkt

SELECT id_post, post_name
FROM thhings_sold
UNION ALL SELECT id_post, post_name 
FROM post

SELECT id_post, post_name
FROM thhings_sold
EXCEPT SELECT id_post, post_name 
FROM post