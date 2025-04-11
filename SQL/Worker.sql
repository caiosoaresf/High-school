create database Worker;
use Worker;

create table Person(
    CPF varchar(20) not null,
    Nom varchar(20) null,
    constraint primary key(CPF) 
);
create table Worker(
	CPF_Person varchar (20) not null,
	Salary double not null,
    constraint primary key (CPF_Person),
    constraint fk_CPF foreign key (CPF_Person) references Person(CPF) on delete cascade
);
insert into Person values('013.976.896-33', 'Moises');
insert into Worker values('013.976.896-33', '1500');
select * from Person;
