drop database if exists Calculadora;
create database Calculadora;
use Calculadora;

set @@max_sp_recursion_depth = 100;

delimiter $$
create procedure E(in expressao text, inout i int, inout resultado double)
begin
	call T(expressao, i, resultado);
    call Elinha(expressao, i, resultado);
end $$

create procedure Elinha(in expressao text, inout i int, inout anterior double)
begin
	declare resultado double;
	declare token char(1);    
    set token = substr(expressao, i, 1);
    if (token = '+')  then
		set i = i + 1; 
		call T(expressao, i, resultado);
        call Elinha(expressao, i, resultado);
        set anterior = anterior + resultado;
	elseif (token = '-') then
		set i = i + 1; 
		call T(expressao, i, resultado);
        call Elinha(expressao, i, resultado); 
        set anterior = anterior - resultado;
	end if;
end $$

create procedure T(in expressao text, inout i int, inout resultado double)
begin
	call F(expressao, i, resultado);
    call Tlinha(expressao, i, resultado);
end $$

create procedure Tlinha(in expressao text, inout i int, inout anterior double)
begin
	declare resultado double;
	declare token char(1);
    set token = substr(expressao, i, 1);
    if (token = '*')  then
		set i = i + 1; 
		call F(expressao, i, resultado);
        calL Tlinha(expressao, i, resultado);
        set anterior = anterior * resultado;
	elseif (token = '/') then 
		call F(expressao, i, resultado);
		calL Tlinha(expressao, i, resultado);
        set anterior = anterior / resultado;
	end if;
end $$ 

create procedure F(in expressao text, inout i int, inout resultado double)
begin
	declare token char(1);
    set token = substr(expressao, i, 1);
    if (token = '√') then
		set i = i + 1; 
		call F(expressao, i, resultado);
        calL Flinha(expressao, i, resultado);
        set resultado = sqrt(resultado);
	elseif  (token = '-') then
		set i = i + 1; 
		call F(expressao, i, resultado);
        calL Flinha(expressao, i, resultado);
        set resultado = -resultado;
	else
		call H(expressao, i, resultado);
        call Flinha(expressao, i, resultado);
	end if;
end $$ 

create procedure Flinha(in expressao text, inout i int, inout anterior double)
begin
	declare resultado double;
	declare token char(1);
    set token = substr(expressao, i, 1);
    if (token = '^')  then
		set i = i + 1; 
		call F(expressao, i, resultado);
        calL Flinha(expressao, i, resultado);
        set anterior = pow(anterior, resultado);
	elseif  (token = '!') then
    	set i = i + 1;  	
        calL Flinha(expressao, i, resultado);
        set anterior = fatorial(anterior);
	end if;
end $$

create procedure H(in expressao text, inout i int, inout resultado double)
begin
	declare token char(1);
    set token = substr(expressao, i, 1);
    if (token = '(') then
		set i = i + 1; 
		call E(expressao, i, resultado);
        set token = substr(expressao, i, 1);
        if (token != ')') then
			set resultado = null;
		end if;
	else
		call I(expressao, i, resultado);
	end if;
    
end $$

create procedure I(in expressao text, inout i int, inout resultado double)
begin
	declare valor int;
	declare token char(1);
    
    set valor = 0;
    set token = substr(expressao, i, 1);
    while i <= length(expressao) and (token = '.' or (token >= '0' and token <= '9')) do
		set valor = concat(valor, token);
        set i = i + 1;
        set token = substr(expressao, i, 1);
    end while;
    set resultado = cast(valor as decimal(10,2));
end $$

create function fatorial(resultado double) returns double
begin
	declare fat, i int;
    
    set i = 1;
    set fat = 1;
    while i <= resultado do 
		set fat = fat * i;
        set i = i + 1;
	end while;
    return fat;
end$$
delimiter ;


set @i = 1;
call E("5!", @i, @resultado);
select@resultado;