DELIMITER //

CREATE PROCEDURE InsertTravel(
    IN trav_weight INT,
    IN trav_origin VARCHAR(100),
    IN trav_destination VARCHAR(100),
    IN trav_payment FLOAT,
    IN trav_description VARCHAR(255),
    IN trav_departureDate DATE,
    IN trav_deliverDate DATE,
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
        deliverDate
    FROM 
        Travel
    WHERE 
        fk_intermediary_id = idIntermediary AND stateTravel = 'enabled';
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE GetAllTravels()
BEGIN
    SELECT 
       trip_id,
        weight,
        origin,
        destination,
        payment,
        description,
        departureDate,
        deliverDate
    FROM 
        Travel;
end//

DELIMITER ;