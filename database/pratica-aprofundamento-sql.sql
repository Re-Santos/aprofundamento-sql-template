-- Active: 1697313249207@@127.0.0.1@3306
-- Conecte o arquivo pratica-aprofundamento-sql.db com a extensão MySQL e ative a conexão aqui

-- Deletar tabela
DROP TABLE pokemons;

-- Criar tabela
CREATE TABLE pokemons (
    id INTEGER PRIMARY KEY UNIQUE NOT NULL,
    name TEXT UNIQUE NOT NULL,
    type TEXT NOT NULL,
    hp INTEGER NOT NULL,
    attack INTEGER NOT NULL,
    defense INTEGER NOT NULL,
    special_attack INTEGER NOT NULL,
    special_defense INTEGER NOT NULL,
    speed INTEGER NOT NULL
);

-- Popular tabela
INSERT INTO pokemons (
    id,
    name,
    type,
    hp,
    attack,
    defense,
    special_attack,
    special_defense,
    speed
)
VALUES 
    (1, 'bulbasaur', 'grass', 45, 49, 49, 65, 65, 45),
    (2, 'ivysaur', 'grass', 60, 62, 63, 80, 80, 60),
    (3, 'venusaur', 'grass', 80, 82, 83, 100, 100, 80),
    (4, 'charmander', 'fire', 39, 52, 43, 60, 50, 65),
    (5, 'charmeleon', 'fire', 58, 64, 58, 80, 65, 80),
    (6, 'charizard', 'fire', 78, 84, 78, 109, 85, 100),
    (7, 'squirtle', 'water', 44, 48, 65, 50, 64, 43),
    (8, 'wartortle', 'water', 59, 63, 80, 65, 80, 58),
    (9, 'blastoise', 'water', 79, 83, 100, 85, 105, 78);

-- Buscar todos os pokemons
SELECT * FROM pokemons;

-- Práticas
--buscar pokemons com speed maior que 60
--todas as colunas
SELECT * FROM pokemons
WHERE speed > 60;

--colunas específicas
SELECT name,id,speed FROM pokemons
WHERE speed > 60;

--buscar pokemons que tenham attack e special_attack maiores ou igual a 60
SELECT * FROM pokemons
WHERE attack >=60 AND special_attack >=60;

--buscar pokemons que tenham na coluna name o termo "saur" no final do texto.
SELECT *  FROM pokemons
WHERE name LIKE '%saur';

--busque na tabela pokemons a média simples da coluna hp
SELECT AVG(hp) AS mediaHP
FROM pokemons;

--busque o número de linhas das tabela pokemons
SELECT COUNT(*) AS totalPokemons
FROM pokemons;

--Refatore as queries acima apelidando as colunas com funções para nomes mais semânticos em camelCase
--AS mediaHP
--AS totalPokemons

--busque  todos os pokemons e ordene-os baseando a coluna defense em ordem decrescente
SELECT * FROM pokemons
ORDER BY defense DESC;

-- busque novamente o número de pokemons cadastrados, mas agora o resultado baseado na coluna type
SELECT COUNT (*), type FROM pokemons
GROUP BY type;

--busque por todos os pokemons, limite o resultado a 3 linhas iniciando a partir da quinta linha
SELECT * FROM pokemons
LIMIT 3
OFFSET 4;
--outra maneira, colocando tudo em uma linha só
SELECT * FROM pokemons
LIMIT 4,3;

--FIXAÇÃO
--busque por todos os pokemons:
--1- filtrar o resultado, mostrando somente os itens que possuem a coluna type valendo fire ou grass
SELECT * FROM pokemons
WHERE type = 'fire' OR type = 'grass';
--2- ordenar crescente baseado na coluna attack
SELECT * FROM pokemons
ORDER BY attack ASC;
--3-resultado das linhas limitado a 3 e iniciando a partir da terceira linha
SELECT * FROM pokemons
LIMIT 3
OFFSET 2;

--MODELO FEITO EM AULA PELA COLEGA KARINA (UNINDO TODOS REQUISITOS DO EXERCÍCIO)
SELECT * FROM pokemonS
WHERE type = 'fire' OR type = 'grass'
ORDER BY attack ASC
LIMIT 3
OFFSET 2;
