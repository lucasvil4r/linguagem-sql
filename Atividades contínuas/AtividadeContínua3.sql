-- EXERCICOS 2 - Foram verificadas algumas inconsistкncias nos dados inseridos. Utilize o comando UPDATE para atualizar os dados.

-- Atualizando sigla table ESTADO

update ESTADO
set SIGLA = 'MG'
where ID_ESTADO = 3;

-- Atualizando nome cidade	
update CIDADE
set CIDADE = 'RIO CLARO'
where ID_CIDADE = 4;

-- Atualizando endereзo

update ENDERECO
set NUMERO = '560'
where ID_ENDERECO = 7;

-- Atualizando data cadastro do clientes
update CLIENTE
set DATA_CADASTRO = '2012-01-01'
where DATA_CADASTRO is NULL;

-- Atualizando descriзгo tabela maquina

update MAQUINA
set DESCRICAO = 'Jukebox dos anos 50 em acabamento refinado'
where ID_MAQUINA = 3;

-- Atualizando info de desconto

ALTER TABLE PEDIDO
ADD DESCONTO DECIMAL(10,2);

update PEDIDO 
set DESCONTO = VALOR_TOTAL * 10 / 100
where DESCONTO is null;

-- Atualizando tabela pedido e alterar valor total

update PEDIDO 
set VALOR_TOTAL = VALOR - DESCONTO;

-- EXERCICOS 3 - Foi descoberto que uma compra de um cliente foi uma fraude. Precisamos deletar os dados dessa transaзгo e os dados do cliente.

DELETE from ITEM_PEDIDO where ID_PEDIDO = 7;

-- Deletar dados tabela pedido

DELETE from PEDIDO where ID_PEDIDO = 7;

-- Deletar dados fraudulentos

DELETE from PEDIDO where ID_CLIENTE = 6;

-- EXERCICOS 4 -  A бrea comercial deseja entrar em contato com os clientes que nasceram antes de 1980 para atualizar os dados cadastrais.
-- Crie uma tabela temporбria chamada У#CLIENTES_CADASTRO_ATUALIZADOФ contendo os campos (CNPJ_CPF, NOME, DATA_NASCIMENTO) e insira os dados
-- dos clientes que nasceram antes de 1980 nessa tabela. (Dica, use a clбusula Уinsert intoФ)

DROP TABLE IF EXISTS #CLIENTES_CADASTRO_ATUALIZADO
CREATE TABLE #CLIENTES_CADASTRO_ATUALIZADO
	(
	CNPJ_CPF VARCHAR(500),
	NOME VARCHAR(200),
	DATA_NASCIMENTO DATE
	)

INSERT INTO #CLIENTES_CADASTRO_ATUALIZADO
SELECT CNPJ_CPF, NOME, DATA_NASCIMENTO FROM CLIENTE
WHERE DATA_NASCIMENTO  < '1998-01-01';

-- EXERCICOS 5 - Crie uma consulta listando o id maquina, cуdigo, nome das mбquinas que sгo pebolim.

select ID_MAQUINA, CODIGO, NOME from MAQUINA WHERE DESCRICAO LIKE '%pebolim%';

-- EXERCICOS 6 - Crie uma consulta listando o nome e a data de nascimento dos clientes que nasceram antes de 1995.

select NOME, DATA_NASCIMENTO from CLIENTE WHERE DATA_NASCIMENTO < '1995-01-01';

-- EXERCICOS 7 - Crie a tabela abaixo

CREATE TABLE #FABRICANTE
	(
	ID_FABRICANTE INT IDENTITY(1,1),
	NOME_FABRICANTE VARCHAR(500) UNIQUE, 
	PAIS VARCHAR(500) NOT NULL,
	PRIMARY KEY (ID_FABRICANTE)
	);

 -- EXERCICOS 8 - Insira esses valores nas tabelas criadas
 
INSERT INTO #FABRICANTE(NOME_FABRICANTE, PAIS) VALUES ('DELL', 'EUA');
INSERT INTO #FABRICANTE(NOME_FABRICANTE, PAIS) VALUES ('LENOVO', 'EUA');
INSERT INTO #FABRICANTE(NOME_FABRICANTE, PAIS) VALUES ('SAMSUNG', 'COREIA');


/*
LUCAS VILAR - RA: 2101658
GUSTAVO GATTO - RA: 2201041
*/