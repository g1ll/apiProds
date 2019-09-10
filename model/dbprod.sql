CREATE TABLE produtos(
	id_prod BIGINT(20) UNSIGNED AUTO_INCREMENT NOT NULL,
	nome VARCHAR(200) NOT NULL,
	descricao VARCHAR(500) NOT NULL,
	qtd_estoque INTEGER NOT NULL DEFAULT 0,
	preco DECIMAL(10,2) NOT NULL,
	importado BOOLEAN NOT NULL DEFAULT FALSE,
	PRIMARY KEY (id_prod)
);

CREATE TABLE descontos(
	 id_desc BIGINT(20) UNSIGNED AUTO_INCREMENT NOT NULL,
	 descricao VARCHAR(200) NOT NULL,
	 taxa DECIMAL(10,2) NOT NULL DEFAULT 0,
	 PRIMARY KEY (id_desc)
);

CREATE TABLE extras(
     id_ext BIGINT(20) UNSIGNED AUTO_INCREMENT NOT NULL,
     descricao VARCHAR(200) NOT NULL,
     PRIMARY KEY (id_ext)
);

CREATE TABLE prod_desc(
	id_prod bigint(20) UNSIGNED not null,
	id_desc bigint(20) UNSIGNED not null,
	PRIMARY KEY (id_prod, id_desc),
	foreign key (id_prod) references produtos(id_prod),
	foreign key (id_desc) references descontos(id_desc)
);

CREATE TABLE prod_ext(
    	id_prod bigint(20) UNSIGNED not null,
	id_ext bigint(20) UNSIGNED not null,
	PRIMARY KEY (id_prod, id_ext),
	foreign key (id_prod) references produtos(id_prod),
	foreign key (id_ext) references extras(id_ext)
);
