CREATE TABLE IF NOT EXISTS funcionarios (
	id SERIAL,
	nome VARCHAR(50),
	gerente INTEGER,
	PRIMARY KEY (id),
	FOREIGN KEY (gerente) REFERENCES funcionarios(id)
);

INSERT INTO funcionarios(nome,gerente) VALUES ('Ancelmo', null);
INSERT INTO funcionarios(nome,gerente) VALUES ('Beatriz', 1);
INSERT INTO funcionarios(nome,gerente) VALUES ('Magno', 1);
INSERT INTO funcionarios(nome,gerente) VALUES ('Cremilda', 2);
INSERT INTO funcionarios(nome,gerente) VALUES ('Wagner', 4);

SELECT id, nome, gerente FROM funcionarios WHERE gerente IS NULL
UNION ALL
SELECT id, nome, gerente FROM funcionarios WHERE id = 999; --APENAS PARA EXEMPLIFICAR

CREATE OR REPLACE RECURSIVE VIEW vw_func(id, gerente, funcionario) AS (
	SELECT id, CAST ('' AS VARCHAR) AS gerente, nome
	FROM funcionarios
	WHERE gerente IS NULL
	UNION ALL
	SELECT funcionarios.id, gerentes.nome, funcionarios.nome
	FROM funcionarios
	JOIN vw_func ON funcionarios.gerente = vw_func.id
	JOIN funcionarios AS gerentes ON gerentes.id = vw_func.id
);

DROP VIEW vw_func;

SELECT id, gerente, funcionario
FROM vw_func;

