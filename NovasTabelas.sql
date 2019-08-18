/*
SELECT * FROM tb_clientes

SELECT *
INTO tb_ClientesBackup
FROM tb_Clientes;
*/
CREATE TABLE tb_enderecoS(
	codEndereco INT NOT NULL PRIMARY KEY IDENTITY (1,1),
	mEndereco	VARCHAR (50) NOT NULL,
	nmCEP VARCHAR(9),
	codCidade INT NOT NULL
	)
CREATE TABLE tb_Cidades(
	codCidade INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	nmCidade VARCHAR (50) NOT NULL,
	codEstado INT NOT NULL
	)
CREATE TABLE tb_Estados (
	codEstado INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	nmEstado VARCHAR (30) NOT NULL,
	nmSigla VARCHAR (2) NOT NULL
	)
ALTER TABLE tb_Enderecos
ADD CONSTRAINT FK_Enderecos_Cidades
FOREIGN KEY (codCidade)
REFERENCES tb_Cidades (codCidade);

ALTER TABLE tb_Cidades
ADD CONSTRAINT FK_Cidades_Estados
FOREIGN KEY (codEstado)
