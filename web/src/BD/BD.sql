/* ------------------------------ */
# | Criação do DataBase          | #
/* ------------------------------ */

CREATE DATABASE MeiLegal;
USE MeiLegal;

/* ------------------------------ */
# | Criação da tabela Clientes   | #
/* ------------------------------ */

CREATE TABLE Clientes (
	Id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Nome VARCHAR(100) NOT NULL,
    CPF VARCHAR(14) NOT NULL,
    Idade INTEGER(2) NOT NULL,
    DataCadastro DATE NOT NULL
);


/* ---------------------------------- */
# | Criação da tabela Funcionários   | #
/* ---------------------------------- */

CREATE TABLE Funcionarios (
	Id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Nome VARCHAR(100) NOT NULL,
    CPF VARCHAR(14) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    Telefone VARCHAR(13) NOT NULL
);


/* ---------------------------------- */
# | Criação da tabela Funcionários   | #
/* ---------------------------------- */

CREATE TABLE Fornecedores (
	Id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    RazaoSocial VARCHAR(100) NOT NULL,
    CNPJ VARCHAR(18) NOT NULL,
    Servico VARCHAR(255) NOT NULL,
    Telefone VARCHAR(13) NOT NULL,
    Email VARCHAR(255) NOT NULL
);


/* ---------------------------------- */
# | Criação da tabela Legalização    | #
/* ---------------------------------- */

CREATE TABLE Legalizacao (
	Id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    TipoProcesso ENUM('Abertura', 'Alteração', 'Baixa', 'Regularização') NOT NULL,
    FaseProcesso ENUM('Análise', 'Protocolo', 'Deferido', 'Concluído') NOT NULL,
    
	# IDs das Foreign Keys
    /*-------------------------------------------------> Cliente */
    IdCliente INT NOT NULL,
    CONSTRAINT fk_legalizacaoCliente
		FOREIGN KEY (IdCliente)
        REFERENCES Clientes (Id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    
    /*-------------------------------------------------> Funcionário */
    IdFuncionario INT NOT NULL, 
    CONSTRAINT fk_legalizacaoFuncionario
		FOREIGN KEY (IdFuncionario)
        REFERENCES Funcionarios (Id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
        
    /*-------------------------------------------------> Fornecedor */ 
    IdFornecedor INT NOT NULL,
    CONSTRAINT fk_legalizacaoFornecedor 
		FOREIGN KEY (IdFornecedor)
        REFERENCES Fornecedores (ID)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);


/* ---------------------------------- */
# | Criação da tabela Geral          | #
/* ---------------------------------- */    
    
CREATE TABLE Geral (
	Id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Status Boolean NOT NULL,
    
    # IDs das Foreign Keys
    /*-------------------------------------------------> Cliente */
    # Cliente
    IdCliente INT NOT NULL,
    CONSTRAINT fk_geralCliente
		FOREIGN KEY (IdCliente)
        REFERENCES Clientes (ID)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    
    /*-------------------------------------------------> Funcionário */
    IdFuncionario INT NOT NULL,
    CONSTRAINT fk_geralFuncionario
		FOREIGN KEY (IdFuncionario)
        REFERENCES Funcionarios (ID)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
     
    /*-------------------------------------------------> Fornecedor */
    IdFornecedor INT NOT NULL,
    CONSTRAINT fk_geralFornecedor 
		FOREIGN KEY (IdFornecedor)
        REFERENCES Fornecedores (ID)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    
    /*-------------------------------------------------> Legalização */
    IdLegalizacao INT NOT NULL,
    CONSTRAINT fk_geralLegalizacao 
		FOREIGN KEY (IdLegalizacao)
        REFERENCES Legalizacao (ID)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);
