-- CONSULTAS

-- Queries de la tabla de card

SELECT * FROM Card;

SELECT * FROM Card
WHERE YEAR(expiration_date) = 2024;

SELECT COUNT(*) FROM Card;

UPDATE Card
SET cvv = '999'
WHERE card_number = '1111222233334444';

DELETE FROM Card
WHERE card_number = '5555666677778888';

-- querys de la tabla vehicle_company

SELECT * FROM Vehicle_Company;

SELECT * FROM Vehicle_Company
WHERE monthly_fee > 600;

SELECT COUNT(*) FROM Vehicle_Company
WHERE stateCompanyVehicle = 'enabled';

UPDATE Vehicle_Company
SET monthly_fee = 750.0
WHERE nit = 'A123456789';


UPDATE Vehicle_Company
SET monthly_fee = 750.0
WHERE nit = 'A123456789';

DELETE FROM Vehicle_Company
WHERE nit = 'B234567890';

-- querys de la tabla Intermediary

SELECT * FROM Intermediary;

SELECT * FROM Intermediary
WHERE monthly_fee < 60;

SELECT COUNT(*) FROM Intermediary
WHERE stateIntermediary = 'enabled';

UPDATE Intermediary
SET address = '777 New St'
WHERE intermediary_id = 1;

DELETE FROM Intermediary
WHERE intermediary_id = 5;

-- querys de la tabla Transporter

SELECT * FROM Transporter;


SELECT * FROM Transporter
WHERE statusTransporter = 'Active';


SELECT COUNT(*) FROM Transporter
WHERE stateTransporter = 'enabled';


UPDATE Transporter
SET statusTransporter = 'Inactive'
WHERE transporter_id = 3;


DELETE FROM Transporter
WHERE transporter_id = 4;


-- querys de la tabla Travel

SELECT * FROM Travel;


SELECT * FROM Travel
WHERE weight > 18000;


SELECT COUNT(*) FROM Travel
WHERE stateTravel = 'enabled';


UPDATE Travel
SET deliverDate = '2023-06-01'
WHERE trip_id = 1;


DELETE FROM Travel
WHERE trip_id = 5;


-- querys de la tabal vehicle

SELECT * FROM Vehicle;


SELECT * FROM Vehicle
WHERE capacity > 20000;


SELECT COUNT(*) FROM Vehicle
WHERE stateVehicle = 'enabled';


UPDATE Vehicle
SET description = 'New description'
WHERE license_plate = 'JKL123';


DELETE FROM Vehicle
WHERE license_plate = 'MNO456';