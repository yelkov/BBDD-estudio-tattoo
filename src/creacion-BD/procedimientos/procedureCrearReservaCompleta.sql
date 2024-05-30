/*PROCEDIMIENTO PARA CREAR CITAS*/
DELIMITER $$

DROP PROCEDURE IF EXISTS CREAR_RESERVA_COMPLETA$$
CREATE PROCEDURE CREAR_RESERVA_COMPLETA(
									INOUT CLAVE_CITA INT UNSIGNED,
									INOUT CLAVE_CLIENTE INT UNSIGNED,
								/*********DATOS TABLA CITA*********/
									IN NUEVO_TIPO VARCHAR(8),
                                    IN NUEVA_DESCRIPCION VARCHAR(60),
                                    IN NUEVA_SEÑAL FLOAT,
                                    IN NUEVO_PRECIO FLOAT,
                                    IN NUEVO_ESTADO CHAR(9),
                                    IN NUEVO_TATUADOR INT UNSIGNED,
                                    IN NUEVO_ANILLADOR INT UNSIGNED,
                                    IN NUEVA_CABINA INT UNSIGNED,
								/********DATOS TABLA HUECOS*********/
                                    IN DIA_CITA DATE,
                                    IN HORA_CITA TIME,
                                    IN CANTIDAD_HUECOS INT UNSIGNED,
								/*******DATOS TABLA CLIENTES********/
                                    IN NUEVO_DNI CHAR(9),
                                    IN NUEVO_NOMBRE VARCHAR(30),
                                    IN NUEVO_TELEF VARCHAR(15),
                                    IN NUEVO_DIRECCION VARCHAR(60),
                                    IN NUEVO_FECHA_NAC DATE,
                                    IN NUEVO_INSTAGRAM VARCHAR(30),
                                    IN NUEVO_EMAIL VARCHAR(30),
								/******DATOS TABLA TUTORES LEGALES*******/
                                    IN NUEVO_DNI_TUTOR CHAR(9),
                                    IN NUEVO_NOMBRE_TUTOR VARCHAR(50),
                                    IN NUEVO_FECHA_NAC_TUTOR DATE,
                                    IN NUEVO_TELEF_TUTOR VARCHAR(15),
                                    IN NUEVO_PARENTESCO VARCHAR(11)
                                 )
MODIFIES SQL DATA
BEGIN
    
    START TRANSACTION;
    /*===================================================*/    
    /**			CREAMOS LA CITA SI NO EXISTE			**/
    IF CLAVE_CITA IS NULL
		OR 
        CLAVE_CITA NOT IN (
							SELECT	ID_CITA
								FROM CITAS
						  )
		THEN CALL CREAR_NUEVA_CITA(
									NUEVO_TIPO,
                                    NUEVA_DESCRIPCION,
                                    NUEVA_SEÑAL,
                                    NUEVO_PRECIO,
                                    NUEVO_ESTADO,
                                    NUEVO_TATUADOR,
                                    NUEVO_ANILLADOR,
                                    NUEVA_CABINA
								  );
    
		/**	Y OBTENEMOS LA NUEVA CLAVE DE CITA**/
		SELECT	ID_CITA INTO CLAVE_CITA
			FROM CITAS
			WHERE CONCAT(DESCRIPCION,CABINA) = CONCAT(NUEVA_DESCRIPCION,NUEVA_CABINA);
	END IF;
        
    /*===================================================================*/    
    /**				RESERVAMOS LOS HUECOS SI ESTAN LIBRES				**/
    IF DIA_CITA IS NOT NULL
		AND
        HORA_CITA IS NOT NULL
        THEN CALL RESERVAR_HUECOS(DIA_CITA, HORA_CITA, CANTIDAD_HUECOS, NUEVA_CABINA, CLAVE_CITA);
	END IF;
    
    /*===================================================================*/    
    /**					 CREAMOS CLIENTE SI NO EXISTE					**/
	IF CLAVE_CLIENTE IS NULL 
		OR
        CLAVE_CLIENTE NOT IN (
								SELECT ID_CLIENTE
									FROM CLIENTES
                             )
		THEN CALL CREAR_NUEVO_CLIENTE(
									NUEVO_DNI,
                                    NUEVO_NOMBRE,
                                    NUEVO_TELEF,
                                    NUEVO_DIRECCION,
                                    NUEVO_FECHA_NAC,
                                    NUEVO_INSTAGRAM,
                                    NUEVO_EMAIL,
                                    NUEVO_DNI_TUTOR,
                                    NUEVO_NOMBRE_TUTOR,
                                    NUEVO_FECHA_NAC_TUTOR,
                                    NUEVO_TELEF_TUTOR,
                                    NUEVO_PARENTESCO
								);
		/*Y SELECCIONAMOS CLAVE DE CLIENTE*/
		SELECT ID_CLIENTE INTO CLAVE_CLIENTE
			FROM CLIENTES
			WHERE DNI = NUEVO_DNI;
    END IF;
    
	/*===================================================================*/    
    /**					 ASIGNAMOS CITA A CLIENTE						**/
    CALL ASIGNAR_CITA_CLIENTE(CLAVE_CITA,CLAVE_CLIENTE);
    
	COMMIT;

END$$
