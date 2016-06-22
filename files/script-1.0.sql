create database listatimesmobile;
use listatimesmobile;

create table estados(
	id int not null auto_increment primary key,
    nome varchar(255) not null unique
) ENGINE = Innodb;

create table divisoes(
	id int not null auto_increment primary key,
    nome varchar(255) not null unique
)ENGINE Innodb;

create table times (
	id int not null auto_increment primary key,
    nome varchar(255) not null unique,
    id_estado int not null,
    id_divisao int not null,
	foto varchar(255) null,
    constraint fkidestado foreign key(id_estado) references estados(id) on delete cascade,
    constraint fkiddivisao foreign key(id_divisao) references divisoes(id) on delete cascade
) ENGINE = Innodb;

create table sedes(
	id int not null auto_increment primary key,
	nome varchar(255) not null unique,
	rua varchar(255) not null,
	numero varchar(255),
	bairro varchar(255) not null,
	cidade varchar(255) not null,
	latitude varchar(255) not null,
	longitude varchar(255) not null,
	id_time int not null,
	constraint fkidtime foreign key(id_time) references times(id) on delete cascade
) ENGINE = Innodb;

insert into estados(nome) values
	('Acre'),
    ('Alagoas'),
    ('Amapá'),
    ('Amazonas'),
    ('Bahia'),
    ('Ceará'),
    ('Distrito Federal'),
    ('Espírito Santo'),
    ('Goiás'),
    ('Maranhão'),
    ('Mato Grosso'),
    ('Mato Grosso do Sul'),
    ('Minas Gerais'),
    ('Pará'),
    ('Paraíba'),
    ('Paraná'),
    ('Pernambuco'),
    ('Piauí'),
    ('Rio de Janeiro'),
    ('Rio Grande do Norte'),
    ('Rio Grande do Sul'),
    ('Rondônia'),
    ('Roraima'),
    ('Santa Catarina'),
    ('São Paulo'),
    ('Sergipe'),
    ('Tocantins');

insert into divisoes(nome) values('Primeira Divisão'), ('Segunda Divisão');