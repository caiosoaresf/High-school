Drop database if exists CityDB;
Create database CityDB;
Use CityDB;

create table REALTOR (CPF varchar(14) not null,COMMISSION varchar(50) not null,NOM varchar(60) not null,constraint primary key (CPF));

create table PHONEREALTOR (DDD int not null,NUMB3R int not null,CPFREALTOR varchar(14) not null,constraint fk_PHONEREALTOR foreign key (CPFREALTOR) references REALTOR (CPF));

create table REALTOR_MANAGES_REALTOR (CPFMANAGER varchar(14) not null,CPFMANAGED varchar(14) not null,constraint fk_MANAGER foreign key (CPFMANAGER) references REALTOR (CPF),constraint fk_MANAGED foreign key (CPFMANAGED) references REALTOR (CPF));

create table COUNTY (NOM varchar(40) not null,UF varchar(30) not null,constraint primary key (NOM, UF));

create table REGION (Id int not null,NOM varchar(30) not null,NOMCOUNTY varchar(40) not null,UFCOUNTY varchar(30) not null,constraint primary key (Id),constraint fk_COUNTY foreign key (NOMCOUNTY, UFCOUNTY) references COUNTY (NOM, UF));

create table REALTORATTENDSREGION (CPFREALTOR varchar(14) not null,IdREGION int not null,constraint fk_CPFREALTOR foreign key (CPFREALTOR) references REALTOR (CPF),constraint fk_IdREGION foreign key (IdREGION) references REGION (Id));

Create view AmelieATTENDS as
select m.NOM as NOMDoMunicípio, m.UF as UnidadadeFederativa, r.NOM as NOMOFREGION
from COUNTY m, REGION r, REALTORATTENDSREGION car, REALTOR c
where m.NOM = r.NOMCOUNTY and
	r.id = car.idREGION and
    car.CPFREALTOR = c.CPF and
    c.NOM = "Amelie Brandão Tannus";

insert into REALTOR values ("001","60","Amelie Brandão Tannus");
insert into REALTOR values ("002","70","Gustavo Trabalhador");
insert into REALTOR values ("003","80","Luís soq Fraco");

insert into COUNTY values("Itauna","MG");
insert into COUNTY values("Rio de Janeiro","RJ");
insert into COUNTY values("São Paulo","SP");

insert into REGION values(004,"Belvedere","Itauna","MG");
insert into REGION values(005,"Lagoa Rodrigo de Freitas","Rio de Janeiro","RJ");
insert into REGION values(006,"Morumbi","São Paulo","SP");

insert into REALTORATTENDSREGION values("001",004);
insert into REALTORATTENDSREGION values("001",006);
insert into REALTORATTENDSREGION values("002",005);
insert into REALTORATTENDSREGION values("003",004);
insert into REALTORATTENDSREGION values("003",005);

select * from AmelieATTENDS;
