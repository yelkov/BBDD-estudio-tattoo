/*PROCEDIMIENTO PARA INSERTAR CLIENTES*/
DELIMITER $$

DROP PROCEDURE IF EXISTS CREAR_NUEVO_CLIENTE$$
CREATE PROCEDURE CREAR_NUEVO_CLIENTE(
										IN NUEVO_DNI CHAR(9),
                                        IN NUEVO_NOMBRE VARCHAR(30),
                                        IN NUEVO_TELEF VARCHAR(15),
                                        IN NUEVO_DIRECCION VARCHAR(60),
                                        IN NUEVO_FECHA_NAC DATE,
                                        IN NUEVO_INSTAGRAM VARCHAR(30),
                                        IN NUEVO_EMAIL VARCHAR(30),
                                        IN NUEVO_DNI_TUTOR CHAR(9),
                                        IN NUEVO_NOMBRE_TUTOR VARCHAR(50),
                                        IN NUEVO_FECHA_NAC_TUTOR DATE,
                                        IN NUEVO_TELEF_TUTOR VARCHAR(15),
										IN NUEVO_PARENTESCO VARCHAR(11)
                                    )
MODIFIES SQL DATA
BEGIN
	IF DATEDIFF(CURRENT_DATE(), NUEVO_FECHA_NAC)/365 > 18 THEN
		 INSERT INTO CLIENTES
         (DNI,NOMBRE,TELEFONO,DIRECCIÓN,FECHA_NACIMIENTO,INSTAGRAM,EMAIL,TUTOR,PARENTESCO)
         VALUES
         (
			NUEVO_DNI,
            NUEVO_NOMBRE,
            NUEVO_TELEF,
            NUEVO_DIRECCION,
            NUEVO_FECHA_NAC,
            NUEVO_INSTAGRAM,
            NUEVO_EMAIL,
            NULL,
            NULL
         );
	ELSE 
		CALL CREAR_NUEVO_TUTOR(NUEVO_DNI_TUTOR,NUEVO_NOMBRE_TUTOR,NUEVO_FECHA_NAC_TUTOR,NUEVO_TELEF_TUTOR);
		INSERT INTO CLIENTES
        (DNI,NOMBRE,TELEFONO,DIRECCIÓN,FECHA_NACIMIENTO,INSTAGRAM,EMAIL,TUTOR,PARENTESCO)
         VALUES
         (
			NUEVO_DNI,
            NUEVO_NOMBRE,
            NUEVO_TELEF,
            NUEVO_DIRECCION,
            NUEVO_FECHA_NAC,
            NUEVO_INSTAGRAM,
            NUEVO_EMAIL,
            NUEVO_DNI_TUTOR,
            NUEVO_PARENTESCO
         );
	END IF;
END$$
