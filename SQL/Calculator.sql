drop database if exists CALCULATOR;
create database CALCULATOR;
use CALCULATOR;

set @@max_sp_recursion_depth = 100;

delimiter $$
create procedure E(in EXPRESSION text, inout i int, inout RESULT double)
begin
	call T(EXPRESSION, i, RESULT);
    call E_LINE(EXPRESSION, i, RESULT);
end $$

create procedure E_LINE(in EXPRESSION text, inout i int, inout PREDECESSOR double)
begin
	declare RESULT double;
	declare token char(1);    
    set token = substr(EXPRESSION, i, 1);
    if (token = '+')  then
		set i = i + 1; 
		call T(EXPRESSION, i, RESULT);
        call E_LINE(EXPRESSION, i, RESULT);
        set PREDECESSOR = PREDECESSOR + RESULT;
	elseif (token = '-') then
		set i = i + 1; 
		call T(EXPRESSION, i, RESULT);
        call E_LINE(EXPRESSION, i, RESULT); 
        set PREDECESSOR = PREDECESSOR - RESULT;
	end if;
end $$

create procedure T(in EXPRESSION text, inout i int, inout RESULT double)
begin
	call F(EXPRESSION, i, RESULT);
    call T_LINE(EXPRESSION, i, RESULT);
end $$

create procedure T_LINE(in EXPRESSION text, inout i int, inout PREDECESSOR double)
begin
	declare RESULT double;
	declare token char(1);
    set token = substr(EXPRESSION, i, 1);
    if (token = '*')  then
		set i = i + 1; 
		call F(EXPRESSION, i, RESULT);
        calL T_LINE(EXPRESSION, i, RESULT);
        set PREDECESSOR = PREDECESSOR * RESULT;
	elseif (token = '/') then 
		call F(EXPRESSION, i, RESULT);
		calL T_LINE(EXPRESSION, i, RESULT);
        set PREDECESSOR = PREDECESSOR / RESULT;
	end if;
end $$ 

create procedure F(in EXPRESSION text, inout i int, inout RESULT double)
begin
	declare token char(1);
    set token = substr(EXPRESSION, i, 1);
    if (token = '√') then
		set i = i + 1; 
		call F(EXPRESSION, i, RESULT);
        calL F_LINE(EXPRESSION, i, RESULT);
        set RESULT = sqrt(RESULT);
	elseif  (token = '-') then
		set i = i + 1; 
		call F(EXPRESSION, i, RESULT);
        calL F_LINE(EXPRESSION, i, RESULT);
        set RESULT = -RESULT;
	else
		call H(EXPRESSION, i, RESULT);
        call F_LINE(EXPRESSION, i, RESULT);
	end if;
end $$ 

create procedure F_LINE(in EXPRESSION text, inout i int, inout PREDECESSOR double)
begin
	declare RESULT double;
	declare token char(1);
    set token = substr(EXPRESSION, i, 1);
    if (token = '^')  then
		set i = i + 1; 
		call F(EXPRESSION, i, RESULT);
        calL F_LINE(EXPRESSION, i, RESULT);
        set PREDECESSOR = pow(PREDECESSOR, RESULT);
	elseif  (token = '!') then
    	set i = i + 1;  	
        calL F_LINE(EXPRESSION, i, RESULT);
        set PREDECESSOR = FACTORIAL(PREDECESSOR);
	end if;
end $$

create procedure H(in EXPRESSION text, inout i int, inout RESULT double)
begin
	declare token char(1);
    set token = substr(EXPRESSION, i, 1);
    if (token = '(') then
		set i = i + 1; 
		call E(EXPRESSION, i, RESULT);
        set token = substr(EXPRESSION, i, 1);
        if (token != ')') then
			set RESULT = null;
		end if;
	else
		call I(EXPRESSION, i, RESULT);
	end if;
    
end $$

create procedure I(in EXPRESSION text, inout i int, inout RESULT double)
begin
	declare valor int;
	declare token char(1);
    
    set valor = 0;
    set token = substr(EXPRESSION, i, 1);
    while i <= length(EXPRESSION) and (token = '.' or (token >= '0' and token <= '9')) do
		set valor = concat(valor, token);
        set i = i + 1;
        set token = substr(EXPRESSION, i, 1);
    end while;
    set RESULT = cast(valor as decimal(10,2));
end $$

create function FACTORIAL(RESULT double) returns double
begin
	declare fat, i int;
    
    set i = 1;
    set fat = 1;
    while i <= RESULT do 
		set fat = fat * i;
        set i = i + 1;
	end while;
    return fat;
end$$
delimiter ;


set @i = 1;
call E("5!", @i, @RESULT);
select@RESULT;
