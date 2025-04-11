create database Little_Game;
use Little_Game;

create table User (
  Nick varchar(10) not null,
  Nom varchar(30) not null,
  XP int not null,
  Life double not null,
  constraint primary key (Nick)
);
create table Human (
  Nick_User varchar(10) not null,
  Strength double not null,
  constraint primary key (Nick_User),
  constraint fk_User_H foreign key (Nick_User) references User(Nick) on delete cascade 
);
create table Inhuman (
  Nick_User varchar(10) not null,
  Magic double not null,
  constraint primary key (Nick_User),
  constraint fk_User_I foreign key (Nick_User) references User(Nick) on delete cascade 
);
create table Weapon (
  XP_Damage int not null,
  Nom varchar(120) not null,
  Sinopsis text null,
  constraint primary key (Nom)
);
create table UserWeapon (
  Nick_User varchar(10) not null,
  Nom_Weapon varchar(120) not null,
  constraint primary key (Nick_User, Nom_Weapon),
  constraint fk_User_Weapon foreign key (Nick_User) references User(Nick) on delete cascade,
  constraint fk_User_Weapon1 foreign key (Nom_Weapon) references Weapon(Nom) on delete restrict
);
