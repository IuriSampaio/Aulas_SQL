create database db_banco;
use db_banco;

create table tbl_estados(
	idEstado int not null auto_increment primary key,
    nomeEstado varchar(30) not null,
    sigla varchar(2) not null
);
create table tbl_cargo(
	idCargo int not null auto_increment primary key,
    nomeCargo varchar(40),
    descrisaoCargo varchar(200)
);
create table tbl_funcionario(
	idFuncionario int not null auto_increment primary key,
    idEstado int,
    idCargo int,
    nome varchar(70) not null,
    telefone varchar(15) not null,
    cpf varchar(15) not null,
    cidade varchar(60),
    constraint FK_funcionario_estado foreign key (idEstado) references tbl_estados(idEstado),
	constraint FK_funcionario_cargo foreign key (idCargo) references tbl_cargo(idCargo)
);
# tinha pensado errado e só percebi agr
alter table tbl_funcionario add column idAgencia int;
alter table tbl_funcionario add constraint FK_funcionario_agencia foreign key (idAgencia) references tbl_agencia(idAgencia);
create table tbl_agencia(
	idAgencia int not null auto_increment primary key,
    numeroDeFuncionarios int not null,
    numeroDeClientes int 
);
create table tbl_cliente(
	idCliente int not null auto_increment primary key,
	nome varchar(70),
    cpf varchar(15),
    email varchar(60),
    telefone varchar(15),
    idAgencia int,
    constraint FK_cliente_agencia foreign key (idAgencia) references tbl_agencia(idAgencia),
    idEstado int,
    constraint FK_cliente_estado foreign key (idEstado) references tbl_estados(idEstado)
);
create table tbl_conta(
	idConta int not null auto_increment primary key,
    idCliente int,
    constraint FK_conta_cliente  foreign key(idCliente) references tbl_cliente (idCliente)
);