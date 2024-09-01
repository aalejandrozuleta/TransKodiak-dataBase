DELIMITER //

CREATE PROCEDURE CreateNotification(
    IN p_fk_transporter_id INT UNSIGNED,
    IN p_fk_intermediary_id INT,
    IN p_fk_trip_id INT
)
BEGIN
    INSERT INTO Notification (
        fk_transporter_id, 
        fk_intermediary_id, 
        fk_trip_id
    ) 
    VALUES (
        p_fk_transporter_id, 
        p_fk_intermediary_id, 
        p_fk_trip_id
    );
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE SetTransporterInactive(IN transporterId INT)
BEGIN
    UPDATE Transporter
    SET statusTransporter = 'Inactive'
    WHERE transporter_id = transporterId;
end //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE GetTransporterStatus(IN transporterId INT)
BEGIN
    SELECT statusTransporter
    FROM Transporter
    WHERE transporter_id = transporterId;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE SetNotificationAccepted(IN notification_id INT)
BEGIN
    UPDATE Notification
    SET status = 'accepted'
    WHERE id = notification_id;
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE SetTransporterInProgress(IN transporterId INT)
BEGIN
    UPDATE Transporter
    SET statusTransporter = 'In transit'
    WHERE transporter_id = transporterId;
end //

DELIMITER ;




DELIMITER //
CREATE PROCEDURE SetTransporterInDenegad(IN transporterId INT)
BEGIN
    UPDATE Transporter
    SET statusTransporter = 'Active'
    WHERE transporter_id = transporterId;
end //

DELIMITER ;

DELIMITER //


CREATE PROCEDURE SetNotificationRejected(IN notification_id INT)
BEGIN
    UPDATE Notification
    SET status = 'rejected'
    WHERE id = notification_id;
END //

DELIMITER ;
