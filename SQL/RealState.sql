Create database RealState;
use RealState;

create table Realtor(
	CPF varchar(14) not null, 
	Commission double not null, 
	Nom varchar(30) not null, 
	CPFManager varchar(14) not null, 
	constraint primary key (CPF),
	constraint fK_Realtor foreign key (CPFManager) references Realtor(CPF) on delete restrict
);

create table County(
	Nom varchar(20) not null,
	UF char(2) not null,
	constraint primary key (Nom, UF)
);

create table Region(
	ID int not null,
	Nom varchar(20) not null,
	NomCounty varchar(20) not null,
	UFCounty char(2) not null, 
	constraint primary key (ID),
	constraint fK_CountyRegion foreign key (NomCounty, UFCounty) references County(Nom, UF) on delete cascade
);

create table PhoneNumbers (
	CPFRealtor varchar(14) not null,
	DDD varchar(3) not null, 
	Contact varchar(9) not null, 
	constraint primary key (CPFRealtor),
	constraint fK_RealtorPhoneNumbers foreign key (CPFRealtor) references Realtor(CPF) on delete cascade
);

create table RealtorAttendsRegion(
	CPFRealtor varchar(14) not null,
	IDRegion int not null, 
	constraint primary key (CPFRealtor, IDRegion),
	constraint fK_RealtorAttends foreign key (CPFRealtor) references Realtor(CPF) on delete cascade,
	constraint fK_RegionAttends foreign key (IDRegion) references Region(ID) on delete restrict
);
