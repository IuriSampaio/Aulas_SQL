create database db_DepartamentoFornecedoresPecas;
use db_DepartamentoFornecedoresPecas;

create table estados(
	idEstado int auto_increment not null primary key,
    nome varchar(30) not null,
    sigla varchar(2) not  null
);
insert into departamento values (DEFAULT,'Tecnologia','segunda rua á esquerda');
create table departamento(
	idDepartamento int auto_increment not null primary key,
    areaDeServico varchar(50),
	localizacao varchar(30)
);

create table peca(
	idPeca int not null auto_increment primary key,
    TipoPeça varchar(70) not null,
    material varchar(70) not null,
    Tamanho varchar(30) not null  
);
select * from peca;
insert into fornecedor_peca values (default,'6','3');
create table fornecedores(
	idFornecedor int auto_increment not null primary key,
    nomeFornecedor varchar(30) not null,
    dataDePedido date not null,
    dataDeEntrega date not null
);

create table fornecedor_peca(
	idFornecedorPeca int auto_increment not null primary key,
    idPeca int,
    constraint FK_fornecedor_peca_peca foreign key(idPeca) references peca(idPeca),
    idFornecedor int,
    constraint FK_fornecedor_peca_fornecedor foreign key(idFornecedor) references fornecedores(idFornecedor)
);

create table projeto(
	idProjeto int auto_increment not null primary key,
    idFornecedorPeca int,
    constraint FK_projeto_fornecedor_peca foreign key(idFornecedorPeca) references fornecedor_peca(idFornecedorPeca),
    dataInicio date not null,
    dataTermino date 
);
select * from fornecedor_peca;
insert into projeto values (default,'4','2020-02-05','2020-07-02');
create table Funcionario(
	idFuncionario int not null auto_increment primary key,
    idEstado int,
    constraint FK_Funcionario_estado foreign key(idEstado) references estados(idEstado),
    idDepartamento int,
    constraint FK_Funcionario_Departamento foreign key(idDepartamento) references departamento(idDepartamento),
    nomeFuncionario varchar(30) not null,
    cpf varchar(9) not null,
    telefone varchar(13) not null,
    email varchar(50),
    cargo varchar(30)
);
select * from departamento;
insert into Funcionario values (default,'2','3','MAICOL CAIOL','120457912','982045602','gerecvv@gmail.com','operário');

create table funcionarioProjeto(
idProjetoFuncionario int not null auto_increment primary key,
idProjeto int ,
constraint FK_projeto_funcionarioProjeto foreign key(idProjeto) references projeto(idProjeto),
idFuncionario int,
constraint FK_funcionario_funcionariProjeto foreign key(idFuncionario) references Funcionario(idFuncionario)
);

insert into funcionarioProjeto values (default,3,2);