--Actualizar el recuento de transportistas y vehículos:
--Este disparador se activará después de cada inserción en la tabla Transporter o Vehicle, actualizando automáticamente los recuentos correspondientes en la tabla Vehicle_Company.

DELIMITER //
CREATE TRIGGER update_counts_after_insert
AFTER INSERT ON Transporter
FOR EACH ROW
BEGIN
    UPDATE Vehicle_Company
    SET transporter_count = transporter_count + 1
    WHERE nit = NEW.fk_nit;
END//

CREATE TRIGGER update_counts_after_insert_vehicle
AFTER INSERT ON Vehicle
FOR EACH ROW
BEGIN
    UPDATE Vehicle_Company
    SET vehicle_count = vehicle_count + 1
    WHERE nit = NEW.fk_vehicle_company_id;
END//
DELIMITER ;

--------------------------------------------------------------------------------------------------------------------------------
--Actualizar el recuento de transportistas y vehículos después de eliminar:
--Este disparador se activará después de cada eliminación en las tablas Transporter o Vehicle, actualizando automáticamente los recuentos correspondientes en la tabla Vehicle_Company.

DELIMITER //
CREATE TRIGGER update_counts_after_delete
AFTER DELETE ON Transporter
FOR EACH ROW
BEGIN
    UPDATE Vehicle_Company
    SET transporter_count = transporter_count - 1
    WHERE nit = OLD.fk_nit;
END//

CREATE TRIGGER update_counts_after_delete_vehicle
AFTER DELETE ON Vehicle
FOR EACH ROW
BEGIN
    UPDATE Vehicle_Company
    SET vehicle_count = vehicle_count - 1
    WHERE nit = OLD.fk_vehicle_company_id;
END//
DELIMITER ;

--------------------------------------------------------------------------------------------------------------------------------
--Bloquear la compañía después de múltiples intentos fallidos de inicio de sesión:
--disparador se activa después de cada actualización en el contador de intentos de inicio de sesión, verificando si el contador ha alcanzado un límite y bloqueando la compañía si es así.

DELIMITER //
CREATE TRIGGER lock_company_after_failed_login
AFTER UPDATE ON Vehicle_Company
FOR EACH ROW
BEGIN
    IF NEW.login_attempts >= 3 THEN
        SET NEW.locked_until = DATE_ADD(NOW(), INTERVAL 15 MINUTE);
    END IF;
END//
DELIMITER ;