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
insert into tbl_tipoTelefone values(DEFAULT,'');
# descreve um campo na tabela 
# desc tabela campo
desc tbl_tipoTelefone tipo;
create table tbl_telefones (
	idTelefone int(8) not null auto_increment primary key,
    telefone varchar(20),
    idTipoTelefone int,
    constraint FK_telefone_tipo foreign key(idTipoTelefone) references tbl_tipoTelefone(idTipoTelefone)
);
insert into tbl_telefones values(DEFAULT,'11 4537-8562',2);
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
insert into tbl_ator values (DEFAULT,'Federich Nithelzhe',1,'1837-09-29',4);
create table tbl_filme(
	idFilme int not null auto_increment primary key,
    nome varchar(80) not null,
    dtLancamento date not null,
    quantidade int not null,
    sinopse text not null
);
insert into tbl_filme VALUES (DEFAULT,'uma escola da pesada','2009-09-12',223,'mostra a futilidade da juventudo-==e autual');
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
insert into tbl_genero values(DEFAULT,'romance');
create table tbl_filme_genero(
	idFilme_genero int not null auto_increment primary key,
    idFilme int,
    idGenero int,
    constraint FK_filme_genero foreign key(idFilme) references tbl_filme(idFilme),
    constraint FK_genero_filme foreign key(idGenero) references tbl_genero(idGenero)
);
insert into tbl_filme_genero values(default,4,1)
