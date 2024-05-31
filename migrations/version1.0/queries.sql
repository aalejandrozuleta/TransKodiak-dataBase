
-- TABLA CARD

-- Seleccionar todos los registros
SELECT * FROM Card;

-- Seleccionar una tarjeta específica por su número de tarjeta
SELECT * FROM Card WHERE card_number = '1234567890123456';

-- Insertar un nuevo registro
INSERT INTO Card (card_number, expiration_date, cvv) 
VALUES ('1234567890123456', '2025-12-31', '123');

-- Actualizar la fecha de expiración de una tarjeta específica
UPDATE Card 
SET expiration_date = '2026-12-31' 
WHERE card_number = '1234567890123456';

-- Eliminar una tarjeta específica
DELETE FROM Card 
WHERE card_number = '1234567890123456';

------------------------------------------------------------------

--Tabla VehicleCompany

-- Seleccionar todos los registros
SELECT * FROM Vehicle_Company;

-- Seleccionar una compañía específica por su NIT
SELECT * FROM Vehicle_Company WHERE nit = '1234567890';

-- Insertar un nuevo registro
INSERT INTO Vehicle_Company (nit, name, phone, email, address, monthly_fee, transporter_count, vehicle_count, login_attempts, locked_until, stateCompanyVehicle, fk_card_number) 
VALUES ('1234567890', 'Transports Inc.', '123456789', 'info@transportsinc.com', '123 Main St', 100.00, 10, 5, 0, NULL, 'enabled', '1234567890123456');

-- Actualizar el estado de una compañía específica
UPDATE Vehicle_Company 
SET stateCompanyVehicle = 'disabled' 
WHERE nit = '1234567890';

-- Eliminar una compañía específica
DELETE FROM Vehicle_Company 
WHERE nit = '1234567890';

------------------------------------------------------------------

--Tabla Intermedary
-- Seleccionar todos los registros
SELECT * FROM Intermediary;

-- Seleccionar un intermediario específico por su ID
SELECT * FROM Intermediary WHERE intermediary_id = 1;

-- Insertar un nuevo registro
INSERT INTO Intermediary (name, email, phone, monthly_fee, address, login_attempts, locked_until, stateIntermediary, fk_card_number) 
VALUES ('John Doe', 'johndoe@example.com', '987654321', 50.00, '456 Another St', 0, NULL, 'enabled', '1234567890123456');

-- Actualizar la tarifa mensual de un intermediario específico
UPDATE Intermediary 
SET monthly_fee = 60.00 
WHERE intermediary_id = 1;

-- Eliminar un intermediario específico
DELETE FROM Intermediary 
WHERE intermediary_id = 1;

------------------------------------------------------------------

--Tabla Transporter
-- Seleccionar todos los registros
SELECT * FROM Transporter;

-- Seleccionar un transportista específico por su ID
SELECT * FROM Transporter WHERE transporter_id = 1;

-- Insertar un nuevo registro
INSERT INTO Transporter (name, id_number, email, phone, license, status, fk_nit, login_attempts, locked_until, stateTransporter, fk_card_number) 
VALUES ('Jane Smith', 'A123456789', 'janesmith@example.com', '123456789', 'LIC123456', 'Active', '1234567890', 0, NULL, 'enabled', '1234567890123456');

-- Actualizar el estado de un transportista específico
UPDATE Transporter 
SET status = 'Inactive' 
WHERE transporter_id = 1;

-- Eliminar un transportista específico
DELETE FROM Transporter 
WHERE transporter_id = 1;


------------------------------------------------------------------

--Tabla Travel

-- Seleccionar todos los registros
SELECT * FROM Travel;

-- Seleccionar un viaje específico por su ID
SELECT * FROM Travel WHERE trip_id = 1;

-- Insertar un nuevo registro
INSERT INTO Travel (weight, origin, destination, payment, description, departureDate, deliverDate, stateTravel, fk_transporter_id, fk_intermediary_id) 
VALUES (1000, 'City A', 'City B', 500.00, 'Transport of goods', '2024-06-01', '2024-06-02', 'enabled', 1, 1);

-- Actualizar la fecha de entrega de un viaje específico
UPDATE Travel 
SET deliverDate = '2024-06-03' 
WHERE trip_id = 1;

-- Eliminar un viaje específico
DELETE FROM Travel 
WHERE trip_id = 1;

------------------------------------------------------------------

--Tabla Vehicle

-- Seleccionar todos los registros
SELECT * FROM Vehicle;

-- Seleccionar un vehículo específico por su matrícula
SELECT * FROM Vehicle WHERE license_plate = 'ABC123';

-- Insertar un nuevo registro
INSERT INTO Vehicle (license_plate, description, capacity, vehicle_type, load_type, stateVehicle, fk_vehicle_company_id) 
VALUES ('ABC123', 'Truck model X', 5000.00, 'Truck', 'General', 'enabled', '1234567890');

-- Actualizar la capacidad de un vehículo específico
UPDATE Vehicle 
SET capacity = 6000.00 
WHERE license_plate = 'ABC123';

-- Eliminar un vehículo específico
DELETE FROM Vehicle 
WHERE license_plate = 'ABC123';
