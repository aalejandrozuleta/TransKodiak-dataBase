DELIMITER //

CREATE PROCEDURE InsertVehicleCompany(
    IN nit VARCHAR(30),
    IN name VARCHAR(50),
    IN phone VARCHAR(15),
    IN email VARCHAR(50),
    IN address VARCHAR(100),
    IN monthly_fee FLOAT,
    IN transporter_count INT,
    IN vehicle_count INT
)
BEGIN
    INSERT INTO Vehicle_Company (nit, name, phone, email, address, monthly_fee, transporter_count, vehicle_count)
    VALUES (nit, name, phone, email, address, monthly_fee, transporter_count, vehicle_count);
END //

DELIMITER ;

---------------------------------------------------------------
DELIMITER //

CREATE PROCEDURE DeleteVehicleCompany(
    IN company_nit VARCHAR(30)
)
BEGIN
    DELETE FROM Vehicle_Company
    WHERE nit = company_nit;
END //

DELIMITER ;
----------------------------------------------------------------
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
