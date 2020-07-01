create database db_livraria;
use db_livraria;

create table tbl_livros(
	idLivro int not null auto_increment primary key,
    nome varchar(60),
    genero varchar(30),
    Npaginas int
);
create table tbl_cliente(
	idCliente int not null auto_increment primary key,
    nome varchar(60),
    tel_cel varchar(15),
    cpf varchar(15),
    idLivro int,
    constraint FK_cliente_livro foreign key(idLivro) references tbl_livros(idLivro)
);
create table tbl_autor(
	idAutor int not null auto_increment primary key,
    nome varchar(60),
    tel_cel varchar(15),
    cpf varchar(15)
);
create table tbl_livro_autor(
	idAutor int,
    idLivro int,
    constraint FK_livro_autor foreign key(idLivro) references tbl_livros(idLivro),
    constraint FK_autor_livro foreign key(idAutor) references tbl_autor(idAutor)
);
create table tbl_editora(
	idEditora int not null auto_increment primary key,
    nome varchar(50),
    cnpj varchar(16)
);
create table tbl_exemplares(
	idExemplares int not null auto_increment primary key,
    quantidadeProduzida bigint,
    idEditora int,
    lucroDoExemplar varchar(12),
    constraint FK_exemplar_editora foreign key(idEditora) references tbl_editora(idEditora)
);
