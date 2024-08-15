CREATE FUNCTION ContarClientesCadastrados(@Data DATE)
RETURNS INT
AS
BEGIN
    DECLARE @TotalClientes INT;

    SELECT @TotalClientes = COUNT(*)
    FROM Clientes
    WHERE CONVERT(DATE, DataCadastro) = @Data;

    RETURN @TotalClientes;
END;
