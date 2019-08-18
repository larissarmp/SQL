-- INICIAR A TRANSAÇÃO
BEGIN TRAN;

CREATE TABLE #tmp_Estados(
	codEstado INT IDENTITY(1,1),
	nmEstado VARCHAR(30),
	nmSigla	 VARCHAR(2)
);
/*IF OBJECT_ID('tb_Estados... #step_Estados') IS NOT NULL
DROP TABLE #tmp_Estados;*/
--Inserir os dados dos estados na tabela temporaria
INSERT INTO #tmp_Estados(nmEstado)
SELECT DISTINCT nmEstado FROM tb_Clientes ORDER BY nmEstado;
-- update na sigla

UPDATE #tmp_Estados SET nmSigla = 'GO' WHERE nmEstado = 'Goiânia';
UPDATE #tmp_Estados SET nmSigla = 'GO' WHERE nmEstado = 'Goiás';
UPDATE #tmp_Estados SET nmSigla = 'MG' WHERE nmEstado = 'Minas Gerais';
UPDATE #tmp_Estados SET nmSigla = 'SP' WHERE nmEstado = 'São Paulo';

SET IDENTITY_INSERT tb_Estados ON; -- iNSERE NA COLUNA DE IDENTITY

--INSERINDO NA TABELA ESTADOS

INSERT INTO tb_Estados (codEstado, nmEstado, nmSigla)
SELECT codEstado, nmEstado, nmSigla FROM #tmp_Estados;


--SELECT * FROM #tmp_Estados
--SELECT * FROM tb_Estados;

SET IDENTITY_INSERT tb_Estados OFF;
--ROLLBACK TRAN
--COMMIT TRAN; --INSERE AS ALTERAÇÃO  
