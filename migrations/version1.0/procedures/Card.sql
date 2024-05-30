DELIMITER //

CREATE PROCEDURE createCard(
    IN card_number_in VARCHAR(100),
    IN expiration_date_in DATE,
    IN cvv_in VARCHAR(100)
)
BEGIN
    -- Insertar una nueva tarjeta
    INSERT INTO Card (card_number, expiration_date, cvv)
    VALUES (card_number_in, expiration_date_in, cvv_in);
END//

DELIMITER ;
-- 
DELIMITER //

CREATE PROCEDURE updateCard(
    IN card_number_in VARCHAR(100),
    IN expiration_date_in DATE,
    IN cvv_in VARCHAR(100)
)
BEGIN
    -- Actualizar los detalles de una tarjeta existente
    UPDATE Card
    SET expiration_date = expiration_date_in, cvv = cvv_in
    WHERE card_number = card_number_in;
END //

DELIMITER ;
-- 
DELIMITER //

CREATE PROCEDURE deleteCard(
    IN card_number_in VARCHAR(100)
)
BEGIN
    -- Eliminar una tarjeta
    DELETE FROM Card
    WHERE card_number = card_number_in;
END //

DELIMITER ;


