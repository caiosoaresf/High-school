create database Invincible;
use Invincible;

create table User(
    Nom varchar(30) not null,
    Attack double not null,
    Defense double not null,
    Health double not null,
    constraint primary key (Nom)
);
create table Mage(
    NomUser varchar(30) not null,
    Clan varchar (30) not null,
    constraint primary key (NomUser),
    constraint fk_Mage foreign key (NomUser) references User (Nom) on delete cascade
);
create table Dwarfs(
    NomUser varchar(30) not null,
    Guardian varchar (30) not null,
    constraint primary key (NomUser),
    constraint fk_Dwarfs foreign key (NomUser) references User (Nom) on delete cascade
);
create table Elf(
    NomUser varchar(30) not null,
    Skills varchar (50) not null,
    constraint primary key (NomUser),
    constraint fk_Elf foreign key (NomUser) references User (Nom) on delete cascade
);
create table Warrior(
    NomUser varchar(30) not null,
    Strength double not null,
    constraint primary key (NomUser),
    constraint fk_Warrior foreign key (NomUser) references User (Nom) on delete cascade
);
create table Orc(
    NomUser varchar(30) not null,
    Evilness int not null,
    constraint primary key (NomUser),
    constraint fk_Orc foreign key (NomUser) references User (Nom) on delete cascade
);
