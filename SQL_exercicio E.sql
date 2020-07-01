create database db_SecEngMot;
use db_SecEngMot;

create table secretaria(
	idSecretaria int auto_increment primary key,
    linguasDominadas varchar(100)
);
create table engenheiro(
	idEngenheiro int auto_increment primary key,
    especializacoes varchar(100)
);
create table motorista(
	idMotorista int auto_increment primary key,
    carrosQueDirige varchar(50),
    acidentes varchar(90)
);
create table estado(
	idEstado int not null auto_increment primary key,
    nome varchar(60),
    sigla varchar(2)
);
create table funcionario(
	idFuncionario int not null auto_increment primary key,
    idEstado int,
    nome varchar(80),
    cpf varchar(14),
    email varchar(90),
    salario varchar(10),
    idSecretaria int,
    idEngenheiro int,
    idMotorista int,
    constraint FK_estado_funcionario foreign key(idEstado) references estado(idEstado),
    constraint FK_secretaria_funcionario foreign key(idSecretaria) references secretaria(idSecretaria),
    constraint FK_eng_func foreign key (idEngenheiro) references engenheiro(idEngenheiro),
    constraint FK_mot_func foreign key (idMotorista) references motorista(idMotorista)
);
create table departamento(
	idDepartamento int auto_increment not null primary key,
    descDep varchar(100),
    nomeDep varchar(30)
);

show tables;
create table funcionario_departamento(
	idFuncionario int,	
    constraint FK_funcionario_departamento foreign key(idFuncionario) references funcionario(idFuncionario),
    idDepartamento int,
    constraint FK_departamento_funcionario foreign key(idDepartamento) references departamento(idDepartamento)
);