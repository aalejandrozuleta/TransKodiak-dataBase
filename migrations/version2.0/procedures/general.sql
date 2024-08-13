DELIMITER //

CREATE PROCEDURE `authGeneral` (
    IN p_email VARCHAR(50)
)
BEGIN
    SELECT id, password, user_type FROM (
        SELECT nit AS id, password, 'Vehicle_Company' AS user_type 
        FROM Vehicle_Company WHERE email = p_email
        UNION ALL
        SELECT intermediary_id AS id, password, 'Intermediary' AS user_type 
        FROM Intermediary WHERE email = p_email
        UNION ALL
        SELECT transporter_id AS id, password, 'Transporter' AS user_type 
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

