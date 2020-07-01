#criação de Database Contatos 
create database dbContatos20201A;
##########criação das tabelas##########
#cria tabela dentro do db( 1 modo ) => create table dbContatos20201A.tblEstados20201A(

#(modo 2)ativa o db para sua ultilização
use dbContatos20201A;
#tabela
select * from tblContatos;
create table tblEstados20201A(
	#criação do campo estado que será inteiro, auto incrementavel, nao nulo e chave primaria
	idEstado int auto_increment not null primary key,
    #numero maximo de caracteres é 2, nao pode ser nulo
    sigla varchar(2) not null,
    #numero maximo de caracteres é 100, nao pode ser nulo
    nome varchar(100) not null
);
insert into tblEstados20201A values (default,"ES","Espirito Santo");
create table tblContatos(
	idContatos int auto_increment not null,
    nome varchar(100) not null,
    endereco varchar(150),
    bairro varchar(50),
    cep varchar(9),
    idEstado int not null,
    telefone varchar(15) not null,
    celular varchar(15) not null,
    email varchar(100) not null,
    dtNasc date not null,
    sexo varchar(1) not null,
    obs text not null,
    #outro jeito de declarar chave primaria 
    primary key(idContatos),
    #declarando a chave estrangeira e dando um "apelido" para ela 
	 CONSTRAINT FK_estados_criticas FOREIGN KEY (idEstado) REFERENCES tblEstados20201A(idEstado) 
);

show tables;
