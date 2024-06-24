-- Procedimientos almacenados de la tabla travel

DELIMITER //
CREATE PROCEDURE SelectAllTravels()
BEGIN
    SELECT * FROM Travel;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE InsertTravel(
    IN travel_weight INT UNSIGNED, 
    IN travel_origin VARCHAR(100), 
    IN travel_destination VARCHAR(100),
    IN travel_payment FLOAT UNSIGNED,
    IN travel_description VARCHAR(255),
    IN travel_departureDate DATE,
    IN travel_deliverDate DATE,
    IN travel_state ENUM('enabled', 'disabled'),
    IN trans_id INT UNSIGNED,
    IN inter_id INT UNSIGNED
)
BEGIN
    INSERT INTO Travel (weight, origin, destination, payment, description, departureDate, deliverDate, stateTravel, fk_transporter_id, fk_intermediary_id)
    VALUES (travel_weight, travel_origin, travel_destination, travel_payment, travel_description, travel_departureDate, travel_deliverDate, travel_state, trans_id, inter_id);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE UpdateTravelDescription(
    IN travel_id INT, 
    IN new_description VARCHAR(255)
)
BEGIN
    UPDATE Travel SET description = new_description WHERE trip_id = travel_id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE DeleteTravel(
    IN travel_id INT
)
BEGIN
    DELETE FROM Travel WHERE trip_id = travel_id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE SumTravelPayments()
BEGIN
    SELECT SUM(payment) AS total_payment FROM Travel;
END //
DELIMITER ;