/*  

#------------ DROP TABLE
@Josiel Costa
@autor: Josiel Costa Martins
@S.A claviculário Conssecionária
@data de Criação: 10/04/2020
@data da Última Atualização: 27/04/2020

* Excluir Tabelas
*/

DROP TABLE IF EXISTS Retirarchave;
DROP TABLE IF EXISTS Colaborador;
DROP TABLE IF EXISTS Setor;
DROP TABLE IF EXISTS veiculo;
DROP TABLE IF EXISTS Marcaveiculo;
DROP TABLE IF EXISTS ModeloVeiculo;
DROP TABLE IF EXISTS chave;


#--------TABELA  -->> MARCA VEICULO
CREATE TABLE IF NOT EXISTS Marcaveiculo (
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR (40)

)ENGINE = InnoDB;

insert into Marcaveiculo(nome) values ('Volks');
insert into Marcaveiculo(nome) values ('Ford');
insert into Marcaveiculo(nome) values ('Toyota');
insert into Marcaveiculo(nome) values ('Fiat');
select * from Marcaveiculo;


#-----TABELA -->> MODELO VEICULO
CREATE TABLE IF NOT EXISTS ModeloVeiculo(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
modelo VARCHAR (40) NOT NULL,
categoria VARCHAR (50) NOT NULL,
anoModelo INT NOT NULL,
publico VARCHAR (30) NOT NULL

)ENGINE = InnoDB;

insert into ModeloVeiculo (modelo,categoria,anoModelo,publico) values ('Suv','Esportivo',2015,'Diversificado');
insert into ModeloVeiculo (modelo,categoria,anoModelo,publico) values ('Jeep','Trilha',2019,'Aventureiro');
insert into ModeloVeiculo (modelo,categoria,anoModelo,publico) values ('Perua','Espaço e Conforto',2012,'Familia');
insert into ModeloVeiculo (modelo,categoria,anoModelo,publico) values ('Utilitarios','Trabalho',2013,'Profissional');
select * from ModeloVeiculo;


#-----TABELA CHAVE
CREATE TABLE IF NOT EXISTS chave(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
marca VARCHAR (50) NOT NULL,
CodigoVeiculo INT NOT NULL UNIQUE KEY  # <---------  CÓDIGO DA CHAVE

)ENGINE = InnoDB;


insert into chave(marca,CodigoVeiculo) values('Volks',FLOOR(RAND() * 5041) + 100000);
insert into chave(marca,CodigoVeiculo) values('Ford',FLOOR(RAND() * 5021) + 100000);
insert into chave(marca,CodigoVeiculo) values('Toyota',FLOOR(RAND() * 5031) + 100000);
insert into chave(marca,CodigoVeiculo) values('Fiat',FLOOR(RAND() * 5101) + 100000);
select * from chave;



#-----TABLA   -->> VEICULO
CREATE TABLE IF NOT EXISTS veiculo (
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT ,
nome VARCHAR (80) NOT NULL,
combustivel VARCHAR(7) NOT NULL,
cor VARCHAR (20) NOT NULL,
chassi VARCHAR (50) NOT NULL,
transmissao VARCHAR (70) NOT NULL,
CodigoVeiculo INT NOT NULL ,  # <---------  CÓDIGO DA CHAVE
motor CHAR (3) NOT NULL,
descricao INT NOT NULL, #FOREING
marcaVeiculo INT NOT NULL, #FOREING 
anoModelo INT NOT NULL, # FOREING 
CONSTRAINT fk_descricao FOREIGN KEY (descricao) REFERENCES ModeloVeiculo(id),
CONSTRAINT fk_marcaVeiculo FOREIGN KEY (marcaVeiculo) REFERENCES marcaVeiculo(id),
CONSTRAINT fk_anoModelo FOREIGN KEY (anoModelo) REFERENCES ModeloVeiculo(id),
CONSTRAINT fk_CodigoVeiculo FOREIGN KEY (CodigoVeiculo) REFERENCES chave(id)

)ENGINE = InnoDB;

insert into veiculo (nome,combustivel,cor,chassi,transmissao,CodigoVeiculo,motor,descricao,marcaVeiculo,anoModelo) values
 ('SpaceFox','ALC/GAS','cinza',3432142,'Imotion',1,'1.6',1,2,3);
 
insert into veiculo (nome,combustivel,cor,chassi,transmissao,CodigoVeiculo,motor,descricao,marcaVeiculo,anoModelo) values
('gol','GAS/GAS','prata',1239856,'automático',2,'1.0',1,2,3);

insert into veiculo (nome,combustivel,cor,chassi,transmissao,CodigoVeiculo,motor,descricao,marcaVeiculo,anoModelo) values
('renagade','ALC/GAS','branco',3421442,'mecânico',3,'2.0',2,3,4);

insert into veiculo (nome,combustivel,cor,chassi,transmissao,CodigoVeiculo,motor,descricao,marcaVeiculo,anoModelo) values
('Hilux','GAS','preto',3422122,'automatico',4,'3.0',2,3,4);
select * from veiculo;


#-----TABELA SETOR
CREATE TABLE IF NOT EXISTS Setor (
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
setor VARCHAR (100) NOT NULL
 

)ENGINE = InnoDB;	

insert into Setor(setor) values('Vendas');
insert into Setor(setor) values('Lavação');
insert into Setor(setor) values('Desenvolvimento');
insert into Setor(setor) values('Manutencao');
select * from Setor;

#-----TABELA COLABORADOR
CREATE TABLE IF NOT EXISTS Colaborador (
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR (100) NOT NULL,
funcao VARCHAR(60) NOT NULL,
login VARCHAR (120) NOT NULL,
telefone VARCHAR (40) NOT NULL,
setor INT NOT NULL,
CodCracha INT, 
CONSTRAINT fk_setor FOREIGN KEY (setor) REFERENCES Setor(id),
CONSTRAINT uk_CodCracha UNIQUE (CodCracha)


)ENGINE = InnoDB;

INSERT INTO Colaborador (nome,funcao,login,telefone,setor,CodCracha) VALUES ('Joao','Vendedor','Joao@gmail','48-994433',1,FLOOR(RAND() * 640 + 100000));
INSERT INTO Colaborador (nome,funcao,login,telefone,setor,CodCracha) VALUES ('Pedro','Mecanico','Pedro@gmail','48-994423',2,FLOOR(RAND() * 620 + 100000));
INSERT INTO Colaborador (nome,funcao,login,telefone,setor,CodCracha) VALUES ('Lucas','Lavador','Lucas@gmail','48-994477',3,FLOOR(RAND() * 660 + 100000));
INSERT INTO Colaborador (nome,funcao,login,telefone,setor,CodCracha) VALUES ('Carla','Progamador','Carla@gmail','48-994321',4,FLOOR(RAND() * 610 + 100000));
select * from Colaborador;

																		

#-----TABELA RETIRAR CHAVE
CREATE TABLE IF NOT EXISTS Retirarchave(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome INT NOT NULL,
setor INT NOT NULL,
horaRetirada DATETIME NOT NULL,
horaEntrega DATETIME NOT NULL,
CONSTRAINT fk_Retnome FOREIGN KEY (nome) REFERENCES colaborador(id),
CONSTRAINT fk_Retsetor FOREIGN KEY (setor) REFERENCES Setor(id)

)ENGINE = InnoDB;

INSERT INTO Retirarchave(horaRetirada,horaEntrega,nome,setor) VALUES ('2020-12-31 23:53:59',now(),1,2);
INSERT INTO Retirarchave(horaRetirada,horaEntrega,nome,setor) VALUES ('2020-11-11 21:23:22',now(),3,4);
INSERT INTO Retirarchave(horaRetirada,horaEntrega,nome,setor) VALUES ('2020-10-11 12:03:19',now(),2,1);
INSERT INTO Retirarchave(horaRetirada,horaEntrega,nome,setor) VALUES ('2020-09-21 09:12:02',now(),1,3);


select * from Retirarchave join Setor order by nome;
create view vw_chave_marca as select chave.marca , veiculo.nome from veiculo inner join chave on chave.id = veiculo.id;
select marca,nome from vw_chave_marca order by nome;


#-----TRIGGER
DELIMITER $
create trigger trg_chave after insert on Retirarchave
for each row
begin
	if (new.entregue = 0) then 
	if end
end 
DELIMITER ;

select * from Retirarchave join Setor order by nome;

SELECT * FROM Colaborador
INNER JOIN Setor
ON Setor.id = Colaborador.id;
