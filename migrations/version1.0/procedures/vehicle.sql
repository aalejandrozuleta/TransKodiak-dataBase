-- Registrar Vehiculo
DELIMITER //
CREATE PROCEDURE RegistrarVehiculo(
    IN p_license_plate VARCHAR(10),
    IN p_description VARCHAR(255),
    IN p_capacity FLOAT,
    IN p_vehicle_type VARCHAR(50),
    IN p_load_type VARCHAR(50),
)
BEGIN
    INSERT INTO Vehicle (license_plate, description, capacity, vehicle_type, load_type, stateVehicle)
    VALUES (p_license_plate, p_description, p_capacity, p_vehicle_type, p_load_type, 'enabled');
END //
DELIMITER ;


-- Consultar Vehiculo

DELIMITER //
CREATE PROCEDURE ConsultarVehiculo(
    IN p_license_plate VARCHAR(10)
)
BEGIN
    SELECT * FROM Vehicle WHERE license_plate = p_license_plate;

END //
DELIMITER ;


-- Actualizar Vehiculo 

DELIMITER //

CREATE PROCEDURE ActualizarVehiculo(
    IN p_license_plate VARCHAR(10),
    IN p_description VARCHAR(255),
    IN p_capacity FLOAT,
    IN p_vehicle_type VARCHAR(50),
    IN p_load_type VARCHAR(50)
)
BEGIN
    UPDATE Vehicle 
    SET description = p_description, capacity = p_capacity, vehicle_type = p_vehicle_type, load_type = p_load_type
    WHERE license_plate = p_license_plate;
END//
DELIMITER ;


-- Deshabilitar Vehiculo

DELIMITER //
CREATE PROCEDURE DeshabilitarVehiculo(
    IN p_license_plate VARCHAR(10)
)
BEGIN
    UPDATE Vehicle 
    SET stateVehicle = 'disabled'
    WHERE license_plate = p_license_plate;
END//

DELIMITER ;


