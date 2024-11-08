-- Criação do banco de dados
-- Criação do banco de dados
CREATE DATABASE sisdb;

-- Conectar ao banco de dados sisdb
\c sisdb;

-- Tabela de Categorias de Equipamentos
CREATE TABLE IF NOT EXISTS CategoriaEquipamento (
    id_categoria SERIAL PRIMARY KEY,
    nome_categoria VARCHAR(100) NOT NULL
);

-- Tabela de Equipamentos
CREATE TABLE IF NOT EXISTS Equipamento (
    id_equip SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    id_categoria INT REFERENCES CategoriaEquipamento(id_categoria),
    preco DECIMAL(10, 2),
    qtd_estoque INT,
    marca VARCHAR(50)
);

-- Tabela de Funcionários
CREATE TABLE IF NOT EXISTS Funcionario (
    id_func SERIAL PRIMARY KEY,
    id_depto INT REFERENCES Departamento(id_depto),
    nome VARCHAR(100) NOT NULL,
    idade INT,
    funcao VARCHAR(100),
    tipo VARCHAR(50)
);

-- Tabela de Departamentos
CREATE TABLE IF NOT EXISTS Departamento (
    id_depto SERIAL PRIMARY KEY,
    nome_dept VARCHAR(100) NOT NULL
);

-- Tabela de Clientes
CREATE TABLE IF NOT EXISTS Cliente (
    id_cliente SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(15),
    endereco TEXT
);

-- Tabela de Transações de Equipamentos (Compra/Aluguel)
CREATE TABLE IF NOT EXISTS TransacaoEquipamento (
    id_transacao SERIAL PRIMARY KEY,
    id_cliente INT REFERENCES Cliente(id_cliente),
    id_equip INT REFERENCES Equipamento(id_equip),
    tipo_transacao VARCHAR(50), -- Ex: Compra, Aluguel
    data_transacao DATE,
    valor_total DECIMAL(10, 2)
);

-- Tabelas específicas de atributos dos equipamentos

-- Atributos para Notebooks
CREATE TABLE IF NOT EXISTS EquipamentoNotebook (
    id_equip INT PRIMARY KEY REFERENCES Equipamento(id_equip),
    peso DECIMAL(5, 2),
    bateria INT,
    tam_tela DECIMAL(5, 2)
);

-- Atributos para Smartphones
CREATE TABLE IF NOT EXISTS EquipamentoSmartphone (
    id_equip INT PRIMARY KEY REFERENCES Equipamento(id_equip),
    bateria INT,
    tipo_tela VARCHAR(100)
);

-- Atributos para Desktops
CREATE TABLE IF NOT EXISTS EquipamentoDesktop (
    id_equip INT PRIMARY KEY REFERENCES Equipamento(id_equip),
    gabinete VARCHAR(100)
);

-- Inserindo dados de exemplo nas tabelas

-- Categorias de Equipamento
INSERT INTO CategoriaEquipamento (nome_categoria) VALUES 
    ('Desktop'),
    ('Notebook'),
    ('Smartphone');

-- Equipamentos
INSERT INTO Equipamento (nome, descricao, id_categoria, preco, qtd_estoque, marca) VALUES 
    ('Computador Desktop', 'Desktop com processador Intel', 1, 3500.00, 10, 'Dell'),
    ('Notebook', 'Notebook leve e portátil', 2, 2800.00, 5, 'HP'),
    ('Smartphone', 'Smartphone Android', 3, 1500.00, 20, 'Samsung');

-- Dados específicos para equipamentos
-- Para notebooks
INSERT INTO EquipamentoNotebook (id_equip, peso, bateria, tam_tela) VALUES 
    (2, 1.5, 4000, 15.6);

-- Para smartphones
INSERT INTO EquipamentoSmartphone (id_equip, bateria, tipo_tela) VALUES 
    (3, 4000, 'LCD');

-- Para desktops
INSERT INTO EquipamentoDesktop (id_equip, gabinete) VALUES 
    (1, 'Gabinete ATX');

-- Funcionários
INSERT INTO Funcionario (id_depto, nome, idade, funcao, tipo) VALUES 
    (1, 'João Silva', 30, 'Desenvolvedor', 'Efetivo'),
    (2, 'Maria Santos', 28, 'Assistente de RH', 'Estagiário'),
    (3, 'Carlos Oliveira', 35, 'Analista Financeiro', 'Efetivo');

-- Clientes
INSERT INTO Cliente (nome, telefone, endereco) VALUES 
    ('Ana Costa', '(11) 91234-5678', 'Rua A, 123'),
    ('Paulo Souza', '(21) 98877-6655', 'Rua B, 456'),
    ('Fernanda Lima', '(31) 97766-5544', 'Rua C, 789');

-- Transações de Equipamentos
INSERT INTO TransacaoEquipamento (id_cliente, id_equip, tipo_transacao, data_transacao, valor_total) VALUES 
    (1, 1, 'Compra', '2024-11-01', 3500.00),
    (2, 2, 'Compra', '2024-10-15', 2800.00),
    (3, 3, 'Aluguel', '2024-09-20', 1500.00);
