create database UNIVERSITY_RESEARCH;
use UNIVERSITY_RESEARCH;

create table PROJECT (id int not null,title varchar(45) not null,dataPROJECT date not null,url varchar(100) default 'https://www.ifmg.edu.br/ribeiraodasneves/pesquisa' not null,constraint primary key(id));

create table US3R (id int not null,nom varchar(45) not null,email varchar(45) not null,passcode varchar(45) not null,constraint primary key(id));

create table COMMENTS (id int not null,COMMENTS text not null,dataCOMMENTS date not null,id_PROJECT int not null,id_US3R int null,constraint primary key(id),constraint fk_PROJECT_COMMENTS foreign key(id_PROJECT) references PROJECT(id) on delete cascade,constraint fk_US3R_COMMENTS foreign key(id_US3R) references US3R(id) on delete set null);

create table LikesByPROJECT (id_PROJECT int not null,id_US3R int not null,constraint primary key(id_PROJECT, id_US3R),constraint fk_PROJECT_LikesByPROJECT foreign key(id_PROJECT) references PROJECT(id) on delete cascade,constraint fk_US3R_LikesByPROJECT foreign key(id_US3R) references US3R(id) on delete cascade);

create table LikesByCOMMENTS (id_COMMENTS int not null,id_US3R int not null,constraint primary key(id_COMMENTS, id_US3R),constraint fk_COMMENTS_LikesByCOMMENTS foreign key(id_COMMENTS) references COMMENTS(id) on delete cascade,constraint fk_US3R_LikesByCOMMENTS foreign key(id_US3R) references US3R(id) on delete cascade);

insert into PROJECT(id, title, dataPROJECT) values(1, 'Monarquias', str_to_date('0001-01-01', '%Y-%m-%d'));
insert into PROJECT(id, title, dataPROJECT) values(2, 'Repúblicas', str_to_date('1291-08-01', '%Y-%m-%d'));
insert into PROJECT(id, title, dataPROJECT) values(3, 'Anarquias', str_to_date('1539-06-15', '%Y-%m-%d'));

insert into US3R values(1, 'Napoleão', 'PesadeloDaEuropa@hotmail.com', 'ViveLaFrance');
insert into US3R values(2, 'Pedro II', 'magnonimo@hotmail.com', '1840Sempre');
insert into US3R values(3, 'Bakunin', 'MikhailBakunin@hotmail.com.br', 'ForaEstado');
insert into US3R values(4, 'Kogos', 'AnarcoCapitalismo@gmail.com', 'SulIndependente');

insert into COMMENTS values(1, 'Gostava mais de quando o Brasil era um Império', curdate(), 1, 2);
insert into COMMENTS values(2, 'Adoro poder votar, me sinto mais representado', curdate(), 2, 4);
insert into COMMENTS values(3, 'O estado só serve para roubar nosso dinheiro', curdate(), 3, 3);
insert into COMMENTS values(4, 'Que se dane os políticos, mais facil as empresas assumirem logo', curdate(), 2, 4);
insert into COMMENTS values(5, 'Odeio os militares', curdate(), 1, 2);
insert into COMMENTS values(6, 'Alguem já superou a marinha britanica?', curdate(), 1, 1);
insert into COMMENTS values(7, 'Conversei várias vezes com Marx sobre o assunto', curdate(), 3, 3);

insert into LikesByPROJECT values(1, 1);
insert into LikesByPROJECT values(1, 2);
insert into LikesByPROJECT values(2, 1);
insert into LikesByPROJECT values(2, 4);
insert into LikesByPROJECT values(2, 3);
insert into LikesByPROJECT values(3, 3);
insert into LikesByPROJECT values(3, 4);

insert into LikesByCOMMENTS values(1, 1);
insert into LikesByCOMMENTS values(2, 3);
insert into LikesByCOMMENTS values(6, 4);

# Q1
insert into PROJECT(id, title, dataPROJECT) values(4, 'Facismo', str_to_date('1919-03-8', '%Y-%m-%d'));
insert into US3R values(5, 'BenitoMussolini', 'FuniculiFunicula@hotmail.com', 'ANovaRoma');
insert into COMMENTS values(8, 'O Comunismo deve ser combatido já!!', curdate(), 4, 5);
insert into COMMENTS values(9, 'Construiremos uma nova Roma, eu serei o primeiro ministro e Humberto II o rei', curdate(), 1, 5);

insert into LikesByPROJECT values(1, 3);
insert into LikesByPROJECT values(4, 1);
insert into LikesByPROJECT values(3, 2);
insert into LikesByPROJECT values(4, 2);
insert into LikesByPROJECT values(4, 5);

insert into LikesByCOMMENTS values(3, 5);
insert into LikesByCOMMENTS values(4, 4);
insert into LikesByCOMMENTS values(5, 2);
insert into LikesByCOMMENTS values(7, 1);
insert into LikesByCOMMENTS values(8, 3);
insert into LikesByCOMMENTS values(9, 2);
insert into LikesByCOMMENTS values(8, 1);

# Q2
select p.title as title_do_PROJECT,
(select count(c.id)
from COMMENTS c
where c.id_PROJECT = p.id) as Quantidade_de_COMMENTSs,
(select count(lp.id_PROJECT)
from LikesByPROJECT lp
where lp.id_PROJECT = p.id) as Quantidade_de_Likes 
from PROJECT p;

select u.nom as US3R,
(select count(c.id)
from COMMENTS c
where c.id_US3R = u.id) as Quantidade_de_COMMENTSs,
(select count(lp.id_PROJECT)
from LikesByPROJECT lp
where lp.id_US3R = u.id)
+
(select count(lc.id_COMMENTS)
from LikesByCOMMENTS lc
where lc.id_US3R = u.id) as Quantidade_de_Likes
from US3R u;

select p.id as Id, p.title as PROJECT, u.nom as US3R
from US3R u
inner join PROJECT p
on u.id = p.id;

select p.id, p.title, p.dataPROJECT
from PROJECT p
where extract(year from p.dataPROJECT) in ("1539")
order by p.id;

select u.id, u.nom, u.email
from US3R u
where exists
(select u.id from US3R u,likesByPROJECT lp where lp.id_US3R = u.id and lp.id_PROJECT in ("3"))
