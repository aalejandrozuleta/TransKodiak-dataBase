-- procedimientos almacendados de la tabla card

DELIMITER //
CREATE PROCEDURE SelectAllCards()
BEGIN
    SELECT * FROM Card;
END //
DELIMITER ;
--
DELIMITER //
CREATE PROCEDURE InsertCard(
    IN card_num VARCHAR(100), 
    IN exp_date DATE, 
    IN cvv_code VARCHAR(100)
)
BEGIN
    INSERT INTO Card (card_number, expiration_date, cvv)
    VALUES (card_num, exp_date, cvv_code);
END //
DELIMITER ;
--
DELIMITER //
CREATE PROCEDURE UpdateCardCVV(
    IN card_num VARCHAR(100), 
    IN new_cvv VARCHAR(100)
)
BEGIN
    UPDATE Card SET cvv = new_cvv WHERE card_number = card_num;
END //
DELIMITER ;
--
DELIMITER //
CREATE PROCEDURE DeleteCard(
    IN card_num VARCHAR(100)
)
BEGIN
    DELETE FROM Card WHERE card_number = card_num;
END //
DELIMITER ;
--
DELIMITER //
CREATE PROCEDURE CountCards()
BEGIN
    SELECT COUNT(*) AS total_cards FROM Card;
END //
DELIMITER ;
