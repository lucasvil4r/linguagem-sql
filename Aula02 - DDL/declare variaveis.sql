/*
Retorne (print ou select)  o resultado exato de 5 ÷ 2
Faça o seguinte cálculo 200 + ((500 ÷ 20) x 10,5)

Crie 5 variáveis:
 	time_coracao varchar (500) =  Nome do time
	títulos_mundiais int = quantidade de títulos mundiais
	ultimo_titulo date = data do ultimo titulo “YYYYMMDD”
	ingresso decimal(10,2) = ingresso do jogo do seu time
5 . Atualize o valor do ingresso para o dobro do inicial.
SOMA = +
SUB = -
DIV = /
MULT = *
*/

DECLARE @CALCULO DECIMAL(10,2) = 5/2.0
PRINT @CALCULO

DECLARE @CALCULO2 DECIMAL(10,2)=  200 + ((500 / 20) * 10.5)
PRINT(@CALCULO2)

DECLARE @time_coracao varchar (500) =  'ATLETICO MG'
PRINT @time_coracao

DECLARE @títulos_mundiais INT = 0

DECLARE @ultimo_titulo date --= '2021-12-31'
SET @ultimo_titulo =  '2021-12-31'
DECLARE @INGRESSO DECIMAL (10,4) = 100.50
SET @INGRESSO = @INGRESSO * 2



DECLARE @VARIAVEL INT=10 + 1
PRINT @VARIAVEL

DECLARE @DECIMALZIN DECIMAL(15,4) = 112.788848
PRINT @DECIMALZIN

DECLARE @STRING VARCHAR(10) ='SSSSSSSSSSSSSSSSSS'
PRINT @STRING


DECLARE @DATA DATE = '2022-08-10'
PRINT @DATA