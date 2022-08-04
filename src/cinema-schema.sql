drop database if exists cinema;
create database cinema;
use cinema;

DROP TABLE if EXISTS cinemaemployee;
DROP TABLE if EXISTS cinemamovie;
DROP TABLE if EXISTS employeephone;
DROP TABLE if EXISTS moviedistributor;
DROP TABLE if EXISTS movieshow;
DROP TABLE if EXISTS roomshow;


create or REPLACE table cinema(
	cinemaId int auto_increment,
	cinemaName varchar(30),
	primary KEY (cinemaId)
);

create or replace table employee(
	employeeid int auto_increment,
	employeeName varchar(50),
	address varchar(50),
	primary KEY (employeeid)
);

create or replace table phone(
	phoneid int auto_increment,
	phonetype enum('Mobile','Home'),
	phoneNumber varchar(15),
	primary KEY (phoneid)
);

create or replace table movie(
	movieid int auto_increment,
	moviename varchar(80),
	runtime float(5,2),
	primary KEY (movieid)
);

create or replace table distributor(
	distributorid int auto_increment,
	distributorname varchar(50),
	primary KEY (distributorid)
);

create or replace table room(
	roomid int auto_increment,
	seatNo int not null,
	primary KEY (roomid)
);

create or replace table shows(
	showid int auto_increment,
	day date,
	starttime time,
	endtime time,
	type enum ('2D','3D','4D'),
	PRIMARY KEY (SHOWid)
);

create or replace table cinemaemployee(
	cinemaid int not null,
	employeeid int not null,
	primary key (cinemaid, employeeid),
	constraint fk_cinemaemployee_cinema foreign key (cinemaid) references cinema(cinemaId),
	constraint fk_cinemaemployee_employee foreign key (employeeid) references employee(employeeid)
);

create or replace table cinemamovie(
	cinemaid int not null,
	movieid int not null,
	primary key (cinemaid, movieid),
	constraint fk_cinemamovie_cinema foreign key (cinemaid) references cinema(cinemaId),
	constraint fk_cinemamovie_movie foreign key (movieid) references movie(movieid)
);

create or replace table employeephone(
	employeid int not null,
	phoneid int not null,
	primary key (employeid, phoneid),
	constraint fk_employeephone_employee foreign key (employeid) references employee(employeeid),
	constraint fk_employeephone_phone foreign key (phoneid) references phone(phoneid)
);

create or replace table moviedistributor(
	movieid int not null,
	distributorid int not null,
	primary key (movieid, distributorid),
	constraint fk_moviedistributor_movie foreign key (movieid) references movie(movieid),
	constraint fk_moviedistributor_distributor foreign key (distributorid) references distributor(distributorid)
);

create or replace table movieshows(
	movieid int not null,
	showid int not null,
	primary key (movieid, showid),
	constraint fk_movieshow_movie foreign key (movieid) references movie(movieid),
	constraint fk_movieshow_show foreign key (showid) references shows(showid)
);

create or replace table roomshow(
	roomid int not null,
	showid int not null,
	primary key (roomid, showid),
	constraint fk_roomshow_room foreign key (roomid) references room(roomid),
	constraint fk_roomshow_show foreign key (showid) references shows(showid)
);