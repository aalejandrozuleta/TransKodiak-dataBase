-- Disparadores de la base de datos

-- tabla card
-- Disparador antes de insertar en Card para verificar que la tarjeta no esté vencida:
DELIMITER //
CREATE TRIGGER before_insert_card
BEFORE INSERT ON Card
FOR EACH ROW
BEGIN
    IF NEW.expiration_date < CURDATE() THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se puede insertar tarjeta';
    END IF;
END //
DELIMITER ;

-- tabla vehicle_company
-- Disparador después de insertar en Vehicle_Company para asegurarse de que el NIT sea único:

DELIMITER //
CREATE TRIGGER after_insert_vehicle_company
AFTER INSERT ON Vehicle_Company
FOR EACH ROW
BEGIN
    DECLARE duplicate_count INT;
    SELECT COUNT(*) INTO duplicate_count FROM Vehicle_Company WHERE nit = NEW.nit;
    IF duplicate_count > 1 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Duplicate NIT detected.';
    END IF;
END //
DELIMITER ;

-- Disparador antes de actualizar Vehicle_Company para no permitir cambiar el nit

DELIMITER //
CREATE TRIGGER before_update_vehicle_company
BEFORE UPDATE ON Vehicle_Company
FOR EACH ROW
BEGIN
    IF NEW.nit <> OLD.nit THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot change NIT.';
    END IF;
END //
DELIMITER ;

-- tabla transporter
-- Disparador antes de actualizar en Transporter para evitar estados inválidos

DELIMITER //
CREATE TRIGGER before_update_transporter
BEFORE UPDATE ON Transporter
FOR EACH ROW
BEGIN
    IF NEW.statusTransporter NOT IN ('Active', 'Inactive', 'In transit') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid transporter status.';
    END IF;
END //
DELIMITER ;

-- tabla travel
-- Disparador antes de insertar en Travel para asegurarse de que las fechas sean válidas

DELIMITER //
CREATE TRIGGER before_insert_travel
BEFORE INSERT ON Travel
FOR EACH ROW
BEGIN
    IF NEW.deliverDate <= NEW.departureDate THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Delivery date must be after departure date.';
    END IF;
END //
DELIMITER ;

-- tabla vehicle
-- Disparador antes de insertar en Vehicle para verificar capacidad positiva

DELIMITER //
CREATE TRIGGER before_insert_vehicle
BEFORE INSERT ON Vehicle
FOR EACH ROW
BEGIN
    IF NEW.capacity <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Vehicle capacity must be positive.';
    END IF;
END //
DELIMITER ;

-- Disparador antes de actualizar en Vehicle para verificar capacidad positiva

DELIMITER //
CREATE TRIGGER before_update_vehicle
BEFORE UPDATE ON Vehicle
FOR EACH ROW
BEGIN
    IF NEW.capacity <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Vehicle capacity must be positive.';
    END IF;
END //
DELIMITER ;