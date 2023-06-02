
CREATE DATABASE piratasDoSelect;
USE piaratasDoSelect;



CREATE TABLE pirata (
idPirata INT primary key AUTO_INCREMENT,
nome VARCHAR (45),
habilidade VARCHAR (45),
classe VARCHAR (45),
constraint chkClasse CHECK (classe in ('Capitão','Imediato','Carpinteiro','Médico','Mestre de Armas','Cozinheiro','Comum'))
)AUTO_INCREMENT = 1000;

ALTER TABLE pirata ADD column fkTripulacao INT;
ALTER TABLE pirata ADD constraint fkTripulados foreign key(fkTripulacao) references tripulacao(idtripulacao);
desc pirata;


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



-- CONJUNTO DE PIRATAS
CREATE TABLE tripulacao (
idTripulacao INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45)
);

-- UMA LOCALIZAÇÃO PODE CONTER UM OU MAIS TESOUROS
CREATE TABLE localizacao (
idLocalizacao INT PRIMARY KEY auto_increment,
nome VARCHAR(45)
);

-- NAVIO É COMPOSTO POR UMA E SOMENTE UMA TRIPULAÇÃO E UMA TRIPULAÇÃO SO PODE PERTENCER A UM NAVIO,
-- UM VAIO PODE TER UMA ALIANÇA COM OUTROS NAVIOS
CREATE TABLE navio(
idNavio INT primary key auto_increment,
nome VARCHAR (45),
tipo VARCHAR(45),
fkTripulacao INT,
fkLocalizacao INT,
constraint fkTripulacao foreign key(fkTripulacao) REFERENCES tripulacao(idTripulacao),
constraint fkLocal foreign key(fkLocalizacao) REFERENCES localizacao(idLocalizacao)

)auto_increment=100;


-- TABELA ASSOCIATIVA entre Navios
CREATE TABLE alianca (
idAlianca INT AUTO_INCREMENT,
fkNavio1 INT,
fkNavio2 INT,
constraint fkN1 foreign key(fkNavio1) references navio(idNavio),
constraint fkN2 foreign key(fkNavio2) references navio(idNavio),
primary key(idAlianca,fkNavio1,fkNavio2)
);



-- TESOURO
CREATE TABLE tesouro (
idTesouro INT PRIMARY KEY auto_increment,
valorEstimado FLOAT,
fkLocalizacao INT,
constraint fkLocalizaTesouro foreign key(fkLocalizacao) references localizacao(idLocalizacao)
);

     
       
       INSERT INTO tripulacao VALUES 
       (1, 'Tripulação do Pérola Negra'),
       (2, 'Tripulação do Vingança da Rainha'),
       (3, 'Tripulação do Espírito Vingativo');
       
       INSERT INTO navio VALUES 
       (1, 'Pérola Negra', 'Navio de Guerra'),
       (2, 'Vingança da Rainha', 'Galeão'),
       (3, 'Espírito Vingativo', 'Fragata');
       
       INSERT INTO tesouro VALUES 
       (1, 1000000, 'Ilha da Caveira'),
       (2, 500000, 'Ilha do Tesouro'),
       (3, 2000000, 'Ilha dos Piratas');
       
       INSERT INTO localizacao VALUES 
       (1, 'Ilha da Caveira'),
       (2, 'Ilha do Tesouro'),
       (3, 'Ilha dos Piratas');
       
       INSERT INTO Alianca VALUES 
       (1, 1, 2),
       (2, 2, 3),
       (3, 1, 3);

