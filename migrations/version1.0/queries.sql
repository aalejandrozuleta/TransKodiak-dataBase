-- CONSULTAS

-- Queries de la tabla de card

SELECT * FROM Card;

SELECT * FROM Card WHERE expiration_date > '2025-01-01';

UPDATE Card SET cvv = '999' WHERE card_number = '1234-5678-9012-3456';

DELETE FROM Card WHERE card_number = '5678-9012-3456-7890';

SELECT COUNT(*) AS total_cards FROM Card;

-- querys de la tabla vehicle_company

SELECT * FROM Vehicle_Company;

SELECT * FROM Vehicle_Company WHERE vehicle_count > 5;

UPDATE Vehicle_Company SET stateCompanyVehicle = 'disabled' WHERE nit = '800123456';

DELETE FROM Vehicle_Company WHERE nit = '800567890';

SELECT SUM(monthly_fee) AS total_monthly_fee FROM Vehicle_Company;

-- querys de la tabla Intermediary

SELECT * FROM Intermediary;

SELECT * FROM Intermediary WHERE stateIntermediary = 'enabled';

UPDATE Intermediary SET phone = '555-9999' WHERE intermediary_id = 1;

DELETE FROM Intermediary WHERE intermediary_id = 5;

SELECT COUNT(*) AS total_intermediaries FROM Intermediary;

-- querys de la tabla Transporter

SELECT * FROM Transporter;

SELECT * FROM Transporter WHERE statusTransporter = 'Active';

UPDATE Transporter SET stateTransporter = 'disabled' WHERE transporter_id = 2;

DELETE FROM Transporter WHERE transporter_id = 4;

SELECT stateTransporter, COUNT(*) AS total FROM Transporter GROUP BY stateTransporter;


-- querys de la tabla Travel

SELECT * FROM Travel;

SELECT * FROM Travel WHERE weight > 500;

UPDATE Travel SET description = 'Updated Description' WHERE trip_id = 3;

DELETE FROM Travel WHERE trip_id = 2;

SELECT SUM(payment) AS total_payment FROM Travel;

-- querys de la tabal vehicle

SELECT * FROM Vehicle;

SELECT * FROM Vehicle WHERE stateVehicle = 'enabled';

UPDATE Vehicle SET capacity = 20.0 WHERE license_plate = 'ABC123';

DELETE FROM Vehicle WHERE license_plate = 'GHI789';

SELECT SUM(capacity) AS total_capacity FROM Vehicle;