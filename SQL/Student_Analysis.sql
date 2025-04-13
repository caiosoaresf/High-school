DROP DATABASE if EXISTS STUDENTS;
CREATE DATABASE STUDENTS;
USE STUDENTS;

Create table INDIVIDUAL(CPF varchar(14) not null, NOM varchar(100) not null, ADDRESS varchar(100) not null, ConstRAint primary key (CPF));

Create table STUDENT(CPF varchar(14) not null, RA int not null, SCORE double not null, ConstRAint primary key(RA), ConstRAint fk_STUDENT foreign key(CPF) references INDIVIDUAL(CPF));

Insert into INDIVIDUAL values("001.001.001-10","Lucas","Rua do Twitter");
Insert into INDIVIDUAL values("002.002.002-20","Gustavo","Rua do Cruzeiro");
Insert into INDIVIDUAL values("003.003.003-30","Laís","Rua Geraldinha");
Insert into INDIVIDUAL values("004.004.004-40","Luiz","Rua dos Crias");
Insert into INDIVIDUAL values("005.005.005-50","Rafael","Rua do lol");

Insert into STUDENT values("001.001.001-10",00001,81.2);
Insert into STUDENT values("002.002.002-20",00002,69.3);
Insert into STUDENT values("003.003.003-30",00003,59.7);
Insert into STUDENT values("004.004.004-40",00004,78.1);
Insert into STUDENT values("005.005.005-50",00005,89.4);

delimiter $$
Create procedure Q1 (in RA int,inout LIST text)
begin
	declare TESTX varchar(40);
	declare ENDING int default 0;
    declare SCORETEST double;
    declare CPFTEST varchar(14);
	declare ANALYSIS cursor for select s.NOM from INDIVIDUAL s, STUDENT e where s.CPF = e.CPF and SCORETEST > e.SCORE;
	declare continue handler for not found set ENDING = 1; 
	select e.CPF, e.SCORE from STUDENT e where e.RA = RA into CPFTEST, SCORETEST;
	open ANALYSIS;
	SEARCHINGTEST: loop
		fetch ANALYSIS into TESTX;
		if ENDING = 1 then
			leave SEARCHINGTEST;
		end if;
		set LIST= concat(TESTX, ', ' , LIST);
    end loop SEARCHINGTEST;
    set LIST= concat(CPFTEST, ' : ' , LIST);
end $$
delimiter ;

set @TTESTe = '';
call Q1(00001, @TTESTe);
select @TTESTe;
