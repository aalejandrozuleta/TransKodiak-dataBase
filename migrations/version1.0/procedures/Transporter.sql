-- Ingresar nuevo registro

DELIMITER //

CREATE PROCEDURE InsertTransporter(
    IN p_name VARCHAR(50),
    IN p_id_number VARCHAR(20),
    IN p_email VARCHAR(50),-- Procedimientos almacenados de la tabla transporter

DELIMITER //
CREATE PROCEDURE SelectAllTransporters()
BEGIN
    SELECT * FROM Transporter;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE InsertTransporter(
    IN trans_name VARCHAR(50), 
    IN trans_id_number VARCHAR(20), 
    IN trans_email VARCHAR(50),
    IN trans_phone VARCHAR(15),
    IN trans_license VARCHAR(30),
    IN trans_status ENUM('Active', 'Inactive', 'In transit'),
    IN trans_state ENUM('enabled', 'disabled'),
    IN trans_password VARCHAR(255),
    IN company_nit VARCHAR(30)
)
BEGIN
    INSERT INTO Transporter (name, id_number, email, phone, license, statusTransporter, stateTransporter, password, fk_nit)
    VALUES (trans_name, trans_id_number, trans_email, trans_phone, trans_license, trans_status, trans_state, trans_password, company_nit);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE UpdateTransporterState(
    IN trans_id INT UNSIGNED, 
    IN new_state ENUM('enabled', 'disabled')
)
BEGIN
    UPDATE Transporter SET stateTransporter = new_state WHERE transporter_id = trans_id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE DeleteTransporter(
    IN trans_id INT UNSIGNED
)
BEGIN
    DELETE FROM Transporter WHERE transporter_id = trans_id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE CountTransportersByState()
BEGIN
    SELECT stateTransporter, COUNT(*) AS total FROM Transporter GROUP BY stateTransporter;
END //
DELIMITER ;
    IN p_phone VARCHAR(15),
    IN p_license VARCHAR(30),
    IN p_password VARCHAR(255),
)
BEGIN
    INSERT INTO Transporter (name, id_number, email, phone, license, password)
    VALUES (p_name, p_id_number, p_email, p_phone, p_license, p_password);
END //

DELIMITER ;

------------------------------------------------------------------------------------------------------------

-- Actualizar transportador

DELIMITER //

CREATE PROCEDURE UpdateTransporter(
    IN p_transporter_id INT,
    IN p_name VARCHAR(50),
    IN p_id_number VARCHAR(20),
    IN p_email VARCHAR(50),
    IN p_phone VARCHAR(15),
    IN p_license VARCHAR(30),
    IN p_status ENUM('Active', 'Inactive', 'In transit'),
    IN p_password VARCHAR(255),
)
BEGIN
    UPDATE Transporter
    SET name = p_name,
        id_number = p_id_number,
        email = p_email,
        phone = p_phone,
        license = p_license,
        status = p_status,
        password = p_password,
    WHERE transporter_id = p_transporter_id;
END //

DELIMITER ;

----------------------------------------------------------------------------------------------

--Deshabilitar un transportador

DELIMITER //

CREATE PROCEDURE DisableTransporter(
    IN p_transporter_id INT
)
BEGIN
    UPDATE Transporter
    SET stateTransporter = 'disabled'
    WHERE transporter_id = p_transporter_id;
END //

DELIMITER ;

---------------------------------------------------------------------------------------------------

-- Ver perfil del transportador

DELIMITER //

CREATE PROCEDURE ViewTransporterProfile(
    IN p_transporter_id INT
)
BEGIN
    SELECT * FROM Transporter
    WHERE transporter_id = p_transporter_id;
END //

DELIMITER ;

-----------------------------------------------------------------

-- Cambion contraseña

DELIMITER //

CREATE PROCEDURE ChangeTransporterPassword(
    IN p_transporter_id INT,
    IN p_new_password VARCHAR(255)
)
BEGIN
    UPDATE Transporter
    SET password = p_new_password
    WHERE transporter_id = p_transporter_id;
END //

DELIMITER ;

----------------------------------------------------

--Obtener datos transportador

DELIMITER //

CREATE PROCEDURE GetAllTransporters()
BEGIN
    SELECT * FROM Transporter;
END //

DELIMITER ;

------------------------------------------------------

-- Obtener transportador por id

DELIMITER //

CREATE PROCEDURE GetTransporterById(
    IN p_transporter_id INT
)
BEGIN
    SELECT * FROM Transporter
    WHERE transporter_id = p_transporter_id;
END //

DELIMITER ;