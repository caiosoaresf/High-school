drop database if exists Enrollment;
create database Enrollment;
use Enrollment;

create table PERSON(CPF int not null,NOM varchar(50) not null,ADDRESS varchar(200) not null,constraint primary key(CPF));

create table STUDENT(CPF1 int not null,RA int not null,SCORE int not null,constraint primary key(CPF1, RA),constraint fk_STUDENT foreign key(CPF1) references PERSON(CPF) on delete cascade);

create table INTERNSHIP(CPF2 int not null,RA1 int not null,SCHOLARSHIP int not null,constraint primary key(CPF2, RA1),constraint fk_INTERNSHIP1 foreign key(CPF2) references STUDENT(CPF1) on delete cascade,constraint fk_INTERNSHIP2 foreign key(CPF2, RA1) references STUDENT(CPF1, RA) on delete cascade);

create table EMPLOYEE(CPF3 int not null,SALARY int not null,constraint primary key(CPF3),constraint fk_EMPLOYEE foreign key(CPF3) references PERSON(CPF) on delete cascade);
