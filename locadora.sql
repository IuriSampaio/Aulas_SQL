create database db_locadora;
# mostra os bancos que ja foram criados 
show databases;
# deletar banco 
drop database db_locadora;
use db_locadora;

create table tbl_tipoTelefone(
	idTipoTelefone int(8) not null auto_increment primary key,
    tipo varchar(50) not null
);

insert into tbl_tipoTelefone values(DEFAULT,'clientes');
# descreve um campo na tabela 
# desc tabela campo
desc tbl_tipoTelefone tipo;

create table tbl_telefones (
	idTelefone int(8) not null auto_increment primary key,
    telefone varchar(20),
    idTipoTelefone int,
    constraint FK_telefone_tipo foreign key(idTipoTelefone) references tbl_tipoTelefone(idTipoTelefone)
);
insert into tbl_telefones values(DEFAULT,'11 7219-9562',4);

# drop table NOMEDATABABELA --> para deletar um tabela
desc tbl_telefones;

create table tbl_ator(
	idAtor int not null auto_increment primary key,
    nome varchar(100),
    qtdPremios int(3),
    dataNascimento date
);
desc tbl_ator;

# adiciona campo a tabela criada 
alter table tbl_ator add idTelefone int;
# apaga campo(coluna) da tabela criada 
alter table tbl_ator drop column idTelefone;
# coloca uma chave estrangeira 
alter table tbl_ator add constraint FK_telefone_ator foreign key(idTelefone) references tbl_telefones(idTelefone);
# modifica as especificações de uma coluna da tabela 
alter table tbl_ator modify column dataNascimento date not null;

# renomeia e tbm muda as especificações de uma coluna da tabela ]
# alter table TABELA change NOMEANTIGO NOMENOVO NOVASESPECIFICAÇOES
alter table tbl_ator change dataNascimento data_Nascimento date;

# para deletear a chave estrangeira primeeiro deve-se apagar a foreign key e depois sse deleta a coluna 
# deletando foreign key 
alter table tbl_ator drop foreign key FK_telefone_ator;
# deletando a coluna 
alter table tbl_ator drop column idTelefone;
show tables;

select * from tbl_telefones;

insert into tbl_ator values (DEFAULT,'Raul Seixas',2,'2009-12-19',3);

create table tbl_filme(
	idFilme int not null auto_increment primary key,
    nome varchar(80) not null,
    dtLancamento date not null,
    quantidade int not null,
    sinopse text not null
);

insert into tbl_filme VALUES (DEFAULT,'Privatização é ruim','2010-01-02',3,'llalalz lala lala la al la  aal');

create table tbl_filme_ator(
	idFilme_ator int not null auto_increment primary key,
    idFilme int,
    idAtor int,
	constraint FK_filme_ator foreign key(idFilme) references tbl_filme(idFilme),
    constraint FK_ator_filme foreign key(idAtor) references tbl_ator(idAtor)
);
insert into tbl_filme_ator values(DEFAULT,3,3);

create table tbl_genero(
	idGenero int not null auto_increment primary key,
    nome varchar(50)
);
insert into tbl_genero values(DEFAULT,'Maluquice');

create table tbl_filme_genero(
	idFilme_genero int not null auto_increment primary key,
    idFilme int,
    idGenero int,
    constraint FK_filme_genero foreign key(idFilme) references tbl_filme(idFilme),
    constraint FK_genero_filme foreign key(idGenero) references tbl_genero(idGenero)
);
insert into tbl_filme_genero values(default,4,3);
show tables;
############## AULA DE SELECT E UPDATE
select * from tbl_telefones;        
select * from tbl_ator;        
select * from tbl_tipotelefone;
select * from tbl_genero;
select * from tbl_filme;
select * from tbl_filme_genero;
select * from tbl_filme_ator;

desc tbl_tipotelefone;
#Script para alterar registros, nunca esquecer do where
update tbl_tipotelefone set tipo = 'Familiar' where idTipoTelefone = 4;
update tbl_filme set status = '1';
update tbl_filme set status = '0' where quantidade <= 5; 

#SELECT para trazer todos os campos de uma tabela
select * from tbl_filme;

select tbl_filme.* from tbl_filme;

select nome, quantidade from tbl_filme;

select tbl_filme.nome, tbl_filme.quantidade from tbl_filme;

#SELECT com where
select * from tbl_filme where idfilme = 2;

select * from tbl_filme where tbl_filme.idfilme = 2;

#Busca por igualdade
select * from tbl_filme where nome = 'Jovens Malucos';

#Utilizando o like pode buscar por pedaços da informação
/*
	like 'valor' - busca fazendo a comparação através da igualdade
	like 'valor%' - busca fazendo a comparação por tudo que começa com aquela informação
	like '%valor' - busca fazendo a comparação por tudo que termina com aquela informação
	like '%valor%' - busca fazendo a comparação por qualquer parte do campo

*/
select * from tbl_filme where nome like 'J%';

#Utilizando operadores lógicos or, and, not
	#And - todas as condições precisam ser válidas para trazer algum resultado
    #Or - se apenas uma das condições for válida irá trazer o resultado
	#Operadores de comparação = , <, > <=, >=, <>
select * from tbl_filme where quantidade <= 10 or sinopse like '%l%';

select * from tbl_filme where quantidade = 2 or quantidade = 23; 

select * from tbl_filme where quantidade <> 10;
select * from tbl_filme where not quantidade = 10;

#Utulizando o comando in (), podemos colocar uma lista de itens a serem buscados no BD
		#Not in() inverte o resultado da busca
#OBS: in() ou Not in() substitui o ooperador lógico (OR) na comparação, desde que seja o mesmo campo
select * from tbl_filme where quantidade in(5,10,4);
select * from tbl_filme where quantidade not in(5,10,4);

#Order by - permite fazer a ordenação dos registros

select * from tbl_filme order by nome;      #Ordem crescente (padrão)
select * from tbl_filme order by nome asc;  #Ordem crescente utilizando o (asc)
select * from tbl_filme order by nome desc; #Ordem drcrescente utilizando o (desc)

#Order by é sempre a ultima instrução do script e podemos atribuir ordenação por vários campos
select * from tbl_filme where idfilme < 5 order by nome, quantidade asc;
select * from tbl_filme where idfilme < 5 order by nome asc, quantidade desc;

#LIMIT - permite especificar a quantida de registros que será retornada (mysql LIMIT, alguns outros bancos usam o TOP)
select * from tbl_filme order by idfilme asc limit 1; #Trazer o primeiro registro
select * from tbl_filme order by idfilme desc limit 1;#Trazer o ultimo registro
select * from tbl_filme limit 2;

#COUNT - permite contar qtos registros existem
select count(*) as quantidade_Registros  from tbl_filme;
select count(*) as quantidade_Registros  from tbl_filme where idfilme < 7;

#MIN/MAX
select min(quantidade) as minimo, nome from tbl_filme; 
select max(quantidade) as maximo, nome from tbl_filme;

#AVG - permite calculr a media
select avg(quantidade) as mediaQuantidades from tbl_filme;

#SUM - Soma de valores
select sum(quantidade) as soma from tbl_filme;
select sum(quantidade) as soma from tbl_filme where quantidade < 7;
select * from tbl_filme;

#Fazendo calculos matemáticos no select
select (quantidade / 3) as resultado from tbl_filme;
select ((quantidade + 3)/100) as resultado, nome, sinopse from tbl_filme;
select (quantidade - 3) as resultado from tbl_filme;
select ((min(quantidade) * 3)/10)+50 as resultado from tbl_filme;


select * from tbl_filme;

#BETWEEN - permite fazer uma busca utilizando um range de valores
select * from tbl_filme where quantidade >=2 and quantidade <=8; #opção 1 usando operador lógico
select * from tbl_filme where not(quantidade >=2 and quantidade <=8); #opção 1 usando operador lógico

select * from tbl_filme where quantidade between 2 and 8;  #opção 2 usando o between
select * from tbl_filme where quantidade not between 2 and 8;  #opção 2 usando o between

#CONCAT - concatena dados
#ROUND  - arredonda casas decimais de uma valor

select quantidade, concat('R$ ', ( quantidade - round( ( ( quantidade * 50 ) /100 ) ,2 ) ) ) as desconto from tbl_filme;


#TRABALHANDO COM DATA E HORA
#Retorna a data atual do servidor
select curdate();
select current_date();

#Retorna a hora do servidor
select curtime();
select current_time();

#Retorna da e hora do servidor
select current_timestamp();

#Funções para formatar Hora
/*
	%h - retorna a hora de entre 0-12
	%H - retorna a hora de entre 0-24
	%i - retorna o minuto
	%s - retorna o segundo
	%r - retorna AM/PM
    %T - retorna o padrão da hora que é hh:mm:ss
    
*/
select time_format(curtime(), '%T') as hora;

#HOUR(), MINUTE(), SECOND()
select hour(curtime()) as hora;
select minute(curtime()) as minutos;
select second(curtime()) as segundos;

#TIME() - permite extrair apenas a hora de um campo datetime
select time(current_timestamp()) as hora;

#Funções para formatar Data
/*
	%W: dia da semana por extenso. Exemplo: segunda, terça, quarta e assim por diante;
    %w: dia da semana representado por um inteiro numérico. 0-Domingo, 1-Segunda, e assim por diante. A sequência termina em 6 - Sábado;
	%a: dia da semana por extenso abreviado. Exemplo: Seg, Ter, Qua e assim por diante;
	%M: mês por extenso completo. Exemplo: Janeiro, Fevereiro, Março e assim por diante;
	%b: mês por extenso abreviado. Exemplo: Jan, Fev, Mar e assim por diante;
    %d: retorna o dia
    %m: retorna o mês
    %y: retorna o ano 00
    %Y: retorna o ano 0000
*/
select date_format(curdate(), 'Data: %d/%m/%Y / Dia na semana: %a é o %w dia ou seja %W / Mes: %M abreviando é %b') as data_brasileira; #Data padrão brasileiro
select date_format(curdate(), '%Y-%m-%d') as data_americana; #Data padrão americano

#DAY(), MONTH(), YEAR()
select day(curdate()) as data;
select month(curdate()) as mes;
select year(curdate()) as ano;

#Extrai apenas a data de um campo datetime
select date(current_timestamp()) as data;

#Diferença de data e hora usando DATEDIFF E TIMEDIFF
select datediff('2020-01-01', '2020-12-31') as diferenca;
select timediff('07:10:00' , current_time) as diferenca_até_hora_de_acordar;

#Relacionamento utilizando o WHERE
show tables;
# entre 3 tabelas
select tbl_ator.nome, tbl_telefones.telefone, tbl_tipotelefone.tipo
from tbl_ator, tbl_telefones, tbl_tipotelefone
where tbl_telefones.idtelefone = tbl_ator.idtelefone
and tbl_tipotelefone.idTipoTelefone = tbl_telefones.idTipoTelefone;

desc tbl_tipotelefone; 
select * from tblFilme_ator;
select * from tbl_telefones;

select * from tbl_telefones;        
select * from tbl_ator;        
select * from tbl_tipotelefone;
select * from tbl_genero;
select * from tbl_filme;
select * from tbl_filme_genero;
select * from tbl_filme_ator;

select tbl_ator.nome, tbl_telefones.telefone, tbl_tipotelefone.tipo, tbl_filme.nome
from tbl_ator, tbl_telefones, tbl_tipotelefone, tbl_filme, tbl_filme_ator
where tbl_telefones.idtelefone = tbl_ator.idtelefone
and tbl_tipotelefone.idTipoTelefone = tbl_telefones.idTipoTelefone
#relacionamento quando existe uma tabela intermediaria
and tbl_filme.idFilme = tbl_filme_ator.idFilme
and tbl_ator.idAtor = tbl_filme_ator.idAtor; 

select tbl_ator.nome, tbl_telefones.telefone, tbl_tipotelefone.tipo, tbl_filme.nome, tbl_genero.nome
from tbl_ator, tbl_telefones, tbl_tipotelefone, tbl_filme, tbl_filme_ator,tbl_genero,tbl_filme_genero
where tbl_telefones.idtelefone = tbl_ator.idtelefone
and tbl_tipotelefone.idTipoTelefone = tbl_telefones.idTipoTelefone
#relacionamentos quando existe uma tabela intermediaria
and tbl_filme.idFilme = tbl_filme_ator.idFilme
and tbl_ator.idAtor = tbl_filme_ator.idAtor 
and tbl_filme_genero.idGenero = tbl_genero.idGenero
and tbl_filme.idFilme = tbl_filme_genero.idFilme;

#Relacionamento usando inner Join

select tbl_ator.nome, tbl_telefones.telefone, tbl_tipotelefone.tipo
from  tbl_ator 
inner join tbl_telefones 
on tbl_telefones.idtelefone = tbl_ator.idtelefone 
inner join tbl_tipotelefone 
on tbl_tipotelefone.idTipoTelefone = tbl_telefones.idTipoTelefone ;


select tbl_ator.nome, tbl_telefones.telefone, tbl_tipotelefone.tipo, tbl_filme.nome
from tbl_tipotelefone 
inner join tbl_telefones
on tbl_tipotelefone.idTipoTelefone = tbl_telefones.idTipoTelefone
inner join tbl_ator
on tbl_telefones.idtelefone = tbl_ator.idtelefone 
inner join tbl_filme_ator
on tbl_filme_ator.idAtor = tbl_ator.idAtor
inner join tbl_filme
on tbl_filme_ator.idFilme = tbl_filme.idFilme;

select tbl_ator.nome, tbl_telefones.telefone, tbl_tipotelefone.tipo, tbl_filme.nome, 
tbl_genero.nome 
from tbl_tipotelefone inner join tbl_telefones
on tbl_tipotelefone.idTipoTelefone = tbl_telefones.idTipoTelefone
inner join tbl_ator
on tbl_telefones.idtelefone = tbl_ator.idtelefone
inner join tbl_filme_ator
on tbl_filme_ator.idAtor = tbl_ator.idtelefone
inner join tbl_filme
on tbl_filme.idFilme = tbl_filme_ator.idFilme
inner join tbl_filme_genero
on tbl_filme.idFilme = tbl_filme_genero.idFilme
inner join tbl_genero
on tbl_genero.idGenero = tbl_filme_genero.idGenero;

select * from tbl_filme_genero;
show tables;

#INNER JOIN --> traz apenas a intersecção entre as duas tabelas
select tbl_telefones.telefone, tbl_tipotelefone.tipo
from tbl_tipotelefone
inner join tbl_telefones
on tbl_tipotelefone.idTipoTelefone = tbl_telefones.idTipoTelefone;

#LEFT JOIN --> tras a intercecção e também traz tudo que tem na tabela da esquerda 
# (a primeira declarada no comando) e não tem na outra
select tbl_telefones.telefone, tbl_tipotelefone.tipo
from tbl_tipotelefone
left join tbl_telefones
on tbl_tipotelefone.idTipoTelefone = tbl_telefones.idTipoTelefone;

#RIGHT JOIN --> tras a intercecção e também traz tudo que tem na tabela da esquerda 
# (a primeira declarada no comando) e não tem na outra
select tbl_telefones.telefone, tbl_tipotelefone.tipo
from tbl_tipotelefone
right join tbl_telefones
on tbl_tipotelefone.idTipoTelefone = tbl_telefones.idTipoTelefone;

# VAI TRAZER O GENERO QUE NÃO PERTENCE A NENHUM FILME
select tbl_filme.nome as filme, tbl_genero.nome as genero
from tbl_filme 
left join tbl_filme_genero
on tbl_filme.idFilme = tbl_filme_genero.idFilme
right join tbl_genero
on tbl_genero.idGenero = tbl_filme_genero.idGenero;

# VAI TRAZER O FILME QUE NÃO PERTENCE A NENHUM GENERO
select tbl_filme.nome as filme, tbl_genero.nome as genero
from tbl_filme 
left join tbl_filme_genero
on tbl_filme.idFilme = tbl_filme_genero.idFilme
left join tbl_genero
on tbl_genero.idGenero = tbl_filme_genero.idGenero;

# VAI TRAZER A INTECECÃO E TBM OS QUE NÃO PERTENCEM UM AO OUTRO
# ou seja tras os filmes que não tem genero e o genero que não tem filme
select tbl_filme.nome as filme, tbl_genero.nome as genero
from tbl_filme 
left join tbl_filme_genero
on tbl_filme.idFilme = tbl_filme_genero.idFilme
right join tbl_genero
on tbl_genero.idGenero = tbl_filme_genero.idGenero
union ## UNINDO OS DOIS COMANDOS FEITOS ANTERIORMENTE ## substitui o full outer join que não existe no mysql
select tbl_filme.nome as filme, tbl_genero.nome as genero
from tbl_filme 
left join tbl_filme_genero
on tbl_filme.idFilme = tbl_filme_genero.idFilme
left join tbl_genero
on tbl_genero.idGenero = tbl_filme_genero.idGenero;

# union --> só funciona quando a quantidade de colunas são iguais