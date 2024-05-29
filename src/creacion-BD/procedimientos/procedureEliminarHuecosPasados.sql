/*Procedimiento para borrar huecos de cabina que hayan quedado vacíos una vez pasada la fecha del hueco*/
DELIMITER $$

DROP PROCEDURE IF EXISTS ELIMINAR_HUECOS_VACIOS_PASADOS$$
CREATE PROCEDURE ELIMINAR_HUECOS_VACIOS_PASADOS()
MODIFIES SQL DATA
BEGIN
	DELETE FROM HUECOS
		WHERE DIA < CURRENT_DATE()
			AND
		CITA IS NULL;
END$$