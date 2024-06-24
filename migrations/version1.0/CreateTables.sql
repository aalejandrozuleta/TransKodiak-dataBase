CREATE DATABASE Transkodiak;
USE Transkodiak;

drop database Transkodiak;

-- Creacion de tablas
-- Tabla Card
CREATE TABLE Card (
    card_number VARCHAR(100) NOT NULL PRIMARY KEY,
    expiration_date DATE NOT NULL,
    cvv VARCHAR(100) NOT NULL
);

-- Tabla Vehicle_Company
CREATE TABLE Vehicle_Company (
    nit VARCHAR(30) PRIMARY KEY NOT NULL,
    name VARCHAR(50) NOT NULL,
    phone VARCHAR(15),
    email VARCHAR(50) UNIQUE,
    address VARCHAR(100),
    monthly_fee FLOAT,
    transporter_count INT,
    vehicle_count INT,
    stateCompanyVehicle ENUM ('enabled', 'disabled') DEFAULT 'enabled',
    password VARCHAR(255),
    fk_card_number VARCHAR(100) NOT NULL,
    FOREIGN KEY (fk_card_number) REFERENCES Card (card_number),
    INDEX idx_stateCompanyVehicle (stateCompanyVehicle)
);

-- Tabla Intermediary
CREATE TABLE Intermediary (
    intermediary_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    address VARCHAR(100) NOT NULL,
    stateIntermediary ENUM ('enabled', 'disabled') DEFAULT 'enabled',
    password VARCHAR(255),
    INDEX idx_stateIntermediary (stateIntermediary)
);

-- Tabla Transporter
CREATE TABLE Transporter (
    transporter_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    id_number VARCHAR(20) NOT NULL UNIQUE,
    email VARCHAR(50) UNIQUE,
    phone VARCHAR(15),
    license VARCHAR(30) NOT NULL,
    statusTransporter ENUM ('Active', 'Inactive', 'In transit') DEFAULT 'Inactive',
    stateTransporter ENUM ('enabled', 'disabled') DEFAULT 'enabled',
    password VARCHAR(255),
    fk_nit VARCHAR(30) NOT NULL,
    FOREIGN KEY (fk_nit) REFERENCES Vehicle_Company (nit),
    INDEX idx_statusTransporter (statusTransporter),
    INDEX idx_stateTransporter (stateTransporter)
);

-- Tabla Travel
CREATE TABLE Travel (
    trip_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    weight INT UNSIGNED NOT NULL,
    origin VARCHAR(100) NOT NULL,
    destination VARCHAR(100) NOT NULL,
    payment FLOAT UNSIGNED NOT NULL,
    description VARCHAR(255),
    departureDate DATE NOT NULL,
    deliverDate DATE NOT NULL,
    stateTravel ENUM('enabled', 'disabled') DEFAULT 'enabled',
    fk_transporter_id INT UNSIGNED NOT NULL,
    fk_intermediary_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (fk_transporter_id) REFERENCES Transporter(transporter_id),
    FOREIGN KEY (fk_intermediary_id) REFERENCES Intermediary(intermediary_id) ON DELETE CASCADE,
    INDEX idx_weight (weight),
    INDEX idx_origin (origin),
    INDEX idx_destination (destination),
    INDEX idx_departureDate (departureDate),
    INDEX idx_deliverDate (deliverDate),
    INDEX idx_stateTravel (stateTravel)
);

-- Tabla Vehicle
CREATE TABLE Vehicle (
    license_plate VARCHAR(10) PRIMARY KEY NOT NULL,
    description VARCHAR(255),
    capacity FLOAT NOT NULL,
    vehicle_type VARCHAR(50) NOT NULL,
    load_type VARCHAR(50) NOT NULL,
    stateVehicle ENUM ('enabled', 'disabled'),
    fk_vehicle_company_id VARCHAR(30) NOT NULL,
    FOREIGN KEY (fk_vehicle_company_id) REFERENCES Vehicle_Company (nit) ON DELETE CASCADE,
    INDEX idx_capacity (capacity),
    INDEX idx_vehicle_type (vehicle_type),
    INDEX idx_load_type (load_type),
    INDEX idx_stateVehicle (stateVehicle)
);