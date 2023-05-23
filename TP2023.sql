CREATE DATABASE TP2023;
USE TP2023

CREATE TABLE JUGADOR(

Nickname varchar(30) PRIMARY KEY NOT NULL,
EMAIL varchar(50) UNIQUE NOT NULL,
Nacionalidad varchar(30)

);

-- INSERT INTO JUGADOR VALUES ( );



CREATE TABLE PARTIDA(

ID_Partida int PRIMARY KEY NOT NULL,
Hora_in varchar(5),
Duracion varchar(10),
Mapa varchar(20),
Modo varchar(20)

);

-- INSERT INTO PARTIDA VALUES( );

CREATE TABLE SESION(

ID_Sesion int IDENTITY PRIMARY KEY NOT NULL,
Fecha_hr_in varchar(20),
Fecha_hr_eg Varchar(20),
Nickname varchar(30)

FOREIGN KEY (Nickname) REFERENCES JUGADOR(Nickname)

);

--INSERT INTO SESION VALUES( );

CREATE TABLE HEROE(

ID_Heroe int IDENTITY PRIMARY KEY NOT NULL,
Nombre varchar(20),
Rol varchar(20)

);


-- INSERT INTO HEROE VALUES ( );

CREATE TABLE HABILIDADES (

Nombre varchar(30) PRIMARY KEY,
Daño int,
ID_Heroe int

FOREIGN KEY (ID_Heroe) REFERENCES HEROE(ID_Heroe)
);

-- INSERT INTO HABILIDADES VALUES ( ); 