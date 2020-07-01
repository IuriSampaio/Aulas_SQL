#criando banco
create database cadastro
#configurando o banco para receber caracteres padão pt-br
default character set utf8
default collate utf8_general_ci;
#usar banco contatos
use cadastro;

###trabalhando com criação de tabelas

#criando trabela pessoa
create table pessoas(
#um definidor, não nulo e se preenche sozinho
id int not null auto_increment,
#nome com 30 caracteres ajustaveis de acordo com oque for digitado(para reduzir o espaço em memoria), e não nulo
nome varchar(30) not null,
#nascimento recebera uma data(no padrão americano (ano/mes/dia))
nascimento date,
#sexo receberá dois valores de acordo com o comando enum(M(masculino) ou F(feminino))
sexo enum('M','F'),
#peso receberá um valor decimal com no maxímo 5 valores, 3 depois da virgula e 2 antes dela
peso decimal(5,2),
#altura receberá um valor decimal com no maxímo 5 valores, 3 depois da virgula e 2 antes dela
altura decimal(5,2),
#nascionalidade receberá 30 caracteres ajustaveis de acordo com oque for digitado, não nulo , que possui como padrão o brasil
nacionalidade varchar(30) not null default'BRAZIL',
#id será a chave primaria(elemento identificador) 
primary key(id)
)default charset =utf8;

#1º jeito de se inserir dados na tabela

#inserir na tabela com nome pessoas
insert into pessoas
#ordem dos atributos(não prescisa ser a mesma da tabela)
(nome,nascimento,peso,sexo,altura,nacionalidade)
#valores dxs atributos(prescisa ser na mesma ordem colocada acima) 
values
('iuri','2002/09/02','87.2','M','1.60','brazil');

#2º jeito de se inserir dados na tabela

#desta forma os valores terão que ser digitados exatamente na mesma ordem que esta na tabela
insert into pessoas values
#  DEFAULT==auto_increment || DEFAULT == 'texto padrão  para o atributo'
(DEFAULT, 'Adalberto','1820/01/01','F','142.8','2.30',DEFAULT);

#cocolocar varios de uma vez também é possivel:
insert into pessoas values
(DEFAULT, 'Adalberto','1820/01/01','F','142.8','2.30',DEFAULT),
(DEFAULT, 'adalgisa','1990/01/01','F','142.8','1.60',DEFAULT),
(DEFAULT, 'Agnostica','1920/01/01','M','142.8','1.80',DEFAULT),
(DEFAULT, 'Ana','2020/01/01','F','32.8','1.30',DEFAULT),
(DEFAULT, 'Alabni','1820/01/01','M','82.8','2.30',DEFAULT),
(DEFAULT, 'Abner','1999/11/05','F','42.8','1.30',DEFAULT);

#selecionar todas as colunas da tabela pessoas
select * from pessoas;
#descrever os objetos da tabela pessoas
desc pessoas;

###trabalhando com ALTER TABLE

#adicionando uma cololuna com o nome profisao que recebe 10 caracteres ajustaveis
alter table pessoas
add column profisao varchar(10);
#apagando a coluna profisao da tabela pessoas
alter table pessoas
drop column profisao;
#adicionando a tabela pessoas uma coluna com nome profisão que será colocada antes da coluna nome
alter table pessoas
add column profisao varchar(10) after nome;
#modificando a coluna profisao da tabela pessoas para nunca nulo com um valor vazio como padrão
alter table pessoas
modify profisao varchar(30) not null default '';
#altereando na tabela pessoas o nome da coluna profisao para profissão (os atributos são obrigatórios)
alter table pessoas
change column profisao profissão varchar(30) not null default'';

#alterando o nome da tabela pessoas pára mySql
alter table pessoas
rename to mySql;

#se não existir uma tabela de nome cursos, será criada uma tabela com este nome  
create table if not exists cursos(
#nome do curso, será ajustavel de acordo com u=o numero de caractéres e não pode se repetir(unique)
nome varchar(30) not null unique,
descrisão text,
#unsigned=== apenas valores positivos 
carga int unsigned,
totalDeAulas int,
#ano padrão 2020
ano year default '2020'
)default charset = utf8;

#adicionando o idCurso como primeiro elementi da tabela
alter table cursos
add idCurso int first;

#transforma em chave primaria o elemento idCurso
alter table cursos
add primary key(idCurso);

#mostra os elementos da tabela cursos e suas descrições
describe cursos;

#criaçõa da tabea teste, se nao existir nenhuma com esse nome banco
create table if not exists teste(
id int,
nome varchar(30),
idade int
);
#inserindo dados na tabela  
insert into teste values
('1','Pedro','22'),
('2','lucas','22'),
('3','leo','18');
#mostrando todos os elemntos de teste 
select * from teste;
#apagando a tabela teste se existir no banco
drop table if exists teste;


#########Importação do varDump carregado de dados gafanhotos(tabela)

####trabalhando com SELECT


# selecionar todas as colunas da tabela gafanhotos no banco de dados cadastro
SELECT * FROM cadastro.gafanhotos
# e ordenar por nome de forma descente
order by nome desc;
#desc = descendente --> ordem descendente ou alfabetica^-1
#asc = ascendente  --> ordem alfabetica ou ascendente
desc cadastro.gafanhotos;

#para FILTRAR as COLUNAS desejadas, basta coclocar seus nomes no lugar do *(que seleciona todas as colunas)
#selecionar as colunas nome,sexo,peso,id (a ordem das colunas pode ser completamente aleatória) na tabela especificada
select nome,sexo,peso,id FROM cadastro.gafanhotos
#para FILTRAR as LINHAS de acordo com um resultado especifico basta usar a sintaxe where='resultadoEsperado'
#selecionar todas as linhas que na coluna sexo possuam a letra M
where sexo != 'M'
#ordenar por peso na ordem ascendente (do maior pro menor)
order by peso asc;

#motrar tudo sobre os programadores
SELECT * FROM cadastro.gafanhotos
where profissao ='programador'
order by id asc;

#motrar todos os maiores de idade
Select nome,nascimento from cadastro.gafanhotos
#é possivel usar operadores condicionais aqui (<=,<,>,>=,!= ou <>,=)
where nascimento <='2002/04/21'
order by nascimento desc;

#motrar todos os nomes
select nome from cadastro.gafanhotos;

#selecionar os menores de idade
select nome,nascimento from cadastro.gafanhotos

#operador BETWEEN 
#ONDE o nascimeno ESTA ENTRE valorInicial E valorFinal
where nascimento between '2002/01/01' and  '2021/01/01'
order by nascimento desc, nome asc;

select nome,nascimento from cadastro.gafanhotos

#operador in
#ONDE nascimento É(valor,valor...)
where nascimento in ('2013-12-30','2005-02-22');

SELECT * FROM cadastro.gafanhotos
#onde a profissao for programador e for mulher ou a profissao for empreendedor e for  não homem(ou seja mulher)
where profissao ='programador'and sexo ='F' xor profissao= 'empreendedor' and  not sexo='M'
order by profissao;

select * from cadastro.gafanhotos
## operador like
# % = qualquer resto

#onde o nome é como 'I e possui qualquerResto' 
where nome like 'I%';

select * from cadastro.gafanhotos
#seleciona todos os nomes que possuam i em qualquer caractere#
where nome like'%i%';

select * from cadastro.gafanhotos
#seleciona todos os nomes que possuam i como ultimo caractere#
where nome like'%i';

select * from cadastro.gafanhotos
# _ = obriga que tenha um caractere na posição#
#selecionar todos os nomes que se parecem com a_(algum caractere)a%(qualquer resto)
where nome like'a_a%';

# distinct == sem repetição
#mostrar os paises que estão cadastrados(sem repetição)
select distinct nacionalidade from cadastro.gafanhotos;


select * from cadastro.gafanhotos
where nacionalidade = 'brasil' 
and sexo ='F'
and nome like 'j%';

select nome,nacionalidade from cadastro.gafanhotos
where sexo='M' 
and nacionalidade='brasil' 
and nome like '%_silva' 
and peso <= 100;

##funçoes no mysql
#min() --> retorna o menor valor
#max() --> retorna o maior valor
#sum() --> retorna a soma dos valores
#avg() --> retorna a média dos valores
#count() --> retorna o numero de linhas que seguem as especificações

select avg(peso) from cadastro.gafanhotos;

select min(peso) from cadastro.gafanhotos
where sexo='F' 
and nacionalidade!='brasil' 
and nascimento between '1990/01/01' and '2000/12/31'; 

select count(altura) from cadastro.gafanhotos
where sexo='F' 
and altura>='1.90';