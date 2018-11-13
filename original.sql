Create Table temp (
DataColeta varchar(20),
IdNumeric int,
GrupoProduto varchar(30),
Produto varchar(50),
Posto varchar(100),
CnpjPosto varchar(50),
Distribuidora varchar(100),
Endereço varchar(100),
Complemento varchar(100),
Bairro varchar(50),
Municipio varchar(50),
Latitude varchar(50),
Longitude varchar(50),
Uf varchar(20),
RegiaoPolitica varchar(20),
Ensaio varchar(50),
Resultado varchar(100),
Conforme varchar(5)
);


ALTER TABLE temp CONVERT TO CHARACTER SET utf8mb4;


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/PMQC_09_2018_modificado_certo.csv' 
INTO TABLE temp 
FIELDS TERMINATED BY ';' 
LINES TERMINATED BY '\n'
IGNORE 1 rows 
(DataColeta, IdNumeric, GrupoProduto, Produto, Posto,
CnpjPosto, Distribuidora, Endereço, Complemento,
Bairro, Municipio, Latitude, Longitude, Uf,
RegiaoPolitica, Ensaio, Resultado, Conforme);