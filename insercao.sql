/*
Autor: Larissa Ribeiro
Data: 09/08/2019
*/
-----------------------------------------------------------------------------------
--Inserção dos valores na tabela produto
-----------------------------------------------------------------------------------

INSERT INTO tb_Produtos VALUES ('Caneta', 1.20);
INSERT INTO tb_Produtos VALUES ('Lápis', 1.00);
INSERT INTO tb_Produtos VALUES ('Caderno', 21.25);
INSERT INTO tb_Produtos VALUES ('Borracha', 0.75);
INSERT INTO tb_Produtos VALUES ('Régua', 2.50);
INSERT INTO tb_Produtos VALUES ('Lapiseira',7.50);
INSERT INTO tb_Produtos VALUES ('Tinta', 3.40);
INSERT INTO tb_Produtos VALUES ('Estojo', 13.75);
INSERT INTO tb_Produtos VALUES ('Pasta', 2.50);
INSERT INTO tb_Produtos VALUES ('Mochila', 103.25);


-------------------------------------------------------------------------------------
--No caso de vendas como tem a a restrição do produto ter que existir na tabela produto 
--somente será add um novo valor caso exita
--------------------------------------------------------------------------------------
INSERT INTO tb_vendas VALUES (1, 1.20)
INSERT INTO tb_vendas VALUES (2, 5.00)
INSERT INTO tb_vendas VALUES (3, 3.20)
INSERT INTO tb_vendas VALUES (4, 5.60)
INSERT INTO tb_vendas VALUES (5, 65.00)
INSERT INTO tb_vendas VALUES (6, 35.00)
INSERT INTO tb_vendas VALUES (7,150.00)
INSERT INTO tb_vendas VALUES (20,150.00)--Código 20 inexistente na tabela produtos então não será possível add um novo valor
