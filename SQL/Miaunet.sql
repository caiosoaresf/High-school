create database miaunet;
use miaunet;

create table Genre(
Code int not null auto_increment,
Nom varchar (30),
constraint primary key (Code)
);

create table Piece(
TitleID int auto_increment,
Title varchar(30),
Kind ENUM("Filme","Série"),
Duration varchar(10),
GenreCode int not null,
constraint primary key (TitleID),
constraint fk_Piece foreign key (GenreCode) references Genre(Code) on delete cascade
);

insert into Genre(Nom) values ("Ação");
insert into Genre(Nom) values ("Aventura");
insert into Genre(Nom) values ("Animação");
insert into Genre(Nom) values ("Comedia");
insert into Genre(Nom) values ("Drama");
insert into Genre(Nom) values ("Musica");
insert into Genre(Nom) values ("Misterio");
insert into Genre(Nom) values ("Romance");
insert into Genre(Nom) values ("Terror");
insert into Genre(Nom) values ("Guerrra");
insert into Genre(Nom) values ("Ficção Cientifica");
insert into Genre(Nom) values ("Familia");
insert into Genre(Nom) values ("Crime");
insert into Genre(Nom) values ("Documentario");
insert into Genre(Nom) values ("Suspense");

insert into Piece(Title, Kind, Duration, GenreCode) values ("Minha mãe é uma peça 1", "Filme", "1:40", 4); 
insert into Piece(Title, Kind, Duration, GenreCode) values ("Minha mãe é uma peça 2", "Filme", "1:40", 4);
insert into Piece(Title, Kind, Duration, GenreCode) values ("Minha mãe é uma peça 3", "Filme", "1:40", 4);
insert into Piece(Title, Kind, Duration, GenreCode) values ("Os mercenários 3", "Filme", "1:40", 1);
insert into Piece(Title, Kind, Duration, GenreCode) values ("Free fire", "Filme", "1:40", 14);
insert into Piece(Title, Kind, Duration, GenreCode) values ("Kong fu panda", "Filme", "1:40", 2);
insert into Piece(Title, Kind, Duration, GenreCode) values ("Kong fu panda 2", "Filme", "1:43", 2);
insert into Piece(Title, Kind, Duration, GenreCode) values ("All of us are dead", "Série", "40", 15);
insert into Piece(Title, Kind, Duration, GenreCode) values ("A namorada do gustavo 3º ano", "Série", "365", 15);
