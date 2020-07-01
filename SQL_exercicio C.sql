create database db_funcionario_setor_peca;
use db_funcionario_setor_peca;

create table estados(
	idEstado int auto_increment not null primary key,
    nome varchar(30) not null,
    sigla varchar(2) not  null
);
  create table peca(
	idPeca int auto_increment not null primary key,
    precoVenda varchar(10),
    dataVenda date not null,
    material varchar(20)
  );
  create table materiaPrima(
	idMateriaPrima int auto_increment not null primary key,
    precoPorKg varchar(10),
    dataCompra date not null,
    material varchar(20),
    quantidade varchar(30)
  );

create table peca_MateriaPrima(
	idPecaMateriaPrima int auto_increment not null primary key,
    idPeca int,
    constraint FK_peca_materiaPrima foreign key(idPeca) references peca(idPeca),
    idMateriaPrima int,
    constraint FK_materiaPrima_peca foreign key(idMateriaPrima) references materiaPrima(idMateriaPrima)
);
alter table peca_MateriaPrima add column precoProducao varchar(10);
create table tipoPeca(
	idTipoPeça int not null auto_increment primary key,
    idPecaMateriaPrima int,
    constraint FK_TipoPeca_materiaPrimaPeca foreign key (idPecaMateriaPrima) references peca_MateriaPrima(idPecaMateriaPrima),
    qtdPecas int not null,
    lucroPorPeça varchar(10) not null 
);
select * from tipoPeca;
create table setor(
	idSetor int auto_increment not null primary key,
    tipoDeProducao varchar(90),
    dataDeCriacao date not null,
    idTipoPeca int,
    constraint FK_setor_tipoPeca foreign key(idTipoPeca) references tipoPeca(idTipoPeça),
    qtdMaquinas int,
    lucroSemana varchar(13),
    SalarioFuncionarioSemana varchar(6)
);
create table funcinario (
	idFuncionario int not null auto_increment primary key,
    idSetor int,
    constraint FK_funcionario_setor foreign key(idSetor) references setor(idSetor),
    idEstado int,
    constraint FK_funcionario_estado foreign key(idEstado) references estados(idEstado),
    nome varchar(30) not null,
    cargo varchar(30) not null,
    horarioDeTrabalho varchar(20),
    especialidade varchar(20),
    dataEntrada date
);