-- 1.Selecione o banco de dados (esquema) pokédex.
USE pokedex;

-- 2.Obtenha informações da estrutura da tabela Pokémon.
DESC TABLE pokemon;

-- 3.Selecione todos os pokémons cadastrados no banco de dados.
SELECT nome FROM pokemon;

-- 4.Selecione o numero, nome, cor, altura_m e peso_kg de todos os pokémons cadastrados.
SELECT numero, nome, cor, altura_m, peso_kg FROM pokemon;

-- 5.Qual é o numero e o nome de todos os pokémons da primeira geração?
SELECT numero, nome FROM pokemon WHERE geracao = '1';

-- 6. Quais são os pokémons Amarelo da primeira geração?
SELECT nome FROM pokemon WHERE geracao = '1' & cor = 'amarelo';

-- 7. Qual é o pokémon mais forte? (Arceus)
SELECT nome, total
FROM pokemon
ORDER BY total DESC;

-- 8 Selecione o numero, nome e tipo1; de todos os pokémons cujo tipo primário é Fire.
SELECT numero, nome, tipo1
FROM pokemon
WHERE tipo1='fire';

-- 10. Selecione em ordem decrescente o numero, nome e defesa de todos os pokémons.
SELECT numero, nome, defesa
FROM pokemon
ORDER BY numero DESC;

SELECT nome, numero, defesa
FROM pokemon
ORDER BY nome DESC;

SELECT defesa, numero, nome
FROM pokemon
ORDER BY defesa DESC;

-- 11.Qual o pokémon possui menor taxa de captura? Selecione apenas numero e nome.
SELECT numero, nome
FROM pokemon
ORDER BY taxa_captura DESC;

-- 12. Selecione todos pokémons que não possuem tipo secundário, ou seja, tipo2.
SELECT nome
FROM pokemon
WHERE tipo2 IS NULL;

-- 13. Selecione numero, nome, tipo1, tipo2 de todos os pokémons que possuem o peso entre 100kg e 500kg.
SELECT numero, nome, tipo1, tipo2
FROM pokemon
WHERE peso_kg >=100 AND peso_kg <=500;

-- *14 Crie um ranking dos top 10 pokémons mais velozes, contendo numero, nome e velocidade.
SELECT numero, nome, velocidade
FROM pokemon
GROUP BY velocidade
HAVING COUNT(10)
ORDER BY velocidade DESC;

-- 15 Selecione numero, nome, tipo1, tipo2, taxa_captura dos pokémons que possuem os dois tipos
-- e tenham uma taxa de captura acima de 100. Ordene os resultados decrescente pela taxa de captura.

SELECT numero, nome, tipo1, tipo2, taxa_captura
FROM pokemon
WHERE tipo1 & tipo2 IS NOT NULL
AND taxa_captura >100
ORDER BY taxa_captura DESC;

-- 16 Quais são os tipos primários dos pokémons?
SELECT DISTINCT tipo1
from pokemon;

-- 17. Selecione o numero, nome e cor de todos os pokémons que o nome começa com a letra D.
SELECT numero, nome, cor
FROM pokemon
WHERE nome LIKE 'd%';

-- * 18. Qual é o pokémon mais poderoso de todas as gerações?*(deu dois resultados)
SELECT MAX(total), nome, geracao
FROM pokemon;

-- 19. Selecione o numero, nome, defesa, ataque dos pokémons com defesa > 60 e ataque <= 70;
-- ordenados decrescente pelo total.
SELECT numero, nome, defesa, ataque
FROM pokemon
WHERE defesa >60 AND ataque<=70
ORDER BY total DESC;

-- 20. Selecione todos os pokémons do tipo Planta e Venenoso que não sejam Green,
-- ordenado crescente pelo nome.
SELECT nome, tipo1, tipo2, cor
FROM pokemon
WHERE tipo1='Planta' AND tipo2 = 'Venenoso' AND NOT cor='Green';

-- 21. Selecione de maneira crescente os nomes dos pokémons
-- que possuem a letra y na 4ª posição do nome.
SELECT nome
FROM pokemon
WHERE nome LIKE '___y%';

-- 22. Qual é o maior valor de ataque_especial cadastrado?
SELECT MAX(ataque_especial), nome
FROM pokemon;

-- 23. Selecione o numero, nome e altura_m dos pokémons que possuem altura acima de 2,10m.
SELECT numero, nome, altura_m
FROM pokemon
WHERE altura_m >2.10;

-- 24. Quais são as diferentes tipos de cores dos pokémons?
-- Apresente os resultados de maneira crescente pelo nome da cor.
SELECT DISTINCT cor
FROM pokemon
ORDER BY cor ASC;

-- 25. Selecione o nome e velocidade dos pokémons com velocidade entre 30 e 70. Ordene os resultados
-- por nome (crescente) e velocidade (decrescente)
SELECT nome, velocidade
FROM pokemon
WHERE velocidade >=30 AND velocidade <=70
ORDER BY nome ASC;

SELECT nome, velocidade
FROM pokemon
WHERE velocidade >=30 AND velocidade <=70
ORDER BY velocidade DESC;

-- 26. Quem são os pokémons lendários? Apresente os resultados ordenados por total decrescente.
SELECT lendario,total, nome
FROM pokemon
ORDER BY total DESC;

-- 27. Selecione os pokémons da primeira geração com taxa de captura igual a 255.
SELECT geracao, nome, taxa_captura
FROM pokemon
WHERE geracao ='1' AND taxa_captura =255;

-- *28. Quem é o mais poderoso? selecione o Pikachu, Squirtle, Bulbasaur e Charmander;
-- ordenados decrescente pelo total.
SELECT nome
FROM pokemon
WHERE nome ='Pikachu' AND nome ='Squirtle'
ORDER BY nome DESC;

-- 29. Quem são os pokémons da primeira geração, que começam com a letra d e não possuem tipo secundário?
-- Ordene os resultados crescente por taxa_captura e decrescente pelo total.
SELECT geracao, nome, taxa_captura
FROM pokemon
WHERE nome LIKE 'd%' AND tipo2 IS NOT NULL
ORDER BY taxa_captura ASC;

SELECT geracao, nome, total
FROM pokemon
WHERE nome LIKE 'd%' AND tipo2 IS NOT NULL
ORDER BY total DESC;

-- 30. Qual é o ranking dos top 5 pokémons lendários com maior taxa_captura e total?
-- Apresente apenas numero, nome, total, taxa_captura nos resultados.
SELECT nome, numero, total, taxa_captura
FROM pokemon
WHERE lendario
ORDER BY taxa_captura DESC
LIMIT 5;

SELECT nome, numero, total, taxa_captura
FROM pokemon
WHERE lendario
ORDER BY total DESC
LIMIT 5;

-- 31. Selecione o numero, nome, peso_kg dos pokémons com peso entre 2kg e 3kgs?
SELECT numero, nome, peso_kg
FROM pokemon
WHERE peso_kg >= 2 AND peso_kg <=3;

-- 32. Selecione o numero, nome, tipo1 e tipo2 dos pokémons com tipo primário Normal, que não possuem tipo secundário.
-- Existe algum pokémon lendário nos resultados, se sim, os remova dos resultados?
SELECT numero, nome, tipo1, tipo2
FROM pokemon
WHERE tipo1 ='Normal' AND tipo2 IS NULL AND NOT lendario;

-- 33. Quem são os pokémons do tipo Water que não são azuis?
-- Apresente numero, nome, tipo1, tipo2 e cor, ordenados pelo nome de maneira crescente.
SELECT numero, nome, tipo1, tipo2, cor
FROM pokemon
WHERE tipo1 ='Water' AND NOT cor ='Blue'
ORDER BY nome ASC;

-- 34. Crie um ranking dos top 10 pokémons mais lentos.
SELECT nome, velocidade
FROM pokemon
ORDER BY velocidade ASC
LIMIT 10;

-- 35. Selecione os pokémons cujo nome comece e termine com a letra a.
SELECT nome
FROM pokemon
WHERE nome LIKE 'a%a';

-- 36. Quem são os pokémons do tipo Fire que não são vermelhos?
-- Apresente numero, nome, tipo1, tipo2 e cor, ordenados pelo nome de maneira crescente.
SELECT numero, nome, tipo1, tipo2, cor
FROM pokemon
WHERE tipo1 ='Fire' AND NOT cor= 'Red'
ORDER BY nome ASC;

-- .37 Quais são os diferentes tipos de peso_kg dos pokémons?
-- Apresente os resultados ordenados de maneira crescente.
SELECT DISTINCT peso_kg
FROM pokemon
ORDER BY peso_kg ASC;

-- 38. Selecione o numero, nome e hp dos pokémons com valores entre 0 e 100.
-- Ordene os resultados de maneira crescente por hp e nome.
SELECT numero, nome, hp
FROM pokemon
WHERE hp>=0 AND hp <=100
ORDER BY hp ASC;

SELECT numero, nome, hp
FROM pokemon
WHERE hp>=0 AND hp <=100
ORDER BY nome ASC;

-- 39. Selecione o numero, nome, hp, ataque, defesa e total;
-- dos pokémons com valores de hp, ataque, defesa maiores ou iguais a 100.
SELECT numero, nome, hp, ataque, defesa , total
FROM pokemon
WHERE hp >=100 AND ataque >=100 AND defesa >=100;

-- 40. Selecione todos os pokémons do tipos Water e Gelo, ordenados decrescente por total.
SELECT nome, total
FROM pokemon
WHERE tipo1 = 'Water' OR tipo1 ='Gelo' OR tipo2= 'Water' OR tipo2='Gelo'
ORDER BY total DESC;

-- EXERCÍCIO DE FUNÇÕES AGREGADAS

-- 1. Quais são os valores máximo e mínimo das seguintes colunas:
SELECT MAX(total), MAX(hp), MAX(ataque), MAX(defesa), MAX(ataque_especial),
MAX(defesa_especial), MAX(velocidade), MAX(taxa_captura)
FROM pokemon;

-- 2. Quantas cores diferentes possuem os pokémons?
SELECT COUNT(DISTINCT cor)
FROM pokemon;

-- 3 Qual é o peso médio dos pokémons?
SELECT AVG(peso_kg)
FROM pokemon;

-- 4. Qual é a soma das alturas dos pokémons?
SELECT SUM(altura_m)
FROM pokemon;

-- 5. Quantos pokémons estão cadastrados no banco de dados?
SELECT COUNT(*)
FROM pokemon;

-- 6. Qual é o altura média dos pokémons?
SELECT AVG(altura_m)
FROM pokemon;

-- *7. Qual é o desvio padrão do valor de HP dos pokémons?
SELECT STDDEV_SAMP(hp)
FROM pokemon;

-- 8. Quantos pokémons possuem tipo2?
SELECT COUNT(tipo2)
FROM pokemon;

-- 9. Quantos são os diferentes tipos primários dos pokémons?
SELECT COUNT(DISTINCT tipo1)
FROM pokemon;

-- 10. Qual é a soma dos pesos dos pokémons?
SELECT SUM(peso_kg)
FROM pokemon;

– * 11. Qual é a quantidade de Pokémons lendários e não lendários
SELECT COUNT(lendario)
FROM pokemon
WHERE lendario = '1'
GROUP BY lendario;

SELECT COUNT(lendario)
FROM pokemon
WHERE lendario = '0'
GROUP BY lendario;

-- 12 Qual é a quantidade de pokémons para cada uma das diferentes cores ordenadas decrescente?
SELECT DISTINCT cor, COUNT(*)
FROM pokemon
GROUP BY cor
ORDER BY cor DESC;

-- 13.Qual é a média de peso e altura de cada um dos tipos primários dos pokémons?
-- Ordene os resultados decrescente respectivamente por média de peso e altura.
SELECT DISTINCT tipo1
FROM pokemon
WHERE AVG(peso) AND AVG(altura)
GROUP BY tipo1
ORDER BY AVG(peso);


-- 14. Qual é a taxa de captura média por cor de cada um dos pokémons lendários?
SELECT cor, AVG(taxa_captura)
FROM pokemon
WHERE lendario ='1'
GROUP BY cor;

-- 15. Qual os tipos primários que possuem a taxa de captura média acima de 100
SELECT tipo1, AVG(taxa_captura)
FROM pokemon
WHERE taxa_captura >100
GROUP BY tipo1 ;

-- 16. Agrupados por cor, quais pokémons não lendários possuem média total abaixo de 400
SELECT cor, nome, AVG(total)
FROM pokemon
WHERE lendario ='0' AND total <400
GROUP BY cor;

-- 17. Qual o valor máximo total em cada uma das gerações?
SELECT geracao, MAX(total)
FROM pokemon
GROUP BY geracao;

-- 18. Quantos pokémons lendários existem em cada uma das gerações?
SELECT geracao, COUNT(lendario='1')
FROM pokemon
GROUP BY geracao;

-- 19. Em cada uma das gerações, quantos pokémons tem tipos primários e
-- secundários e qual a taxa_captura média deles?
SELECT geracao, tipo1, tipo2, AVG(taxa_captura)
FROM pokemon
WHERE tipo1 IS NOT NULL AND tipo2 IS NOT NULL
GROUP BY geracao;

-- 20 .Qual é a quantidade de cores de cada um dos pokémons lendários em todas as gerações?
SELECT cor, COUNT(cor), lendario, geracao
FROM pokemon
WHERE lendario ='1'
GROUP BY cor;