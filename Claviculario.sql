
#------------ DROPS TABLE
DROP TABLE IF EXISTS chave;
DROP TABLE IF EXISTS veiculo;
DROP TABLE IF EXISTS retiradaChave;
DROP TABLE IF EXISTS ModeloVeiculo;
DROP TABLE IF EXISTS Colaborador;
DROP TABLE IF EXISTS Setor;

#-----TABELA VEICULO
CREATE TABLE IF NOT EXISTS veiculo (
id INT NOT NULL PRIMARY KEY,
modelo VARCHAR (40)NOT NULL,
marca VARCHAR(10) NOT NULL,
anoFabricacao INT NOT NULL,
anoModelo INT NOT NULL,
combustivel CHAR(2) NOT NULL,
cor VARCHAR (20) NOT NULL,
chassi CHAR(17) PRIMARY KEY,
Numchave CHAR (39) PRIMARY KEY


)ENGINE = InnoDB;

insert into veiculo values (1,'R8','audi',2008,2009,'G','prata',97979,45454646);
insert into veiculo values (2,'gol','volks',2005,2006,'A','branco',645764,4654646);
insert into veiculo values (3,'fusion','ford',2020,2021,'AG','preto',674646,3467464);
insert into veiculo values (4,'palio','fiat',2012,2013,'G','vermelho',9879879,6346341);
insert into veiculo values (5,'corola','toyota',2018,2019,'AG','verde',987462,346374684);
insert into veiculo values (6,'hilux','toyota',2010,2011,'G','prata',687664,35463345);

select * from veiculo;


#-----TABELA MODELO VEICULO
CREATE TABLE IF NOT EXISTS ModeloVeiculo (
id INT NOT NULL PRIMARY KEY,
modelo INT NOT NULL,
marca INT NOT NULL,
chassi INT NOT NULL,
Numchave INT NOT  NULL PRIMARY KEY,
constraint fk_chave foreign key (Numchave) references veiculo (id),
constraint fk_modelo foreign key (modelo) references veiculo (id),
constraint fk_marca foreign key (marca) references veiculo (id),
constraint fk_chassi foreign key (chassi) references veiculo (id)

)ENGINE = InnoDB;


#-----TABELA SETOR
CREATE TABLE IF NOT EXISTS Setor (
id INT NOT NULL PRIMARY KEY,
funcao VARCHAR(60) NOT NULL,
permissaonivel FLOAT

)ENGINE = InnoDB;

INSERT INTO Setor VALUES
(1,'Vendedor',1),
(2,'Administração',2),
(3,'Manutenção',3),
(4,'Seguro',2.1);

select * from Setor;


#-----TABELA COLABORADOR
CREATE TABLE IF NOT EXISTS Colaborador (
id INT NOT NULL PRIMARY KEY,
nome VARCHAR (50) NOT NULL,
login VARCHAR (120) NOT NULL,
telefone VARCHAR (40) NOT NULL,
codColaborador VARCHAR (100) NOT NULL,
numsetor INT NOT NULL,
CONSTRAINT uk_login UNIQUE (login),
CONSTRAINT fk_numsetor FOREIGN  KEY (numsetor) REFERENCES Setor(id)

)ENGINE = InnoDB;

insert into Colaborador values(1,'Joao','Joao@gmail',48-994433,12345,1);
insert into Colaborador values(2,'Pedro','Pedro@gmail',48-994423,23456,3);
insert into Colaborador values(3,'Lucas','Lucas@gmail',48-994477,345678,2);
insert into Colaborador values(4,'Bruno','Bruno@gmail',48-9943121,456789,2.1);

select * from Colaborador;

#----------------------------------------- ABAIXO REITIRADA E RESERVA DAS CHAVES ----------------------------

 
CREATE TABLE IF NOT EXISTS retiradaChave (
id INT NOT NULL PRIMARY KEY,
Numchave INT NOT NULL,
funcao INT NOT NULL,
dataRetirada DATETIME,
dataEntregua DATETIME,
permissaonivel INT NOT NULL,
CONSTRAINT fk_funcao FOREIGN  KEY (funcao) REFERENCES Setor(id),
CONSTRAINT fk_Numchave FOREIGN  KEY (Numchave) REFERENCES ModeloVeiculo(id)


)ENGINE InnoDB;


insert into retiradaChave values (1,'2020-01-01 23:59:59','2020-02-02 22:59:59',2,2);
select * from retiradaChave;

#----------------------- FEITO ATÉ ( RETIRADACHAVE ) SEGUNDA - FEIRA ------------------------- 

 #----------FALTA FAZER 
CREATE TABLE iF NOT EXISTS Reservarchave (
id INT NOT NULL PRIMARY KEY,
descricao VARCHAR (120),
marca INT not null,
tipo INT not null,
CONSTRAINT fk_marcaC FOREIGN KEY (marca) REFERENCES marca(id),
CONSTRAINT fk_tipoC FOREIGN KEY (tipo) REFERENCES tipo(id)
)ENGINE = InnoDB;




select * from chave inner join marca on chave.id ;