-- Procedimientos almacenados de la tabla vehicle

DELIMITER //
CREATE PROCEDURE SelectAllVehicles()
BEGIN
    SELECT * FROM Vehicle;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE InsertVehicle(
    IN vehicle_plate VARCHAR(10), 
    IN vehicle_description VARCHAR(255), 
    IN vehicle_capacity FLOAT,
    IN vehicle_type VARCHAR(50),
    IN load_type VARCHAR(50),
    IN vehicle_state ENUM('enabled', 'disabled'),
    IN company_nit VARCHAR(30)
)
BEGIN
    INSERT INTO Vehicle (license_plate, description, capacity, vehicle_type, load_type, stateVehicle, fk_vehicle_company_id)
    VALUES (vehicle_plate, vehicle_description, vehicle_capacity, vehicle_type, load_type, vehicle_state, company_nit);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE UpdateVehicleCapacity(
    IN vehicle_plate VARCHAR(10), 
    IN new_capacity FLOAT
)
BEGIN
    UPDATE Vehicle SET capacity = new_capacity WHERE license_plate = vehicle_plate;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE DeleteVehicle(
    IN vehicle_plate VARCHAR(10)
)
BEGIN
    DELETE FROM Vehicle WHERE license_plate = vehicle_plate;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE SumVehicleCapacity()
BEGIN
    SELECT SUM(capacity) AS total_capacity FROM Vehicle;
END //
DELIMITER ;
