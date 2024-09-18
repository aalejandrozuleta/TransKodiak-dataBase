DELIMITER //

CREATE PROCEDURE InsertTravel(
    IN trav_weight INT,
    IN trav_origin VARCHAR(100),
    IN trav_destination VARCHAR(100),
    IN trav_payment FLOAT,
    IN trav_description VARCHAR(255),
    IN trav_departureDate DATE,
    IN trav_deliverDate DATE,
    in trav_vehicle_type VARCHAR(50),
    IN trav_fk_intermediary_id INT
)
BEGIN
    INSERT INTO Travel (
        weight, 
        origin, 
        destination, 
        payment, 
        description, 
        departureDate, 
        deliverDate,
        vehicle_type,
        fk_intermediary_id
    ) 
    VALUES (
        trav_weight, 
        trav_origin, 
        trav_destination, 
        trav_payment, 
        trav_description, 
        trav_departureDate, 
        trav_deliverDate,
        trav_vehicle_type,
        trav_fk_intermediary_id
    );
end//

DELIMITER ;

DELIMITER //

CREATE PROCEDURE getTravels(
    IN idIntermediary VARCHAR(30)
)
BEGIN
    select
    	trip_id as id,
        weight, 
        origin, 
        destination, 
        payment, 
        description, 
        departureDate, 
        deliverDate,
        vehicle_type
    FROM 
        Travel
    WHERE 
        fk_intermediary_id = idIntermediary AND stateTravel = 'enabled';
END //

DELIMITER ;

DELIMITER //

DELIMITER //

CREATE PROCEDURE GetAllTravels()
BEGIN
    SELECT 
        t.trip_id,
        t.weight,
        t.origin,
        t.destination,
        t.payment,
        t.description,
        t.departureDate,
        t.deliverDate,
        t.vehicle_type,
        t.stateTravel,
        t.fk_intermediary_id,
        i.phone
    FROM 
        Travel AS t
    LEFT JOIN 
        Intermediary AS i ON t.fk_intermediary_id = i.intermediary_id
    WHERE 
        t.stateTravel = 'enabled';  -- Filtrar solo los viajes habilitados
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE DisableStateTravel(
    IN p_trip_id INT
)
BEGIN
    UPDATE Travel
    SET stateTravel = 'disabled'
    WHERE trip_id = p_trip_id;
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE GetTravelDetailsByTripId(
    IN p_trip_id INT
)
BEGIN
    SELECT
        weight,
        origin,
        destination,
        payment,
        description,
        departureDate,
        deliverDate,
        vehicle_type
    FROM
        Travel
    WHERE
        trip_id = p_trip_id
        AND stateTravel = 'enabled';
END //

DELIMITER ;
