create database db_departamento_projeto;
use db_departamento_projeto;
create table tbl_departamento(
	idDepartamento int not null auto_increment primary key,
    nomeDepartamento varchar(70),
    areaDeTrabalho varchar(40),
    localizacao varchar(70)
);
create table tbl_cargo(
	idCargo int not null auto_increment primary key,
    nomeCargo varchar(40),
    descrisaoCargo varchar(200)
);
create table tbl_projeto(
	idProjeto int not null auto_increment primary key,
    nomeDoProjeto varchar(40),
    descrisaoProjeto varchar(150),
    inicioTrabalho date,
    fimDoTrabalho date
);
create table tbl_funcionario(
	idFuncionario int not null auto_increment primary key,
    nomeFuncionario varchar(70),
    dataNascimento date,
    formacao varchar(50),
    salario varchar(13),
    numeroDependentes int,
    idDepartamento int,
    idCargo int,
    constraint FK_funcionario_departamento foreign key (idDepartamento) references tbl_departamento(idDepartamento),
	constraint FK_funcionario_cargo foreign key(idCargo) references tbl_cargo(idCargo)
);
create table tbl_projeto_fornecedores(
	idFuncionario int,
    idProjeto int,
    constraint FK_funcionario_projeto foreign key(idFuncionario) references tbl_funcionario(idFuncionario),
    constraint FK_projeto_funcionario foreign key(idProjeto) references tbl_projeto(idProjeto)
);
