-- Insertando registros en la tabla Card
INSERT INTO Card (card_number, expiration_date, cvv) VALUES
('1234567890123456', '2025-12-31', '123'),
('2345678901234567', '2026-11-30', '234'),
('3456789012345678', '2027-10-31', '345'),
('4567890123456789', '2028-09-30', '456'),
('5678901234567890', '2029-08-31', '567');

-- Insertando registros en la tabla Vehicle_Company
INSERT INTO Vehicle_Company (nit, name, phone, email, address, monthly_fee, transporter_count, vehicle_count, login_attempts, locked_until, stateCompanyVehicle, password, fk_card_number) VALUES
('1234567890', 'Transportes A', '1234567890', 'a@transportes.com', 'Calle 123', 1000.0, 5, 10, 0, NULL, 'enabled', 'password1', '1234567890123456'),
('2345678901', 'Transportes B', '2345678901', 'b@transportes.com', 'Calle 234', 1200.0, 4, 8, 0, NULL, 'enabled', 'password2', '2345678901234567'),
('3456789012', 'Transportes C', '3456789012', 'c@transportes.com', 'Calle 345', 1500.0, 3, 6, 0, NULL, 'enabled', 'password3', '3456789012345678'),
('4567890123', 'Transportes D', '4567890123', 'd@transportes.com', 'Calle 456', 1100.0, 2, 4, 0, NULL, 'enabled', 'password4', '4567890123456789'),
('5678901234', 'Transportes E', '5678901234', 'e@transportes.com', 'Calle 567', 1300.0, 1, 2, 0, NULL, 'enabled', 'password5', '5678901234567890');

-- Insertando registros en la tabla Intermediary
INSERT INTO Intermediary (name, email, phone, monthly_fee, address, login_attempts, locked_until, stateIntermediary, password, fk_card_number) VALUES
('Intermediario A', 'a@intermediario.com', '1234567890', 500.0, 'Calle 123', 0, NULL, 'enabled', 'password1', '1234567890123456'),
('Intermediario B', 'b@intermediario.com', '2345678901', 600.0, 'Calle 234', 0, NULL, 'enabled', 'password2', '2345678901234567'),
('Intermediario C', 'c@intermediario.com', '3456789012', 700.0, 'Calle 345', 0, NULL, 'enabled', 'password3', '3456789012345678'),
('Intermediario D', 'd@intermediario.com', '4567890123', 800.0, 'Calle 456', 0, NULL, 'enabled', 'password4', '4567890123456789'),
('Intermediario E', 'e@intermediario.com', '5678901234', 900.0, 'Calle 567', 0, NULL, 'enabled', 'password5', '5678901234567890');

-- Insertando registros en la tabla Transporter
INSERT INTO Transporter (name, id_number, email, phone, license, status, login_attempts, locked_until, stateTransporter, password, fk_card_number) VALUES
('Transportista A', '1234567890', 'a@transportista.com', '1234567890', 'LIC123', 'Inactive', 0, NULL, 'enabled', 'password1', '1234567890123456'),
('Transportista B', '2345678901', 'b@transportista.com', '2345678901', 'LIC234', 'Inactive', 0, NULL, 'enabled', 'password2', '2345678901234567'),
('Transportista C', '3456789012', 'c@transportista.com', '3456789012', 'LIC345', 'Inactive', 0, NULL, 'enabled', 'password3', '3456789012345678'),
('Transportista D', '4567890123', 'd@transportista.com', '4567890123', 'LIC456', 'Inactive', 0, NULL, 'enabled', 'password4', '4567890123456789'),
('Transportista E', '5678901234', 'e@transportista.com', '5678901234', 'LIC567', 'Inactive', 0, NULL, 'enabled', 'password5', '5678901234567890');

-- Insertando registros en la tabla Travel
INSERT INTO Travel (weight, origin, destination, payment, description, departureDate, deliverDate, stateTravel, fk_transporter_id, fk_intermediary_id) VALUES
(1000, 'Ciudad A', 'Ciudad B', 500.0, 'Carga de alimentos', '2023-05-01', '2023-05-02', 'enabled', 1, 1),
(2000, 'Ciudad B', 'Ciudad C', 1000.0, 'Carga de ropa', '2023-06-01', '2023-06-03', 'enabled', 2, 2),
(1500, 'Ciudad C', 'Ciudad D', 750.0, 'Carga de muebles', '2023-07-01', '2023-07-04', 'enabled', 3, 3),
(2500, 'Ciudad D', 'Ciudad E', 1250.0, 'Carga de electrodomésticos', '2023-08-01', '2023-08-05', 'enabled', 4, 4),
(3000, 'Ciudad E', 'Ciudad F', 1500.0, 'Carga de maquinaria', '2023-09-01', '2023-09-06', 'enabled', 5, 5);

-- Insertando registros en la tabla Vehicle
INSERT INTO Vehicle (license_plate, description, capacity, vehicle_type, load_type, stateVehicle, fk_vehicle_company_id) VALUES
('ABC123', 'Camión grande', 2000.0, 'Camión', 'Carga pesada', 'enabled', '1234567890'),
('DEF456', 'Camión mediano', 1500.0, 'Camión', 'Carga mediana', 'enabled', '2345678901'),
('GHI789', 'Camioneta', 1000.0, 'Camioneta', 'Carga ligera', 'enabled', '3456789012'),
('JKL012', 'Furgoneta', 500.0, 'Furgoneta', 'Carga pequeña', 'enabled', '4567890123'),
('MNO345', 'Tráiler', 3000.0, 'Tráiler', 'Carga extra pesada', 'enabled', '5678901234');
