
-- Arquivo de Criação do Banco de Dados
-- Atividade 08 - Cafeteria BomGosto

CREATE TABLE cardapio (
    codigo SERIAL PRIMARY KEY,
    nome VARCHAR(100) UNIQUE NOT NULL,
    descricao TEXT,
    preco_unitario NUMERIC(10, 2) NOT NULL
);

CREATE TABLE comanda (
    codigo SERIAL PRIMARY KEY,
    data DATE NOT NULL,
    numero_mesa INT NOT NULL,
    nome_cliente VARCHAR(150)
);

CREATE TABLE item_comanda (
    codigo_comanda INT NOT NULL,
    codigo_cardapio INT NOT NULL,
    quantidade INT NOT NULL,
    PRIMARY KEY (codigo_comanda, codigo_cardapio),
    FOREIGN KEY (codigo_comanda) REFERENCES comanda(codigo),
    FOREIGN KEY (codigo_cardapio) REFERENCES cardapio(codigo)
);

INSERT INTO cardapio (nome, descricao, preco_unitario) VALUES
('Espresso', 'Café puro e intenso', 5.00),
('Cappuccino', 'Espresso, leite vaporizado e espuma de leite', 8.50),
('Latte', 'Espresso com uma grande quantidade de leite vaporizado', 9.00),
('Mocha', 'Espresso, chocolate e leite vaporizado', 10.50),
('Macchiato', 'Espresso com uma pequena quantidade de espuma de leite', 6.00);

INSERT INTO comanda (data, numero_mesa, nome_cliente) VALUES
('2025-10-09', 5, 'Carlos Eduardo'),
('2025-10-09', 2, 'Ana Paula'),
('2025-10-10', 8, 'Fernanda Lima'),
('2025-10-10', 5, 'Ricardo Souza'),
('2025-10-11', 3, 'Juliana Alves');

INSERT INTO item_comanda (codigo_comanda, codigo_cardapio, quantidade) VALUES
(1, 1, 2), -- Comanda 1: 2 Espressos
(1, 2, 1), -- Comanda 1: 1 Cappuccino
(2, 3, 1), -- Comanda 2: 1 Latte
(3, 4, 2), -- Comanda 3: 2 Mochas
(3, 1, 1), -- Comanda 3: 1 Espresso
(4, 2, 1), -- Comanda 4: 1 Cappuccino
(5, 5, 2); -- Comanda 5: 2 Macchiatos