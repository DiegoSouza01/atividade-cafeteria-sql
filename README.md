# Atividade 08 - Modelagem de Banco de Dados: Cafeteria BomGosto

Este repositório documenta a solução da Atividade 08, que envolve a modelagem, construção e consulta de um banco de dados PostgreSQL para gerenciar as vendas da cafeteria BomGosto.

## Objetivo do Projeto

O objetivo principal é criar um sistema de banco de dados capaz de registrar e controlar as vendas de café realizadas a partir de comandas. O sistema deve permitir o gerenciamento de um cardápio, o registro de comandas por cliente e mesa, e a associação dos cafés consumidos em cada comanda.

---

## Modelagem do Banco de Dados

Para atender aos requisitos da atividade, o banco de dados foi estruturado em três tabelas principais:

### 1. Tabela `cardapio`

Esta tabela armazena o catálogo de produtos (cafés) oferecidos pela cafeteria.
* **Informações:** Contém um código único para o café, seu nome (que também é único), a descrição de sua composição e o preço unitário.

### 2. Tabela `comanda`

Esta tabela registra cada transação de venda individual.
* **Informações:** Armazena um código único para a comanda, a data da venda, o número da mesa e o nome do cliente.

### 3. Tabela `item_comanda`

Esta é uma tabela associativa que conecta as comandas aos itens do cardápio que foram consumidos.
* **Informações:** Relaciona o código da comanda e o código do cardápio, armazenando também a quantidade de cada item solicitado.
* **Regra de Negócio:** Possui uma chave primária composta que impede a inserção do mesmo item de cardápio mais de uma vez na mesma comanda.

---

## Estrutura dos Arquivos no Repositório

* **`criacao_banco.sql`**: Este script contém os comandos SQL responsáveis por criar a estrutura de tabelas (`CREATE TABLE`) e por popular o banco com dados de exemplo (`INSERT INTO`) para permitir a execução das consultas.
* **`respostas_consultas.sql`**: Este script contém todas as consultas (`SELECT`) desenvolvidas para responder às cinco questões propostas na atividade.

---

## Questões da Atividade

As consultas SQL no arquivo `respostas_consultas.sql` foram desenvolvidas para extrair as seguintes informações do banco de dados:

1.  Uma listagem completa de todos os itens do cardápio, ordenada alfabeticamente pelo nome do café.
2.  Um relatório detalhado de todas as comandas e seus respectivos itens, incluindo dados do cliente (data, mesa) e dados do item (nome do café, quantidade, preço unitário e preço total do item).
3.  Uma listagem de todas as comandas, incluindo uma coluna calculada com o valor total de cada uma, ordenada por data.
4.  Um filtro da listagem anterior, exibindo apenas as comandas que continham mais de um tipo de café (ou seja, mais de um item) registrado.
5.  Um relatório de faturamento total agrupado por data, permitindo a análise de vendas diárias.
