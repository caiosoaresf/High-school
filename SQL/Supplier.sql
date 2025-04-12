Drop database if exists SUPPLIER;
Create database SUPPLIER;
Use SUPPLIER;

create table SUPPLIER (Cod3Supplier int not null,Nom varchar(60) not null,	constraint primary key (Cod3Supplier));

create table PRODUCT (Cod3Product int not null,Stock int not null,constraint primary key (Cod3Product));

create table SUPPLIER_ASK_PRODUCT (Cod3Supplier int not null,Cod3Product int not null,Price double not null,Quantity int not null,constraint fk_Supplier foreign key (Cod3Supplier) references SUPPLIER (Cod3Supplier),constraint fk_Prod foreign key (Cod3Product) references PRODUCT (Cod3Product));

insert into SUPPLIER values(1,"SUPPLIER1");
insert into SUPPLIER values(2,"SUPPLIER2");
insert into SUPPLIER values(3,"SUPPLIER3");

insert into PRODUCT values(600,200);
insert into PRODUCT values(700,1000);
insert into PRODUCT values(800,200);
insert into PRODUCT values(900,400);
insert into PRODUCT values(1000,20);

insert into SUPPLIER_ASK_PRODUCT values(1,600,20.00,1000);
insert into SUPPLIER_ASK_PRODUCT values(1,800,500.00,200);
insert into SUPPLIER_ASK_PRODUCT values(2,1000,303.00,700);
insert into SUPPLIER_ASK_PRODUCT values(3,700,882.99,840);
insert into SUPPLIER_ASK_PRODUCT values(2,600,12000.50,550);
insert into SUPPLIER_ASK_PRODUCT values(1,600,300.00,640);

delimiter $
create procedure VERIFYPRODUCT(in COD3PRODUCT int)
begin
	select count(*) as TIMESBOUGHT, sum(fpp.Price) as PROFITGENERATED, sum(fpp.Quantity) as QUANTITYSOLD
    from SUPPLIER_ASK_PRODUCT fpp where fpp.Cod3Product = COD3PRODUCT;
end $
delimiter ;

call VERIFYPRODUCT(1000);
call VERIFYPRODUCT(700);
call VERIFYPRODUCT(600);
call VERIFYPRODUCT(900);
call VERIFYPRODUCT(800);
