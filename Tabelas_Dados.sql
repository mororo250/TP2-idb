create table Posto(
PostoNome varchar(100),
Cnpj varchar(50) not null primary key,
Endereço varchar(100),
Complemento varchar(100),
Bairro varchar(50),
Municipio varchar(50),
Latitude varchar(50),
Longitude varchar(50),
Uf varchar(20),
RegiaoPolitica varchar(20)
);


Insert Into Posto (PostoNome, Cnpj, 
Endereço, Complemento, Bairro, Municipio, 
Latitude, Longitude, Uf, RegiaoPolitica)
Select distinct Posto, CnpjPosto, 
Endereço, Complemento, Bairro, Municipio, 
Latitude, Longitude, Uf, RegiaoPolitica
From Temp;

Create Table Produto (
Nome varchar(50) not null primary key,
GrupoProduto varchar(30)
);

Insert Into Produto(Nome, GrupoProduto)
Select distinct Produto, GrupoProduto
From Temp;

create table Fornece(
CnpjPosto varchar(50) not null,
ProdutoNome varchar(50) not null, 
Distribuidora varchar(100) not null,
foreign key (CnpjPosto) References Posto(cnpj)
on update cascade
on delete cascade,
foreign key (ProdutoNome) References Produto(Nome)
on update cascade
on delete cascade,
primary key (CnpjPosto, ProdutoNome)
);

Insert Into fornece(CnpjPosto, ProdutoNome, Distribuidora)
Select distinct CnpjPosto, Produto, Distribuidora
From Temp;

Create table Teste(
Id int not null primary Key,
CnpjPosto varchar(50) not null, 
ProdutoNome varchar(50) not null,
DataColeta varchar(20),
foreign key (CnpjPosto) References Posto(cnpj)
on update cascade
on delete cascade,
foreign key (ProdutoNome) References Produto(Nome)
on update cascade
on delete cascade
);

Insert Into Teste(Id, CnpjPosto, ProdutoNome, DataColeta)
Select distinct IdNumeric, CnpjPosto, Produto, DataColeta
From Temp;

Create Table Ensaio(
IdTeste int not null, 
EnsaioNome varchar(50) not null,
Resultado varchar(100),
Conforme varchar(5),
Foreign key (Idteste) references Teste(Id),
primary key(IdTeste, EnsaioNome)
);

Insert Into Ensaio(IdTeste, EnsaioNome, Resultado, Conforme)
Select distinct IdNumeric, Ensaio, Resultado, Conforme
From Temp;




