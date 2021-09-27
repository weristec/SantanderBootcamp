/*Funções*/
CREATE or replace FUNCTION func_somar(INTEGER, INTEGER)
RETURNs INTEGER
SECURITY DEFINER
--RETURNS NULL ON NULL INPUT -> lembre-se de atualizar a função
called on null input 
LANGUAGE SQL
AS $$
SELECT COALESCE($1,0) + COALESCE($2,100);

--SELECT func_somar(1+2);
SELECT func_somar(1+NULL);

select COALESCE(NULL, 'Welton', 'digital');--substitui o valor se o parametro for nulo
----------------------------------------------------------------------------------------------

CREATE or REPLACE FUNCTION banco_add(p_numero INTEGER, p_nome VARCHAR, p_ativo BOOLEAN)
returns INTEGER 
security invoker
language plpgsql
called on NULL input 
as $$ 
DECLARE variavel_id INTEGER
begin
	if p_numero is NULL or p_nome is NULL or p_ativo is NULL THEN
		return 0;
	end if
	
	SELECT into variavel_id numero
	FROM banco 	
	where numero = p_numero;
	
	if variavel_id is NULL then 
		INSERT into banco(numero, nome, ativo)
		values (p_numero, p_nome, p_ativo);
	ELSE
		RETURN variavel_id;
	
	end IF
		SELECT into variavel_id numero
		FROM banco 	
		where numero = p_numero;
		RETURN variavel_id;
end; $$;

SELECT banco_add(1,'Banco novo', false);
SELECT banco_add(5433,'Banco novo', false);

SELECT numero, nome, ativo from banco where numero=5433;
	