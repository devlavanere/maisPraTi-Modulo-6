CREATE DATABASE it_solutions;
USE it_solutions;

CREATE TABLE recurso (
    id_recurso INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    numero_registro INT,
    salario DECIMAL(10,2),
    data_salario DATE,
    telefone_residencial VARCHAR(20),
    telefone_comercial VARCHAR(20),
    celular VARCHAR(20),
    ramal VARCHAR(20),
    endereco TEXT
);

CREATE TABLE equipe (
    id_equipe INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    numero_recursos INT
);

CREATE TABLE projeto (
    id_projeto INT PRIMARY KEY AUTO_INCREMENT,
    codigo VARCHAR(20),
    nome VARCHAR(100),
    data_inicio DATE,
    data_prevista_termino DATE,
    data_termino_real DATE,
    status VARCHAR(50),
    horas_previstas INT,
    horas_reais INT
);

CREATE TABLE atividade (
    id_atividade INT PRIMARY KEY AUTO_INCREMENT,
    codigo VARCHAR(20),
    nome VARCHAR(100)
);

CREATE TABLE tarefa (
    id_tarefa INT PRIMARY KEY AUTO_INCREMENT,
    codigo VARCHAR(20),
    descricao TEXT
);

CREATE TABLE programador (
    id_programador INT PRIMARY KEY,
    id_recurso INT,
    ferramenta VARCHAR(50),
    versao_ferramenta VARCHAR(20),
    FOREIGN KEY (id_recurso) REFERENCES recurso(id_recurso)
);

CREATE TABLE projeto_equipe (
    id_projeto_equipe INT PRIMARY KEY AUTO_INCREMENT,
    id_projeto INT,
    id_equipe INT,
    FOREIGN KEY (id_projeto) REFERENCES projeto(id_projeto),
    FOREIGN KEY (id_equipe) REFERENCES equipe(id_equipe)
);

CREATE TABLE atividade_projeto (
    id_atividade_projeto INT PRIMARY KEY AUTO_INCREMENT,
    id_atividade INT,
    id_projeto INT,
    FOREIGN KEY (id_atividade) REFERENCES atividade(id_atividade),
    FOREIGN KEY (id_projeto) REFERENCES projeto(id_projeto)
);

CREATE TABLE tarefa_atividade (
    id_tarefa_atividade INT PRIMARY KEY AUTO_INCREMENT,
    id_tarefa INT,
    id_atividade INT,
    FOREIGN KEY (id_tarefa) REFERENCES tarefa(id_tarefa),
    FOREIGN KEY (id_atividade) REFERENCES atividade(id_atividade)
);

CREATE TABLE gerente_projeto (
    id_gerente_projeto INT PRIMARY KEY AUTO_INCREMENT,
    id_recurso INT,
    id_projeto INT,
    FOREIGN KEY (id_recurso) REFERENCES recurso(id_recurso),
    FOREIGN KEY (id_projeto) REFERENCES projeto(id_projeto)
);
