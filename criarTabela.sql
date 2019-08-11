/*
Autor: Larissa Ribeiro
Data: 09/08/2019

Criar uma tabela para inserir os dados do produto da empresa

Primeiro cria-se as tabelas e por último inserir as regras(chaves primárias, chaves
secundárias, CONSTRAINS
*/
----------------------------------------------------------------------------------

CREATE TABLE  tb_Produtos(
	codProduto INT PRIMARY KEY IDENTITY(1,1), --começa com 1 e aumenta de 1 em 1 
	nmProduto VARCHAR(50) NOT NULL, --sabe-se que essa variável é obrigatória
	vlProduto DECIMAL(6,2) --valores decimais em que a 1ª parte é a qtd de nº e a 2ª parte é a qtd de vírgula. 
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
	codProduto INT NOT NULL, --quando relacionar duas tabelas utilizar com mesmo nome para facilitar na manutenção 
	vlProduto DECIMAL (6,2) NOT NULL,
);

-----------------------------------------------------------------------------------
--Criar uma restrição/regra para que a venda seja feita somente se houver produto
--CONSTRAINS
--FOREIGN KEY
-----------------------------------------------------------------------------------

ALTER TABLE tb_vendas
ADD CONSTRAINT FK_Produto_Vendas --para nomear o nome utiliza-se a chave que está saindo e a coluna que está 
FOREIGN KEY (codProduto) --qual vai ser a coluna que estará referenciando a outra tabela
REFERENCES tb_Produtos (codProduto)--onde esta fazendo referência 1º -> tabela 2º -> coluna

-------------------------------------------------------------------------------------
--Remover a tabela de vendas
-------------------------------------------------------------------------------------

DROP TABLE tb_Vendas

--Relacionar o produto a vendas

CREATE TABLE  tb_Vendas(
	codVenda INT PRIMARY KEY IDENTITY(1,1),
	codCliente INT NOT NULL FOREIGN KEY REFERENCES tb_Clientes (codCliente),
	dtVenda DATETIME NOT NULL,
);

CREATE TABLE tb_ProdutoVenda(
	codProdutoVenda INT PRIMARY KEY IDENTITY(1,1),
	codVenda INT FOREIGN KEY REFERENCES tb_Vendas (codVenda) NOT NULL,
	codProduto INT FOREIGN KEY REFERENCES tb_Produtos (codProduto) NOT NULL,
	qtdProduto INT NOT NULL, --nessa tabela os preços seram fixos
);
