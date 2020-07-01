create database db_motorista;
use db_motorista;

create table tbl_estado(
	idEstado int not null auto_increment primary key,
    nomeEstado varchar(30) not null,
    sigla varchar(2) not null
);
create table tbl_fabricante(
	idFabricante int not null auto_increment primary key,
    nomeFabricante varchar(30),
    paisDeOrigem varchar(40)
);
create table tbl_modelo(
	idModelo int not null auto_increment primary key,
    nomeModelo varchar(50),
    preçoFIB varchar(11),
    idFabricante int,
    constraint FK_modelo_fabricante foreign key (idFabricante) references tbl_fabricante(idFabricante)
);
create table tbl_carro(
	idCarro int not null auto_increment primary key,
    nPortas int
);
create table tbl_moto(
	idMoto int not null auto_increment primary key,
    tipo varchar(20)
);
create table tbl_caminhao(
	idCaminhao int not null auto_increment primary key,
    porte varchar(15)
);
create table tbl_tipo_veiculo(
	idTipoVeiculo int not null auto_increment primary key,
    idCarro int,
    idMoto int,
    idCaminhao int,
    constraint FK_carro foreign key(idCarro) references tbl_carro(idCarro),
    constraint FK_moto foreign key(idMoto) references tbl_moto(idMoto),
    constraint FK_caminhao foreign key(idCaminhao) references tbl_caminhao(idCaminhao)
);
create table tbl_veiculo(
	idVeiculo int not null auto_increment primary key,
    tamanho varchar(7),
    idModelo int,
    idTipoVeiculo int,
    constraint FK_veiculo_modelo foreign key (idModelo) references tbl_modelo (idModelo) ,
    constraint FK_veiculo_tipo foreign key (idTipoVeiculo) references tbl_tipo_veiculo (idTipoVeiculo)
);
create table tbl_motorista(
	idMotorista int not null auto_increment primary key,
    cpf varchar(15),
    tel_cel varchar(15),
    nome varchar(70),
    idVeiculo int,
    IPVA varchar(20),
    placaVeiculo varchar(8),
    constraint FK_motorista_veiculo foreign key(idVeiculo) references tbl_veiculo(idVeiculo)
);
alter table tbl_motorista add constraint FK_estado foreign key(idEstado) references tbl_estado(idEstado);