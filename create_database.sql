-- Cria o banco de dados ESCOLA
CREATE DATABASE ESCOLA;

-- Seleciona o banco de dados ESCOLA para uso
USE ESCOLA;


-- Cria a tabela ALUNO com os atributos especificados
CREATE TABLE ALUNO (
    ID INT AUTO_INCREMENT PRIMARY KEY,  -- Atributo ID como chave primária e auto-incremental
    nome VARCHAR(100) NOT NULL,         -- Atributo nome do tipo varchar com tamanho máximo de 100 caracteres
    email VARCHAR(100) NOT NULL,        -- Atributo email do tipo varchar com tamanho máximo de 100 caracteres
    endereco VARCHAR(255) NOT NULL      -- Atributo endereco do tipo varchar com tamanho máximo de 255 caracteres
);

