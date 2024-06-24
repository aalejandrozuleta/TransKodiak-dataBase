-- INSERCION DATOS

-- Insertar datos en la tabla Card
INSERT INTO Card (card_number, expiration_date, cvv)
VALUES 
('1234-5678-9012-3456', '2025-08-15', '123'),
('2345-6789-0123-4567', '2024-07-21', '234'),
('3456-7890-1234-5678', '2026-06-30', '345'),
('4567-8901-2345-6789', '2023-05-19', '456'),
('5678-9012-3456-7890', '2027-04-22', '567');


select * from Card;

-- Insertar datos en la tabla Vehicle_Company
INSERT INTO Vehicle_Company (nit, name, phone, email, address, monthly_fee, transporter_count, vehicle_count, stateCompanyVehicle, password, fk_card_number)
VALUES 
('800123456', 'Company A', '555-0100', 'contact@companya.com', '123 Main St', 1500.00, 10, 5, 'enabled', 'passwordA', '1234-5678-9012-3456'),
('800234567', 'Company B', '555-0200', 'contact@companyb.com', '456 Oak St', 1300.00, 8, 4, 'enabled', 'passwordB', '2345-6789-0123-4567'),
('800345678', 'Company C', '555-0300', 'contact@companyc.com', '789 Pine St', 1700.00, 12, 6, 'disabled', 'passwordC', '3456-7890-1234-5678'),
('800456789', 'Company D', '555-0400', 'contact@companyd.com', '101 Maple St', 1100.00, 6, 3, 'enabled', 'passwordD', '4567-8901-2345-6789'),
('800567890', 'Company E', '555-0500', 'contact@companye.com', '202 Elm St', 1400.00, 9, 4, 'disabled', 'passwordE', '5678-9012-3456-7890');


-- Insertar datos en la tabla Intermediary
INSERT INTO Intermediary (name, email, phone, address, stateIntermediary, password)
VALUES 
('Intermediary A', 'intera@mail.com', '555-1100', '111 North St', 'enabled', 'passwordIA'),
('Intermediary B', 'interb@mail.com', '555-1200', '222 South St', 'disabled', 'passwordIB'),
('Intermediary C', 'interc@mail.com', '555-1300', '333 East St', 'enabled', 'passwordIC'),
('Intermediary D', 'interd@mail.com', '555-1400', '444 West St', 'enabled', 'passwordID'),
('Intermediary E', 'intere@mail.com', '555-1500', '555 Central St', 'disabled', 'passwordIE');

select * from Intermediary;

-- Insertar datos en la tabla Transporter
INSERT INTO Transporter (name, id_number, email, phone, license, statusTransporter, stateTransporter, password, fk_nit)
VALUES 
('Transporter A', '123456789', 'transa@mail.com', '555-2100', 'A123456', 'Active', 'enabled', 'passwordTA', '800123456'),
('Transporter B', '234567890', 'transb@mail.com', '555-2200', 'B234567', 'Inactive', 'disabled', 'passwordTB', '800234567'),
('Transporter C', '345678901', 'transc@mail.com', '555-2300', 'C345678', 'In transit', 'enabled', 'passwordTC', '800345678'),
('Transporter D', '456789012', 'transd@mail.com', '555-2400', 'D456789', 'Inactive', 'enabled', 'passwordTD', '800456789'),
('Transporter E', '567890123', 'transe@mail.com', '555-2500', 'E567890', 'Active', 'disabled', 'passwordTE', '800567890');


select * from Transporter;

-- Insertar datos en la tabla Travel
INSERT INTO Travel (weight, origin, destination, payment, description, departureDate, deliverDate, stateTravel, fk_transporter_id, fk_intermediary_id)
VALUES 
(500, 'City A', 'City B', 1500.00, 'Electronics', '2024-07-01', '2024-07-02', 'enabled', 1, 1),
(300, 'City B', 'City C', 1000.00, 'Furniture', '2024-08-15', '2024-08-16', 'enabled', 2, 2),
(700, 'City C', 'City D', 2000.00, 'Food', '2024-09-10', '2024-09-12', 'disabled', 3, 3),
(600, 'City D', 'City E', 1800.00, 'Clothing', '2024-10-05', '2024-10-06', 'enabled', 4, 4),
(400, 'City E', 'City F', 1200.00, 'Machinery', '2024-11-20', '2024-11-21', 'enabled', 5, 5);


select * from Travel;

-- Insertar datos en la tabla Vehicle
INSERT INTO Vehicle (license_plate, description, capacity, vehicle_type, load_type, stateVehicle, fk_vehicle_company_id)
VALUES 
('ABC123', 'Truck A', 10.0, 'Truck', 'General', 'enabled', '800123456'),
('DEF456', 'Truck B', 15.0, 'Truck', 'Refrigerated', 'enabled', '800234567'),
('GHI789', 'Van A', 8.0, 'Van', 'General', 'disabled', '800345678'),
('JKL012', 'Van B', 9.0, 'Van', 'Hazardous', 'enabled', '800456789'),
('MNO345', 'Truck C', 12.0, 'Truck', 'General', 'enabled', '800567890');

select *from Vehicle;