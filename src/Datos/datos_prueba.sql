/*============== INTRODUCCION DE DATOS DE PRUEBA ==============*/

/*AGUJAS*/
INSERT INTO `estudio_tattoo`.`AGUJAS` (`NUMERO_AGUJAS`, `CONFIGURACION`, `TAPER`, `CANTIDAD`) VALUES ('1', 'RL', 'MEDIUM', '50');
INSERT INTO `estudio_tattoo`.`AGUJAS` (`NUMERO_AGUJAS`, `CONFIGURACION`, `TAPER`, `CANTIDAD`) VALUES ('3', 'RL', 'MEDIUM', '50');
INSERT INTO `estudio_tattoo`.`AGUJAS` (`NUMERO_AGUJAS`, `CONFIGURACION`, `TAPER`, `CANTIDAD`) VALUES ('5', 'RL', 'MEDIUM', '50');
INSERT INTO `estudio_tattoo`.`AGUJAS` (`NUMERO_AGUJAS`, `CONFIGURACION`, `TAPER`, `CANTIDAD`) VALUES ('7', 'RL', 'MEDIUM', '50');
INSERT INTO `estudio_tattoo`.`AGUJAS` (`NUMERO_AGUJAS`, `CONFIGURACION`, `TAPER`, `CANTIDAD`) VALUES ('9', 'RL', 'MEDIUM', '50');
INSERT INTO `estudio_tattoo`.`AGUJAS` (`NUMERO_AGUJAS`, `CONFIGURACION`, `TAPER`, `CANTIDAD`) VALUES ('3', 'RS', 'SHORT', '25');
INSERT INTO `estudio_tattoo`.`AGUJAS` (`NUMERO_AGUJAS`, `CONFIGURACION`, `TAPER`, `CANTIDAD`) VALUES ('9', 'RS', 'SHORT', '25');
INSERT INTO `estudio_tattoo`.`AGUJAS` (`NUMERO_AGUJAS`, `CONFIGURACION`, `TAPER`, `CANTIDAD`) VALUES ('11', 'RS', 'MEDIUM', '25');
INSERT INTO `estudio_tattoo`.`AGUJAS` (`NUMERO_AGUJAS`, `CONFIGURACION`, `TAPER`, `CANTIDAD`) VALUES ('13', 'M1', 'MEDIUM', '50');
INSERT INTO `estudio_tattoo`.`AGUJAS` (`NUMERO_AGUJAS`, `CONFIGURACION`, `TAPER`, `CANTIDAD`) VALUES ('17', 'M1', 'MEDIUM', '50');
INSERT INTO `estudio_tattoo`.`AGUJAS` (`NUMERO_AGUJAS`, `CONFIGURACION`, `TAPER`, `CANTIDAD`) VALUES ('24', 'M1', 'MEDIUM', '50');
INSERT INTO `estudio_tattoo`.`AGUJAS` (`NUMERO_AGUJAS`, `CONFIGURACION`, `TAPER`, `CANTIDAD`) VALUES ('13', 'CM', 'MEDIUM', '50');
INSERT INTO `estudio_tattoo`.`AGUJAS` (`NUMERO_AGUJAS`, `CONFIGURACION`, `TAPER`, `CANTIDAD`) VALUES ('15', 'CM', 'MEDIUM', '50');
INSERT INTO `estudio_tattoo`.`AGUJAS` (`NUMERO_AGUJAS`, `CONFIGURACION`, `TAPER`, `CANTIDAD`) VALUES ('3', 'RL', 'LONG', '25');
INSERT INTO `estudio_tattoo`.`AGUJAS` (`NUMERO_AGUJAS`, `CONFIGURACION`, `TAPER`, `CANTIDAD`) VALUES ('5', 'RL', 'LONG', '25');


/*TRABAJADORES*/
INSERT INTO `estudio_tattoo`.`TRABAJADORES` (`NIF`, `NOMBRE`, `NSS`, `FECHA_NACIMIENTO`, `FECHA_ALTA`, `EMAIL`) VALUES ('33445556Y', 'Armando Barullo Seguro', '1234567891', '2001-09-11', '2024-02-01', 'armando.barullo@gmail.com');
INSERT INTO `estudio_tattoo`.`TRABAJADORES` (`NIF`, `NOMBRE`, `NSS`, `FECHA_NACIMIENTO`, `FECHA_ALTA`, `EMAIL`) VALUES ('99887766N', 'Joseba Cilarte', '9876543212', '1995-07-07', '2020-02-28', 'j.cilarte@hotmail.com');
INSERT INTO `estudio_tattoo`.`TRABAJADORES` (`NIF`, `NOMBRE`, `NSS`, `FECHA_NACIMIENTO`, `FECHA_ALTA`, `SALARIO`, `EMAIL`) VALUES ('32456798L', 'Elena Nito del Bosque', '8887776661', '1989-05-23', '2018-06-20', '1100', 'elenaNito@protommail.com');
INSERT INTO `estudio_tattoo`.`TRABAJADORES` (`NIF`, `NOMBRE`, `NSS`, `FECHA_NACIMIENTO`, `FECHA_ALTA`, `EMAIL`) VALUES ('77889988G', 'Ana Lladora Buena', '9998881112', '1999-12-31', '2021-03-21', 'anita.piercing@gmail.com');
INSERT INTO `estudio_tattoo`.`TRABAJADORES` (`NIF`, `NOMBRE`, `NSS`, `FECHA_NACIMIENTO`, `FECHA_ALTA`, `EMAIL`) VALUES ('44455566K', 'Paco Merlo Toito', '1234568765', '1994-04-12', '2022-10-05', 'paquito.ttt@gmail.com');
INSERT INTO `estudio_tattoo`.`TRABAJADORES` (`NIF`, `NOMBRE`, `NSS`, `FECHA_NACIMIENTO`, `FECHA_ALTA`, `EMAIL`) VALUES ('11122233T', 'Aitor Tilla Rica', '9998887776', '1993-02-09', '2023-11-23', 'aitor.tattoer@gmail.com');
UPDATE `estudio_tattoo`.`TRABAJADORES` SET `MENTOR` = '2' WHERE (`ID_TRABAJADOR` = '6');
UPDATE `estudio_tattoo`.`trabajadores` SET `MENTOR` = '3' WHERE (`ID_TRABAJADOR` = '1');

/*TATUADORES*/
INSERT INTO `estudio_tattoo`.`TATUADORES` (`TRABAJADOR`, `COMISION`) VALUES ('1', '60');
INSERT INTO `estudio_tattoo`.`TATUADORES` (`TRABAJADOR`, `COMISION`) VALUES ('2', '60');
INSERT INTO `estudio_tattoo`.`TATUADORES` (`TRABAJADOR`, `COMISION`) VALUES ('5', '60');
INSERT INTO `estudio_tattoo`.`TATUADORES` (`TRABAJADOR`, `COMISION`) VALUES ('6', '60');

/*ANILLADORES*/
INSERT INTO `estudio_tattoo`.`ANILLADORES` (`TRABAJADOR`, `COMISION`) VALUES ('4', '70');
INSERT INTO `estudio_tattoo`.`ANILLADORES` (`TRABAJADOR`, `COMISION`) VALUES ('2', '70');

/*TELELFONOS_TRABAJADORES*/
INSERT INTO `estudio_tattoo`.`TELEFONOS_TRABAJADORES` (`TRABAJADOR`, `TELEFONO`) VALUES ('1', '738124497');
INSERT INTO `estudio_tattoo`.`TELEFONOS_TRABAJADORES` (`TRABAJADOR`, `TELEFONO`) VALUES ('1', '622837285');
INSERT INTO `estudio_tattoo`.`TELEFONOS_TRABAJADORES` (`TRABAJADOR`, `TELEFONO`) VALUES ('2', '712280433');
INSERT INTO `estudio_tattoo`.`TELEFONOS_TRABAJADORES` (`TRABAJADOR`, `TELEFONO`) VALUES ('3', '792880017');
INSERT INTO `estudio_tattoo`.`TELEFONOS_TRABAJADORES` (`TRABAJADOR`, `TELEFONO`) VALUES ('4', '734345034');
INSERT INTO `estudio_tattoo`.`TELEFONOS_TRABAJADORES` (`TRABAJADOR`, `TELEFONO`) VALUES ('4', '664190214');
INSERT INTO `estudio_tattoo`.`TELEFONOS_TRABAJADORES` (`TRABAJADOR`, `TELEFONO`) VALUES ('5', '603262915');
INSERT INTO `estudio_tattoo`.`TELEFONOS_TRABAJADORES` (`TRABAJADOR`, `TELEFONO`) VALUES ('6', '611061270');

/*CABINAS*/
INSERT INTO `estudio_tattoo`.`CABINAS` (`UBICACION`, `SUPERFICIE`, `PUEDE_HACER_PIERCING`) VALUES ('FONDO', '12.5', '1');
INSERT INTO `estudio_tattoo`.`CABINAS` (`UBICACION`, `SUPERFICIE`, `PUEDE_HACER_PIERCING`) VALUES ('ENTRADA', '10.25', '0');
INSERT INTO `estudio_tattoo`.`CABINAS` (`UBICACION`, `SUPERFICIE`, `PUEDE_HACER_PIERCING`) VALUES ('MEDIO VENTANA', '14.5', '0');
INSERT INTO `estudio_tattoo`.`CABINAS` (`UBICACION`, `SUPERFICIE`, `PUEDE_HACER_PIERCING`) VALUES ('MEDIO CAMARA', '12.0', '1');


/*CLIENTES*/
INSERT INTO `estudio_tattoo`.`CLIENTES` (`DNI`, `NOMBRE`, `TELEFONO`, `DIRECCIÓN`, `FECHA_NACIMIENTO`, `EMAIL`) VALUES ('99228844M', 'Mipri Mer Cliente', '611454545', 'Calle Larga 32', '2000-07-07', 'mipri.mc@gmail.com');
INSERT INTO `estudio_tattoo`.`CLIENTES` (`DNI`, `NOMBRE`, `TELEFONO`, `DIRECCIÓN`, `FECHA_NACIMIENTO`, `EMAIL`) VALUES ('88999988H', 'Agrícolo Pérez', '622345678', 'Rúa labranza 12, Vigo', '1964-07-21', 'agricolo.granja@gmail.com');
INSERT INTO `estudio_tattoo`.`CLIENTES` (`DNI`, `NOMBRE`, `TELEFONO`, `DIRECCIÓN`, `FECHA_NACIMIENTO`, `EMAIL`) VALUES ('33488829R', 'Ferran Millan', '722545743', 'Alameda Iglesia, 24, 30150, Abanilla(murcia)', '1995-12-06', 'zcq35m1t3@yahoo.es');
INSERT INTO `estudio_tattoo`.`CLIENTES` (`DNI`, `NOMBRE`, `TELEFONO`, `DIRECCIÓN`, `FECHA_NACIMIENTO`, `EMAIL`) VALUES ('67525870D', 'Yolanda Olmo', '765015602', 'Jardines Catalunya, 78', '2001-05-29', 'zcq35m1t3@yahoo.es');
INSERT INTO `estudio_tattoo`.`CLIENTES` (`DNI`, `NOMBRE`, `TELEFONO`, `DIRECCIÓN`, `FECHA_NACIMIENTO`, `EMAIL`) VALUES ('70625723Z', 'Claudia Cobos', '638996591', 'Parque Nueva, 99 Zaragoza ', '1982-09-11', '5reyyelyx@journalism.com');
INSERT INTO `estudio_tattoo`.`CLIENTES` (`DNI`, `NOMBRE`, `TELEFONO`, `DIRECCIÓN`, `FECHA_NACIMIENTO`, `EMAIL`) VALUES ('15857824Z', 'Fidel Moral Arroyo', '736552574', 'Polígono Nueva, 88, 44109, Torrevelilla(teruel)', '1977-11-22', '1myvk6g3ni@yahoo.com');
INSERT INTO `estudio_tattoo`.`CLIENTES` (`DNI`, `NOMBRE`, `TELEFONO`, `DIRECCIÓN`, `FECHA_NACIMIENTO`, `EMAIL`) VALUES ('19788750X', 'Isabel Alcaraz Cabezas', '798882576', 'Travesía Nueva, 48, 41312, Constantina(sevilla)', '1974-08-27', 'p1oaqrn3oe@lycos.nl');
INSERT INTO `estudio_tattoo`.`CLIENTES` (`DNI`, `NOMBRE`, `TELEFONO`, `DIRECCIÓN`, `FECHA_NACIMIENTO`, `EMAIL`) VALUES ('88984923Q', 'Maria Concepcion', '771514845', 'Poblado Iglesia, 51,  Royo, El(soria)', '1974-01-08', 'f1limrds@teacher.com');
INSERT INTO `estudio_tattoo`.`CLIENTES` (`DNI`, `NOMBRE`, `TELEFONO`, `DIRECCIÓN`, `FECHA_NACIMIENTO`, `EMAIL`) VALUES ('03248042M', 'Edgar Andreu Bello', '673156446', 'Plazuela Iglesia, 31,  Peralta(huesca)', '1981-10-21', 'f19c0kn0l@netscape.com');
INSERT INTO `estudio_tattoo`.`CLIENTES` (`DNI`, `NOMBRE`, `TELEFONO`, `DIRECCIÓN`, `FECHA_NACIMIENTO`, `EMAIL`) VALUES ('27332143R', 'Maria Mar Duarte Roldan', '654212978', 'Barrio Real, 47,  Hoyo De Pinares, El(ávila)', '1983-07-09', 'bak5rbjcw@aim.com');
INSERT INTO `estudio_tattoo`.`CLIENTES` (`DNI`, `NOMBRE`, `TELEFONO`, `DIRECCIÓN`, `FECHA_NACIMIENTO`, `EMAIL`) VALUES ('08776316E', 'Enric Carrera Prieto', '627954602', 'Carretera Horno, 1, Martín Muñoz De La Dehesa(segovia)', '1990-10-04', 'y1f45woyz@msn.com');
INSERT INTO `estudio_tattoo`.`CLIENTES` (`DNI`, `NOMBRE`, `TELEFONO`, `DIRECCIÓN`, `FECHA_NACIMIENTO`, `EMAIL`) VALUES ('30350524T', 'Enriqueta Barroso Vazquez', '702885215', 'Plaça Real, 35, Navalmoral De Béjar(salamanca)', '2007-12-07', '5h0tazwlig@yahoo.com');
INSERT INTO `estudio_tattoo`.`CLIENTES` (`DNI`, `NOMBRE`, `TELEFONO`, `DIRECCIÓN`, `FECHA_NACIMIENTO`, `EMAIL`) VALUES ('91909557Q', 'German Tena Campo', '613291901', 'Avenida Mayor, 61, Esgos(ourense)', '2001-04-09', 'zurp8p89@netscape.net');
INSERT INTO `estudio_tattoo`.`CLIENTES` (`DNI`, `NOMBRE`, `TELEFONO`, `DIRECCIÓN`, `FECHA_NACIMIENTO`, `EMAIL`) VALUES ('45104684M', 'Estela Sancho Reyes', '672306906', 'Estrada De España, 96 Carenas(zaragoza)', '1997-03-10', '8rwtzgwof@witty.com');


/*TUTORES CLIENTES*/
INSERT INTO `estudio_tattoo`.`TUTORES_LEGALES` (`DNI`, `NOMBRE`, `FECHA_NACIMIENTO`, `TELEFONO`) VALUES ('21156997X', 'Eric Egea Brito', '1950-08-07', '987665544');
UPDATE `estudio_tattoo`.`CLIENTES` SET `TUTOR` = '21156997X', `PARENTESCO` = 'PADRE/MADRE' WHERE (`ID_CLIENTE` = '12');


/*PRODUCTOS*/
INSERT INTO `estudio_tattoo`.`PRODUCTOS` (`NOMBRE`) VALUES ('vaselina');
INSERT INTO `estudio_tattoo`.`PRODUCTOS` (`NOMBRE`) VALUES ('rollo film transparente');
INSERT INTO `estudio_tattoo`.`PRODUCTOS` (`NOMBRE`) VALUES ('rollo papel camilla');
INSERT INTO `estudio_tattoo`.`PRODUCTOS` (`NOMBRE`) VALUES ('rollo papel absorbente');
INSERT INTO `estudio_tattoo`.`PRODUCTOS` (`NOMBRE`) VALUES ('tijera');
INSERT INTO `estudio_tattoo`.`PRODUCTOS` (`NOMBRE`) VALUES ('bolsas basura');
INSERT INTO `estudio_tattoo`.`PRODUCTOS` (`NOMBRE`) VALUES ('bote cups pequeños');
INSERT INTO `estudio_tattoo`.`PRODUCTOS` (`NOMBRE`) VALUES ('bote cups medianos');
INSERT INTO `estudio_tattoo`.`PRODUCTOS` (`NOMBRE`) VALUES ('bote cups grandes');
INSERT INTO `estudio_tattoo`.`PRODUCTOS` (`NOMBRE`) VALUES ('caja depresores');
INSERT INTO `estudio_tattoo`.`PRODUCTOS` (`NOMBRE`) VALUES ('caja guantes');
INSERT INTO `estudio_tattoo`.`PRODUCTOS` (`NOMBRE`) VALUES ('caja cubreclipcord');

