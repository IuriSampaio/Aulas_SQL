create database db_SeguroCarro;
use db_SeguroCarro;

show tables;

create table estados(
	idEstado int auto_increment not null primary key,
    nome varchar(30) not null,
    sigla varchar(2) not  null
);

create table clientes(
	idCliente int auto_increment not null primary key,
    idEstado int,
    constraint FK_clientes_estados foreign key (idEstado) references estados(idEstado), 
    dataNasc date not null,
    nome varchar(40)
);

create table carro(
	idCarro int auto_increment not null primary key,
    marca varchar(30) not null,
    placa varchar(8) not null,
    preço varchar(10)
);

create table acidente(
	idAcidente int auto_increment not null primary key,
    tipoDeAcidente varchar(30) not null,
    dataDoAcidente date not null,
    hora time not null
);

create table apolicie(
	idApolicie int auto_increment not null primary key,
    idCliente int not null,
    constraint FK_apolicie_clientes foreign key (idCliente) references clientes(idCliente), #on update cascade
    tipoDeApolicie varchar(30) not null,
    descrisaoApolicie varchar(300) not null,
    idCarro int not null,
    constraint FK_apolicie_carro foreign key(idCarro) references carro(idCarro),
    idAcidente int not null,
    constraint FK_apolicie_acidente foreign key(idAcidente) references acidente(idAcidente)
);
insert into apolicie values (DEFAULT,1,'Master','garente recuperação completa do carro',3,3);
select * from apolicie;