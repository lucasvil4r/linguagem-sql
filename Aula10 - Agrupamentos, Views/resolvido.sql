/* 1 – Crie as seguintes consultas utilizando a tabela pedidos
	Soma do valor total, da quantidade total, onde a data do pedido é maior que 2012-04-01.
	Menor data do pedido e maior data do pedido onde o valor total é maior que 300?
	Contagem dos pedidos e média de valor total onde a quantidade total é maior que 1?
*/
--Soma do valor total, da quantidade total, onde a data do pedido é maior que 2012-04-01.
SELECT SUM(VALOR_TOTAL) TOTAL,
	   SUM(QUANTIDADE_TOTAL) QTDE_TOTAL
FROM PEDIDO
WHERE DATA_PEDIDO > '2012-04-01'

--Menor data do pedido e maior data do pedido onde o valor total é maior que 300?
SELECT MIN(DATA_PEDIDO) MENOR_DATA,
	   MAX(DATA_PEDIDO) MAIOR_DATA
FROM PEDIDO
WHERE VALOR_TOTAL > 300

--Contagem dos pedidos e média de valor total onde a quantidade total é maior que 1?
SELECT COUNT(ID_PEDIDO) QTDE_PEDIDOS, 
	   AVG(VALOR_TOTAL) MEDIA_VALOR_TOTAL 
FROM PEDIDO WHERE QUANTIDADE_TOTAL > 1 

/* 2- Crie as seguintes consultas utilizando a tabela item pedidos e maquinas
	Soma do valor e quantidade agrupado por nome da máquina, se caso as máquinas não foram vendidas ainda, 
	as somatórias devem vir zeradas e não com “null”.
	Soma do valor, soma da quantidade, e contagem agrupado por nome da máquina e cor.
	Soma da quantidade das maquinas de nome FORCEX, soma da quantidade das maquinas não FORCEX.
*/
--Soma do valor e quantidade agrupado por nome da máquina, se caso as máquinas não foram vendidas ainda
--se caso as máquinas não foram vendidas ainda, 
	--as somatórias devem vir zeradas e não com “null”.
SELECT M.NOME AS NOME_MAQUINA,
	ISNULL(SUM(I.VALOR_TOTAL),0) AS TOTAL,
	ISNULL(SUM(I.QUANTIDADE),0) AS QTDE
FROM MAQUINA M
	LEFT JOIN ITEM_PEDIDO I
		ON M.ID_MAQUINA = I.ID_MAQUINA
GROUP BY M.NOME

--Soma do valor, soma da quantidade, e contagem agrupado por nome da máquina e cor.
SELECT
    M.NOME AS NOME_MAQUINA,
	M.COR,
	COUNT(*) CONTAGEM,
	ISNULL(SUM(I.VALOR_TOTAL),0) AS TOTAL,
	ISNULL(SUM(I.QUANTIDADE),0) AS QTDE 
FROM MAQUINA M
	LEFT JOIN ITEM_PEDIDO I
		ON M.ID_MAQUINA = I.ID_MAQUINA
GROUP BY M.NOME,
	     M.COR

--	Soma da quantidade das maquinas de nome FORCEX, soma da quantidade das maquinas não FORCEX.
SELECT 
M.NOME,
 CASE WHEN M.NOME = 'FORCEX' THEN QUANTIDADE ELSE 0 END  FORCEX ,
 CASE WHEN M.NOME != 'FORCEX' THEN QUANTIDADE ELSE 0 END  N_FORCEX 
FROM MAQUINA M
	inner JOIN ITEM_PEDIDO I
		ON M.ID_MAQUINA = I.ID_MAQUINA

SELECT 
SUM(CASE WHEN M.NOME = 'FORCEX' THEN QUANTIDADE ELSE 0 END) FORCEX ,
SUM(CASE WHEN M.NOME != 'FORCEX' THEN QUANTIDADE ELSE 0 END) N_FORCEX 
FROM MAQUINA M
	INNER JOIN ITEM_PEDIDO I
		ON M.ID_MAQUINA = I.ID_MAQUINA

/*3- Crie as seguintes consultas utilizando a tabela estado, cidade, endereço, cliente, pedido
	Soma do valor total, da quantidade total, onde a data do pedido é maior que 2012-03-11, agrupado por estado.
	Menor data do pedido e maior data do pedido agrupado por cidade e estado.
	Contagem dos pedidos e média de valor total agrupado pela data de nascimento dos clientes. 
	Soma do valor total, da quantidade total agrupado por estado onde a somatória do valor total seja maior que 1500.
	Soma do valor total dos pedidos agrupados pelo Ano da data do pedido.
*/
 

--	Soma do valor total, da quantidade total, 
--onde a data do pedido é maior que 2012-03-11, agrupado por estado.

SELECT SUM(P.VALOR_TOTAL) VALOR, SUM(P.QUANTIDADE_TOTAL) QTD,ES.ESTADO 
FROM PEDIDO P 
INNER JOIN CLIENTE C ON P.ID_CLIENTE = C.ID_CLIENTE
INNER JOIN [dbo].[ENDERECO] E ON C.ID_ENDERECO = E.ID_ENDERECO
INNER JOIN [dbo].[CIDADE] CI ON E.ID_CIDADE = CI.ID_CIDADE
INNER JOIN [dbo].[ESTADO]ES ON CI.ID_ESTADO = ES.ID_ESTADO
WHERE P.DATA_PEDIDO > '2012-03-11'
GROUP BY ES.ESTADO

--Menor data do pedido e maior data do pedido agrupado por cidade e estado.
SELECT MIN(P.DATA_PEDIDO) MINI ,MAX(P.DATA_PEDIDO)MAX, ES.ESTADO, CI.CIDADE FROM PEDIDO P 
INNER JOIN CLIENTE C ON P.ID_CLIENTE = C.ID_CLIENTE
INNER JOIN [dbo].[ENDERECO] E ON C.ID_ENDERECO = E.ID_ENDERECO
INNER JOIN [dbo].[CIDADE] CI ON E.ID_CIDADE = CI.ID_CIDADE
INNER JOIN [dbo].[ESTADO]ES ON CI.ID_ESTADO = ES.ID_ESTADO 
GROUP BY ES.ESTADO,  CI.CIDADE

--Contagem dos pedidos e média de valor total agrupado pela data de nascimento dos clientes. 
SELECT COUNT(P.ID_PEDIDO) PEDIDOS, AVG(VALOR_TOTAL) MEDIA, C.DATA_NASCIMENTO DATA_NASC
FROM PEDIDO P 
INNER JOIN CLIENTE C ON P.ID_CLIENTE = C.ID_CLIENTE
INNER JOIN [dbo].[ENDERECO] E ON C.ID_ENDERECO = E.ID_ENDERECO
INNER JOIN [dbo].[CIDADE] CI ON E.ID_CIDADE = CI.ID_CIDADE
INNER JOIN [dbo].[ESTADO]ES ON CI.ID_ESTADO = ES.ID_ESTADO
GROUP BY  C.DATA_NASCIMENTO

--Soma do valor total, da quantidade total
--agrupado por estado onde a somatória do valor total seja maior que 1500.
SELECT SUM(P.QUANTIDADE_TOTAL) PEDIDOS, SUM(P.VALOR_TOTAL)VALOR, ES.ESTADO
FROM PEDIDO P 
INNER JOIN CLIENTE C ON P.ID_CLIENTE = C.ID_CLIENTE
INNER JOIN [dbo].[ENDERECO] E ON C.ID_ENDERECO = E.ID_ENDERECO
INNER JOIN [dbo].[CIDADE] CI ON E.ID_CIDADE = CI.ID_CIDADE
INNER JOIN [dbo].[ESTADO]ES ON CI.ID_ESTADO = ES.ID_ESTADO
GROUP BY ES.ESTADO
HAVING  SUM(P.VALOR_TOTAL) > 2700

--	Soma do valor total dos pedidos agrupados pelo Ano da data do pedido.
SELECT YEAR(P.DATA_PEDIDO) ANO,MONTH(P.DATA_PEDIDO)MES, SUM(VALOR_TOTAL) VALOR  
FROM PEDIDO P 
INNER JOIN CLIENTE C ON P.ID_CLIENTE = C.ID_CLIENTE
INNER JOIN [dbo].[ENDERECO] E ON C.ID_ENDERECO = E.ID_ENDERECO
INNER JOIN [dbo].[CIDADE] CI ON E.ID_CIDADE = CI.ID_CIDADE
INNER JOIN [dbo].[ESTADO]ES ON CI.ID_ESTADO = ES.ID_ESTADO
GROUP BY 
YEAR(P.DATA_PEDIDO) ,
MONTH(P.DATA_PEDIDO)
ORDER BY ANO,MES