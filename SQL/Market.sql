Drop database if exists MARKET;
Create database MARKET;
Use MARKET;

Create table PRODUCT (COD3 int(5) not null,NOM varchar(30) not null,STOCK int(10) not null,constraint primary key (COD3));

Create table ItemSELL (codItem int(6) auto_increment not null,QUANTITY int(10) not null,PRICE float(8,2) not null,codProd int(5) not null,constraint primary key (codItem),constraint fk_PRODUCT foreign key (codProd) references PRODUCT (COD3));

insert into PRODUCT values (50, 'Camisa Atlético', 250);
insert into PRODUCT values (60, 'Camisa Palmeiras', 260);
insert into PRODUCT values (70, 'Camisa Elche CF', 300);
insert into PRODUCT values (100, 'Chuteira Adidas', 100);

insert into ItemSELL (QUANTITY, PRICE, codProd) values (10, 150.00, 50);
insert into ItemSELL (QUANTITY, PRICE, codProd) values (9,50.00, 70);
insert into ItemSELL (QUANTITY, PRICE, codProd) values (9, 600, 100);

delimiter $$
create procedure VERIFYQUANTITYPRODUCT(out QUANTITY int)
begin
	select count(*) into QUANTITY from PRODUCT;
end $$
delimiter ;

call VERIFYQUANTITYPRODUCT(@total);
select @total;

delimiter &&
create trigger UPDATESTOCKSELL after insert
on ItemSELL for each row
begin
	update PRODUCT set STOCK = STOCK - new.QUANTITY
    where COD3 = new.codProd;
end &&
delimiter ;

delimiter &&
create trigger DELETEItemSELL after delete
on ItemSELL for each row
begin
	update PRODUCT set STOCK = STOCK + old.QUANTITY
    where COD3 = old.codProd;
end &&
delimiter &&
