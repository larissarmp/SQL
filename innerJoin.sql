/*
Autora: Larissa Ribeiro
Data: 11/08/2019
*/


SELECT	
	P.codProduto,
	P.nmProduto,
	PV.qtdProduto,
	P.vlProduto
FROM tb_Produtos P INNER JOIN tb_ProdutoVenda PV
ON P.codProduto = PV.codProduto --COLUNA QUE TEM NAS DUAS TABELAS IGUAIS

--seleção dos dados com valores para quem vendi
--quantos inner join preciso fazer é a qtd de tabela para chegar onde deseja menos 1.
--4 table <- 3 inner join
SELECT	
	V.codVenda,
	C.nmCliente,
	P.codProduto,
	P.nmProduto,
	PV.qtdProduto,
	P.vlProduto
FROM tb_Produtos P INNER JOIN tb_ProdutoVenda PV ON P.codProduto = PV.codProduto --COLUNA QUE TEM NAS DUAS TABELAS IGUAIS; condiçao para o inner join
INNER JOIN tb_Vendas V ON PV.codVenda = V.codVenda
INNER JOIN tb_clientes C ON V.codCliente = C.codCliente

SELECT	
	V.codVenda,
	C.nmCliente,
	P.codProduto,
	P.nmProduto,
	PV.qtdProduto,
	P.vlProduto,
	qtdProduto * vlProduto AS qtdValorTotalProduto -- multiplicação de valor pela quantidade
FROM tb_Produtos P INNER JOIN tb_ProdutoVenda PV ON P.codProduto = PV.codProduto --COLUNA QUE TEM NAS DUAS TABELAS IGUAIS; condiçao para o inner join
INNER JOIN tb_Vendas V ON PV.codVenda = V.codVenda
INNER JOIN tb_clientes C ON V.codCliente = C.codCliente

--quero o agrupamento dos produtos
-- Soma dos valores

/*SELECT C.nmCliente,	SUM(PV.qtdProduto) qtdTotalProdutos, SUM(P.vlProduto * PV.qtdProduto)
FROM tb_Produtos P INNER JOIN tb_ProdutoVenda PV ON P.codProduto = PV.codProduto --COLUNA QUE TEM NAS DUAS TABELAS IGUAIS; condiçao para o inner join
INNER JOIN tb_Vendas V ON PV.codVenda = V.codVenda
INNER JOIN tb_clientes C ON V.codCliente = C.codCliente
GROUP BY C.nmCliente, P.nmProduto*/

SELECT C.nmCliente,	SUM(PV.qtdProduto) qtdTotalProdutos, SUM(P.vlProduto * PV.qtdProduto) AS qtdValorTotalVenda
FROM tb_Produtos P INNER JOIN tb_ProdutoVenda PV ON P.codProduto = PV.codProduto 
INNER JOIN tb_Vendas V ON PV.codVenda = V.codVenda
INNER JOIN tb_clientes C ON V.codCliente = C.codCliente
GROUP BY C.nmCliente
