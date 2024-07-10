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

-- Procedimiento para encontrar si ya esta registrado por medio del nombre

DELIMITER //
CREATE PROCEDURE SearchCompanyByName(
	IN name varchar(50)
) BEGIN 
	SELECT nit,name FROM Vehicle_Company WHERE name = name;
END //
DELIMITER ;

---- !Funcionando

---------------------------------------------------------------

DELIMITER //

CREATE PROCEDURE UpdateVehicleCompany(
    IN company_nit VARCHAR(30),
    IN company_name VARCHAR(50),
    IN company_phone VARCHAR(15),
    IN company_email VARCHAR(50),
    IN company_address VARCHAR(100),
    IN company_monthly_fee FLOAT,
    IN company_transporter_count INT,
    IN company_vehicle_count INT
)
BEGIN
    UPDATE Vehicle_Company
    SET name = company_name,
        phone = company_phone,
        email = company_email,
        address = company_address,
        monthly_fee = company_monthly_fee,
        transporter_count = company_transporter_count,
        vehicle_count = company_vehicle_count
    WHERE nit = company_nit;
END //

DELIMITER ;
----------------------------------------------------------------

DELIMITER //

CREATE PROCEDURE GetAllVehicleCompanies()
BEGIN
    SELECT * FROM Vehicle_Company;
END //

DELIMITER ;

----------------------------------------------------------------

DELIMITER //

CREATE PROCEDURE GetVehicleCompanyById(
    IN company_nit VARCHAR(30)
)
BEGIN
    SELECT * FROM Vehicle_Company
    WHERE nit = company_nit;
END //

DELIMITER ;

----------------------------------------------------------------

DELIMITER //

CREATE PROCEDURE UpdateCompanyState(
    IN company_nit VARCHAR(30),
    IN new_state ENUM ('enabled', 'disabled')
)
BEGIN
    UPDATE Vehicle_Company
    SET stateCompanyVehicle = new_state
    WHERE nit = company_nit;
END //

DELIMITER ;

----------------------------------------------------------------

DELIMITER //
CREATE PROCEDURE ResetLoginAttempts(
    IN p_nit VARCHAR(30)
)
BEGIN
    UPDATE Vehicle_Company SET login_attempts = 0 WHERE nit = p_nit;
END //
DELIMITER ;

----------------------------------------------------------------

DELIMITER //
CREATE PROCEDURE LockAccount(
    IN p_nit VARCHAR(30)
)
BEGIN
    DECLARE max_attempts INT DEFAULT 5; 
    DECLARE current_attempts INT;
    DECLARE lock_duration INT DEFAULT 5;
    
    SELECT login_attempts INTO current_attempts FROM Vehicle_Company WHERE nit = p_nit;
    
    IF current_attempts + 1 >= max_attempts THEN
        UPDATE Vehicle_Company SET locked_until = DATE_ADD(NOW(), INTERVAL lock_duration MINUTE) WHERE nit = p_nit;
    ELSE
        UPDATE Vehicle_Company SET login_attempts = current_attempts + 1 WHERE nit = p_nit;
    END IF;
END //
DELIMITER ;

----------------------------------------------------------------

DELIMITER //
CREATE PROCEDURE UnlockAccount(
    IN p_nit VARCHAR(30)
)
BEGIN
    UPDATE Vehicle_Company SET login_attempts = 0, locked_until = NULL WHERE nit = p_nit;
END //
DELIMITER ;

