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

insert into estados(id, nome) values
	(1, 'Acre'),
    (2, 'Alagoas'),
    (3, 'Amapá'),
    (4, 'Amazonas'),
    (5, 'Bahia'),
    (6, 'Ceará'),
    (7, 'Distrito Federal'),
    (8, 'Espírito Santo'),
    (9, 'Goiás'),
    (10, 'Maranhão'),
    (11, 'Mato Grosso'),
    (12, 'Mato Grosso do Sul'),
    (13, 'Minas Gerais'),
    (14, 'Pará'),
    (15, 'Paraíba'),
    (16, 'Paraná'),
    (17, 'Pernambuco'),
    (18, 'Piauí'),
    (19, 'Rio de Janeiro'),
    (20, 'Rio Grande do Norte'),
    (21, 'Rio Grande do Sul'),
    (22, 'Rondônia'),
    (23,'Roraima'),
    (24, 'Santa Catarina'),
    (25, 'São Paulo'),
    (26, 'Sergipe'),
    (27, 'Tocantins');

insert into divisoes(id, nome) values(1, 'Primeira Divisão'), (2, 'Segunda Divisão');

INSERT INTO `times` (`id`, `nome`, `id_estado`, `id_divisao`, `foto`) VALUES
(1, 'Botafogo', 19, 1, 'botafogo'),
(2, 'Flamengo', 19, 1, 'flamengo'),
(3, 'Fluminense', 19, 1, 'fluminense'),
(4, 'Vasco', 19, 2, 'vasco');

INSERT INTO `sedes` (`id`, `nome`, `rua`, `numero`, `bairro`, `cidade`, `latitude`, `longitude`, `id_time`) VALUES
(1, 'General Severiano', 'Avenida Venceslau Brás', '72', 'Botafogo', 'Rio de Janeiro', '-22.95481', '-43.17798', 1),
(2, 'Gávea', 'Avenida Borges de Medeiros', '997', 'Lagoa', 'Rio de Janeiro', '-29.39611', '-50.87088', 2),
(3, 'Laranjeiras', 'Rua Álvaro Chaves', '41', 'Laranjeiras', 'Rio de Janeiro', '-31.78083', '-52.33797', 3),
(4, 'São Januário', 'Rua General Almério de Moura', '131', 'Vasco da Gama', 'Rio de Janeiro', '-22.89103', '-43.22900', 4),
(5, 'Marechal Hermes', 'Rua Xavier Curado', '1705', 'Marechal Hermes', 'Rio de Janeiro', '-22.86296', '-43.37686', 1);