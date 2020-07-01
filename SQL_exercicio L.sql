create database db_condominio;
use db_condominio;

create table tbl_administrador(
	idAdministrador int not null auto_increment primary key,
    nome varchar(70),
    salario varchar(9),
    tel_cel varchar(15)
);
create table tbl_condominio(
	idCondominio int not null auto_increment primary key,
    nomeCondominio varchar(25),
    localizacao varchar(100),
    idAdministrador int,
    constraint FK_adm_condominio foreign key(idAdministrador) references tbl_administrador(idAdministrador)
);
create table tbl_bloco(
    idBloco int not null auto_increment primary key,
    idCondominio int,
    localizacao varchar(30),
    constraint FK_bloco_condominio foreign key(idCondominio) references tbl_condominio(idCondominio)
);
create table tbl_apartamento(
	idApartamento int not null auto_increment primary key,
    idBloco int,
    tamanho varchar(8),
    constraint FK_apartamento_bloco foreign key(idBloco) references tbl_bloco(idBloco)
);
create table tbl_morador(
	idMorador int not null auto_increment primary key,
    nome varchar(60),
    cpf varchar(15),
    dataNasc date
);
create table tbl_morador_apartamento(
	idApartamento int,
    idMorador int,
    constraint FK_apartamento_morador foreign key(idApartamento) references tbl_apartamento(idApartamento),
    constraint FK_morador_apartamento foreign key(idMorador) references tbl_morador (idMorador)
);