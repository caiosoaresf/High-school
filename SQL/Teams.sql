create database Receba;
use Receba;
create table player(
	BID int not null,
    nom varchar (40) not null,
    origin varchar (20) null,
    dataNasc varchar (10) null,
    constraint primary key (BID)
);
create table championship(
	BIDplayer int not null,
    prize varchar(50) not null,
    constraint primary key (BIDplayer,prize),
    constraint fk_player foreign key (BIDplayer) references player(BID) on delete restrict
);

create table team(
	nom varchar(20) not null,
	acronym varchar(3) null,
	city varchar(30) null,
    league varchar (1000) not null,
	constraint primary key (nom)  
);

create table playergame(
	BIDplayer_plays int not null,
    teamname_plays varchar(20) not null,
    constraint primary key (BIDplayer_plays, teamname_plays),
    constraint fk_BIDplayer_plays foreign key (BIDplayer_plays) references player(BID) on delete cascade,
    constraint fk_teamname_plays foreign key (teamname_plays) references team(nom) on delete restrict
);

insert into team values ('Palmeiras','PAL','São Paulo','Série A');
insert into team values ('Atlhético Paraense','CAP','Curitiba','Série A');
insert into team values ('Atlético Mineiro','CAM','Belo Horizonte','Série A');
insert into team values ('Corinthians','COR','São Paulo','Série A');
insert into team values ('Internacional','INT','Porto Alegre','Série A');
insert into team values ('Fluminense','FLU','Rio de Janeiro','Série A');
insert into team values ('São Paulo','SAO','São Paulo','Série A');
insert into team values ('Flamengo','FLA','Rio de Janeiro','Série A');
insert into team values ('Botafogo','BOT','Rio de Janeiro','Série A');
insert into team values ('Santos','SAN','Santos','Série A');
insert into team values ('Avaí','AVA','Florianópolis','Série A');
insert into team values ('Coritiba','CFC','Curitiba','Série A');
insert into team values ('América Mineiro','AME','Belo Horizonte','Série A');
insert into team values ('Bragantino','BGT','Bragança Paulista','Série A');
insert into team values ('Ceará','CEA','Fortaleza','Série A');
insert into team values ('Atlético Goianiense','ACG','Goiânia','Série A');
insert into team values ('Goiás','GOI','São Paulo','Série A');
insert into team values ('Cuiabá','CUI','Cuiabá','Série A');
insert into team values ('Juventude','JUV','Caxias do Sul','Série A');
insert into team values ('Fortaleza','FOR','Fortaleza','Série A');
insert into team values ('Cruzeiro','CRU','Belo Horizonte','Série B');
insert into team values ('Vasco da Gama','VAS','Rio de Janeiro','Série B');
insert into team values ('Bahia','BAH','Salvador','Série B');
insert into team values ('Grêmio','GRE','Porto Alegre','Série B');
insert into team values ('Criciúma','CRI','Criciúma','Série B');
insert into team values ('Novo Horizontino','NOV','Novo Horizonte','Série B');
insert into team values ('CRB','CRB','Maceió','Série B');
insert into team values ('Londrina','LEC','Londrina','Série B');
insert into team values ('Sport Recife','SPT','Recife','Série B');
insert into team values ('Tombense','TOM','Tombos','Série B');
insert into team values ('Brusque','BRU','Brusque','Série B');
insert into team values ('Sampaio Correia','SCO','São Luís','Série B');
insert into team values ('Operário','OPE','Ponta Grossa','Série B');
insert into team values ('Ituano','ITU','Itú','Série B');
insert into team values ('Chapecoense','CHA','Chapecó','Série B');
insert into team values ('Náutico','NAU','Recife','Série B');
insert into team values ('Ponte Preta','PON','Campinas','Série B');
insert into team values ('CSA','CSA','Maceió','Série B');
insert into team values ('Guarani','GUA','Campinas','Série B');
insert into team values ('Vila Nova','VNO','Nova Lima','Série B');
