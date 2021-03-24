create database actividad
GO
use actividad
GO
create table carreras(
ID varchar(4) not null primary key,
nombre varchar(50) not null,
fecha_de_creacion date not null check(fecha_de_creacion < getdate()),
mail varchar(50) not null,
nivel varchar(12) not null check(nivel = 'Diplomatura' or nivel = 'Pregrado' or nivel = 'Grado' or nivel = 'Posgrado'),
)
GO
create table alumnos(
legajo bigint not null primary key identity(1000, 1),
IDcarrera varchar(4) not null foreign key references carreras(ID),
apellido varchar(50) not null,
nombres varchar(50) not null,
fecha_de_nacimiento date not null check(fecha_de_nacimiento < getdate()),
mail varchar(50) not null unique,
telefono varchar(20) null,
)
GO
create table materias(
ID bigint not null primary key identity(1,1),
IDcarrera varchar(4) not null foreign key references carreras(ID),
nombre varchar(15) not null,
CargaHoraria int not null check(CargaHoraria > 0),
)
GO