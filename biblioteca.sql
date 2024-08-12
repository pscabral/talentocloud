-- Criação do Banco de Dados
CREATE DATABASE IF NOT EXISTS Biblioteca;
USE Biblioteca;

-- Criação da Tabela Autores
CREATE TABLE IF NOT EXISTS Autores (
    AutorID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Nacionalidade VARCHAR(50)
);

-- Criação da Tabela Livros
CREATE TABLE IF NOT EXISTS Livros (
    LivroID INT AUTO_INCREMENT PRIMARY KEY,
    Titulo VARCHAR(150) NOT NULL,
    AutorID INT,
    AnoPublicacao INT,
    Categoria VARCHAR(50),
    CONSTRAINT FK_Autor FOREIGN KEY (AutorID) REFERENCES Autores(AutorID)
);

-- Criação da Tabela Emprestimos
CREATE TABLE IF NOT EXISTS Emprestimos (
    EmprestimoID INT AUTO_INCREMENT PRIMARY KEY,
    LivroID INT,
    DataEmprestimo DATE,
    DataDevolucao DATE,
    CONSTRAINT FK_Livro FOREIGN KEY (LivroID) REFERENCES Livros(LivroID)
);

-- Criação do Trigger
DELIMITER //

CREATE TRIGGER AtualizaDataEmprestimo
AFTER INSERT ON Emprestimos
FOR EACH ROW
BEGIN
    UPDATE Livros
    SET Categoria = 'Emprestado'
    WHERE LivroID = NEW.LivroID;
END //

DELIMITER ;
