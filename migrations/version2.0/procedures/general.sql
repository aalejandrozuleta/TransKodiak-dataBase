DELIMITER //

CREATE PROCEDURE authGeneral (
    IN p_email VARCHAR(50)
)
BEGIN
    SELECT id, name, password, user_type FROM (
        SELECT nit AS id, name, password, 'Vehicle_Company' AS user_type 
        FROM Vehicle_Company WHERE email = p_email
        UNION ALL
        SELECT intermediary_id AS id, name, password, 'Intermediary' AS user_type 
        FROM Intermediary WHERE email = p_email
        UNION ALL
        SELECT transporter_id AS id, name, password, 'Transporter' AS user_type 
        FROM Transporter WHERE email = p_email
    ) AS combined
    LIMIT 1;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE searchUserCode (
    IN p_email VARCHAR(50),
    IN p_phone varchar(15)
)
BEGIN
    SELECT id FROM (
        SELECT nit AS id FROM Vehicle_Company WHERE email = p_email and phone = p_phone
        UNION ALL
        SELECT intermediary_id AS id FROM Intermediary WHERE email = p_email and phone = p_phone
        UNION ALL
        SELECT transporter_id AS id FROM Transporter WHERE email = p_email and phone = p_phone
    ) AS combined
    LIMIT 1;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE forgetPassword (
    IN p_user_id INT,
    IN p_new_password VARCHAR(255)
)
BEGIN
    -- Actualizar en Vehicle_Company
    UPDATE Vehicle_Company
    SET password = p_new_password
    WHERE nit = p_user_id;

    -- Si no se afectaron filas, intentar en Intermediary
    IF ROW_COUNT() = 0 THEN
        UPDATE Intermediary
        SET password = p_new_password
        WHERE intermediary_id = p_user_id;
    END IF;

    -- Si no se afectaron filas, intentar en Transporter
    IF ROW_COUNT() = 0 THEN
        UPDATE Transporter
        SET password = p_new_password
        WHERE transporter_id = p_user_id;
    END IF;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE SearchEmail(IN search_email VARCHAR(50))
BEGIN
    SELECT email
    FROM (
        SELECT email FROM Vehicle_Company WHERE email = search_email
        UNION
        SELECT email FROM Intermediary WHERE email = search_email
        UNION
        SELECT email FROM Transporter WHERE email = search_email
    ) AS Emails
    LIMIT 1;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE UpdateImageUrlByEmail(
    IN userEmail VARCHAR(50),
    IN newImageUrl VARCHAR(255)
)
BEGIN
    -- Actualizar la tabla Vehicle_Company
    UPDATE Vehicle_Company
    SET imageUrl = newImageUrl
    WHERE email = userEmail;
    
    -- Actualizar la tabla Intermediary
    UPDATE Intermediary
    SET imageUrl = newImageUrl
    WHERE email = userEmail;

    -- Actualizar la tabla Transporter
    UPDATE Transporter
    SET imageUrl = newImageUrl
    WHERE email = userEmail;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE GetNotificationCountsByTransporterId(
    IN input_transporter_id INT
)
BEGIN
    SELECT 
        (SELECT COUNT(*) 
         FROM Notification 
         WHERE fk_transporter_id = input_transporter_id 
           AND status = 'accepted') AS accepted_count,
        (SELECT COUNT(*) 
         FROM Notification 
         WHERE fk_transporter_id = input_transporter_id 
           AND status = 'rejected') AS rejected_count;
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE GetIntermediaryStatistics(
    IN input_intermediary_id INT
)
BEGIN
    -- Viajes publicados
    SELECT 
        (SELECT COUNT(*) 
         FROM Notification 
         WHERE fk_intermediary_id = input_intermediary_id) AS published_trips,
        
        -- Viajes denegados
        (SELECT COUNT(*) 
         FROM Notification 
         WHERE fk_intermediary_id = input_intermediary_id 
           AND status = 'rejected') AS rejected_trips,
        
        -- Viajes confirmados
        (SELECT COUNT(*) 
         FROM Notification 
         WHERE fk_intermediary_id = input_intermediary_id 
           AND status = 'accepted') AS accepted_trips;
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE GetCompanyStatistics(
    IN input_nit VARCHAR(30)
)
BEGIN
    -- Vehículos registrados
    SELECT 
        (SELECT COUNT(*) 
         FROM Vehicle 
         WHERE fk_nit = input_nit) AS vehicle_count,
         
        -- Transportadores registrados
        (SELECT COUNT(*) 
         FROM Transporter 
         WHERE fk_nit = input_nit) AS transporter_count,
         
        -- Viajes realizados (aceptados) por transportadores de la empresa
        (SELECT COUNT(*) 
         FROM Notification N
         JOIN Transporter T ON N.fk_transporter_id = T.transporter_id
         WHERE T.fk_nit = input_nit 
           AND N.status = 'accepted') AS trip_count;
END //

DELIMITER ;
