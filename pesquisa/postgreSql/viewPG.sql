/* Views criadas 24/09/21*/

SELECT numero, nome, ativo from banco;
CREATE or REPLACE VIEW vw_banco as (
	SELECT numero, nome, ativo from banco;
);

SELECT numero, nome, ativo from vw_banco;

CREATE or REPLACE view vw_banco_2 (banco_numero, banco_nome, banco_ativo) as(
	SELECT numero, nome, ativo from banco;
);

SELECT banco_numero, banco_nome, banco_ativo from vw_banco_2;

INSERT into vw_banco_2 (banco_numero, banco_nome, banco_ativo)
values (51, 'Banco Boa Idéia', TRUE);7

SELECT banco_numero, banco_nome, banco_ativo from vw_banco_2 
WHERE banco_numero = 51;

SELECT numero, nome, ativo from banco where numero = 51; 

UPDATE vw_banco_2 set banco_ativo = FALSE where banco_numero = 51;

SELECT numero, nome, ativo from banco where numero = 51; 

SELECT banco_numero, banco_nome, banco_ativo from vw_banco_2 
WHERE banco_numero = 51;

DELETE from vw_banco_2 WHERE banco_numero = 51;

CREATE or REPLACE TEMPORARY view vw_agencia as(
	SELECT nome from agencia
);

SELECT nome from vw_agencia; /* se for aberto outra query toll não funcionará*/ 

CREATE or REPLACE view vw_banco_ativo as (
	select numero, nome, ativo from banco 
	where ativo is TRUE
); 

insert into vw_banco_ativo (numero, nome, ativo) VALUES (51, 'Banco Boa Idéia', false);

CREATE or REPLACE view vw_banco_com_a as(
	SELECT nomero, nome, ativo from vw_banco_ativo 
	WHERE nome ILIKE 'a%'
)with cascaded CHECK OPTION;

SELECT numero, nome, ativo from vw_banco_com_a;

insert into vw_banco_com_a (numero, nome, ativo) VALUES (333, 'Alfa Omega', true);
insert into vw_banco_com_a (numero, nome, ativo) VALUES (334, 'Alfa Gama', false);
insert into vw_banco_com_a (numero, nome, ativo) VALUES (335, 'Alfa Gama Beta', false);

CREATE or REPLACE recursive view vw_func(id, gerente, funcionario) as (
	SELECT id, gerente, nome
	from funcionario 
	where gerente is NULL
	UNION ALL
	SELECT funcionario.id, funcionario.gerente, funcionario.nome
	from funcionario
	join vw_func on vw_func.id = funcionario.gerente
	
);

SELECT id, gerente, funcionario from vw_func;
	