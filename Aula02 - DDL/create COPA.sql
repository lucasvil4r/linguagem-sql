--USE fit_alunos
CREATE TABLE  fit_alunos.dbo.DENILSON_COPA_BRASIL
(id_table int identity(1,1) primary key,
time1 varchar(100) not null,
data_jogo date not null,
codigo_jogo varchar(100) unique not null
--CONSTRAINT  CHAVE_TABELA PRIMARY KEY(id_table)
)

CREATE TABLE 
DENILSON_CAMPEONATOS
(
id_campeonatos int identity(100,10),
data_atualizacao date,
id_jogo_copa_brasil 
int FOREIGN KEY REFERENCES
DENILSON_COPA_BRASIL(id_table),
--CONSTRAINT FK_TABELA
--FOREIGN KEY REFERENCES DENILSON_COPA_BRASIL(id_table)
)


SELECT * FROM DENILSON_CAMPEONATOS