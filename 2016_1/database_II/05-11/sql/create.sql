/*
    CREATES
*/
CREATE TABLE curso(
    codcurso INTEGER NOT NULL,
    curso VARCHAR(50) NOT NULL,
    duracao INTEGER NOT NULL,
    dtcurso DATE NOT NULL,
    PRIMARY KEY(codcurso)
);

CREATE TABLE analista(
    codanalista INTEGER NOT NULL,
    analista VARCHAR(50) NOT NULL,
    idade INTEGER NOT NULL,
    endereco CHAR(30) NOT NULL,
    codcurso INTEGER NOT NULL,
    salario FLOAT NOT NULL,
    PRIMARY KEY (codanalista),
    FOREIGN KEY (codcurso) REFERENCES curso
);

CREATE TABLE programador(
    codprogramador INTEGER NOT NULL,
    programador VARCHAR(50) NOT NULL,
    idade INTEGER NOT NULL,
    endereco CHAR(30) NOT NULL,
    salario FLOAT NOT NULL,
    PRIMARY KEY(codprogramador)
);

CREATE TABLE atividadesanalise(
    codatividadeanalise INTEGER NOT NULL,
    dtinicio DATE NOT NULL,
    dttermino DATE NOT NULL,
    descricao VARCHAR(100) NOT NULL,
    codanalista INTEGER NOT NULL,
    PRIMARY KEY (codatividadeanalise),
    FOREIGN KEY (codanalista) REFERENCES analista
);

CREATE TABLE atividadesprog(
    codatividadeprog INTEGER NOT NULL,
    dtinicio DATE NOT NULL,
    dttermino DATE NOT NULL,
    descricao VARCHAR(100) NOT NULL,
    codprogramador INTEGER NOT NULL,
    codatividadeanalise INTEGER NOT NULL,
    PRIMARY KEY(codatividadeprog),
    FOREIGN KEY(codprogramador) REFERENCES programador,
    FOREIGN KEY(codatividadeanalise) REFERENCES atividadesanalise
);
