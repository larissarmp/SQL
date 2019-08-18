--Migrar as cidades para a tb_Cidades

BEGIN TRAN;


CREATE TABLE #tmp_Cidades(
	codCidades INT IDENTITY(1,1),
	nmCidade VARCHAR(50),
	codEstado INT
	);

/*IF OBJECT_ID('tb_Estados... #step_Estados') IS NOT NULL
DROP TABLE #tmp_Estados;*/

-- Inserir os dados das cidades na tabela temporária
INSERT INTO  #tmp_Cidades(nmCidade)
SELECT DISTINCT nmCidade FROM tb_clientes ORDER BY nmCidade;

-- Tratamento de dados

--Update do código do estado
--UPDATE MAIS COMPLICADADO
UPDATE TC SET codEstado = E.codEstado
FROM #tmp_Cidades TC
INNER JOIN tb_Clientes T ON TC.nmCidade = T.nmCidade
INNER JOIN tb_Estados E ON T.nmEstado = E.nmEstado;

SELECT * FROM #tmp_Cidades

SELECT DISTINCT E.codEstado, C.nmCidade FROM tb_Estados E
INNER JOIN tb_clientes C ON E.nmEstado = C.nmEstado

SELECT * FROM #tmp_Cidades

ROLLBACK TRAN;
--COMMIT TRAN;
