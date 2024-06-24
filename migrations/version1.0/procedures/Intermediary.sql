-- Procedimientos almacenados de la tabla intermediary

DELIMITER //
CREATE PROCEDURE SelectAllIntermediaries()
BEGIN
    SELECT * FROM Intermediary;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE InsertIntermediary(
    IN inter_name VARCHAR(50), 
    IN inter_email VARCHAR(50), 
    IN inter_phone VARCHAR(15),
    IN inter_address VARCHAR(100),
    IN inter_state ENUM('enabled', 'disabled'),
    IN inter_password VARCHAR(255)
)
BEGIN
    INSERT INTO Intermediary (name, email, phone, address, stateIntermediary, password)
    VALUES (inter_name, inter_email, inter_phone, inter_address, inter_state, inter_password);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE UpdateIntermediaryPhone(
    IN inter_id INT UNSIGNED, 
    IN new_phone VARCHAR(15)
)
BEGIN
    UPDATE Intermediary SET phone = new_phone WHERE intermediary_id = inter_id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE DeleteIntermediary(
    IN inter_id INT UNSIGNED
)
BEGIN
    DELETE FROM Intermediary WHERE intermediary_id = inter_id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE CountIntermediaries()
BEGIN
    SELECT COUNT(*) AS total_intermediaries FROM Intermediary;
END //
DELIMITER ;
