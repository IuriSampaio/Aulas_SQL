# TRIGGER
# invocado quando um comando DML(insert, update, delete) é executado
# não são chamados diretamente como funções, views, stored procedures são invocados automaticamente
# é armazenado como um arquivo separado, e é associado a uma tabela
############# BEFORE OR AFTER #####################
# BEFORE -> antes do comando DML ser executado por completo
# AFTER -> EXPERA A EXECUÇÃO DO COMANDO dml PARA AGIR
# tempoPraOcorrer -> BEFORE OR AFTER 
############ INSERT - UPDATE - DELETE #############
# operaçãoFeita -> inset, update ou delete 
# INSERT -> o trigger ira acontecer ao inserir comandos no banco de dados
# UPDATE -> o trigger ira acontecer quando algum registo for atuzlizado 
# DELETE -> acontece ao deletar algum registro do banco

# CREATE TRIGGER nome tempoPraOcorrer operaçãoFeita
# ON nomeTabela
# FOR EACH ROW # pra agir fazendo a mesma coisa em cada linha da tabela 
######## codigos e declarações
show tables;
#EX 
create table tbl_produto(
	idPeoduto int auto_increment primary key,
    nomeProduto varchar(20),
    precoNormal decimal(10,2),
    precoDesconto decimal(10,2)
);

CREATE trigger trigger_desconto before insert
on tbl_produto
for each row
set new.precoDesconto = (new.precoNormal*2);	

insert into tbl_produto values (DEFAULT,'monitor',100.00,0.1); # para o valor em desconto aplica a regra que ele é 

select * from tbl_produto;