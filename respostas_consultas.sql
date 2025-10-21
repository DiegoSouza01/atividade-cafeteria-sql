-- Arquivo de Respostas das Consultas
-- Atividade 08 - Cafeteria BomGosto

-- 1) Faça uma listagem do cardápio ordenada por nome;
SELECT
    nome,
    descricao,
    preco_unitario
FROM
    cardapio
ORDER BY
    nome;

-- 2) Apresente todas as comandas (código, data, mesa e nome do cliente) e os itens da comanda
-- (código comanda, nome do café, descricão, quantidade, preço unitário e preço total do café)
-- destas ordenados data e código da comanda e, também o nome do café;
SELECT
    c.codigo AS codigo_comanda,
    c.data,
    c.numero_mesa,
    c.nome_cliente,
    ca.nome AS nome_cafe,
    ca.descricao,
    ic.quantidade,
    ca.preco_unitario,
    (ic.quantidade * ca.preco_unitario) AS preco_total_cafe
FROM
    comanda c
JOIN
    item_comanda ic ON c.codigo = ic.codigo_comanda
JOIN
    cardapio ca ON ic.codigo_cardapio = ca.codigo
ORDER BY
    c.data,
    c.codigo,
    ca.nome;

-- 3) Liste todas as comandas (código, data, mesa e nome do cliente) mais uma coluna com o
-- valor total da comanda. Ordene por data esta listagem;
SELECT
    c.codigo,
    c.data,
    c.numero_mesa,
    c.nome_cliente,
    SUM(ic.quantidade * ca.preco_unitario) AS valor_total_comanda
FROM
    comanda c
JOIN
    item_comanda ic ON c.codigo = ic.codigo_comanda
JOIN
    cardapio ca ON ic.codigo_cardapio = ca.codigo
GROUP BY
    c.codigo, c.data, c.numero_mesa, c.nome_cliente
ORDER BY
    c.data;

-- 4) Faça a mesma listagem das comandas da questão anterior, mas traga apenas
-- as comandas que possuem mais do que um tipo de café na comanda;
SELECT
    c.codigo,
    c.data,
    c.numero_mesa,
    c.nome_cliente,
    SUM(ic.quantidade * ca.preco_unitario) AS valor_total_comanda
FROM
    comanda c
JOIN
    item_comanda ic ON c.codigo = ic.codigo_comanda
JOIN
    cardapio ca ON ic.codigo_cardapio = ca.codigo
GROUP BY
    c.codigo, c.data, c.numero_mesa, c.nome_cliente
HAVING
    COUNT(ic.codigo_cardapio) > 1
ORDER BY
    c.data;

-- 5) Qual o total de faturamento por data? ordene por data esta consulta.
SELECT
    c.data,
    SUM(ic.quantidade * ca.preco_unitario) AS faturamento_total
FROM
    comanda c
JOIN
    item_comanda ic ON c.codigo = ic.codigo_comanda
JOIN
    cardapio ca ON ic.codigo_cardapio = ca.codigo
GROUP BY
    c.data
ORDER BY
    c.data;