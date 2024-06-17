-- INSERCION DATOS

-- Insertar datos en la tabla Card
INSERT INTO Card (card_number, expiration_date, cvv) VALUES 
('1111222233334444', '2025-12-31', '111'),
('2222333344445555', '2023-08-31', '222'),
('3333444455556666', '2024-05-30', '333'),
('4444555566667777', '2024-11-15', '444'),
('5555666677778888', '2025-01-20', '555');

select * from Card;

-- Insertar datos en la tabla Vehicle_Company
INSERT INTO Vehicle_Company (nit, name, phone, email, address, monthly_fee, transporter_count, vehicle_count, login_attempts, locked_until, stateCompanyVehicle, password, fk_card_number) VALUES
('A123456789', 'Heavy Transport Inc.', '555-1234', 'contact@heavytransport.com', '123 Heavy St', 500.0, 15, 20, 0, NULL, 'enabled', 'password1', '1111222233334444'),
('B234567890', 'Load Masters LLC', '555-5678', 'support@loadmasters.com', '456 Load Rd', 600.0, 20, 25, 0, NULL, 'enabled', 'password2', '2222333344445555'),
('C345678901', 'Cargo Express', '555-9999', 'info@cargoexpress.com', '789 Express Blvd', 550.0, 18, 22, 0, NULL, 'enabled', 'password3', '3333444455556666'),
('D456789012', 'Freight Movers', '555-8888', 'service@freightmovers.com', '321 Freight Ln', 650.0, 22, 28, 0, NULL, 'enabled', 'password4', '4444555566667777'),
('E567890123', 'Bulk Carriers', '555-7777', 'hello@bulkcarriers.com', '654 Bulk Ave', 700.0, 25, 30, 0, NULL, 'enabled', 'password5', '5555666677778888');
select * from Vehicle_Company;

-- Insertar datos en la tabla Intermediary
INSERT INTO Intermediary (name, email, phone, monthly_fee, address, login_attempts, locked_until, stateIntermediary, password, fk_card_number) VALUES
('Intermediary X', 'x@intermediary.com', '555-4321', 50.0, '111 Pine St', 0, NULL, 'enabled', 'passwordX', '1111222233334444'),
('Intermediary Y', 'y@intermediary.com', '555-8765', 60.0, '222 Cedar St', 0, NULL, 'enabled', 'passwordY', '2222333344445555'),
('Intermediary Z', 'z@intermediary.com', '555-0000', 55.0, '333 Birch St', 0, NULL, 'enabled', 'passwordZ', '3333444455556666'),
('Intermediary A', 'a@intermediary.com', '555-1111', 65.0, '444 Maple St', 0, NULL, 'enabled', 'passwordA', '4444555566667777'),
('Intermediary B', 'b@intermediary.com', '555-2222', 70.0, '555 Oak St', 0, NULL, 'enabled', 'passwordB', '5555666677778888');
select * from Intermediary;

-- Insertar datos en la tabla Transporter
INSERT INTO Transporter (name, id_number, email, phone, license, statusTransporter, fk_nit, login_attempts, locked_until, stateTransporter, password) VALUES
('Transporter 1', 'T111122223', 'transporter1@logistics.com', '555-6789', 'LIC111', 'Active', 'A123456789', 0, NULL, 'enabled', 'passwordT1'),
('Transporter 2', 'T222233334', 'transporter2@logistics.com', '555-4321', 'LIC222', 'Inactive', 'B234567890', 0, NULL, 'enabled', 'passwordT2'),
('Transporter 3', 'T333344445', 'transporter3@logistics.com', '555-1111', 'LIC333', 'In transit', 'C345678901', 0, NULL, 'enabled', 'passwordT3'),
('Transporter 4', 'T444455556', 'transporter4@logistics.com', '555-8888', 'LIC444', 'Active', 'D456789012', 0, NULL, 'enabled', 'passwordT4'),
('Transporter 5', 'T555566667', 'transporter5@logistics.com', '555-7777', 'LIC555', 'Inactive', 'E567890123', 0, NULL, 'enabled', 'passwordT5');
select * from Transporter;
-- Insertar datos en la tabla Travel
INSERT INTO Travel (weight, origin, destination, payment, description, departureDate, deliverDate, stateTravel, fk_transporter_id, fk_intermediary_id) VALUES
(15000, 'Warehouse A', 'Port B', 2000.0, 'Heavy machinery', '2023-01-01', '2023-01-02', 'enabled', 1, 1),
(20000, 'Factory C', 'Distribution D', 2500.0, 'Construction materials', '2023-02-01', '2023-02-03', 'enabled', 2, 2),
(18000, 'Depot E', 'Site F', 2200.0, 'Steel rods', '2023-03-01', '2023-03-04', 'enabled', 3, 3),
(17000, 'Warehouse G', 'Port H', 2100.0, 'Electronic equipment', '2023-04-01', '2023-04-03', 'enabled', 4, 4),
(19000, 'Factory I', 'Warehouse J', 2300.0, 'Automotive parts', '2023-05-01', '2023-05-02', 'enabled', 5, 5);
select * from Travel;

-- Insertar datos en la tabla Vehicle
INSERT INTO Vehicle (license_plate, description, capacity, vehicle_type, load_type, stateVehicle, fk_vehicle_company_id) VALUES
('JKL123', '18-Wheeler', 30000.0, 'Truck', 'Heavy', 'enabled', 'A123456789'),
('MNO456', 'Flatbed', 25000.0, 'Truck', 'Oversized', 'enabled', 'B234567890'),
('PQR789', 'Tanker', 20000.0, 'Truck', 'Liquid', 'enabled', 'C345678901'),
('STU012', 'Box Truck', 15000.0, 'Truck', 'General', 'enabled', 'D456789012'),
('VWX345', 'Refrigerated', 18000.0, 'Truck', 'Perishable', 'enabled', 'E567890123');
select *from Vehicle;