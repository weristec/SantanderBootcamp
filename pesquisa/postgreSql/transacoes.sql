/* Transações */
BEGIN;
update conta SET VALOR = valor - 100 WHERE nome = 'Alice';
update conta SET VALOR = valor + 100 WHERE nome = 'Maicon';
COMMIT;

SELECT numero, nome, ativo from banco order by numero;

update banco set ativo = false where numero = 0;

begin;
update banco set ativo = true where numero = 0;
SELECT numero, nome, ativo from banco where numero = 0; 
ROLLBACK; 

begin;
update banco set ativo = true where numero = 0; 
COMMIT;

SELECT id, gerente, nome from funcionario;

BEGIN;
update funcionario set gerente = 2 where id = 3;
SAVEPOINT sf_func; 
update funcionario set gerente = NULL;
ROLLBACK to sf_func;
update funcionario set gerente = 3 where id=5;
COMMIT;
