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