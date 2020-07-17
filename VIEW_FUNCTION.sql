use db_locadora;
# VIEW 
# serve para diminuir o tamanho do código chamado na linguagem de programação 

# a VIEW cria uma tabela virtual com os valores do select usado 
create view view_FilmesAtores as
	select tbl_filme.nome as filme, tbl_genero.nome as genero
		from tbl_filme 
			left join tbl_filme_genero
			on tbl_filme.idFilme = tbl_filme_genero.idFilme
			right join tbl_genero
			on tbl_genero.idGenero = tbl_filme_genero.idGenero
				union
			select tbl_filme.nome as filme, tbl_genero.nome as genero
			from tbl_filme 
			left join tbl_filme_genero
			on tbl_filme.idFilme = tbl_filme_genero.idFilme
			left join tbl_genero
			on tbl_genero.idGenero = tbl_filme_genero.idGenero;
            

# show tables ---> mostra as tabelas fisicas (create table nomeTabela) e as tabelas virtuais (create view nomeview as)
show tables;
# mostrando todos os elementos da view
select * from view_FilmesAtores;
# alterando o select da view existente
alter view view_FilmesAtores as
	select tbl_filme.nome as filme, tbl_genero.nome as generoDoFilme
			from tbl_filme 
				left join tbl_filme_genero
				on tbl_filme.idFilme = tbl_filme_genero.idFilme
				right join tbl_genero
				on tbl_genero.idGenero = tbl_filme_genero.idGenero
					union
				select tbl_filme.nome as filme, tbl_genero.nome as genero
				from tbl_filme 
				left join tbl_filme_genero
				on tbl_filme.idFilme = tbl_filme_genero.idFilme
				left join tbl_genero
				on tbl_genero.idGenero = tbl_filme_genero.idGenero;
# deletando view
drop view FilmesAtores;

########### FUNCTION
########## DETERMINISTC OR NOT DETERMINISTC ##############
# DETERMINISTC -> QUANDO O RETORNO TEM O MESMO TIPO DE DADOS DA ENTRADA DE DADOS OU QUANDO NÃO TEM ARGUMENTOS
# NOT DETERMINISTIC -> QUANDO O RETORNO DA FUNÇÃO NÃO TEM O MESMO TIPO DE DADOS DA ENTRADA0
########## DELIMITER #############
# DELIMITER $$ -> CARACTER PARA TERMINAR A FUNÇÃO DEVE SER ESCOLHIDO, PARA NÃO USAR ';'
##################### DECLARAÇÃO DE FUNÇÃO ##########################
# DELIMITER $$
# CREATE FUNCTION NOMEFUNCAO()
# RETURNS tipoDeDadoQueRetorna
# DETERMINITIC # pois não tem parametro (argumento) para função
# BEGIN
# QUALQUER COISA (DECISÃO, LAÇO ETC...)
# END $$

# como deletar função
drop function function_Saudacao;

# criando uma fução
DELIMITER $$
create function function_Saudacao()
	returns char(20) # -> def	ine o tipo de dados que sera retornado
		deterministic # -> não tem dado como argumento
        begin # -> inicio
		
        # DECLARANDO AS VARIAVEIS
        declare horaServidor time;
        declare hora char(2);
        declare mensagem char(20);

        # ATRIBUINDO VALORES
        set horaServidor = current_time();
        set hora = hour(horaServidor);
            #estrutura de decisão
			if hora>=6 and hora<12 then 
				set mensagem = 'Bom dia ! ';
			elseif hora>=12 and hora<18 then
				set mensagem = 'Boa tarde! ';
			elseif hora>=18 and hora<=00 then
				set mensagem = 'Boa noite! ';
			elseif hora>=00 and hora<6 then
				set mensagem = 'Boa madrugs! ';
			end if;
		# retorno da função
        return mensagem;
	# fim da função
	end $$
DELIMITER ;
# chamando a função 
select function_Saudacao() as msg;	

####### STORED PROCEDURES
# IN    -> identifica parametros de entrada na procedute
# OUT   -> identifica parametros de saida da procedute (returns)
# INOUT -> identifica parametros que vão entrar e sair(para evitar usar parametros de entrada e saida em diferentes posições)

## usando IN
#EXEMPLO1
DELIMITER $$
create procedure prodecure_buscar_filme(IN idFilme int)
    begin 
		select tbl_filme.nome as filme, tbl_genero.nome as generoDoFilme, idFilme
			from tbl_filme 
				left join tbl_filme_genero
				on tbl_filme.idFilme = tbl_filme_genero.idFilme
				right join tbl_genero
				on tbl_genero.idGenero = tbl_filme_genero.idGenero
					union
				select tbl_filme.nome as filme, tbl_genero.nome as genero, idFilme
				from tbl_filme 
				left join tbl_filme_genero
				on tbl_filme.idFilme = tbl_filme_genero.idFilme
				left join tbl_genero
				on tbl_genero.idGenero = tbl_filme_genero.idGenero
		where tbl_filme.idFilme = idFilme;
    end$$

call prodecure_buscar_filme(2);
# apagando procedure
drop procedure prodecure_buscar_filme4;


#EXEMPLO 2
DELIMITER //
create procedure aumentaQtd(IN id INT, taxa int)
BEGIN
	update tbl_filme set quantidade = (quantidade + taxa) where idFilme = id;
END//

SET @filme = 2;
SET @qtd = 1;
CALL aumentaQtd(@filme,@qtd); 

select * from tbl_filme where idFilme = 2;

## USANDO OUT
#EXEMPLO 1
DELIMITER $$
create procedure escolhendoFilme(IN ID INT, OUT FILME VARCHAR(40))
BEGIN
# seleciona o nome do filme que esta na tbl_filme com o id igual ao especificado quando se passa a variavel e coloca-o no atributo FILME
	SELECT nome into FILME FROM tbl_filme where idFilme = ID; 
END $$

call escolhendoFilme(4,@filme); # executando a procedure e guardando a saida numa variavel
select @filme;

#EXEMPLO 2