DELIMITER //

CREATE PROCEDURE getVehicles(
    IN idCompany VARCHAR(30)
)
BEGIN
    SELECT 
        license_plate as id,
		capacity,
		vehicle_type,
		load_type,
		model,
		brand
    FROM 
        Vehicle 
    WHERE 
        fk_nit = idCompany AND stateVehicle = 'enabled';
END //

DELIMITER ;

-- insertar vehiculos

DELIMITER //

CREATE PROCEDURE InsertVehicle (
    IN veh_license_plate VARCHAR(10),
    IN veh_capacity VARCHAR(30),
    IN veh_vehicle_type VARCHAR(50),
    IN veh_load_type VARCHAR(50),
    IN veh_model VARCHAR(30),
    IN veh_brand VARCHAR(30),
    IN veh_nit VARCHAR(30)
)
BEGIN
    INSERT INTO Vehicle (
        license_plate,
        capacity,
        vehicle_type,
        load_type,
        model,
        brand,
        fk_nit
    ) VALUES (
        veh_license_plate,
        veh_capacity,
        veh_vehicle_type,
        veh_load_type,
        veh_model,
        veh_brand,
        veh_nit
    );
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE SearchVehicleByPlate(
    IN PlateVehicle VARCHAR(50)
)BEGIN 
    SELECT license_plate FROM Vehicle WHERE license_plate = PlateVehicle;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE DisableStateVehicle(
    IN p_license_plate VARCHAR(10)
)
BEGIN
    UPDATE Vehicle
    SET stateVehicle = 'disabled'
    WHERE license_plate = p_license_plate;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE GetVehicleDetailsByLicensePlate(
    IN p_license_plate VARCHAR(10)
)
BEGIN
    SELECT
        capacity,
        vehicle_type,
        load_type,
        model,
        brand
    FROM
        Vehicle
    WHERE
        license_plate = p_license_plate
        AND stateVehicle = 'enabled';
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE GetDisabledTransportersByNit(IN input_fk_nit VARCHAR(30))
BEGIN
    SELECT imageUrl AS imgUrl, 
           name, 
           identification_card AS identification, 
           email, 
           statusTransporter 
    FROM Transporter 
    WHERE stateTransporter = 'disabled' 
      AND fk_nit = input_fk_nit;
END //

DELIMITER ;