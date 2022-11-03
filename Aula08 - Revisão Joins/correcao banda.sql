create table #Banda (
	id_banda int identity(1,1) primary key,
	banda varchar(30),
	ano_fundacao int,
	pais varchar(30)
)
GO

create table #Gravadora(
	id_gravadora int identity(1,1) primary key,
	gravadora varchar(30),
	pais varchar(30)
)
GO

create table #Musica (
	id_musica int identity(1,1) primary key,
	nome varchar(30),
	id_banda int foreign key references #Banda(id_banda),
	id_gravadora int foreign key references #Gravadora(id_gravadora)
)
GO

insert into #Banda (banda, ano_fundacao, pais) values 
	('TITANS', 1981, 'Brasil'),
	('LEGIAO URBANA', 1982, 'Brasil'),
	('PARALAMAS DO SUCESSO', 1977, 'Brasil'),
	('ROUPA NOVA', 1980, null)
GO

insert into #Gravadora (gravadora, pais) values
	('Globo', 'Brasil'),
	('EMI', 'EUA'),
	('Apple', 'UK')
GO

insert into #Musica (nome, id_banda, id_gravadora) values
	('Enquanto Houver Sol', 1, 1),
	('Família', 1, 1),
	('Flores', 1, 1),
	('Mais Uma Vez', 2, 2),
	('Que País é Esse?', 2, 2),
	('Óculos', 3, 2),
	('Uma Brasileira',3, null)
GO

select #Gravadora.gravadora,#Musica.nome, #BANDA.pais,#Banda.banda 
from #Gravadora 
JOIN  #Musica ON #Gravadora.id_gravadora = #Musica.id_gravadora
JOIN #Banda ON #Banda.id_banda = #Musica.id_banda 
WHERE #Gravadora.gravadora = 'gLOBO'


select * 
from #Musica as M 
inner join #Gravadora as G
on m.id_gravadora = g.id_gravadora

select * 
from #Musica as M 
left join #Gravadora as G
on m.id_gravadora = g.id_gravadora



select * 
from #Musica as M 
right join #Gravadora as G
on m.id_gravadora = g.id_gravadora


select * 
from #Gravadora as M 
left join #Musica as G
on m.id_gravadora = g.id_gravadora

select * 
from #Gravadora as M 
full join #Musica as G
on m.id_gravadora = g.id_gravadora

select * 
from #Gravadora as M 
cross join #Musica  

select * 
from #Gravadora,#Musica


select * from #Banda

select * from #Musica
--Selecione as colunas nome da música e nome da banda.

SELECT M.NOME,   B.BANDA  FROM #Musica M 
INNER JOIN #Banda B ON M.ID_BANDA = B.ID_BANDA 

--Selecione o nome das bandas que ainda não tiveram nenhuma música cadastrada na tabela.
SELECT B.*  FROM #Banda B 
LEFT JOIN #Musica M on B.ID_BANDA = M.ID_BANDA
WHERE M.ID_BANDA IS NULL
 
--Selecione o id e o nome das músicas que as bandas foram criadas antes  de 1980.
SELECT B.BANDA, M.NOME,B.ID_BANDA   FROM #Banda B 
INNER JOIN #Musica M on B.ID_BANDA = M.ID_BANDA 
WHERE ANO_FUNDACAO < 1980 ORDER BY B.BANDA,2 DESC,id_banda ASC

--Selecione as colunas nome da música 
--e nome da banda, que o país não está preenchido.
SELECT B.BANDA, M.NOME,B.ID_BANDA ,PAIS  FROM #Banda B 
INNER JOIN #Musica M on B.ID_BANDA = M.ID_BANDA 
WHERE PAIS IS NULL 

--Selecione o nome das  músicas e o nome da gravadora.
--Deve aparecer todas as músicas.
SELECT nome,gravadora FROM #Musica M
left join #Gravadora  G on M.id_gravadora = G.id_gravadora

--Selecione o id e o nome da 
--música das gravadoras EMI e da Apple.
SELECT nome,gravadora FROM #Musica M
left join #Gravadora  G on M.id_gravadora = G.id_gravadora
--where g.gravadora = 'EMI' OR g.gravadora = 'Apple'
WHERE g.gravadora in ('EMI','Apple')

--Selecione o  id e o nome da música. 
--Filtre  as músicas que a gravadora não é brasileira.

SELECT nome,gravadora FROM #Musica M
INNER join #Gravadora  G on M.id_gravadora = G.id_gravadora
--where g.gravadora = 'EMI' OR g.gravadora = 'Apple'
WHERE g.PAIS NOT in ('BRASIL')

--SELECT * FROM #Gravadora
--Selecione o nome da banda, nome da música,
--país da banda e país da gravadora.
SELECT M.nome,B.BANDA,G.gravadora,G.PAIS AS Pais_gravadora FROM #Musica M 
INNER JOIN #Banda B ON M.id_banda = B.ID_BANDA
LEFT join #Gravadora  G on M.id_gravadora = G.id_gravadora

--Selecione a data de fundação da banda, id da música, país da banda
--e país da gravadora onde o país da gravadora é diferente do país da banda.
SELECT B.ano_fundacao, M.ID_MUSICA,B.PAIS, G.PAIS FROM  #Musica M 
INNER JOIN #Banda B ON M.id_banda = B.ID_BANDA
INNER join #Gravadora  G on M.id_gravadora = G.id_gravadora
WHERE  G.pais != B.PAIS

--Selecione nome da música, nome da banda. Precisamos de todas as informações (full join)
SELECT M.nome,B.banda FROM  #Musica M 
FULL JOIN #Banda B ON M.id_banda = B.ID_BANDA

