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

CREATE PROCEDURE InsertTransporter(
    IN trans_name VARCHAR(50), 
    IN trans_id_number VARCHAR(20), 
    IN trans_email VARCHAR(50),
    IN trans_phone VARCHAR(15),
    IN trans_license VARCHAR(30),
    IN trans_typeVehicle VARCHAR(30),
    IN trans_password VARCHAR(255),
    IN trans_nit VARCHAR(20)  -- Reference to NIT of the Intermediary
)
BEGIN
    INSERT INTO Transporter (name, identification_card, email, phone, license,typeVehicle, password, fk_nit)
    VALUES (trans_name, trans_id_number, trans_email, trans_phone, trans_license,trans_typeVehicle, trans_password, trans_nit);
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

CREATE PROCEDURE getTransporters(
    IN idCompany VARCHAR(30)
)
BEGIN
    SELECT 
        transporter_id AS id,
        name,
        type_vehicle,
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

DELIMITER //

CREATE PROCEDURE getVehicles(
    IN idCompany VARCHAR(30)
)
BEGIN
    SELECT 
        license_plate as id,
		capacity,
		vehicle_type,
		load_type,
		model,
		brand
    FROM 
        Vehicle 
    WHERE 
        fk_nit = idCompany AND stateVehicle = 'enabled';
END //

DELIMITER ;

-- insertar vehiculos

DELIMITER //

CREATE PROCEDURE InsertVehicle (
    IN veh_license_plate VARCHAR(10),
    IN veh_capacity VARCHAR(30),
    IN veh_vehicle_type VARCHAR(50),
    IN veh_load_type VARCHAR(50),
    IN veh_model VARCHAR(30),
    IN veh_brand VARCHAR(30),
    IN veh_nit VARCHAR(30)
)
BEGIN
    INSERT INTO Vehicle (
        license_plate,
        capacity,
        vehicle_type,
        load_type,
        model,
        brand,
        fk_nit
    ) VALUES (
        veh_license_plate,
        veh_capacity,
        veh_vehicle_type,
        veh_load_type,
        veh_model,
        veh_brand,
        veh_nit
    );
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE SearchVehicleByPlate(
    IN PlateVehicle VARCHAR(50)
)BEGIN 
    SELECT license_plate FROM Vehicle WHERE license_plate = PlateVehicle;
END //

DELIMITER ;



DELIMITER //

CREATE PROCEDURE InsertVehicleCompany(
    IN company_nit VARCHAR(30), 
    IN company_name VARCHAR(50), 
    IN company_phone VARCHAR(15),
    IN company_email VARCHAR(50),
    IN company_address VARCHAR(100),
    IN company_password VARCHAR(255)
)
BEGIN
    INSERT INTO Vehicle_Company (nit, name, phone, email, address, password)
    VALUES (company_nit, company_name, company_phone, company_email, company_address, company_password);
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE searchCompanyByName(
	IN names varchar(50)
) BEGIN 
	SELECT nit, name FROM Vehicle_Company WHERE name= names;
END //

DELIMITER ;

DELIMITER //
CREATE PROCEDURE getVehicleCompanyInformation (IN idCompany VARCHAR(30)) BEGIN
  SELECT
    name,
    phone,
    email,
    address,
    fk_card_number AS card_number
  FROM
    Vehicle_Company
  WHERE
    nit = idCompany;
END //
DELIMITER ;

