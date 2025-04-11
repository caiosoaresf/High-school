create database Recebo;
use Recebo;

create table Player(
	Bid int not null,
    Nom varchar(20) null,
    Origin varchar(20) null,
    constraint primary key(Bid) 
);

create table Championship(
	BidPlayer int not null,
    Prize varchar(30) not null,
    constraint primary key (BidPlayer, Prize),
    constraint fk_Player foreign key (BidPlayer) references Player(Bid) on delete restrict
);
