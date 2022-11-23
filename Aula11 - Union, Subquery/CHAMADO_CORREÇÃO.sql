/*1-Crie uma view chamada: “chamados_abertos”.
Deve possuir as seguintes colunas:
	-nome e a matricula do funcionário solicitante.
	-data abertura do chamado.
	-nome da prioridade e o sla_horas.
	-diferença em horas da data da abertura para a data atual.
Filtro: apenas os chamados sem data de fechamento.
*/
CREATE VIEW chamados_abertos
AS
SELECT 
F.NOME,
F.MATRICULA, 
C.ABERTURA,
P.SLA_HORAS,
DATEDIFF(HOUR,ABERTURA,GETDATE()) TEMPO_ABERTO
FROM CHAMADO C
JOIN FUNCIONARIO F ON C.ID_SOLICITANTE = F.ID_FUNCIONARIO
JOIN PRIORIDADE P ON C.ID_PRIORIDADE = P.ID_PRIORIDADE
WHERE C.FECHAMENTO IS NULL

SELECT * FROM chamados_abertos
/*
2-Criar uma consulta com as seguintes colunas:
 -Somatória de custo do chamado.
 -Somatória da diferença em horas da abertura para o fechamento.
Filtro: Apenas chamados com fechamento preenchido.
Agrupar por nome da categoria do chamado.
*/
SELECT SUM(CUSTO) AS CUSTO,
SUM(DATEDIFF(HOUR,ABERTURA,FECHAMENTO)) HORAS,
CA.CATEGORIA
FROM CHAMADO C 
JOIN CATEGORIA CA ON C.ID_CATEGORIA = CA.ID_CATEGORIA
GROUP BY CA.CATEGORIA
/*
3-Criar uma função tabular chamada “chamado_dep”
com as seguintes colunas:
 -Contagem de chamados
 -Somatória da diferença em horas da abertura para o fechamento.
Agrupar por nome do departamento do solicitante.
A função deve receber o parâmetro @departamento varchar(500). 
Esse parâmetro irá filtrar o nome do departamento na função. 
*/
 
CREATE FUNCTION CHAMADO_DEP(@DEPARTAMENTO VARCHAR(500))
RETURNS TABLE
AS
RETURN
(
SELECT 
D.NOME AS DEPARTAMENTO,
SUM(DATEDIFF(HOUR,ABERTURA,GETDATE())) TEMPO_ABERTO,
COUNT(1) CONTAGEM
FROM CHAMADO C
JOIN FUNCIONARIO F ON C.ID_SOLICITANTE = F.ID_FUNCIONARIO
JOIN DEPARTAMENTO D ON F.ID_DEPARTAMENTO = D.ID_DEPARTAMENTO
WHERE D.NOME= @DEPARTAMENTO
GROUP BY D.NOME
)
 SELECT * FROM CHAMADO_DEP('MARKETING')

/*
4-Criar uma nova tabela chamada “chamados_diretoria”.
 Essa tabela deve possuir as seguintes colunas:
	-nome do funcionário solicitante
 	-abertura
	-fechamento
	-prioridade
Filtro: Inserir dados de
chamados criados por membros
do departamento Diretoria.
*/

SELECT 
 F.NOME,ABERTURA,FECHAMENTO,P.PRIORIDADE INTO chamados_diretoria
FROM CHAMADO C
JOIN FUNCIONARIO F ON C.ID_SOLICITANTE = F.ID_FUNCIONARIO
JOIN DEPARTAMENTO D ON F.ID_DEPARTAMENTO = D.ID_DEPARTAMENTO
JOIN PRIORIDADE P ON C.ID_PRIORIDADE = P.ID_PRIORIDADE
WHERE D.NOME = 'DIRETORIA'
SELECT * FROM chamados_diretoria
 
/*
5-Criar uma função escalar:
 Essa função deve receber dois parâmetros inteiros:
  -quantidade de horas
  -sla horas (sla seria um prazo máximo para atender um chamado)
Deve retornar um varchar: 
 -se a quantidade de horas for menor  que o sla horas “dentro do sla”. 
 -se quantidade de horas  for igual o sla horas “limite sla”.
 -se quantidade de horas  for maior que o sla horas “fora do sla”.
 Testar a função em um comando SELECT.
*/
CREATE FUNCTION HORAS(@HORA INT, @SLA INT)
RETURNS VARCHAR(1000)
BEGIN
   RETURN CASE WHEN @HORA < @SLA THEN 'dentro do sla'
	    WHEN @HORA = @SLA THEN 'limite sla'
		WHEN @HORA > @SLA THEN 'fora do sla' end
		
END
SELECT 
 DATEDIFF(HOUR,C.ABERTURA,GETDATE()), SLA_HORAS,
 dbo.HORAS(DATEDIFF(HOUR,C.ABERTURA,GETDATE()),SLA_HORAS) SLA
FROM CHAMADO C
JOIN PRIORIDADE P ON C.ID_PRIORIDADE = P.ID_PRIORIDADE

CREATE FUNCTION VENDA.LIMPEZA(@ST VARCHAR(1000))
RETURNS VARCHAR(1000)
BEGIN
   RETURN(UPPER(TRIM(@ST)))
END

 
/*
6-Criar uma consulta com as seguintes colunas:
 -Nome atendente
 -Categoria chamado
 -Prioridade Chamado
 -Contagem dos chamados
 -Somatória da quantidade de 
 chamados que o departamento
 é igual a “Diretoria”
Agrupar por nome atendente, 
categoria chamado, prioridade chamado
*/



/*
7-Criar uma consulta com as seguintes colunas:
 -Nome solicitante
 -Categoria chamado
 -Prioridade Chamado
 -Contagem dos chamados
 -Somatória da quantidade de 
 chamados ainda não foram solucionados (data fechamento vazia)
-Somatória da quantidade de 
chamados ainda não foram solucionados e são prioridade alta.
Agrupar por nome solicitante,
categoria chamado, prioridade chamado.
*/

/*
8-Criar uma consulta com as seguintes colunas:
 -Ano da abertura
 -Nome do mês da abertura
 -Dia da abertura
 -Somatória da quantidade de chamados
 Agrupar por ano da abertura, Nome do mês da abertura e dia da abertura

*/



