create database db_faculdade;
use db_faculdade;
create table tbl_estados(
	idEstado int not null auto_increment primary key,
    nomeEstado varchar(30) not null,
    sigla varchar(2) not null
);
create table tbl_departamento(
	idDepartamento int not null auto_increment primary key,
    areaDepartamento varchar(40),
    nomeDepartamento varchar(30),
    localizacao varchar(50)
);
create table tbl_curso(
	idCurso int not null auto_increment primary key,
    idDepartamento int,
    nomeCurso varchar(25),
    dataInicio date,
    dataTermino date,
    descricao varchar(60)
);
select * from tbl_curso;
show tables;
# eu tinha esquecido de criar a chave estrangeira 
alter table tbl_curso add constraint FK_curso_departamento foreign key (idDepartamento) references tbl_departamento(idDepartamento);
create table tbl_alunos(
	idAlunos int not null auto_increment primary key,
    nome varchar(70),
    cpf varchar(15),
    dataNascimento date,
    telefone varchar(15),
    idEstado int,
    constraint FK_aluno_estado foreign key (idEstado) references tbl_estados(idEstado)
);
create table tbl_matricula(
	idMatricula int not null auto_increment primary key,
    idAluno int,
    idCurso int,
    constraint FK_matricula_aluno foreign key (idAluno) references tbl_alunos(idAlunos),
    constraint FK_matricula_curso foreign key (idCurso) references tbl_curso(idCurso)
);