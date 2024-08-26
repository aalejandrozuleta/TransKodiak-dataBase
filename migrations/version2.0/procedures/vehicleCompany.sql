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