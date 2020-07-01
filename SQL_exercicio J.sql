create database db_agenciaViagem;
use db_agenciaViagem;
create table tbl_restaurante(
	idRestaurante int not null auto_increment primary key,
    tipo varchar(20),
    nome varchar(40),
    localizacao varchar(100)
);
create table tbl_cidade(
	idCidade int not null auto_increment primary key,
    nome varchar(100),
    localizacao varchar(100),
    temperaturaMedia decimal
);
create table tbl_cidade_restaurante(
	idCidade int,
    idRestaurante int,
    constraint FK_cidade_restaurante foreign key(idCidade) references tbl_cidade(idCidade),
    constraint FK_restaurante_cidade foreign key(idRestaurante) references tbl_restaurante(idRestaurante)
);
create table tbl_hoteis(
	idHotel int not null auto_increment primary key,
	estrelas varchar(20),
    nome varchar(40),
    localizacao varchar(100)
);
create table tbl_cidade_hotel(
	idCidade int,
    idHotel int,
    constraint FK_cidade_hotel foreign key(idCidade) references tbl_cidade(idCidade),
    constraint FK_hotel_cidade foreign key(idHotel) references tbl_hoteis(idHotel)
);
create table tbl_cliente(
	idClientes int not null auto_increment primary key,
    cpf varchar(14),
    nome varchar(70),
    tel_cel varchar(16)
);
select * from tbl_cliente;
alter table tbl_cliente drop column idHotel;
alter table tbl_cliente drop foreign key FK_cliente_hotel;
create table tbl_viagem(
	idViagem int not null auto_increment primary key,
	idHotel int,
    constraint FK_viagem_hotel foreign key(idHotel) references tbl_hoteis(idHotel),
    dataInicioViagem datetime,
    dataFimViagem datetime,
    idCliente int,
    constraint FK_viagem_cliente foreign key(idCliente) references tbl_cliente(idClientes)
);
create table tbl_ponto_turistico(
	idPontoTuristico int not null auto_increment primary key,
    idCidade int,  
    nomePontoTuristico varchar(50),
    localizacao varchar(90),
    horarioDeFuncionamento varchar(15)
);
