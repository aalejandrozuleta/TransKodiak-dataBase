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

create procedure searchCompanyByName(
	in names varchar(50)
) begin 
	select nit, name from vehicle_Company where name= names;
end

DELIMITER ;

