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

CREATE PROCEDURE getIntermediaryInformation (IN idIntermediary INT)
BEGIN
  SELECT
    name,
    phone,
    email,
    address,
    fk_card_number AS card_number
  FROM
    Intermediary
  WHERE
    intermediary_id = idIntermediary;
END //

DELIMITER ;