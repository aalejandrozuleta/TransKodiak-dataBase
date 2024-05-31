-- insertar viaje

DELIMITER //

CREATE PROCEDURE RegisterTravel(
    IN p_weight INT UNSIGNED,
    IN p_origin VARCHAR(100),
    IN p_destination VARCHAR(100),
    IN p_payment FLOAT UNSIGNED,
    IN p_description VARCHAR(255),
    IN p_departureDate DATE,
    IN p_deliverDate DATE
)
BEGIN
    INSERT INTO Travel (weight, origin, destination, payment, description, departureDate, deliverDate, stateTravel, fk_transporter_id, fk_intermediary_id)
    VALUES (p_weight, p_origin, p_destination, p_payment, p_description, p_departureDate, p_deliverDate, 'enabled');
END //

DELIMITER ;

------------------------------------------------------------------------------------------------------------

--consultar viaje por id

DELIMITER //

CREATE PROCEDURE GetTravelById(
    IN p_trip_id INT
)
BEGIN
    SELECT * FROM Travel
    WHERE trip_id = p_trip_id;
END //

DELIMITER ;

-----------------------------------------------------------------------------------------------

--deshabilitar viaje

DELIMITER //

CREATE PROCEDURE DisableTravel(
    IN p_trip_id INT
)
BEGIN
    UPDATE Travel
    SET stateTravel = 'disabled'
    WHERE trip_id = p_trip_id;
END //

DELIMITER ;

-------------------------------------------------------------------

--Actualizar viaje

DELIMITER //

CREATE PROCEDURE UpdateTravel(
    IN p_trip_id INT,
    IN p_weight INT UNSIGNED,
    IN p_origin VARCHAR(100),
    IN p_destination VARCHAR(100),
    IN p_payment FLOAT UNSIGNED,
    IN p_description VARCHAR(255),
    IN p_departureDate DATE,
    IN p_deliverDate DATE,
    IN p_stateTravel ENUM('enabled', 'disabled'),
    IN p_fk_transporter_id INT,
    IN p_fk_intermediary_id INT
)
BEGIN
    UPDATE Travel
    SET weight = p_weight,
        origin = p_origin,
        destination = p_destination,
        payment = p_payment,
        description = p_description,
        departureDate = p_departureDate,
        deliverDate = p_deliverDate,
        stateTravel = p_stateTravel,
        fk_transporter_id = p_fk_transporter_id,
        fk_intermediary_id = p_fk_intermediary_id
    WHERE trip_id = p_trip_id;
END //

DELIMITER ;

----------------------------------------------------------

--obtener todos los transportadores

DELIMITER //

CREATE PROCEDURE GetAllTransporters()
BEGIN
    SELECT * FROM Transporter;
END //

DELIMITER ;

-------------------------------------------------

-- obtener todos los viajes

DELIMITER //

CREATE PROCEDURE GetAllTravels()
BEGIN
    SELECT * FROM Travel;
END //

DELIMITER ;

-----------------------------------------------------