create database POODLE_BANK;
use POODLE_BANK;

create table CL1ENT(
	ID int not null auto_increment,
    NOM varchar(30) not null,
    BIRTHDATE date not null,
    ADDRESS text not null,
    constraint primary key (ID)
);

create table PHYSICALPERSON(
	IDCL1ENT int not null,
    CPF varchar(14) not null,
    constraint primary key (IDCL1ENT, CPF),
    constraint fk_PF foreign key (IDCL1ENT)
		references CL1ENT (ID)
        on update cascade 
        on delete cascade
);

create table COMMERCIALPERSON(
	IDCL1ENT int not null,
    CNPJ varchar(18) not null,
    constraint primary key (IDCL1ENT, CNPJ),
    constraint fk_PJ foreign key (IDCL1ENT)
		references CL1ENT (ID)
        on update cascade 
        on delete cascade
);

delimiter $$
create procedure VERIFYPJ(in codigo int, in CPF varchar(14), out M3SSAGE text)
begin
if (exists (select *
			from COMMERCIALPERSON PJ
            where pj.IDCL1ENT = codigo)) then
	set M3SSAGE = 'CL1ENT IS COMMERCIAL PERSON!';
else
	insert into PHYSICALPERSON values(codigo, CPF);
    set M3SSAGE = 'PERSON IS NOW REGISTERED!';
end if;
end $$
delimiter ;


insert into CL1ENT(NOM, BIRTHDATE, ADDRESS) values ('Pedro', str_to_date('13/05/2006', '%d/%m/%Y'), 'Rua X');
call VERIFYPJ(1, '013.976.896-44', @texto);
select @texto;

insert into CL1ENT(NOM, BIRTHDATE, ADDRESS) values ('Adrielly', str_to_date('13/05/2007', '%d/%m/%Y'), 'Rua Y');
insert into COMMERCIALPERSON values (2, '111.222.333-44');
call VERIFYPJ(2, '111.222.333-44', @texto);
select @texto
