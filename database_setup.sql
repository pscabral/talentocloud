-- Criação da Base de Dados
CREATE DATABASE LojaOnline;
USE LojaOnline;

-- Criação das Tabelas
CREATE TABLE Clientes (
    ClienteID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    DataCadastro DATE
);

CREATE TABLE Produtos (
    ProdutoID INT AUTO_INCREMENT PRIMARY KEY,
    NomeProduto VARCHAR(100),
    Preco DECIMAL(10, 2),
    Estoque INT
);

CREATE TABLE Pedidos (
    PedidoID INT AUTO_INCREMENT PRIMARY KEY,
    ClienteID INT,
    DataPedido DATE,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

CREATE TABLE DetalhesPedidos (
    DetalheID INT AUTO_INCREMENT PRIMARY KEY,
    PedidoID INT,
    ProdutoID INT,
    Quantidade INT,
    FOREIGN KEY (PedidoID) REFERENCES Pedidos(PedidoID),
    FOREIGN KEY (ProdutoID) REFERENCES Produtos(ProdutoID)
);

-- Inserção de Dados
INSERT INTO Clientes (Nome, Email, DataCadastro) VALUES
('João Silva', 'joao.silva@example.com', '2024-08-01'),
('Maria Oliveira', 'maria.oliveira@example.com', '2024-08-02');

INSERT INTO Produtos (NomeProduto, Preco, Estoque) VALUES
('Camiseta', 29.90, 100),
('Calça Jeans', 79.90, 50);

INSERT INTO Pedidos (ClienteID, DataPedido) VALUES
(1, '2024-08-10'),
(2, '2024-08-11');

INSERT INTO DetalhesPedidos (PedidoID, ProdutoID, Quantidade) VALUES
(1, 1, 2),
(1, 2, 1),
(2, 1, 1);

-- Consultas Utilizando Joins
-- Consulta para obter detalhes dos pedidos com informações do cliente e do produto
SELECT 
    c.Nome AS Cliente,
    p.NomeProduto AS Produto,
    dp.Quantidade,
    p.Preco,
    (dp.Quantidade * p.Preco) AS Total
FROM 
    DetalhesPedidos dp
JOIN 
    Pedidos ped ON dp.PedidoID = ped.PedidoID
JOIN 
    Clientes c ON ped.ClienteID = c.ClienteID
JOIN 
    Produtos p ON dp.ProdutoID = p.ProdutoID;
