DELIMITER //

CREATE PROCEDURE CreateIntermediary(
    IN intermediary_name VARCHAR(50),
    IN intermediary_email VARCHAR(50),
    IN intermediary_phone VARCHAR(15),
    IN intermediary_monthly_fee FLOAT,
    IN intermediary_address VARCHAR(100)
)
BEGIN
    INSERT INTO Intermediary (name, email, phone, monthly_fee, address)
    VALUES (intermediary_name, intermediary_email, intermediary_phone, intermediary_monthly_fee, intermediary_address);
END //

DELIMITER ;

-----------------------------------------------------------------

DELIMITER //

CREATE PROCEDURE UpdateIntermediary(
    IN intermediary_id INT,
    IN intermediary_name VARCHAR(50),
    IN intermediary_email VARCHAR(50),
    IN intermediary_phone VARCHAR(15),
    IN intermediary_monthly_fee FLOAT,
    IN intermediary_address VARCHAR(100)
)
BEGIN
    UPDATE Intermediary
    SET name = intermediary_name,
        email = intermediary_email,
        phone = intermediary_phone,
        monthly_fee = intermediary_monthly_fee,
        address = intermediary_address
    WHERE intermediary_id = intermediary_id;
END //

DELIMITER ;

----------------------------------------------------------------

DELIMITER //

CREATE PROCEDURE DeleteIntermediary(
    IN intermediary_id INT
)
BEGIN
    DELETE FROM Intermediary
    WHERE intermediary_id = intermediary_id;
END //

DELIMITER ;

----------------------------------------------------------------

DELIMITER //

CREATE PROCEDURE GetAllIntermediaries()
BEGIN
    SELECT * FROM Intermediary;
END //

DELIMITER ;

----------------------------------------------------------------

DELIMITER //

CREATE PROCEDURE GetIntermediaryById(
    IN intermediary_id INT
)
BEGIN
    SELECT * FROM Intermediary
    WHERE intermediary_id = intermediary_id;
END //

DELIMITER ;
