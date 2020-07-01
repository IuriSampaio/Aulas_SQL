create database db_pesca;
use db_pesca;
show tables;
create table tbl_peixe(
	idPeixe int not null auto_increment primary key,
    tamanho decimal not null,
    peso decimal not null,
    sexo varchar(1),
	tipo varchar(30)
);
create table tbl_areaDePesca(
	idAreaPesca int not null auto_increment primary key,
    localizacao varchar(50)
);
create table tbl_clasificacao(
	idClasificacao int not null auto_increment primary key,
    idPeixe int,
    constraint FK_clasificacaoPorpeixe foreign key(idPeixe) references tbl_peixe (idPeixe)
);
create table tbl_equipe(
	idEquipe int not null auto_increment primary key,
    chefeEquipe varchar(50),
    numeroIntegrantesEquipe varchar(70) not null,
    idClasificacao int,
	idAreaPesca int, 
    constraint FK_equipe_clasificacao foreign key(idClasificacao) references tbl_clasificacao(idClasificacao),
	constraint FK_equipe_areaPesca foreign key(idAreaPesca) references tbl_areaDePesca(idAreaPesca)
);
