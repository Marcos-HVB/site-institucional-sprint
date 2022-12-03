create database oncotech;

use oncotech;

create table unidade(
idUnidade int primary key auto_increment,
empresa varchar(100),
nomeUnidade varchar(45),
rua varchar(45),
numero varchar(45),
bairro varchar(45),
cep char(8),
complemento varchar(45),
cnpj char(14),
fkMatriz int,
foreign key (fkMatriz) references unidade(idUnidade)
);


create table setor(
idSetor int auto_increment,
nomeSetor varchar(45),
localSetor varchar(45),
fkUnidade int,
fkRemedio int,
foreign key (fkRemedio) references remedio(idremedio),
foreign key (fkUnidade) references unidade(idUnidade),
primary key (idSetor,fkUnidade)
);


create table remedio(
idRemedio int primary key auto_increment,
nomeRemedio varchar (45),
quantidade int,
valor decimal(7,2),
tempMin decimal(3,1),
tempMax decimal (3,1)
);


create table sensor(
idSensor int,
nomeSensor varchar(45),
dthora dateTime,
fkSetor int,
fkUnidade int,
foreign key (fkSetor) references setor(idSetor),
foreign key (fkUnidade) references unidade(idUnidade),
primary key (idSensor,fkSetor,fkUnidade) 
);

create table medida(
idmedida int primary key,
temperatura decimal(3,1),
umidade decimal(3,1));

insert medida values
(1,12.3,25.1),
(2,10.0,24.7),
(3,09.2,23.0),
(4,11.1,20.1),
(5,15.8,27.2),
(6,16.1,28.1),
(7,14.3,26.1),
(8,12.3,21.1),
(9,11.0,22.7);



select temperatura,umidade,sensor.idsensor,setor.idsetor from medida join relatorio on idmedida=fksensor join  sensor on fksensor=idsensor join setor on sensor.fksetor=setor.idsetor;

create table relatorio(
fkmedida int,
fksensor int,
fksetor int,
fkunidade int,
primary key (fkmedida,fksensor,fksetor,fkunidade),
foreign key (fkmedida) references medida(idmedida),
foreign key (fksensor) references sensor(idsensor),
foreign key (fksetor) references setor(idsetor),
foreign key (fkunidade) references unidade(idunidade));





create table usuario(
idUsuario int auto_increment,
nome varchar(45),
sobrenome varchar(45),
cargo varchar(45),
email varchar(45),
senha varchar(45),
fkUnidade int,
foreign key (fkUnidade) references unidade(idUnidade),
primary key (idUsuario, fkUnidade)
);

-- INSERT VALUES
insert into unidade values
(null,'Bayer','Unidade Matriz Tatuape','Tuiuti','1023','Tatuape','08471250',null,'04966357000180',null),
(null,'Bayer','Unidade Mogi','rose prestes','585','Mogi das Cruzes','0845710',null,'04966354510215',1),
(null,'Brainfarma','Unidade Matriz Paulista','hadock lobo','23','Av. Paulista','08471981',null,'04256357001528',null),
(null,'Brainfarma','Unidade Sé','Tuiuti','1023','Tatuape','0847999',null,'03570001801579',3),
(null,'Brainfarma','Unidade São Matheus','jose coutinho','1023','Tatuape','08424562',null,'04889112512220',3),
(null,'Eurofarma','Unidade Matriz Tatuape','Mota souza','10','Tatuape','08498754','proximo ao HOSPITAL almeida','04966357511110',null),
(null,'Medley Indústria Farmacêutica','Unidade Matriz Eng.Goulart','Av. Alameda','545','engenheiro goulart','08401123','Andar de cima a o restaurante','04966357000180',null);





select * from usuario;
select * from unidade;





