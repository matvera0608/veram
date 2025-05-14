DELIMITER //
CREATE TRIGGER CalcularEdadDinámicamente
BEFORE INSERT ON alumno
FOR EACH ROW
BEGIN
	DECLARE FechaActual DATE;
	SET FechaActual = CURDATE();
    SET NEW.Edad = YEAR(CURDATE()) - YEAR(NEW.FechaDeNacimiento) -
    (DATE_FORMAT(CURDATE(), '%m-%d') < DATE_FORMAT(NEW.FechaDeNacimiento, '%m-%d'));
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER ActualizarEdadDinámicamente
BEFORE UPDATE ON alumno
FOR EACH ROW
BEGIN
    SET NEW.Edad = YEAR(CURDATE()) - YEAR(NEW.FechaDeNacimiento) -
    (DATE_FORMAT(CURDATE(), '%m-%d') < DATE_FORMAT(NEW.FechaDeNacimiento, '%m-%d'));
END;
//
DELIMITER ;