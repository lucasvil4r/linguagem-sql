Use AdventureWorksLT2019_PT;

-- 1 - Crie uma consulta com as especificações abaixo:

SELECT LOWER([VENDA].[DESCRICAO_PRODUTO].[DESCRICAO]) as 'DESCRICAO',
[VENDA].[MODELO_PRODUTO].[NOME],
[VENDA].[PRODUTO].COR,
[VENDA].[DETALHE_PEDIDO].QUANTIDADE_PEDIDO,
[VENDA].[PEDIDO].DATA_PEDIDO,
DATEDIFF(day, [VENDA].[PEDIDO].DATA_PEDIDO, GETDATE()) as 'Diferença de dias da data do pedido para hoje'
FROM [VENDA].[DESCRICAO_PRODUTO]
JOIN [VENDA].[MODELO_PRODUTO]
ON [VENDA].[DESCRICAO_PRODUTO].DATA_MODIFICACAO = [VENDA].[MODELO_PRODUTO].DATA_MODIFICACAO
JOIN [VENDA].[PRODUTO]
ON [VENDA].[MODELO_PRODUTO].[NOME] = [VENDA].[PRODUTO].[NOME]
JOIN [VENDA].[DETALHE_PEDIDO]
ON [VENDA].[PRODUTO].ID_PRODUTO = [VENDA].[DETALHE_PEDIDO].ID_PRODUTO
JOIN [VENDA].[PEDIDO]
ON [VENDA].[PEDIDO].ID_PEDIDO = [VENDA].[DETALHE_PEDIDO].ID_PEDIDO
JOIN [VENDA].[CLIENTE]
ON [VENDA].[CLIENTE].ID_CLIENTE = [VENDA].[PEDIDO].ID_CLIENTE
WHERE [VENDA].[CLIENTE].[TITULO] = 'Mrs.'
;

-- 2 – Criar uma nova tabela TEMPORÁRIA (#) chamada “Employee” com as seguintes colunas

-- TABELA TEMPORÁRIA
CREATE TABLE #Employee (
    id_employee INT IDENTITY(1,1) PRIMARY KEY,
    Nome VARCHAR(200) NOT NULL,
	born DATE DEFAULT '1910-09-01'
)

-- INSERINDO DADOS NAS TABELAS
INSERT INTO #Employee(Nome,born) VALUES 
('Barney Swarley', ''),
('Prison Mike','1978-01-01'),
('Chandler Geller','1988-03-08'),
('Ramon Valdes','1990-04-08')

SELECT * FROM #Employee;

-- Atualize o campo born ‘1900-01-01’ da tabela Employee onde o Name =  “Prison Mike”

UPDATE
  #Employee
SET
  born = '1900-01-01'
WHERE
  Nome =  'Prison Mike'

SELECT * FROM #Employee;

-- 3 – Crie uma consulta com as especificações abaixo:

-- dando erro:

SELECT [VENDA].[PRODUTO].NOME,
[VENDA].[MODELO_PRODUTO].NOME,
[VENDA].[CATEGORIA_PRODUTO].NOME,
[VENDA].[PRODUTO].CUSTO_PADRAO,
DATEDIFF(year, GETDATE(), [VENDA].[PRODUTO].[DATA_INICIO_VENDA]) as 'diferença em anos da data atual para a data início venda do produto.',
SUM([VENDA].[DETALHE_PEDIDO].PRECO_UNITARIO) as 'Soma dos valores de preco_unitario da tabela pedido_detalhe'
FROM [VENDA].[PRODUTO]
JOIN [VENDA].[MODELO_PRODUTO]
	ON [VENDA].[PRODUTO].ID_MODELO_PRODUTO = [VENDA].[MODELO_PRODUTO].ID_MODELO_PRODUTO
JOIN [VENDA].[CATEGORIA_PRODUTO]
	ON [VENDA].[CATEGORIA_PRODUTO].[ID_CATEGORIA_PRODUTO] = [VENDA].[PRODUTO].[ID_CATEGORIA_PRODUTO]
JOIN [VENDA].[DETALHE_PEDIDO]
	ON [VENDA].[DETALHE_PEDIDO].[ID_PRODUTO] = [VENDA].[PRODUTO].[ID_PRODUTO]
GROUP BY [VENDA].[CATEGORIA_PRODUTO].NOME,
[VENDA].[PRODUTO].NOME,
[VENDA].[MODELO_PRODUTO].NOME,
'diferença em anos da data atual para a data início venda do produto.';

-- 4- Crie uma consulta com as especificações abaixo:

-- 5 – Crie uma consulta com as especificações abaixo:

