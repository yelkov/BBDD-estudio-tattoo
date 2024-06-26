/*PROCEDIMIENTO CREAR NUEVA CITA*/
DELIMITER $$

DROP PROCEDURE IF EXISTS CREAR_NUEVA_CITA$$
CREATE PROCEDURE CREAR_NUEVA_CITA(
									IN NUEVO_TIPO VARCHAR(8),
                                    IN NUEVA_DESCRIPCION VARCHAR(60),
                                    IN NUEVA_SEÑAL FLOAT,
                                    IN NUEVO_PRECIO FLOAT,
                                    IN NUEVO_ESTADO CHAR(9),
                                    IN NUEVO_TATUADOR INT UNSIGNED,
                                    IN NUEVO_ANILLADOR INT UNSIGNED,
                                    IN NUEVA_CABINA INT UNSIGNED
                                 )
MODIFIES SQL DATA
BEGIN
	START TRANSACTION;
    
    INSERT INTO CITAS
    (TIPO,DESCRIPCION,SEÑAL,PRECIO,ESTADO,TATUADOR,ANILLADOR,CABINA)
    VALUES
    (NUEVO_TIPO,NUEVA_DESCRIPCION,NUEVA_SEÑAL,NUEVO_PRECIO,NUEVO_ESTADO,NUEVO_TATUADOR,NUEVO_ANILLADOR,NUEVA_CABINA);
    
    COMMIT;

END$$