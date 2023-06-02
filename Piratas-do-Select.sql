CREATE DATABASE piratasDoSelect;
USE piratasDoSelect;


-- CONJUNTO DE PIRATAS
CREATE TABLE tripulacao (
idTripulacao INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45)
);

INSERT INTO Tripulacao VALUES 
(1, 'Tripulação do Pérola Negra'),
(2, 'Tripulação do Vingança da Rainha'),
(3, 'Tripulação do Espírito Vingativo');

CREATE TABLE pirata (
idPirata INT primary key AUTO_INCREMENT,
nome VARCHAR (45),
habilidade VARCHAR (45),
classe VARCHAR (45),
constraint chkClasse CHECK (classe in('Capitão','Imediato','Carpinteiro','Médico','Mestre de Armas','Cozinheiro','Comum')),
fkTripulacao INT,
constraint fkTripulacao1 foreign key (fkTripulacao) REFERENCES tripulacao (idTripulacao)
)AUTO_INCREMENT = 1000;

  INSERT INTO pirata VALUES 
  -- TRIPULACAO 1
       (null, 'Jack Sparrow', 'Espadachim, Navegador','Capitão',1),
       (null, 'Barba Negra', 'Liderança, Manipulação','Imediato',1),
       (null, 'Ching Shih', 'Altruismo, Agilidade','Comum',1),
       (null, 'Anne Bonny', 'Atiradora, Estrategista','Mestre de Armas',1),
       (null, 'William Kidd', 'Tratar feridas, Manipulação ','Médico',1),
       (null, 'Francis Drake', 'Atirador, Estrategista','Mestre de Armas',1);


INSERT INTO pirata VALUES
-- TRIPULACAO 2
		(null, 'Dominic Reed', 'Espadachim, Navegador','Capitão',2),
       (null, 'Anneka Blackthorne', 'Liderança, Manipulação','Imediato',2),
       (null, 'Jasper Stormblade', 'Flexível, Manipulação','Comum',2),
       (null, 'Isabella Silverwood', 'Atiradora, Estrategista','Carpinteiro',2),
       (null, 'Magnus Bloodfang', 'Tratar feridas, Manipulação ','Cozinheiro',2),
       (null, 'Seraphina Darkwater', 'Atiradora, Estrategista','Mestre de Armas',2);
       
       
INSERT INTO pirata VALUES
-- TRIPULACAO 3
		(null, 'Davy Jones', 'Liderança, Estratégia','Capitão',3),
       (null, 'Gasparzinho', 'Agilidade','Comum',3),
       (null, 'Geleia', 'Flexível, Manipulação','Mestre de Armas',3),
       (null, 'Drury Lane', 'Resistência, Manipulação','Carpinteiro',3),
       (null, 'Auguste Gusteau', 'Liderança, Trabalho em equipe','Cozinheiro',3);
       

-- UMA LOCALIZAÇÃO PODE CONTER UM OU MAIS TESOUROS
CREATE TABLE localizacao (
idLocalizacao INT PRIMARY KEY auto_increment,
nome VARCHAR(45)
);

INSERT INTO localizacao VALUES
(null,'Serpent Treasure Island'),
(null,'Ilha dos Ventos Sussurrantes'),
(null,'Ilha das Chamas Eternas'),
(null,'Ilha da Caveira Negra'),
(null,'Forgotten Wreck Island'),
(null,'Ilha da Lua Prateada'),
(null,'Ilha do Abismo Profundo');

-- TESOURO
CREATE TABLE tesouro (
idTesouro INT PRIMARY KEY auto_increment,
nome VARCHAR(45),
valorEstimado FLOAT,
fkLocalizacao INT,
constraint fkLocalTesouro foreign key(fkLocalizacao) references localizacao(idLocalizacao)
);

INSERT INTO Tesouro VALUES 
(1,'A Lágrima do Kraken', 15615.85,4),
(2,'One Piece', 456212.69, 1),
(3,'O Colar das Marés Encantadas', 2852634.12, 6);


-- NAVIO É COMPOSTO POR UMA E SOMENTE UMA TRIPULAÇÃO E UMA TRIPULAÇÃO SO PODE PERTENCER A UM NAVIO,
-- UM VAIO PODE TER UMA ALIANÇA COM OUTROS NAVIOS
CREATE TABLE navio(
idNavio INT primary key auto_increment,
nome VARCHAR (45),
tipo VARCHAR(45),
fkTripulacao INT,
fkLocalizacao INT,
constraint fkTripulacao2 foreign key(fkTripulacao) REFERENCES tripulacao(idTripulacao),
constraint fkLocal foreign key(fkLocalizacao) REFERENCES localizacao(idLocalizacao)
)auto_increment=100;

INSERT INTO Navio VALUES 
(1, 'Pérola Negra', 'Navio de Guerra',1,1),
(2, 'Vingança da Rainha', 'Galeão',2,6),
(3, 'Holandês Voador', 'Navio Fantasma',3,1);

-- TABELA ASSOCIATIVA entre Navios
CREATE TABLE alianca (
idAlianca INT AUTO_INCREMENT,
fkNavio1 INT,
fkNavio2 INT,
constraint fkN1 foreign key(fkNavio1) references navio(idNavio),
constraint fkN2 foreign key(fkNavio2) references navio(idNavio),
primary key(idAlianca,fkNavio1,fkNavio2)
);

INSERT INTO Alianca VALUES 
(NULL, 1, 2),
(NULL, 2, 3);