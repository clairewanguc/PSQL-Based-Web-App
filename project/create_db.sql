create table schools (scolname text PRIMARY KEY, location_country text, location_state text, location_city text, scale_students int, scale_faculty int);

create table departments (scolname text references schools(scolname), deptname text NOT NULL, PRIMARY KEY(scolname, deptname) );

create table labs (labname text PRIMARY KEY, size_student int, size_staff int, labdept text not null);

create type sex as enum ('female','male','intersex');
create table professors (email varchar(355) primary key, profname text not null, sex sex, npaper int, birthdate date, focus text not null, profdept text,pilab text not null);

create table students (gradname text, graddate date, primary key (gradname, graddate), adname text not null);

create table labcolb (prim text, secd text, primary key (prim, secd)); 
 
create table scolcolb (scola text, scolb text, primary key (scola, scolb)); 

create table joindept (joina text not null , joinb text not null, joinname text primary key, FOREIGN KEY (joina, joinb) REFERENCES scolcolb (scola, scolb));

create table profcolb (colba text, aemail varchar(355) references professors(email), colbb text unique, bemail varchar(355) not null, primary key(colba, colbb), projname text not null); 

create table collaborators (email varchar(355) primary key, profname text not null, sex sex, npaper int, birthdate date, focus text not null, scolname text, pilab text not null, foreign key(profname) references profcolb(colbb)); 

