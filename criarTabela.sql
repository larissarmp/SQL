/*
Autor: Larissa Ribeiro
Data: 09/08/2019

Criar uma tabela para inserir os dados do produto da empresa

Primeiro cria-se as tabelas e por �ltimo inserir as regras(chaves prim�rias, chaves
secund�rias, CONSTRAINS
*/
----------------------------------------------------------------------------------

CREATE TABLE  tb_DadosProdutos(
	codProduto INT PRIMARY KEY IDENTITY(1,1), --come�a com 1 e aumenta de 1 em 1 
	nmProduto VARCHAR(50) NOT NULL, --sabe-se que essa vari�vel � obrigat�ria
	vlProduto DECIMAL(6,2) --valores decimais em que a 1� parte � a qtd de n� e a 2� parte � a qtd de v�rgula. 
);

-----------------------------------------------------------------------------------
--Criar uma tabela para inserir os clientes da empresa
-----------------------------------------------------------------------------------

CREATE TABLE tb_clientes(
	codCliente INT PRIMARY KEY IDENTITY(1,1),--regra
	nmCliente VARCHAR(50) NOT NULL,
	dtNascimentoCliente DATE,
	inSexo VARCHAR(1) NOT NULL, --Considerando sexo biologico
	nmEndereco VARCHAR(50),
	nmCidade VARCHAR(50),
	nmEstado VARCHAR(20),
	nmTelefoneFixo VARCHAR(15),
	nmTelefoneCelular VARCHAR(15)
);

-----------------------------------------------------------------------------------
--Criar uma tabela para inserir as vendas realizadas na empresa
-----------------------------------------------------------------------------------

CREATE TABLE  tb_vendas(
	codVenda INT PRIMARY KEY IDENTITY(1,1),
	codProduto INT NOT NULL, --quando relacionar duas tabelas utilizar com mesmo nome para facilitar na manuten��o 
	vlProduto DECIMAL (6,2) NOT NULL,
);

-----------------------------------------------------------------------------------
--Criar uma restri��o/regra para que a venda seja feita somente se houver produto
--CONSTRAINS
--FOREIGN KEY
-----------------------------------------------------------------------------------

ALTER TABLE tb_vendas
ADD CONSTRAINT FK_Produto_Vendas --para nomear o nome utiliza-se a chave que est� saindo e a coluna que est� 
FOREIGN KEY (codProduto) --qual vai ser a coluna que estar� referenciando a outra tabela
REFERENCES tb_DadosProdutos (codProduto)--onde esta fazendo refer�ncia 1� -> tabela 2� -> coluna
