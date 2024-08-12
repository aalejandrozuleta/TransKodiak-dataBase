-- procesos transporter

DELIMITER //

CREATE PROCEDURE InsertTransporter(
    IN trans_name VARCHAR(50), 
    IN trans_id_number VARCHAR(20), 
    IN trans_email VARCHAR(50),
    IN trans_phone VARCHAR(15),
    IN trans_license VARCHAR(30),
    IN trans_password VARCHAR(255),
    IN trans_nit VARCHAR(20)  -- Reference to NIT of the Intermediary
)
BEGIN
    INSERT INTO Transporter (name, identification_card, email, phone, license, password, fk_nit)
    VALUES (trans_name, trans_id_number, trans_email, trans_phone, trans_license, trans_password, trans_nit);
END //

DELIMITER ;

-- --------

DELIMITER //

CREATE PROCEDURE DisableStateTransporter(
    IN p_id INT
)
BEGIN
    UPDATE Transporter
    SET stateTransporter = 'disabled'
    WHERE Transporter_id = p_id;
END //

DELIMITER ;

-- -------- 

DELIMITER //

DELIMITER //

CREATE PROCEDURE getTransporters(
    IN idCompany VARCHAR(30)
)
BEGIN
    SELECT 
        transporter_id AS id,
        name,
        email,
        statusTransporter
    FROM 
        Transporter 
    WHERE 
        fk_nit = idCompany AND stateTransporter = 'enabled';
END //

DELIMITER ;


---- 

DELIMITER //

CREATE PROCEDURE SearchTransporterByIdentificationCard(
    IN identification VARCHAR(50)
)BEGIN 
    SELECT transporter_id, name, identification_card FROM Transporter WHERE identification_card = identification;
END //

DELIMITER ;