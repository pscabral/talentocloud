DELIMITER $$

CREATE PROCEDURE RelatorioDiarioCompras()
BEGIN
    SELECT 
        DATE(DataCompra) AS Data,
        ProdutoID,
        SUM(Quantidade) AS QuantidadeTotal
    FROM 
        Compras
    GROUP BY 
        DATE(DataCompra),
        ProdutoID
    ORDER BY 
        Data,
        ProdutoID;
END $$

DELIMITER ;
