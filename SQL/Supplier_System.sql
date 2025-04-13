DROP DATABASE if EXISTS SUPPLIER;
CREATE DATABASE SUPPLIER;
USE SUPPLIER;

Create table SUPPLIER(COD3SUP int not null, NOM varchar(50) not null, constraint primary key(COD3SUP));

Create table PRODUCT(COD3Pro int not null, constraint primary key (COD3Pro));

Create table REQU3ST(COD1NGSUP int not null, COD1NGPro int not null, PRICE double not null, QUANT int not null, constraint fk_REQU3ST foreign key (COD1NGSUP) references SUPPLIER (COD3SUP), constraint fk_REQU3ST2 foreign key (COD1NGPro) references PRODUCT (COD3Pro));

insert into SUPPLIER values(10101,"Loja do Seu Zé");
insert into SUPPLIER values(20202,"Casa do Gustavo");
insert into SUPPLIER values(30303,"Serraria Sousa Pinto");

insert into PRODUCT values(111);
insert into PRODUCT values(222);
insert into PRODUCT values(333);

insert into REQU3ST values(10101,222,55.99,100);
insert into REQU3ST values(10101,111,87.49,70);
insert into REQU3ST values(20202,333,179.99,55);
insert into REQU3ST values(20202,333,149.99,450);
insert into REQU3ST values(30303,333,3515.99,20);
insert into REQU3ST values(20202,111,4499.99,15);

DROP PROCEDURE IF EXISTS QUESTION;
delimiter $$
create procedure QUESTION (in Prod int, inout LIST text)
begin
	declare ENDING int default 0;
	declare REQU3STDONE varchar(40);
	declare ANALYSIS cursor for select f.NOM
								from SUPPLIER f, REQU3ST pd 
                                where f.COD3SUP = pd.COD1NGSUP 
                                and pd.COD1NGPro = Prod 
                                group by f.NOM 
                                having sum(pd.QUANT) > 10;
	declare continue handler for not found set ENDING = 1; 
    
	open ANALYSIS;
	SEACHINGREQU3ST : loop
		fetch ANALYSIS into REQU3STDONE;
		if ENDING = 1 then
			leave SEACHINGREQU3ST;
		end if;
		set LIST= concat(REQU3STDONE, ', ' , LIST);
	end loop SEACHINGREQU3ST;
    set LIST= concat(Prod, ' : ' , LIST);
end $$
delimiter ;

set @TEST = '';
call QUESTION(222,@TEST);
select @TEST;
