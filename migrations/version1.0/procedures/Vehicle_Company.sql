-- Procedimientos almacenados de la tabla vehicle_company

DELIMITER //
CREATE PROCEDURE SelectAllVehicleCompanies()
BEGIN
    SELECT * FROM Vehicle_Company;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE InsertVehicleCompany(
    IN company_nit VARCHAR(30), 
    IN company_name VARCHAR(50), 
    IN company_phone VARCHAR(15),
    IN company_email VARCHAR(50),
    IN company_address VARCHAR(100),
    IN company_password VARCHAR(255),
)
BEGIN
    INSERT INTO Vehicle_Company (nit, name, phone, email, address, password)
    VALUES (company_nit, company_name, company_phone, company_email, company_address, company_password);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE UpdateVehicleCompanyState(
    IN company_nit VARCHAR(30), 
    IN new_state ENUM('enabled', 'disabled')
)
BEGIN
    UPDATE Vehicle_Company SET stateCompanyVehicle = new_state WHERE nit = company_nit;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE DeleteVehicleCompany(
    IN company_nit VARCHAR(30)
)
BEGIN
    DELETE FROM Vehicle_Company WHERE nit = company_nit;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE SumMonthlyFees()
BEGIN
    SELECT SUM(monthly_fee) AS total_monthly_fee FROM Vehicle_Company;
END //
DELIMITER ;
