CREATE DATABASE TP2023;
USE TP2023

CREATE TABLE JUGADOR(

Nickname varchar(30) PRIMARY KEY NOT NULL,
EMAIL varchar(50) UNIQUE NOT NULL,
Nacionalidad varchar(30)

);
INSERT INTO JUGADOR VALUES ('DyingForFree','usuario1@example.com','Argentina'),
						('Evelayn18','usuario2@example.com','Uruguay'),
						('Fran#1223','usuario3@example.com','Paraguay'),
						('HalKryza','usuario4@example.com','Chile'),
						('Kryzah ','usuario5@example.com','Paraguay'),
						('Alan Krzyzanowski','usuario6@example.com','Uruguay'),
						('Rulo','usuario7@example.com','Argentina'),
						('MachiRulo','usuario8@example.com','Chile'),
						('azyrk','usuario9@example.com','Uruguay'),
						('Sr Pates','usuario10@example.com','Argentina'),
						('Tore','usuario11@example.com','Chile'),
						('Luqiñas','usuario12@example.com','Paraguay'),
						('Melly','usuario13@example.com','Chile'),
						('Natokra','usuario14@example.com','Uruguay'),
						('RazMorningstar','usuario15@example.com','Paraguay'),
						('Zeeb','usuario16@example.com','Argentina'),
						('LeonB','usuario17@example.com','Paraguay'),
						('HypnosRequiem','usuario18@example.com','Chile'),
						('Senrielx','usuario19@example.com','Uruguay'),
						('ConejoT1','usuario20@example.com','Chile'),
						('XopiuX','usuario21@example.com','Argentina'),
						('n0temueras','usuario22@example.com','Uruguay'),
						('Fran41','usuario23@example.com','Paraguay'),
						('Nikino','usuario24@example.com','Argentina');
						
SELECT *FROM JUGADOR;


CREATE TABLE MAPA(

ID_Mapa int IDENTITY PRIMARY KEY, 
Nombre_Mapa varchar(30)
);

INSERT INTO MAPA VALUES('Island'),
						('Sanctum'),
						('Western Expanse'),
						('Harmonia');					   						

SELECT *FROM MAPA;

CREATE TABLE MODALIDAD(

ID_Modalidad int IDENTITY PRIMARY KEY,
Nombre_Modalidad varchar(30)
);

INSERT INTO MODALIDAD VALUES('coliseo'), 
						('clásica'),
						('clasificatoria');
SELECT *FROM MODALIDAD;

CREATE TABLE PARTIDA(

ID_Partida int PRIMARY KEY NOT NULL, --6 digitos
Hora_in time,
Duracion time, --en minutos
ID_Mapa int,
ID_Modalidad int

FOREIGN KEY (ID_Mapa) REFERENCES MAPA(ID_Mapa),
FOREIGN KEY (ID_Modalidad) REFERENCES MODALIDAD(ID_Modalidad)

);

INSERT INTO PARTIDA VALUES(827415, '07:21:00', '00:37:48',1,2), -- no se como ingresar los datos time ya que marca error con los dos puntos
						(532976, '09:46:00', '00:41:19',2,3),
						(694820, '11:50:00', '00:24:42',3,1),
						(158743, '02:45:00' ,'00:16:33',4,1);
 
Select * FROM PARTIDA;

CREATE TABLE SESION(

ID_Sesion int IDENTITY PRIMARY KEY NOT NULL,
Fecha_in date,
Hora_in time,
Fecha_eg date,
Hora_eg time,
Nickname varchar(30)

FOREIGN KEY (Nickname) REFERENCES JUGADOR(Nickname)

);


INSERT INTO SESION VALUES( 28/2/2023, '15:45:00', 28/2/2023, '20:15:00', 'n0temueras'), --Operand type clash: int is incompatible with date
						( 12/3/2023, '08:15', 12/3/2023, '10:30', 'Nikino'),
						( 06/05/2023, '13:00', 6/5/2023, '18:45', 'XopiuX'),
						( 15/1/2023, '10:30', 15/1/2023, '17:00','Fran41'),
						( 12/11/2023, '07:20', 12/11/2023, '10:11', 'HypnosRequiem'),
						( 18/6/2023, '09:45', 18/6/2023, '10:50', 'Evelayn18'),
						( 25/8/2023, '12:00', 25/8/2023, '15:00', 'Fran#1223'),
						( 4/7/2023, '17:30', 4/7/2023, '20:01', 'HalKryza'),
						( 28/2/2023, '09:00', 28/2/2023, '12:00', 'DyingForFree'),
						( 5/10/2023, '14:10', 5/10/2023, '17:09', 'MachiRulo'),
						( 23/11/2023, '11:30', 23/11/2023, '13:20', 'Kryzah'),
						( 6/1/2023, '04:45', 6/1/2023, '07:16', 'Rulo'),
						( 4/7/2023, '11:50', 4/7/2023, '13:45', 'Alan Krzyzanowski'),
						( 10/3/2023, '02:45', 10/3/2023, '04:14', 'luqiñas'),
						( 14/5/2023, '11:15', 14/5/2023, '12:06', 'azyrk'),
						( 18/6/2023, '16:30', 18/6/2023, '21:45', 'Sr Pates'),
						( 23/11/2023, '12:30', 23/11/2023, '13:00', 'Tore'),
						( 3/10/2023, '09:40', 3/10/2023, '13:01', 'Zeeb'),
						( 22/8/2023, '10:10', 22/8/2023, '11:10', 'Melly'),
						( 12/9/2023, '14:25', 12/9/2023, '19:35', 'Natokra'),
						( 10/3/2023, '12:30', 10/3/2023, '14:08', 'RazMorningstar'),
						( 6/1/2023, '10:45', 6/1/2023, '14:10', 'ConejoT1'),
						( 14/5/2023, '23:30', 15/5/2023, '04:20', 'Senriel'),
						( 28/2/2023, '13:20', 28/2/2023, '20:19', 'LeonB'),
						( 06/05/2023, '22:00', 07/5/2023, '00:45', 'XopiuX'),
						( 15/1/2023, '8:00', 15/1/2023, '09:00','Fran41'),
						( 12/11/2023, '15:20', 12/11/2023, '18:12', 'HypnosRequiem'),
						( 15/1/2023, '20:00', 16/1/2023, '00:07','Fran41');
						

SELECT * FROM SESION;


CREATE TABLE ROL(

ID_Rol int IDENTITY PRIMARY KEY,
Nombre_Rol varchar(30)
);

INSERT INTO ROL VALUES('Mago'), 
					('tirador'), 
					('tanque'),
					('soporte'), 
					('combatiente'),
					('asesino');

Select* from ROL;

CREATE TABLE HEROE(

ID_Heroe int PRIMARY KEY NOT NULL,
Nombre_Heroe varchar(20),
ID_Rol int

FOREIGN KEY (ID_Rol) REFERENCES ROL(ID_Rol)

);

INSERT INTO HEROE VALUES (1,'Aamon',6),
						(2,'Akai',3),
						(3,'Aldous',5),
						(4,'Alice',1),
						(5,'Alpha',5),
						(6,'Alucard',5),
						(7,'Angela',4),
						(8,'Argus',5),
						(9,'Arlott',5),
						(10,'Atlas',3),
						(11,'Aulus',5),
						(12,'Aurora',1),
						(13,'Badang',5),
						(14,'Balmond',5),
						(15,'Bane',5),
						(16,'Barats',3),
						(17,'Baxia',3),
						(18,'Beatrix',2),
						(19,'Belerick',3),
						(20,'Benedetta',6),
						(21,'Brody',2),
						(22,'Bruno',2),
						(23,'Carmilla',5),
						(24,'Cecilion',1),
						(25,'Chang e',1),
						(26,'Chou',5),
						(27,'Claude',2),
						(28,'Clint',2),
						(29,'Cyclops',1),
						(30,'Diggie',4),
						(31,'Dyrroth',5),
						(32,'Edith',3),
						(33,'Esmeralda',5),
						(34,'Estes',4),
						(35,'Eudora',1),
						(36,'Fanny',6),
						(37,'Faramis',4),
						(38,'Floryn',4),
						(39,'Franco',4),
						(40,'Fredrinn',3),
						(41,'Freya',5),
						(42,'Gatotkaca',3),
						(43,'Gloo',3),
						(44,'Gord',1),
						(45,'Granger',2),
						(46,'Grock',3),
						(47,'Guinevere',5),
						(48,'Gusion',6),
						(49,'Hanabi',2),
						(50,'Hanzo',6),
						(51,'Harith',1),
						(52,'Harley',1),
						(53,'Hayabusa',6),
						(54,'Helcurt',6),
						(55,'Hilda',5),
						(56,'Hylos',3),
						(57,'Irithel',2),
						(58,'Jawhead',5),
						(59,'Johnson',3),
						(60,'Joy',6),
						(61,'Julian',5),
						(62,'Kadita',1),
						(63,'Kagura',1),
						(64,'Kaja',5),
						(65,'Karina',6),
						(66,'Karrie',2),
						(67,'Khaleed',5),
						(68,'Khufra',3),
						(69,'Kimmy',2),
						(70,'Lancelot',6),
						(71,'Lapu-Lapu',5),
						(72,'Layla',2),
						(73,'Leomord',5),
						(74,'Lesley',2),
						(75,'Ling',6),
						(76,'Lolita',4),
						(77,'Lunox',1),
						(78,'Luo Yi',1),
						(79,'Lylia',1),
						(80,'Martis',5),
						(81,'Masha',5),
						(82,'Mathilda',4),
						(83,'Melissa',2),
						(84,'Minotaur',3),
						(85,'Minsitthar',5),
						(86,'Miya',2),
						(87,'Moskov',2),
						(88,'Nana',1),
						(89,'Natalia',6),
						(90,'Natan',2),
						(91,'Novaria',1),
						(92,'Odette',1),
						(93,'Paquito',5),
						(94,'Pharsa',1),
						(95,'Phoveus',5),
						(96,'Popol',2),
						(97,'Rafaela',4),
						(98,'Roger',5),
						(99,'Ruby',5),
						(100,'Saber',6),
						(101,'Selena',6),
						(102,'Silvanna',5),
						(103,'Sun',5),
						(104,'Terizla',5),
						(105,'Thamuz',5),
						(106,'Tigreal',3),
						(107,'Uranus',5),
						(108,'Vale',1),
						(109,'Valentina',1),
						(110,'Valir',1),
						(111,'Vexana',1),
						(112,'Wanwan',2),
						(113,'X.Borg',5),
						(114,'Xavier',1),
						(115,'Yin',5),
						(116,'Yu Zhong',5),
						(117,'Yve',1),
						(118,'Zhask',1),
						(119,'Zilong',6);

SELECT * FROM HEROE;


CREATE TABLE HABILIDADES (

Nombre_Habilidad varchar(100) PRIMARY KEY,
NRO_Habilidad int,
Daño int,
ID_Heroe int

FOREIGN KEY (ID_Heroe) REFERENCES HEROE(ID_Heroe)
);

INSERT INTO HABILIDADES VALUES ('Soul Shards',2,30,1), 				
							('Slayer Shards',3,22,1),
							('Endless Shards',4,18,1),
							('Invisible Armor',1,0,1),
							('Heavy Spin',4,45,2),
							('Tai chi',1,0,2),
							('Body Slam',3,42,2),
							('Headbutt',2,40,2),
							('Contract:Chase Fate',4,60,3),
							('Contract:Transform',1,50,3),
							('Contract:Soul Steal',2,45,3),
							('Contract:Explosion',3,40,3),
							('Blood ode',4,10,4),
							('Blood Ancestry',1,0,4),
							('Flowing Blood',2,60,4),
							('Blood Awe',3,39,4),
							('Alpha, Charge!',4,20,5),
							('Force Swing',3,50,5),
							('Beta, Advance',1,10,5),
							('Rotary Impact',2,30,5),
							('Whirling Smash',3,42,6),
							('Pursuit',1,0,6),
							('Fission Wave',4,70,6),
							('Groundsplitter',2,37,6),
							('Puppet-on-a-String',3,68,7),
							('Smart Heart',1,0,7),
							('Heartguard',4,0,7),
							('Love Waves',2,32,7),
							('Eternal Evil',4,30,8),
							('Warmonger',1,15,8),
							('Demonic Grip',2,32,8),
							('Meteoric Sword',3,40,8),
							('Vengeance',3,36,9),
							('Demon Gaze',1,0,9),
							('Dauntless Strike',2,40,9),
							('Final Slash',4,80,9),
							('Fatal Links',4,76,10),
							('Frigid Breath',1,0,10),
							('Perfect Match',3,42,10),
							('Annihilate',2,39,10),
							('The Power of Axe',3,55,11),
							('Undying Fury',4,29,11),
							('Fighting Spirit',1,0,11),
							('Aulus, Charge!',2,0,11),
							('Cold Destruction',4,100,12),
							('Bitter Frost',3,75,12),
							('Frost Shock',2,60,12),
							('Pride of Ice',1,0,12),
							('Fist Break',3,33,13),
							('Fist Wind',2,26,13),
							('Fist Crack',4,14,13),
							('Chivalry Fist',1,0,13),
							('Soul Lock',2,27,14),
							('Cyclone Sweep',3,20,14),
							('Bloodthirst',1,0,14),
							('Lethal Counter',4,0,14),
							('Deadly Catch',4,100,15),
							('Ale',3,45,15),
							('Crab Claw Cannon',2,35,15),
							('Shark Bite',1,0,15),
							('Missile "Expert"',3,35,16),
							('So-Called Teamwork',2,32,16),
							('Detonas Welcome',4,20,16),
							('Big Guy',1,0,16),
							('Tortoises Puissance',4,50,17),
							('Shield Unity',2,40,17),
							('Shield of Spirit',3,25,17),
							('Baxia Mark',1,0,17),
							('Renners Apathy',4,100,18),
							('Masterful Gunner',2,30,18),
							('Mechanical Genius',1,0,18),
							('Tactical Reposition ',3,0,18),
							('Nature Strike',3,45,19),
							('Ancient Seed',2,30,19),
							('Wrath of Dryad',4,20,19),
							('Deadly Thorns',1,0,19),
							('An Eye for An Eye',3,45,20),
							('Phantom Slash',2,40,20),
							('Alecto: Final Blow',4,16,20),
							('Elapsed Daytime',1,0,20),
							('Torn-Apart Memory',4,58,21),
							('Abyss Impact',2,55,21),
							('Corrosive Strike',3,35,21),
							('Abyss Corrosion',1,0,21),
							('Wave of the World',4,45,22),
							('Volley Shot',2,32,22),
							('Flying Tackle',3,27,22),
							('Mecha Legs',1,0,22),
							('Curse of Blood',4,75,23),
							('Bloodbath',3,30,23),
							('Crimson Flower',2,20,23),
							('Vampire Pact',1,0,23),
							('Bats Feast',4,45,24),
							('Sanguine Claws',3,30,24),
							('Bat Impact',2,23,24),
							('Overflowing',1,0,24),
							('Meteor Shower',4,80,25),
							('Starmoon Shockwave',2,45,25),
							('Trouble Maker',1,0,25),
							('Crescent Moon',3,0,25),
							('The way of Dragon',4,50,26),
							('Shunpo',3,35,26),
							('Jeet Kune Do',2,28,26),
							('Only fast',1,0,26),
							('Art of Thievery',2,29,27),
							('Blazing Duet',4,13,27),
							('Battle Side-By-Side',1,0,27),
							('Battle Mirror Image',3,0,27),
							('Quick Draw',2,40,28),
							('Grenade Bombardement',4,40,28),
							('Trapping Recoil',3,24,28),
							('Double Shot',1,0,28),
							('Star Power Lockdown',4,80,29),
							('Stardust Shock',2,40,29),
							('Planets Attack',3,35,29),
							('Starlit Hourglass',1,0,29),
							('Auto Alarm Bomb',2,60,30),
							('Reverse Time',3,40,30),
							('Young Again',1,0,30),
							('Time Journey',4,0,30),
							('Abysm Strike',4,100,31),
							('Burst Stike',2,45,31),
							('Spectre Step',3,35,31),
							('Wrath of Abyss',1,0,31),
							('Primal Wrath',4,65,32),
							('Earth Shatter',2,45,32),
							('Onward',3,14,32),
							('Overload',1,0,32),
							('Falling Starmoon',4,65,33),
							('Stardust Dance',3,44,33),
							('Stamoon Caskel',1,0,33),
							('Frostmoon Shield',2,0,33),
							('Domain of moon Goddess',3,60,34),
							('Scripture of the moon elf',1,0,34),
							('Moonlight Inmersion',2,0,34),
							('Blessing of Moon Godess',4,0,34),
							('Thunder s Wrath',4,84,35),
							('Forked Lightning',2,65,35),
							('Ball Lighting',3,45,35),
							('Superconductor',1,0,35),
							('Cut Throat',4,65,36),
							('Tornado Strike',2,52,36),
							('Air Superiority',1,0,36),
							('Steal Cable',3,0,36),
							('Ghost Bursters',3,45,37),
							('Shadow Stampede',2,40,37),
							('Vicious Retrieval',1,0,37),
							('Cult Altar',4,0,37),
							('Sow',2,35,38),
							('Sprout',3,35,38),
							('Bloom',4,25,38),
							('Dew',1,0,38),
							('Bloody Hunt',4,70,39),
							('Iron Hook',2,65,39),
							('Fury Shock',3,45,39),
							('Wasteland Force',1,0,39),
							('Appraisers Wrath',4,100,40),
							('Brave Assault',3,30,40),
							('Piercing Stike',2,15,40),
							('Crystalline Armor',1,0,40),
							('Leap of Faith ',2,30,41),
							('Spirit Combo',3,23,41),
							('Power of Einherjar',1,0,41),
							('Ougi: Valkyrie Descent',4,0,41),
							('Avatar of Guardian',4,100,42),
							('Blast Iron Fist',2,30,42),
							('Unbreakable',3,30,42),
							('Steel Bones',1,0,42),
							('Slam, Slam',2,35,43),
							('Pass, Pass',3,30,43),
							('Stick, Stick',1,0,43),
							('Split, Split',4,0,43),
							('Mystic Projectile',2,50,44),
							('Mystic Gush',4,23,44),
							('Mystic Injunction',3,10,44),
							('Mystic Favor',1,0,44),
							('Rhapsody',2,18,45),
							('Death sonata',4,16,45),
							('Caprice',1,0,45),
							('Rondo',3,0,45),
							('Wild Charge',4,60,46),
							('Power of Nature',2,50,46),
							('Guardians Barrier',3,45,46),
							('Ancestral gift',1,0,46),
							('Violet Requiem',4,91,47),
							('Energy Wave',2,52,47),
							('Spatial Migration',3,40,47),
							('Super magic',1,0,47),
							('Sword Spike',2,31,48),
							('Shadowblade Slaughter',3,21,48),
							('Dagger Specialist',1,0,48),
							('Incandescence',4,0,48),
							('Ninjutsu: Soul Scroll',3,91,49),
							('Forbidden Jutsu: Higanbana',4,80,49),
							('Ninjutsu: Equinox',1,0,49),
							('Ninjutsu: Petal Barrage',2,0,49),
							('Ninjutsu: Demon Feast',2,100,50),
							('Ninjutsu: Soul reap',3,90,50),
							('Kinjutsu: Pinnacle Ninja',4,45,50),
							('Ame no Habakiri',1,0,50),
							('Sychro Fission',2,98,51),
							('Chrono Dash',3,35,51),
							('Key insight',1,0,51),
							('Zaman Force',4,0,51),
							('Deadly Magic ',4,40,52),
							('Paker Trick',2,12,52),
							('Magic Master',1,0,52),
							('Space Escape',3,0,52),
							('Ougi: Shadow Kill',4,85,53),
							('Ninjutsu: Phantom Shuriken',2,27,53),
							('Ninjutsu: Quad Shadow',3,18,53),
							('ninjutsu: Trace of Shadow',1,0,53),
							('Deadly Stinger',3,33,54),
							('Shadow Transition',2,30,54),
							('Race Advantage',1,0,54),
							('Dark Night Falls',4,0,54),
							('Art of Hunting',3,42,55),
							('Combat Ritual',2,30,55),
							('Power of Wildness',4,2,55),
							('Blessing of Wilderness',1,0,55),
							('Law and Order',2,55,56),
							('Ring of Punishment',3,30,56),
							('Thickened Blood',1,0,56),
							('Glorious Pathway',4,0,56),
							('Strafe',2,53,57),
							('Force of the Queen',3,35,57),
							('Jungle Heart',1,0,57),
							('Heavy Crossbow',4,0,57),
							('Unstoppable Force',4,60,58),
							('Ejector',3,50,58),
							('Smart Missiles',2,26,58),
							('Mecha Suppression',1,0,58),
							('Rapid Touchdown',4,60,59),
							('Deadly Pincers',2,22,59),
							('Electromag Rays',3,18,59),
							('Electro Airbag',1,0,59),
							('Look, Leonin Crystal!',2,30,60),
							('Ha, Electrifying Beats!',4,27,60),
							('Meow, Rhythm of Joy!',3,21,60),
							('Humph, Joys Angry!',1,0,60),
							('Scythe',2,70,61),
							('Sword',3,42,61),
							('Chain',4,28,61),
							('Smiths Legacy',1,0,61),
							('Ocean Oddity',2,50,62),
							('Breath of the Ocean',3,50,62),
							('Rough Waves',4,35,62),
							('Thalassophobia',1,1,62),
							('Yin Yang Overturn',4,74,63),
							('Seimei Umbrella Open',2,39,63),
							('Yin Yang Gathering',1,0,63),
							('Rasho Umbrella Flee',3,0,63),
							('Ting Of Order',2,85,64),
							('Divine Judgment',4,60,64),
							('Lighting Bomb',3,35,64),
							('Wrath Sanction',1,0,64),
							('Shadow Assault',4,75,65),
							('Dance of Death',3,60,65),
							('Dance of Blades',2,22,65),
							('Shadow Combo',1,0,65),
							('Spinning Light Wheel',2,37,66),
							('Phantom Step',3,27,66),
							('Lightwheel Mark',1,0,66),
							('Speedy lightwheel',4,0,66),
							('Desert Tornado',2,48,67),
							('Raging Sandstorm',4,25,67),
							('Sand Walk',1,0,67),
							('Quicksand guard',3,0,67),
							('Tyrants Revenge',2,100,68),
							('Bouncing Ball',3,100,68),
							('Tyrants Rage',4,60,68),
							('Spell Curse',1,0,68),
							('Chemical Refinement',3,24,69),
							('Maximum Charge',4,10,69),
							('Chemists Instinct',1,0,69),
							('Energy Transformation',2,0,69),
							('Phantom Execution ',4,80,70),
							('Throned Rose',3,40,70),
							('Puncture',2,25,70),
							('Soul Cutter',1,0,70),
							('Bravest Fighter',4,50,71),
							('Justice Blades',2,30,71),
							('Jungle Warrior',3,20,71),
							('Homeland Defender',1,0,71),
							('Destruction Rush',4,80,72),
							('Malefic Bomb',2,40,72),
							('Void Projectile',3,32,72),
							('Malefic Gun',1,0,72),
							('Momentum',2,80,73),
							('Phantom Steed',4,55,73),
							('Decimation Assault',3,40,73),
							('The Oath Keeper',1,0,73),
							('Tactical Grenade',3,30,74),
							('Ultimate Snipe',4,30,74),
							('Lethal Shot',1,0,74),
							('Master of Camouflage',2,0,74),
							('Tempest of Blades',4,45,75),
							('Defiant Sword',3,35,75),
							('Cloud Walker',1,0,75),
							('Finch Poise',2,0,75),
							('Noumenon Blast',4,100,76),
							('Guardians Bulwark',3,50,76),
							('Charge',2,47,76),
							('Noumenon Energy Core',1,0,76),
							('Cosmic Fission',4,50,77),
							('Starlight Pulse',2,35,77),
							('Chaos Assault',3,30,77),
							('Dreamland Twist',1,0,77),
							('Rotation',3,70,78),
							('Diversion',4,36,78),
							('Duality',1,0,78),
							('Dispersion',2,0,78),
							('Magic Shockwave',2,50,79),
							('Shadow Energy',3,16,79),
							('Angry Gloom',1,0,79),
							('Black Shoes',4,0,79),
							('Decimation',4,100,80),
							('Ashura Aura',2,65,80),
							('Mortal Coil',3,30,80),
							('Ashuras Wrath',1,0,80),
							('Wild Power',2,60,81),
							('Thunderclap',4,60,81),
							('Howl Shock',3,30,81),
							('Ancient Strength',1,0,81),
							('Circling Eagle',4,45,82),
							('Soul Bloom',2,6,82),
							('Ancestral Guidance',1,0,82),
							('Guiding Wind',3,0,82),
							('Eyes on You!',3,45,83),
							('Go Away!',4,9,83),
							('Doll Buster',1,0,83),
							('Falling!',2,0,83),
							('Minoan Fury',4,32,84),
							('Despair Stomp',2,14,84),
							('Rage Mode',1,0,84),
							('Motivation Roar',3,0,84),
							('Kings Calling',4,87,85),
							('Spear of Glory',2,65,85),
							('Shield Assault',3,46,85),
							('Mark of the King',1,0,85),
							('Arrow of eclipse',3,74,86),
							('moon Blessing',1,46,86),
							('Moon Arrow',2,13,86),
							('hide moonlight',4,0,86),
							('Spear of Misery',3,46,87),
							('Spear of Destruction',4,46,87),
							('Spear of Quiescence',1,0,87),
							('Abyss Walker',2,0,87),
							('Molina Smooch',3,84,88),
							('Molina Blitz',4,46,88),
							('Molinas Gift',1,13,88),
							('Magic Boomerang',2,2,88),
							('The Hunt',4,35,89),
							('Claw Dash',2,26,89),
							('Assassin Instinct',1,0,89),
							('Smoke Bomb',3,0,89),
							('Interference!',3,10,90),
							('Superposition',2,5,90),
							('Theory of Everything',1,0,90),
							('Entropy?',4,0,90),
							('Astral Meteor',2,41,91),
							('Astral Recall',3,41,91),
							('Star Trail',1,0,91),
							('Astral Echo',4,0,91),
							('Avian Authority',2,55,92),
							('Swan Song',4,32,92),
							('Blue Nova',3,4,92),
							('Lakeshore Ambience',1,0,92),
							('Knockout Strike',4,75,93),
							('Heavy Left Punch',2,52,93),
							('Jab',3,45,93),
							('Champ Stance',1,0,93),
							('Feathered Air Stike',4,87,94),
							('Energy Impact',3,65,94),
							('Curse of Crow',2,42,94),
							('Spiritual Unity',1,0,94),
							('Demonic Force',4,92,95),
							('Astaros Eye',3,57,95),
							('Malefic Terror',2,50,95),
							('Demonic Intuition',1,0,95),
							('Popols Surprise',4,100,96),	
							('Kupa, Help!',3,21,96),
							('Biteem, Kupa!',2,19,96),
							('We Are Friends',1,0,96),
							('Holy Baptism',4,66,97),
							('Light of Retribution',2,50,97),
							('Deity Penalization',1,0,97),
							('Holy Healing',3,0,97),
							('Open Fire',2,60,98),
							('Wolf Transformation',4,50,98),
							('Full Moon Curse',1,0,98),
							('Hunters Steps',3,0,98),
							('Be Good!',2,65,99),
							('Im Offended!',4,48,99),
							('Dont Run, Wolf King!',3,5,99),
							('Lets dance!',1,0,99),
							('Orbiting Swords',2,87,100),
							('Charged',3,65,100),
							('Trilple sweep',4,13,100),
							('Enemys Bane',1,0,100),
							('Abyssal Arrow',3,80,101),
							('Abyssal Trap',2,55,101),
							('Symbiosis',1,0,101),
							('Primal  Darkness',4,0,101),
							('Imperial Justice',4,65,102),
							('Cometic Lance',2,40,102),
							('Spiral Strangling',3,36,102),
							('Knightess Resolve',1,0,102),
							('Instantaneous Move',4,45,103),
							('Simian God',1,0,103),
							('Endless Variety',2,0,103),
							('Swift Exchange',3,0,103),
							('Penalty Zone',4,60,104),
							('Execution Strike',3,45,104),
							('Revenge Strike',2,4,104),
							('Body of Smith',1,0,104),
							('Chasm Trample',3,87,105),
							('Cauterant Inferno',4,48,105),
							('Molten Scythes',2,23,105),
							('Grand Lord Lava',1,0,105),
							('Implosion ',4,43,106),
							('Attack Wave',2,42,106),
							('Sacred Hammer',3,32,106),
							('Fearless',1,0,106),
							('Transcendent Ward',3,75,107),
							('Ionic Edge',2,59,107),
							('Radiance',1,0,107),
							('Consecration',4,0,107),
							('Windstorm',4,100,108),
							('Windblow',3,61,108),
							('Wind Blade',2,45,108),
							('Windtalk',1,0,108),
							('Shadow Strike',2,66,109),
							('Arcane Shade',3,24,109),
							('Primal Force',1,0,109),
							('I Am You',4,0,109),
							('Searing Torrent',2,21,110),
							('Burst Fireball',2,14,110),
							('Ashing',1,0,110),
							('Vengeance Flame',4,0,110),
							('Cursed Blast',3,75,111),
							('Eternal Guard',4,70,111),
							('Deathly Grasp',2,11,111),
							('Nether Touch',1,0,111),
							('Crossbow of Tang',4,90,112),
							('Needles in Flowers',3,3,112),
							('Swallows Path',2,2,112),
							('Tiger Pace',1,0,112),
							('Fire Missiles',2,100,113),
							('Fire Stake',3,100,113),
							('Last Insanity',4,5,113),
							('Firaga Armor',1,0,113),
							('Infinite extension',2,54,114),
							('Mystic Field',3,36,114),
							('Dawning Light',4,10,114),
							('Transcendence',1,0,114),
							('Mountain Shocker',4,58,115),
							('Blood Floods',3,56,115),
							('Traceless',2,33,115),
							('Heavenly Vow',1,0,115),
							('Soul Grip',3,24,116),
							('Furious Drive',4,15,116),
							('Dragon Tail',2,12,116),
							('Cursing Touch',1,0,116),
							('Real World Manipulation',4,49,117),
							('Void Crystal',3,24,117),
							('Void Blast',2,1,117),
							('Galactic Power',1,0,117),
							('Mind Eater',3,59,118),
							('Hive Clones',4,51,118),
							('Nightmaric Spawn',2,50,118),
							('Decimations',1,0,118),
							('Spear Flip',2,54,119),
							('Spear Strike',3,1,119),
							('Dragon Flurry',1,0,119),
							('Supreme Warrior',4,0,119); 

select * from HABILIDADES;



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




-- ¿Qué jugador es el que ganó más partidas? ¿Con qué héroe ganó la mayoría de ellas?

SELECT TOP 1
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



-- ¿Cuál fue la partida más larga y cuál la más corta? Proporcione una lista de los nicknames de los jugadores que jugaron la partida más larga.

SELECT
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



