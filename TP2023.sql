CREATE DATABASE TP2023;
USE TP2023

CREATE TABLE JUGADOR(

Nickname varchar(30) PRIMARY KEY NOT NULL,
EMAIL varchar(50) UNIQUE NOT NULL,
Nacionalidad varchar(30)

);

-- INSERT INTO JUGADOR VALUES ( );
SELECT *FROM JUGADOR;

CREATE TABLE MAPA(

ID_Mapa int IDENTITY PRIMARY KEY, 
Nombre_Mapa varchar(30)
);

--INSERT INTO MAPA VALUES( );
SELECT *FROM MAPA;

CREATE TABLE MODALIDAD(

ID_Modalidad int IDENTITY PRIMARY KEY,
Nombre_Modalidad varchar(30)
);

--INSERT INTO MODALIDAD VALUES( );

CREATE TABLE PARTIDA(

ID_Partida int PRIMARY KEY NOT NULL, --6 digitos
Hora_in varchar(5),
Duracion varchar(10), --en minutos
ID_Mapa int,
ID_Modalidad int

FOREIGN KEY (ID_Mapa) REFERENCES MAPA(ID_Mapa),
FOREIGN KEY (ID_Modalidad) REFERENCES MODALIDAD(ID_Modalidad)

);

-- INSERT INTO PARTIDA VALUES( );

CREATE TABLE SESION(

ID_Sesion int IDENTITY PRIMARY KEY NOT NULL,
Fecha_in varchar(10),
Hora_in varchar(10),
Fecha_eg Varchar(10),
Hora_eg varchar(10),
Nickname varchar(30)

FOREIGN KEY (Nickname) REFERENCES JUGADOR(Nickname)

);

--INSERT INTO SESION VALUES( );

CREATE TABLE ROL(

ID_Rol int IDENTITY PRIMARY KEY,
Nombre_Rol varchar(30)
);

--INSERT INTO ROL VALUES( );


CREATE TABLE HEROE(

ID_Heroe int IDENTITY PRIMARY KEY NOT NULL,
Nombre_Heroe varchar(20),
ID_Rol int

FOREIGN KEY (ID_Rol) REFERENCES ROL(ID_Rol)

);


-- INSERT INTO HEROE VALUES ( );


CREATE TABLE HABILIDADES (

Nombre_Habilidad varchar(30) PRIMARY KEY,
Da�o int,
NRO_Habilidad int,
ID_Heroe int

FOREIGN KEY (ID_Heroe) REFERENCES HEROE(ID_Heroe)
);

-- INSERT INTO HABILIDADES VALUES ( ); 


CREATE TABLE PARTIDA_SESION(

PRIMARY KEY(ID_Partida, ID_Sesion),
ID_Partida int,
ID_Sesion int NOT NULL,
ID_Heroe int
--EQUIPO_NRO int

FOREIGN KEY (ID_Partida) REFERENCES PARTIDA(ID_Partida),
FOREIGN KEY (ID_Sesion) REFERENCES SESION(ID_Sesion),
FOREIGN KEY (ID_Heroe) REFERENCES HEROE(ID_Heroe)

);

--INSERT INTO PARTIDA_SESION( );

CREATE TABLE GANADORES(

PRIMARY KEY (ID_Partida, EQUIPO_NRO),
ID_Partida int NOT NULL,
EQUIPO_NRO int

FOREIGN KEY (ID_Partida) REFERENCES PARTIDA(ID_Partida),

);