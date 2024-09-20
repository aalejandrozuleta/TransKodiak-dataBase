DELIMITER //
CREATE PROCEDURE InsertIntermediary(
    IN inter_name VARCHAR(50), 
    IN inter_email VARCHAR(50), 
    IN inter_phone VARCHAR(15),
    IN inter_address VARCHAR(100),
    IN inter_password VARCHAR(255)
)
BEGIN
    INSERT INTO Intermediary (name, email, phone, address, password)
    VALUES (inter_name, inter_email, inter_phone, inter_address, inter_password);
END //
DELIMITER ;

DELIMITER //

CREATE PROCEDURE SearchIntermediaryByName(
    IN nameInter VARCHAR(50)
)BEGIN 
    SELECT intermediary_id, name FROM Intermediary WHERE name = nameInter;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE getIntermediaryInformation (IN idIntermediary INT)
BEGIN
  SELECT
    name,
    phone,
    email,
    address,
    fk_card_number AS card_number
  FROM
    Intermediary
  WHERE
    intermediary_id = idIntermediary;
END //

DELIMITER ;

DELIMITER //
CREATE PROCEDURE getAcceptedTripsByIntermediary(IN intermediaryId INT)
BEGIN
    SELECT 
        t.origin AS trip_origin, 
        t.destination AS trip_destination, 
        t.payment AS trip_payment,
        trans.name AS transporter_name, 
        trans.phone AS transporter_phone, 
        trans.email AS transporter_email 
    FROM 
        Notification n
    INNER JOIN 
        Travel t ON n.fk_trip_id = t.trip_id 
    INNER JOIN 
        Transporter trans ON n.fk_transporter_id = trans.transporter_id 
    WHERE 
        n.fk_intermediary_id = intermediaryId 
        AND n.status = 'accepted'; 
END //
DELIMITER ;

DELIMITER //

CREATE PROCEDURE SetTransporterActive(IN transporter_id_input INT)
BEGIN
    -- Cambiar el estado del transportador a "Active"
    UPDATE Transporter
    SET statusTransporter = 'Active'
    WHERE transporter_id = transporter_id_input;
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE GetTravelByIntermediary (
    IN intermediaryId INT
)
BEGIN
    SELECT 
        trip_id, 
        weight, 
        origin, 
        destination, 
        payment, 
        description, 
        departureDate, 
        deliverDate, 
        vehicle_type, 
        stateTravel 
    FROM 
        Travel
    WHERE 
        fk_intermediary_id = intermediaryId;
END //

DELIMITER ;
