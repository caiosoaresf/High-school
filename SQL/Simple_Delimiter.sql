CREATE DATABASE OI;
USE OI;

Create table CLIENTS(NOM varchar(50),GENDER varchar (2),AGE int not null,constraint primary key(NOM));

delimiter $$
create procedure FILTERGENDERCLIENTS (in OPT1ON int, out quant int)
begin
	if OPT1ON = 0 then
		select count(*) into quant from CLIENTS where GENDER = 'F';
	else
		if OPT1ON = 1 then
			select count(*) into quant from CLIENTS where GENDER = 'M';
		else
			if OPT1ON = 2 then
				select count(*) into quant from CLIENTS where GENDER = 'HC';
			else
				/* Quando a quantAGE é -1, sabe que o código foi 
                informado era inválido. */
                set quant = -1;
			end if;
		end if;
	end if;
end $$
