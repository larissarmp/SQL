/*
@author: Larissa


--Cria uma função para te retornar determinados dados(como se fosse um select)

CREATE PROCEDURE sp_totalVendasProdutosCliente(
	@codCliente INT
)
As 
--subselect
SELECT	V.codVenda,	C.nmCliente, P.codProduto, P.nmProduto, PV.qtdProduto,	P.vlProduto,
		qtdProduto * vlProduto AS qtdValorTotalProduto 
FROM tb_Produtos P INNER JOIN tb_ProdutoVenda PV ON P.codProduto = PV.codProduto 
INNER JOIN tb_Vendas V ON PV.codVenda = V.codVenda
INNER JOIN tb_clientes C ON V.codCliente = C.codCliente
INNER JOIN(
	SELECT V.codVenda,	SUM(PV.qtdProduto) qtdTotalProdutos, SUM(P.vlProduto * PV.qtdProduto) AS qtdValorTotalVenda
	FROM tb_Produtos P INNER JOIN tb_ProdutoVenda PV ON P.codProduto = PV.codProduto 
	INNER JOIN tb_Vendas V ON PV.codVenda = V.codVenda
	GROUP BY V.codVenda
)TOTAL_VENDAS ON V.codVenda = TOTAL_VENDAS.codVenda
WHERE V.codCliente = 3
*/
--sp_totalVendasProdutosCliente 1
