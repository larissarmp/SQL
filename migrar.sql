--Migrar as cidades para a tb_Cidades

BEGIN TRAN;


CREATE TABLE #tmp_Cidades(
	codCidades INT IDENTITY(1,1),
	nmCidade VARCHAR(50),
	codEstado INT
	);

-- Inserir os dados das cidades na tabela temporária
INSERT INTO  #tmp_Cidades(nmCidade)
SELECT DISTINCT nmCidade FROM tb_clientes ORDER BY nmCidade;

-- Tratamento de dados

--Update do código do estado
SELECT * FROM tb_Estados E
INNER JOIN tb_clientes C ON E.nmEstado = C.nmEstado

ROLLBACK TRAN;
--COMMIT TRAN;
