DROP DATABASE IF EXISTS estudio_tattoo;
CREATE DATABASE IF NOT EXISTS estudio_tattoo;

USE estudio_tattoo;
/********* TABLA 1
            TUTORES_LEGALES **********/
            
        DROP TABLE IF EXISTS TUTORES_LEGALES;
  CREATE TABLE IF NOT EXISTS TUTORES_LEGALES (
 
	DNI CHAR(9) NOT NULL,
    NOMBRE VARCHAR(50) NOT NULL,
    FECHA_NACIMIENTO DATE NOT NULL,
    TELEFONO VARCHAR (15) NOT NULL,
    /******************************/
	PRIMARY KEY (DNI),
    UNIQUE INDEX AK_TELEFONO(TELEFONO)
 
  ) ENGINE INNODB;
  
  /********* TABLA 2
					CLIENTES **********/
  
  DROP TABLE IF EXISTS CLIENTES;
  CREATE TABLE IF NOT EXISTS CLIENTES (
  
	ID_CLIENTE INT UNSIGNED AUTO_INCREMENT NOT NULL,
    DNI CHAR (9) NOT NULL,
    NOMBRE VARCHAR(30)  NOT NULL,
    TELEFONO VARCHAR(15) NOT NULL,
    DIRECCIÓN VARCHAR(60) NOT NULL,
    FECHA_NACIMIENTO DATE NOT NULL,
    INSTAGRAM VARCHAR(30)  NULL,
    EMAIL VARCHAR(30)  NULL,
    /******************************/
    PRIMARY KEY (ID_CLIENTE),
    UNIQUE INDEX AK_DNI_CLIENTE(DNI),
    UNIQUE INDEX AK_TELEFONO_CLIENTE(TELEFONO),
    /************	RELACION TENER TUTOR ************/
    TUTOR  CHAR(9) NULL,
    PARENTESCO ENUM("PADRE/MADRE","ABUELO/A","OTRO") NULL,
    FOREIGN KEY (TUTOR) REFERENCES TUTORES_LEGALES(DNI)
				ON DELETE SET NULL
                ON UPDATE CASCADE,
	INDEX FK_TUTOR_LEGAL(TUTOR)
	
  ) ENGINE INNODB;
  
  /********* TABLA 3
					ALERGIAS_CLIENTES **********/
  
DROP TABLE IF EXISTS ALERGIAS_CLIENTES;
CREATE TABLE IF NOT EXISTS ALERGIAS_CLIENTES (
  
	CLIENTE INT UNSIGNED NOT NULL,
    ALERGIA VARCHAR(30) NOT NULL,
    /******************************/
    PRIMARY KEY (CLIENTE, ALERGIA),
    FOREIGN KEY (CLIENTE) REFERENCES CLIENTES(ID_CLIENTE)
				ON DELETE CASCADE
                ON UPDATE CASCADE,
	INDEX FK_CLIENTE_ALERGIA(CLIENTE)
    
  ) ENGINE INNODB;

  
  /********* TABLA 4
					CABINAS **********/
DROP TABLE IF EXISTS CABINAS;
CREATE TABLE IF NOT EXISTS CABINAS (
	
    ID_CABINA INT UNSIGNED AUTO_INCREMENT NOT NULL,
    UBICACION VARCHAR(30) NOT NULL,
    SUPERFICIE FLOAT UNSIGNED NOT NULL,
	PUEDE_HACER_PIERCING BOOLEAN NOT NULL,
    /******************************/
    PRIMARY KEY (ID_CABINA),
    UNIQUE INDEX AK_UBICACION (UBICACION)
)ENGINE INNODB;

 /********* TABLA 5
					HUECOS **********/
DROP TABLE IF EXISTS HUECOS;
CREATE TABLE IF NOT EXISTS HUECOS (

	NUMERO INT UNSIGNED NOT NULL,
    HORA TIME NOT NULL,
    DIA DATE NOT NULL,
    DISPONIBLE BOOLEAN NOT NULL DEFAULT TRUE,
    /************	RELACION TENER CABINA ************/
    CABINA INT UNSIGNED NOT NULL,
    FOREIGN KEY (CABINA) REFERENCES CABINAS(ID_CABINA)
			ON DELETE CASCADE
            ON UPDATE CASCADE,
	INDEX FK_CABINA_HUECO (CABINA),
    /******************************/
    PRIMARY KEY (NUMERO,CABINA),
    UNIQUE INDEX AK_DIA_HORA_CABINA(DIA,HORA,CABINA)
    
)ENGINE INNODB;

/********* TABLA 6
					PRODUCTOS **********/
DROP TABLE IF EXISTS PRODUCTOS;
CREATE TABLE IF NOT EXISTS PRODUCTOS (

	ID_PRODUCTO INTEGER UNSIGNED AUTO_INCREMENT NOT NULL,
    NOMBRE VARCHAR(30) NOT NULL,
    /******************************/
    PRIMARY KEY (ID_PRODUCTO),
    UNIQUE INDEX AK_NOMBRE(NOMBRE)

) ENGINE INNODB;

/********* TABLA 7
					AGUJAS **********/
DROP TABLE IF EXISTS AGUJAS;
CREATE TABLE IF NOT EXISTS AGUJAS (

	ID_AGUJA INT UNSIGNED AUTO_INCREMENT NOT NULL,
    NUMERO_AGUJAS ENUM ("1","3","5","7","9","11","13","14","15","17","19","21","24","27") NOT NULL,
    CONFIGURACION ENUM ("RL","RS","M1","M2","CM","F") NOT NULL,
    TAPER ENUM ("SHORT","MEDIUM","LONG","EXTRALONG") NOT NULL,
    CANTIDAD INT UNSIGNED NOT NULL,
    /******************************/
    PRIMARY KEY (ID_AGUJA),
    UNIQUE INDEX AK_TIPO_AGUJA (NUMERO_AGUJAS,CONFIGURACION,TAPER)
) ENGINE INNODB;

/********* TABLA 8
					TRABAJADORES **********/
DROP TABLE IF EXISTS TRABAJADORES;
CREATE TABLE IF NOT EXISTS TRABAJADORES (

	ID_TRABAJADOR INT UNSIGNED AUTO_INCREMENT NOT NULL,
    NIF CHAR(9) NOT NULL,
    NOMBRE VARCHAR(50) NOT NULL,
    NSS CHAR(12) NOT NULL,
    FECHA_NACIMIENTO DATE NOT NULL,
    FECHA_ALTA DATE NOT NULL,
    SALARIO FLOAT UNSIGNED NULL,
    EMAIL VARCHAR(30) NOT NULL,
    /************	RELACION SER MENTOR ************/
    MENTOR INT UNSIGNED NULL,
    FOREIGN KEY (MENTOR) REFERENCES TRABAJADORES(ID_TRABAJADOR)
			ON DELETE SET NULL
            ON UPDATE CASCADE,
    UNIQUE INDEX FK_MENTOR (MENTOR),
    /******************************/
    PRIMARY KEY (ID_TRABAJADOR),
    UNIQUE INDEX AK_NIF (NIF),
    UNIQUE INDEX AK_NSS (NSS)
    
) ENGINE INNODB;


/********* TABLA 9
					ANILLADORES **********/
DROP TABLE IF EXISTS ANILLADORES;
CREATE TABLE IF NOT EXISTS ANILLADORES (

	TRABAJADOR INT UNSIGNED NOT NULL,
    COMISION FLOAT UNSIGNED NOT NULL,
    /******************************/
    PRIMARY KEY (TRABAJADOR),
    FOREIGN KEY (TRABAJADOR) REFERENCES TRABAJADORES (ID_TRABAJADOR)
			ON DELETE CASCADE
            ON UPDATE CASCADE

)ENGINE INNODB;

/********* TABLA 10
					TATUADORES **********/
DROP TABLE IF EXISTS TATUADORES;
CREATE TABLE IF NOT EXISTS TATUADORES (

	TRABAJADOR INT UNSIGNED NOT NULL,
    COMISION FLOAT UNSIGNED NOT NULL,
    /******************************/
    PRIMARY KEY (TRABAJADOR),
    FOREIGN KEY (TRABAJADOR) REFERENCES TRABAJADORES (ID_TRABAJADOR)
			ON DELETE CASCADE
            ON UPDATE CASCADE

)ENGINE INNODB;

  /********* TABLA 11
					TELEFONOS_TRABAJADORES **********/
  
DROP TABLE IF EXISTS TELEFONOS_TRABAJADORES;
CREATE TABLE IF NOT EXISTS TELEFONOS_TRABAJADORES (
  
	TRABAJADOR INT UNSIGNED NOT NULL,
    TELEFONO VARCHAR(15) NOT NULL,
    /******************************/
    PRIMARY KEY (TRABAJADOR, TELEFONO),
    FOREIGN KEY (TRABAJADOR) REFERENCES TRABAJADORES(ID_TRABAJADOR)
				ON DELETE CASCADE
                ON UPDATE CASCADE,
	INDEX FK_TRABAJADOR_TELEFONO(TRABAJADOR)
    
  ) ENGINE INNODB;

/********* TABLA 12
					CITAS **********/
DROP TABLE IF EXISTS CITAS;
CREATE TABLE IF NOT EXISTS CITAS (

	ID_CITA INT UNSIGNED AUTO_INCREMENT NOT NULL,
    TIPO ENUM("0","1") NOT NULL,  /* 0 PARA CITAS DE TATUAJE Y 1 PARA CITAS DE PIERCING*/
    FECHA_HORA DATETIME NOT NULL,
    DESCRIPCION VARCHAR(60) NOT NULL,
    SEÑAL FLOAT UNSIGNED NOT NULL DEFAULT 0.0,
    PRECIO FLOAT UNSIGNED NOT NULL,
    ESTADO ENUM("RESERVADA","REALIZADA") NOT NULL DEFAULT "RESERVADA",
    /************	RELACION REALIZAR TATUAJE ************/
    TATUADOR INT UNSIGNED NOT NULL,
    FOREIGN KEY (TATUADOR) REFERENCES TATUADORES(TRABAJADOR)
			ON DELETE RESTRICT
            ON UPDATE CASCADE,
	INDEX FK_TATUADOR (TATUADOR),
    /************	RELACION REALIZAR PIERCING ************/
    ANILLADOR INT UNSIGNED NOT NULL,
    FOREIGN KEY (ANILLADOR) REFERENCES ANILLADORES(TRABAJADOR)
			ON DELETE RESTRICT
            ON UPDATE CASCADE,
	INDEX FK_ANILLADOR (ANILLADOR),
    /************	RELACION LLEVAR A CABO EN ************/
    CABINA INT UNSIGNED NOT NULL,
    FOREIGN KEY (CABINA) REFERENCES CABINAS(ID_CABINA)
			ON DELETE RESTRICT
            ON UPDATE CASCADE,
	INDEX FK_CABINA (CABINA),
    /******************************/
    PRIMARY KEY (ID_CITA),
    UNIQUE INDEX AK_FECHA_HORA_CABINA (FECHA_HORA,CABINA)

) ENGINE INNODB;

/********* TABLA 13
					CITAS_CLIENTES **********/
DROP TABLE IF EXISTS CITAS_CLIENTES;
CREATE TABLE IF NOT EXISTS CITAS_CLIENTES (

	CLIENTE INT UNSIGNED NOT NULL,
    CITA INT UNSIGNED NOT NULL,
    /******************************/
    PRIMARY KEY (CLIENTE,CITA),
    FOREIGN KEY (CLIENTE) REFERENCES CLIENTES(ID_CLIENTE)
			ON DELETE RESTRICT
			ON UPDATE CASCADE,
	FOREIGN KEY (CITA) REFERENCES CITAS(ID_CITA)
			ON DELETE CASCADE
			ON UPDATE CASCADE
)  ENGINE INNODB;

/********* TABLA 14
					CITAS_AGUJAS **********/
DROP TABLE IF EXISTS CITAS_AGUJAS;
CREATE TABLE IF NOT EXISTS CITAS_AGUJAS (

	AGUJA INT UNSIGNED NOT NULL,
    CITA INT UNSIGNED NOT NULL,
    CANTIDAD_USADA INT UNSIGNED NOT NULL,
    /******************************/
    PRIMARY KEY (AGUJA,CITA),
    FOREIGN KEY (AGUJA) REFERENCES AGUJAS(ID_AGUJA)
			ON DELETE RESTRICT
			ON UPDATE CASCADE,
	FOREIGN KEY (CITA) REFERENCES CITAS(ID_CITA)
			ON DELETE CASCADE
			ON UPDATE CASCADE
)  ENGINE INNODB;

/********* TABLA 15
					PRODUCTOS_CABINAS **********/
DROP TABLE IF EXISTS PRODUCTOS_CABINAS;
CREATE TABLE IF NOT EXISTS PRODUCTOS_CABINAS (

	CABINA INT UNSIGNED NOT NULL,
    PRODUCTO INT UNSIGNED NOT NULL,
    CANTIDAD_DISPONIBLE INT UNSIGNED,
    FECHA_CADUCIDAD DATE NULL,
    /******************************/
    PRIMARY KEY (CABINA,PRODUCTO),
    FOREIGN KEY (CABINA) REFERENCES CABINAS(ID_CABINA)
			ON DELETE RESTRICT
			ON UPDATE CASCADE,
	FOREIGN KEY (PRODUCTO) REFERENCES PRODUCTOS(ID_PRODUCTO)
			ON DELETE CASCADE
			ON UPDATE CASCADE
)  ENGINE INNODB;


