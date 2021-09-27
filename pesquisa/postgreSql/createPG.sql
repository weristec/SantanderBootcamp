/* Tabelas criadas 23/09/21*/

CREATE TABLE if not EXISTS banco(
	numero INTEGER not NULL,
	nome VARCHAR(50) not NULL,
	ativo BOOLEAN not NULL DEFAULT TRUE,
	data_criacao TIMESTAMP not NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (numero)
);

CREATE TABLE if not EXISTS agencia(
	banco_numero INTEGER not NULL,
	numero INTEGER not NULL,
	nome varchar(80) not NULL,
	ativo BOOLEAN not NULL DEFAULT TRUE,
	data_criacao TIMESTAMP not NULL DEFAULT CURRENT_TIMESTAMP, 
	PRIMARY key (banco_numero, numero)
	FOREIGN key (banco_numero) REFERENCES banco (numero)
);

CREATE TABLE if not EXISTS cliente(
	numero BIGSERIAL PRIMARY KEY,
	nome VARCHAR(120) not NULL,
	email VARCHAR(250) not NULL,
	ativo BOOLEAN not NULL DEFAULT TRUE,
	data_criacao TIMESTAMP not NULL DEFAULT CURRENT_TIMESTAMP, 
);

CREATE TABLE if not EXISTS conta_corrente(
	banco_numero INTEGER not NULL,
	agencia_numero INTEGER not NULL,
	numero bigint not NULL,
	digito smallint not NULL,
	cliente_numero bigint not NULL,
	ativo BOOLEAN not NULL DEFAULT TRUE,
	data_criacao TIMESTAMP not NULL DEFAULT CURRENT_TIMESTAMP, 
	PRIMARY key(banco_numero, agencia_numero, digito, numero, cliente_numero),
	FOREIGN key(banco_numero, agencia_numero) REFERENCES agencia (banco_numero, numero),
	FOREIGN key (cliente_numero) REFERENCES cliente (numero)
);

CREATE TABLE if not EXISTS tipo_transacao(
	id smallserial PRIMARY KEY,
	nome VARCHAR(50) not NULL,
	ativo BOOLEAN not NULL DEFAULT TRUE,
	data_criacao TIMESTAMP not NULL DEFAULT CURRENT_TIMESTAMP,
);

CREATE TABLE if not EXISTS cliente_transacoes(
	id bigserial PRIMARY key,
	banco_numero INTEGER not null,
	agencia_numero INTEGER not NULL,
	conta_corrente_numero bigint not NULL,
	conta_corrente_digito smallint not NULL,
	cliente_numero bigint not NULL,
	tipo_transacao_id smallint not NULL,
	valor NUMERIC(15,2) not NULL,
	data_criacao TIMESTAMP not NULL DEFAULT CURRENT_TIMESTAMP,
	FOREIGN key (banco_numero, agencia_numero, conta_corrente_numero, conta_corrente_digito, cliente_numero) 
	REFERENCES conta_corrente (banco_numero, agencia_numero, digito, numero, cliente_numero);
);

/* Tabelas criadas 24/09/21* aula das views */
CREATE TABLE if not EXISTS funcionario(
id serial,
nome VARCHAR(50),
gerente integer,
PRIMARY key(id),
FOREIGN key(gerente) REFERENCES funcionario (id)
);

INSERT into funcionario (nome, gerente) values ('Anselmo', null);
INSERT into funcionario (nome, gerente) values ('Beatriz', 1);
INSERT into funcionario (nome, gerente) values ('Magno', 1);
INSERT into funcionario (nome, gerente) values ('Cremilda', 2);
INSERT into funcionario (nome, gerente) values ('Wagner', 4);

SELECT id, nome, gerente from funcionario where gerente is NULL
UNION all
SELECT id, nome, gerente from funcionario where id=999;
