drop database videogame;

create database videogame;

use videogame;

create table videogame(

id_videogame int primary key not null auto_increment,

modelo_videogame varchar(20),

NS_videogame varchar(24)

);

create table jogos(

id_jogos int primary key not null auto_increment,

nome_jogo varchar(30),

descricao_jogo varchar(120),

genero_jogo varchar(20),

produtora_jogo varchar(40)

);

create table tipopessoa(

id_tipo_pessoa int primary key not null auto_increment,

descricao_tipo_pessoa varchar(20)

);

create table tipolocal(

id_tipo_local int primary key not null auto_increment,

descricao_tipo_local varchar(30)

);

create table pessoa(

id_pessoa int primary key not null auto_increment,

tipo_pessoa_id_tipo_pessoa int,

nome_pessoa varchar(80),

rg_pessoa varchar(10) not null,

cpf_pessoa varchar(14) not null,

foreign key (tipo_pessoa_id_tipo_pessoa) references tipopessoa(id_tipo_pessoa)

);

create table contato(

id_contato int primary key not null auto_increment,

tipo_local_id_tipo_local int,

pessoa_id_pessoa int,

telefone_contato varchar(13),

mail_contato varchar(30),

foreign key (pessoa_id_pessoa) references pessoa(id_pessoa),

foreign key (tipo_local_id_tipo_local) references tipolocal(id_tipo_local)

);

create table funcionario(

id_funcionario int primary key not null auto_increment,

pessoa_id_pessoa int,

sexo char(1),

idade int,

foreign key (pessoa_id_pessoa) references pessoa(id_pessoa)

);

create table cliente(

id_cliente int primary key not null auto_increment,

pessoa_id_pessoa int,

pai_cliente varchar(80),

mae_cliente varchar(80),

nick_cliente varchar(12) not null,

senha_cliente varchar(8) not null,

foreign key (pessoa_id_pessoa) references pessoa(id_pessoa)

);

create table aluguel (

id_aluguel int primary key not null auto_increment,

funcionario_id_funcionario int,

videogame_id_videogame int,

cliente_id_cliente int,

jogos_id_jogos int,

valor_aluguel real,

data_aluguel date,

foreign key (cliente_id_cliente) references cliente(id_cliente),

foreign key (videogame_id_videogame) references videogame(id_videogame),

foreign key (funcionario_id_funcionario) references funcionario(id_funcionario),

foreign key (jogos_id_jogos) references jogos(id_jogos)

);

create table endereco(

id_endereco int primary key not null auto_increment,

tipo_local_id_tipo_local int,

pessoa_id_pessoa int,

logradouro_endereco varchar(70),

numero_endereco int,

complemento_endereco varchar(100),

bairro_endereco int,

cep_endereco varchar(9),

cidade_endereco varchar(30),

estado_endereco char(2),

foreign key (pessoa_id_pessoa) references pessoa(id_pessoa),

foreign key (tipo_local_id_tipo_local) references tipolocal(id_tipo_local)

);