create Database Project2;
use Project2;

create table Employee(
	CPF varchar(15) not null,
    FirstName varchar(20) not null,
    LastName varchar(30) not null,
    Gender varchar(1) not null,
    Salary varchar(20) null,
    DateBirth varchar(10) not null,
    constraint primary key (CPF)
);
    
create table Dependant(
	CPFEmployee varchar(15) not null,
    Nom varchar(20) not null,
    Gender varchar(1) not null,
    Relationship varchar(10) not null,
    DateBirth varchar(10) not null,
    constraint primary key (CPFEmployee,Nom),
    constraint fk_Dependant foreign key (CPFEmployee) references Employee(CPF) on delete restrict
);

create table Department(
	Code int not null,
    CPFEmployee varchar(15) not null,
    Nom varchar(40) not null,
    NumberEmployees int not null,
    constraint primary key (Code),
    constraint fk_Department foreign key (CPFEmployee) references Employee(CPF) on delete cascade
);

create table Sectors(
	CodeDep int not null,
    ListLoc varchar(1000) not null,
    constraint primary key (CodeDep),
    constraint fk_Sectors foreign key (CodeDep) references Department(Code) on delete cascade
);

create table EmployeeWorksDep(
	CPFEmployee varchar(15) not null,
    CodeDep int not null,
    DateAdm varchar(10) not null,
	constraint primary key (CPFEmployee,CodeDep),
    constraint fk_EmployeeWorksDep foreign key (CPFEmployee) references Employee(CPF) on delete restrict,
    constraint fk_EmployeeWorksDep1 foreign key (CodeDep) references Department(Code) on delete restrict
);

create table Project(
	Title varchar(20) not null,
    Code int not null,
    CodeDep int not null,
    constraint primary key (Title,Code),
    constraint fk_Project foreign key (CodeDep) references Department(Code) on delete cascade
);

create table EmployeeWorksPro(
	CPFEmployee varchar(15) not null,
    TitlePro varchar(20) not null,
    CodePro int not null,
    Moment varchar(5) not null,
    constraint primary key (CPFEmployee,TitlePro,CodePro),
    constraint fk_EmployeeWorksPro foreign key (CPFEmployee) references Employee(CPF) on delete restrict,
    constraint fk_EmployeeWorksPro1 foreign key (TitlePro,CodePro) references Project(Title,Code) on delete restrict
);

insert into Employee values("12345678901","Maria","Luiza","F","5000","23/12/2000");
insert into Employee values(12145478700,'Gustavo','Costa','M',9000,'15/02/2003');
insert into Employee values(18645619004,'Lucas','Medeiros','M',8000,'04/06/2003');

insert into Dependant values(12345678901,'Joana','F','Mae','28/07/1973');
insert into Dependant values(12345678901,'Ricardo','M','Pai','16/07/1967');
insert into Dependant values(12345678901,'Antonio','M','Avô','31/01/1936');

insert into Department values(0254,12345678901,'Department de desenvolvimento',30);
insert into Department values(4753,12145478700,'Department de pesquisa',20);
insert into Department values(7561,18645619004,'Department de inteligencia',40);

insert into Sectors values(0254,'BH,SL,SP,RJ,SA,FO,BR');
insert into Sectors values(4753,'SL,CU,RB,SA,FL,BR,PA');
insert into Sectors values(7561,'SL,CU,RB,SA,FL,BR,PA');

insert into EmployeeWorksDep values(12345678901,0254,'11/11/2011');
insert into EmployeeWorksDep values(12145478700,4753,'22/11/2014');
insert into EmployeeWorksDep values(18645619004,7561,'26/08/2007');

insert into Project values('Meu Lar',00934,0254);
insert into Project values('Casa Nova',07549,4753);
insert into Project values('Rua Limpa',50781,7561);

insert into EmployeeWorksPro values(12345678901,'Meu Lar',00934,'13:54');
insert into EmployeeWorksPro values(12145478700,'Casa Nova',07549,'15:26');
insert into EmployeeWorksPro values(18645619004,'Rua Limpa',50781,'19:38');
