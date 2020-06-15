SELECT numero, nome, ativo
FROM banco;

CREATE OR REPLACE VIEW vw_bancos AS (
	SELECT numero, nome, ativo
	FROM banco
);

SELECT numero, nome, ativo
FROM vw_bancos;

CREATE OR REPLACE VIEW vw_bancos2 (banco_numero, banco_nome, banco_ativo) AS (
	SELECT numero, nome, ativo
	FROM banco
);

SELECT banco_numero, banco_nome, banco_ativo
FROM vw_bancos2;

INSERT INTO vw_bancos2 (banco_numero, banco_nome, banco_ativo)
VALUES (51, 'Banco Boa Ideia', TRUE);

SELECT banco_numero, banco_nome, banco_ativo FROM vw_bancos2 
WHERE banco_numero = 51;

SELECT numero, nome, ativo FROM banco WHERE numero = 51;

UPDATE vw_bancos2 SET banco_ativo = FALSE WHERE banco_numero = 51;

DELETE FROM vw_bancos2 WHERE banco_numero = 51;

CREATE OR REPLACE TEMPORARY VIEW vw_agencia AS (
	SELECT nome FROM agencia
);

SELECT nome FROM vw_agencia;

CREATE OR REPLACE VIEW vw_bancos_ativos AS (
	SELECT numero, nome, ativo 
	FROM banco
	WHERE ativo IS TRUE
);

INSERT INTO vw_bancos_ativos (numero, nome, ativo)
VALUES (51, 'Banco Boa Ideia', FALSE);

CREATE OR REPLACE VIEW vw_bancos_com_a AS (
	SELECT numero, nome, ativo
	FROM vw_bancos_ativos
	WHERE nome ILIKE 'a%'
) WITH CASCADED CHECK OPTION;

SELECT numero, nome, ativo FROM vw_bancos_com_a;

INSERT INTO vw_bancos_com_a (numero, nome, ativo)
VALUES	(334, 'Alfa Omega', TRUE);

INSERT INTO vw_bancos_com_a (numero, nome, ativo)
VALUES	(331, 'Alfa Gama', FALSE);

INSERT INTO vw_bancos_com_a (numero, nome, ativo)
VALUES	(339, 'Alfa Gama Zeta', FALSE);