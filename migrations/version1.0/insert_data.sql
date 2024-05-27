-- Inserciones en la tabla Vehicle_Company
insert into Vehicle_Company (nit, name, phone, email, address, monthly_fee, transporter_count, vehicle_count) 
values ('123456789', 'Transportes ABC', '3001234567', 'contacto@transportesabc.com', 'Calle 123 #45-67', 1000.0, 10, 20);

insert into Vehicle_Company (nit, name, phone, email, address, monthly_fee, transporter_count, vehicle_count) 
values ('987654321', 'Logística XYZ', '3109876543', 'info@logisticaxyz.com', 'Avenida 89 #34-12', 1500.0, 15, 30);

-- Inserciones en la tabla Intermediary
insert into Intermediary (name, email, phone, monthly_fee, address) 
values ('Intermediario 1', 'inter1@empresa.com', '3000000001', 500.0, 'Calle Falsa 123');

insert into Intermediary (name, email, phone, monthly_fee, address) 
values ('Intermediario 2', 'inter2@empresa.com', '3000000002', 700.0, 'Avenida Siempreviva 456');


-- Inserciones en la tabla Transporter
insert into Transporter (name, id_number, email, phone, license, status, fk_nit) 
values ('Transportador 1', '11111111', 'trans1@empresa.com', '3000000011', 'LIC123456', 'Active', '123456789');

insert into Transporter (name, id_number, email, phone, license, status, fk_nit) 
values ('Transportador 2', '22222222', 'trans2@empresa.com', '3000000022', 'LIC234567', 'Inactive', '987654321');


-- Inserciones en la tabla Trips
insert into Trips (weight, origin, destination, payment, description, fk_transporter_id, fk_intermediary_id) 
values (1000, 'Ciudad A', 'Ciudad B', 2000.0, 'Carga de alimentos', 1, 1);

insert into Trips (weight, origin, destination, payment, description, fk_transporter_id, fk_intermediary_id) 
values (1500, 'Ciudad C', 'Ciudad D', 2500.0, 'Materiales de construcción', 2, 2);

-- Inserciones en la tabla Vehicle
insert into Vehicle (license_plate, description, capacity, vehicle_type, load_type, fk_vehicle_company_id) 
values ('ABC1234', 'Camión grande', 5000.0, 'Camión', 'General', '123456789');

insert into Vehicle (license_plate, description, capacity, vehicle_type, load_type, fk_vehicle_company_id) 
values ('DEF5678', 'Camioneta pequeña', 2000.0, 'Camioneta', 'Fragil', '987654321');
