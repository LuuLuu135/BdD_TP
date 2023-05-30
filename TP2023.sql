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
Fecha_in date,
Hora_in time,
Fecha_eg date,
Hora_eg time,
Nickname varchar(30)

FOREIGN KEY (Nickname) REFERENCES JUGADOR(Nickname)

);


--INSERT INTO SESION VALUES(29/05/2023, );

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
Daño int,
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


--CONSULTAS SQL
--¿Cual fue el jugador que inicio sesion mas veces en un mismo dia?

SELECT TOP 1 Nickname, COUNT(*) AS Cantidad
FROM SESION
GROUP BY Nickname, Fecha_in
HAVING COUNT(*) > 1
ORDER BY COUNT(*) DESC;



--¿Cual es el horario en que se conectan mas jugadores?

SELECT Hora_in, COUNT(*) AS Cantidad_Conexiones
FROM SESION
GROUP BY Hora_in
ORDER BY Cantidad_Conexiones DESC;



--¿Que tipo de partida es la mas jugada y que tipo de mapa es el mas elegido?

SELECT
    M.Nombre_Modalidad AS Tipo_Partida,
    MA.Nombre_Mapa AS Mapa,
    COUNT(*) AS Total
FROM
    PARTIDA_SESION PS
    INNER JOIN PARTIDA P ON PS.ID_Partida = P.ID_Partida
    INNER JOIN MAPA MA ON P.ID_Mapa = MA.ID_Mapa
    INNER JOIN MODALIDAD M ON P.ID_Modalidad = M.ID_Modalidad
GROUP BY
    M.Nombre_Modalidad,
    MA.Nombre_Mapa
ORDER BY
    COUNT(*) DESC



-- ¿Qué héroe de tipo mago es el más utilizado?

SELECT TOP 1 H.Nombre_Heroe, COUNT(*) AS Cantidad_Utilizado
FROM PARTIDA_SESION PS
JOIN HEROE H ON PS.ID_Heroe = H.ID_Heroe
JOIN PARTIDA P ON PS.ID_Partida = P.ID_Partida
JOIN MODALIDAD M ON P.ID_Modalidad = M.ID_Modalidad
JOIN MAPA MP ON P.ID_Mapa = MP.ID_Mapa
WHERE H.ID_Rol = (SELECT ID_Rol FROM ROL WHERE Nombre_Rol = 'mago')
GROUP BY H.Nombre_Heroe
ORDER BY COUNT(*) DESC;



-- ¿Qué jugador es el que ganó más partidas? ¿Con qué héroe ganó la mayoría de ellas?SELECT TOP 1
    J.Nickname AS Jugador,
    H.Nombre_Heroe AS Heroe,
    COUNT(*) AS Total_Partidas_Ganadas
FROM
    JUGADOR J
    INNER JOIN SESION S ON J.Nickname = S.Nickname
    INNER JOIN PARTIDA_SESION PS ON S.ID_Sesion = PS.ID_Sesion
    INNER JOIN PARTIDA P ON PS.ID_Partida = P.ID_Partida
    INNER JOIN GANADORES G ON P.ID_Partida = G.ID_Partida
    INNER JOIN HEROE H ON PS.ID_Heroe = H.ID_Heroe
GROUP BY
    J.Nickname,
    H.Nombre_Heroe
ORDER BY
    Total_Partidas_Ganadas DESC;
-- ¿Cuál fue la partida más larga y cuál la más corta? Proporcione una lista de los nicknames de los jugadores que jugaron la partida más larga.SELECT
  P.ID_Partida,
  P.Duracion,
  J.Nickname
FROM
  PARTIDA P
  INNER JOIN PARTIDA_SESION PS ON P.ID_Partida = PS.ID_Partida
  INNER JOIN SESION S ON PS.ID_Sesion = S.ID_Sesion
  INNER JOIN JUGADOR J ON S.Nickname = J.Nickname
WHERE
  P.Duracion = (SELECT MAX(Duracion) FROM PARTIDA)
ORDER BY
  P.ID_Partida;


-- Calcule la duración promedio de las partidas de acuerdo a su tipo.

SELECT m.Nombre_Mapa, mo.Nombre_Modalidad, AVG(CONVERT(float, p.Duracion)) AS DuracionPromedio
FROM PARTIDA p
JOIN MAPA m ON p.ID_Mapa = m.ID_Mapa
JOIN MODALIDAD mo ON p.ID_Modalidad = mo.ID_Modalidad
GROUP BY m.Nombre_Mapa, mo.Nombre_Modalidad;



-- ¿Cuántos jugadores de cada nacionalidad se encuentran conectados en un determinado día (fije usted el día)?

SELECT Nacionalidad, COUNT(*) AS CantidadJugadores
FROM JUGADOR
INNER JOIN SESION ON JUGADOR.Nickname = SESION.Nickname
-- FECHA A REEMPLAZAR:
WHERE Fecha_in = '2023-05-29' 
GROUP BY Nacionalidad;


-- ¿Cuántos jugadores argentinos se conectaron por día? Ordene la salida desde el día en el que más se conectaron hasta el que menos se conectaron.
SELECT Fecha_in AS Fecha, COUNT(*) AS Cantidad
FROM SESION
JOIN JUGADOR ON SESION.Nickname = JUGADOR.Nickname
WHERE JUGADOR.Nacionalidad = 'Argentina'
GROUP BY Fecha_in
ORDER BY Cantidad DESC;


-- ¿Cuál es el daño total que inflige cada héroe (es decir la suma del daño infligido por todas sus habilidades)? ¿Cuál es el héroe cuya habilidad 4 hace más daño?

SELECT H.Nombre_Heroe, SUM(HB.Daño) AS Daño_Total
FROM HEROE H
JOIN HABILIDADES HB ON H.ID_Heroe = HB.ID_Heroe
GROUP BY H.Nombre_Heroe
ORDER BY Daño_Total DESC;

SELECT TOP 1 H.Nombre_Heroe, HB.Daño AS Daño_Habilidad_4
FROM HEROE H
JOIN HABILIDADES HB ON H.ID_Heroe = HB.ID_Heroe
WHERE HB.NRO_Habilidad = 4
ORDER BY HB.Daño DESC;



