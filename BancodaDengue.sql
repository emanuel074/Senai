Create database bancoDengue;


use bancoDengue;


create table fichavisita
(
id_ficha int NOT NULL AUTO_INCREMENT,

nome_morador varchar(100) not null  ,


estado varchar(20) not null,


cidade varchar(20) not null,


rua varchar(50) not null,


num_casa int not null,


nome_agente varchar(100) not null ,


cod_agente int not null,


num_equipe int not null,


atividades varchar(255) not null,


amostras varchar(100) not null,


data_visita date not null,


horario_visita time not null,


primary key (id_ficha)) ;


create table registrodefocos


(
id_focos int NOT NULL AUTO_INCREMENT,

cod_agente int(10) not null,

num_equipe int(10) not null,

nome_morador varchar(20) not null ,

estado varchar(10) not null,

cidade varchar(20) not null,

rua varchar(40) not null,

num_casa int(4) null,

data_visita varchar(20),

local_Visita varchar (15),

quantidade_focosAgua int(4) not null,

quantidade_criadouros int(4) not null,

local_tem_entulho varchar(15) not null,

tipofocos varchar(20) not null,


situacao_imovel varchar(40) not null,


primary key (id_focos));



create table questionario

(

id_quest int NOT NULL AUTO_INCREMENT,


perguntas varchar(255) not null,


respostas varchar(255) not null,


primary key (id_quest));




create table cadastroAgente


(


codigoAgente int NOT NULL AUTO_INCREMENT,


num_carteira int (30) not null,


nomeProfissional varchar(50) not null,

pis_pasep int(15) not null,

ctps int(7) not null,

cpf int(11) not null,

n_identidade int(8) null,

orgaoEmissor varchar(6) null,

DataEmissao date null,

Nacionalidade varchar(15) not null,

pais varchar (15) not null,

DataEntrada date null,

DataNascimentoProfissional date null,

municipioNascimento varchar(20) not null,

sexo varchar(1)  null,

cor varchar(10) not null,

deficiente varchar(3) not null,

estadoCivil varchar(8) not null,

NumeroDdependentes int(15) null,

grauInstrução varchar(17) null,

endereçoProfissional varchar(50),

municipio varchar(20) not null,

estado varchar(2) not null,

cep int(8) not null, 

telefone int(11) not null,

banco varchar(15) null, 

agencia int(20) null,

num_Conta int(8) null,



primary key (codigoAgente));






create table agendamentos

(

id_agenda int not null AUTO_INCREMENT,


equipe varchar(20) not null,


data_Visita date not null,

turno varchar(15) not null,

regiao varchar(25),


primary key (id_agenda));





create table cadastro_unidade
(
id_filial int not null AUTO_INCREMENT, /* inserir o CNPJ/CEI */

cnpj varchar(20) not null,

nome_Fantasia varchar(50),/* Nome Fantasia do Estab/Razão social do estabelecimento */

Codigo_uf int null,/* Código da UF ou município da Secretaria de Saúde em que é lotado */

endereco_filial varchar(50),

cep int(8) not null,

municipio_filial varchar(20) not null,

estado_filial varchar(20) not null,

tel_filial int(11) null,

email_filial varchar(40) not null,

primary key (id_filial));













