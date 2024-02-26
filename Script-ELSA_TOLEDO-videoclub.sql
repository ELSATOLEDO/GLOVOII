create schema videoclub;

set schema 'videoclub';

-- Creamos tablas

create table persona(
	id_dni varchar(10) primary key,
	nombre varchar(30) not null,
	apellido_1 varchar(40) not null,
	apellido_2 varchar(40) not null,
	telefono varchar(15) not null,
	email varchar(60) not null,
	fecha_nacimiento date not null
);

create table socio(
	id_socio smallserial primary key,
	id_dni varchar(10) not null,
	fecha_alta_socio date not null,
	fecha_baja_socio date
);

create table direccion(
	id_dni varchar(10) primary key,
	codigo_postal smallserial not null,
	calle varchar(80),
	numero varchar(5),
	piso varchar(5),
	otros varchar(15)
);

create table pelicula(
	id_pelicula smallserial primary key,
	titulo varchar(80) not null,
	genero varchar(15) not null,
	director varchar(50) not null,
	sinopsis varchar(400) not null
);

create table copia(
	id_copia smallserial primary key,
	id_pelicula smallserial not null
);

create table alquiler(
	id_alquiler smallserial primary key,
	id_dni varchar(10) not null,
	id_socio smallserial not null,
	id_copia smallserial not null
);

-- Creamos relaciones

alter table socio
add constraint fk_persona_socio
foreign key (id_dni) references persona(id_dni);

alter table direccion
add constraint fk_persona_direccion
foreign key (id_dni) references persona(id_dni);

alter table copia
add constraint fk_pelicula_copia
foreign key (id_pelicula) references pelicula(id_pelicula);

alter table alquiler
add constraint fk_persona_alquiler
foreign key (id_dni) references persona(id_dni);

alter table alquiler
add constraint fk_socio_alquiler
foreign key (id_socio) references socio(id_socio);

alter table alquiler
add constraint fk_copia_alquiler
foreign key (id_copia) references copia(id_copia);
