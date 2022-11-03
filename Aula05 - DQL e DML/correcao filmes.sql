--Liste uma coluna calculada chamada “Custo_Filme” com o valor de 30% da
--“bilheteria_dolar”.
select custo_filme = Bilheteria_dolar * 0.3 from filmes
--• Liste uma coluna calculada chamada “Lucro” = bilheteria_dolar - “Custo_Filme”
select Lucro = Bilheteria_dolar - (Bilheteria_dolar * 0.3),Bilheteria_dolar from filmes
--• Liste apenas uma coluna chamada “filme_distribuidor” essa coluna deverá ser uma
--cadeia de caracteres contendo a concatenação da coluna Filme + “ foi distribuído pela
--empresa: “ + coluna Distribuidor.
select filme + ' foi distribuído pela,--empresa: ' + Distribuidor  from filmes 
select concat(filme ,' foi distribuído pela,--empresa: ', Distribuidor)  from filmes 
-- Liste todas as colunas que o ano é menor que 2000.
select * from filmes where ano in (2000,2001,2010,2011)
select * from filmes where ano not in (2000,2001,2010,2011)
-- Liste todas as colunas que o ano é maior ou igual 2010 e menor que 2015.
select * from filmes where ano >= 2010 and ano <= 2015

select * from filmes  where ano between 2010 and 2014
--
-- Liste as colunas filme e ano, onde a bilheteria_dolar é menor que 1.000.000.000 e que o
--  Ano seja maior que 2000.
select * from filmes  where (bilheteria_dolar < 10000000000) and (ano > 2000)

-- Liste as colunas filme, ano e bilheteria 
--onde o distribuidor é igual Warner Bros. Pictures.
select distinct distribuidor from filmes  where Distribuidor ='Warner Bros. Pictures'
select distinct distribuidor from filmes  where Distribuidor  like 'Warner%'
select distinct distribuidor from filmes  where Distribuidor  like '%Pictures'
select distinct distribuidor from filmes  where Distribuidor  like '%Pictures%'

select distinct distribuidor from filmes  where Distribuidor not like 'Warner%'
select distinct distribuidor from filmes  where Distribuidor not like '%Pictures'
select distinct distribuidor from filmes  where Distribuidor not like '%Pictures%'

-- Liste todas as colunas da tabela onde os valores do distribuidor são NULOS.
select count(1) nulos from filmes where Distribuidor is null  and ano > 2000
select count(1) n_nulos from filmes where Distribuidor is not null
-- Liste todos os filmes que o ranking seja maior
--   que 50 e menor que 80 ou que o ano seja igual 2007.
select *  from filmes where (Ranking > 50 and Ranking < 80) or ano = 2007

-- Liste as colunas filme, ano, distribuidor 
--onde o Ano seja 1977 e o Distribuidor seja “20th -- Century Fox” ou
-- Que o ano seja 1982 e que o distribuidor seja “Universal Pictures”.
select *  from filmes --where ano = 1982
where 
(ano = 1977 and  Distribuidor = '20th Century Fox') or 
(ano = 1982 and  Distribuidor = 'Universal Pictures')
