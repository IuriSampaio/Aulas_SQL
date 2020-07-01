create database db_advogadosEmpresas;
use db_advogadosEmpresas;
create table contrato(
	idContrato int not null auto_increment primary key,
    empresaRecebe varchar(30),
    empresaCede varchar(30),
    preco varchar(10),
    descricaoContrato varchar(1000),
    dataPedicao datetime,
    dataConclusao datetime
);
create table advogado(
	idAdvogado int not null auto_increment primary key,
    nome varchar(30),
    N°daOAB varchar(20),
    empresasQueAuxiliou int,
    valor varchar(10),
    areaDeTrabalho varchar(40)
);
create table advogado_contrato(
	idAdvogadoContrato int not null auto_increment primary key,
    idAdvogado int,
    constraint FK_advogado_advogadoContrato foreign key(idAdvogado) references advogado(idAdvogado),
    idContrato int,
    constraint FK_contrato_advogadoContrato foreign key(idContrato) references contrato(idContrato)
    
);

create table empresas(
	idEmpresa int not null primary key auto_increment,
    idAdvogadoContrato int,
    constraint FK_empresa_advogadoContrato foreign key(idAdvogadoContrato) references advogado_contrato(idAdvogadoContrato),
    nomeEmpresa varchar(30),
    descrisaoAdvogado varchar(40)
);

show tables;