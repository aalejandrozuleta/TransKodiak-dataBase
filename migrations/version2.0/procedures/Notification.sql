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

DELIMITER //

CREATE PROCEDURE GetNotifications(IN intermediary_id INT)
BEGIN
    SELECT 
        N.id AS notification_id, -- Añadir el id de la notificación
        T.trip_id,
        TR.name AS transporter_name,
        TR.imageUrl AS imgUserTransporter,
        T.origin,
        T.destination,
        T.description,
        TR.transporter_id
    FROM 
        Notification N
    JOIN 
        Travel T ON N.fk_trip_id = T.trip_id
    JOIN 
        Transporter TR ON N.fk_transporter_id = TR.transporter_id
    WHERE 
        N.fk_intermediary_id = intermediary_id AND
        N.status = 'pending'; -- Puedes modificar el filtro según lo que necesites
END//

DELIMITER ;

DELIMITER //

CREATE PROCEDURE AcceptNotificationAndUpdateTransporters(IN notification_id INT)
BEGIN
    DECLARE transporterId INT;
    DECLARE tripId INT;

    -- Obtener el ID del transportador y el viaje asociado a la notificación aceptada
    SELECT fk_transporter_id, fk_trip_id INTO transporterId, tripId
    FROM Notification
    WHERE id = notification_id;

    -- Aceptar la notificación
    UPDATE Notification
    SET status = 'accepted'
    WHERE id = notification_id;

    -- Cambiar el estado del transportador que aceptó la notificación a "In transit"
    UPDATE Transporter
    SET statusTransporter = 'In transit'
    WHERE transporter_id = transporterId;

    -- Rechazar todas las demás notificaciones pendientes del mismo viaje
    UPDATE Notification
    SET status = 'rejected'
    WHERE fk_trip_id = tripId
      AND status = 'pending'
      AND id != notification_id;

    -- Cambiar el estado de los transportadores relacionados a las notificaciones rechazadas a "Active"
    UPDATE Transporter
    SET statusTransporter = 'Active'
    WHERE transporter_id IN (
        SELECT fk_transporter_id
        FROM Notification
        WHERE fk_trip_id = tripId
          AND status = 'rejected'
    );
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE AssociateTransporter(IN trip_ids INT, IN transporter_id INT)
BEGIN
    -- Actualizar el campo fk_transporter_id en la tabla Travel
    UPDATE Travel
    SET fk_transporter_id = transporter_id
    WHERE trip_id = trip_ids;
END //

DELIMITER ;