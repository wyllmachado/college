CREATE TABLE construtora (
    cod_const CHAR(10) NOT NULL,
    cgc CHAR(20) unique NOT NULL,
    nome_const CHAR(30) NOT NULL,
    PRIMARY KEY (cod_const)
);

CREATE TABLE engenheiro(
    crea CHAR(8) NOT NULL,
    cpf CHAR(11) UNIQUE NOT NULL,
    nome_eng CHAR(30) NOT NULL,
    area_atuacao CHAR(20) NOT NULL,
    PRIMARY KEY (crea)
);

CREATE TABLE obra(
    cod_obra INTEGER NOT NULL,
    nome_obra CHAR(30) NOT NULL,
    localizacao CHAR(50) NOT NULL,
    tipo CHAR(15) NOT NULL,
    cod_const CHAR(10) NOT NULL,
    cod_eng_resp CHAR(8) NOT NULL,
    PRIMARY KEY (cod_obra),
    FOREIGN KEY (cod_const) REFERENCES construtora,
    FOREIGN KEY (cod_eng_resp) REFERENCES engenheiro
);

CREATE TABLE operario(
    cart_trab CHAR(15) NOT NULL,
    nomeop CHAR(30) NOT NULL,
    endereco CHAR(50) NOT NULL,
    telefone CHAR(20),
    PRIMARY KEY (cart_trab)
);

CREATE TABLE obra_operario(
    cod_obra INTEGER NOT NULL,
    cart_trab CHAR(15) NOT NULL,
    data DATE NOT NULL,
    atividades CHAR(200),
    PRIMARY KEY (cod_obra, cart_trab, data),
    FOREIGN KEY (cod_obra) REFERENCES obra,
    CONSTRAINT fk_obra_op FOREIGN KEY (cart_trab) REFERENCES operario
);

CREATE TABLE operario_construtora(
    cart_trab CHAR(15) NOT NULL,
    cod_const CHAR(10) NOT NULL,
    PRIMARY KEY (cart_trab, cod_const),
    CONSTRAINT fk_opconst FOREIGN KEY (cart_trab) REFERENCES operario,
    FOREIGN key (cod_const) REFERENCES construtora
);
