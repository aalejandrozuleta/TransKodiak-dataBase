drop database Transkodiak;

CREATE DATABASE Transkodiak;

USE Transkodiak;

CREATE TABLE
    Card (
        card_number VARCHAR(100) NOT NULL PRIMARY KEY,
        expiration_date DATE NOT NULL,
        cvv VARCHAR(100) NOT NULL
    );

CREATE TABLE
    Vehicle_Company (
        nit VARCHAR(30) PRIMARY KEY NOT NULL,
        imageUrl VARCHAR(255),
        name VARCHAR(50) NOT NULL,
        phone VARCHAR(15),
        email VARCHAR(50) UNIQUE,
        address VARCHAR(100),
        monthly_fee FLOAT,
        transporter_count INT,
        vehicle_count INT,
        stateCompanyVehicle ENUM ('enabled', 'disabled') DEFAULT 'enabled',
        password VARCHAR(255),
        fk_card_number VARCHAR(100),
        FOREIGN KEY (fk_card_number) REFERENCES Card (card_number),
        INDEX idx_stateCompanyVehicle (stateCompanyVehicle)
    );

create table
    Intermediary (
        intermediary_id int primary key auto_increment not null,
        name varchar(50) not null unique,
        email varchar(50) not null unique,
        phone varchar(15) not null unique,
        imageUrl VARCHAR(255),
        monthly_fee float,
        address varchar(100) not null,
        password VARCHAR(255) not null,
        stateIntermediary ENUM ('enabled', 'disabled') default 'enabled',
        fk_card_number varchar(100),
        foreign key (fk_card_number) references Card (card_number),
        INDEX idx_stateIntermediary (stateIntermediary)
    );

CREATE TABLE
    Transporter (
        transporter_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
        name VARCHAR(50) NOT NULL,
        identification_card VARCHAR(20) NOT NULL UNIQUE,
        email VARCHAR(50) UNIQUE,
        phone VARCHAR(15),
        imageUrl VARCHAR(255),
        license VARCHAR(30) NOT NULL,
        statusTransporter ENUM ('Active', 'Inactive', 'In transit') DEFAULT 'Active',
        stateTransporter ENUM ('enabled', 'disabled') DEFAULT 'enabled',
        password VARCHAR(255),
        fk_nit VARCHAR(30) NOT NULL,
        FOREIGN KEY (fk_nit) REFERENCES Vehicle_Company (nit),
        INDEX idx_statusTransporter (statusTransporter),
        INDEX idx_stateTransporter (stateTransporter)
    );

CREATE TABLE
    Vehicle (
        license_plate varchar(10),
        capacity varchar(30) NOT NULL,
        vehicle_type varchar(50) NOT NULL,
        load_type varchar(50) NOT NULL,
        stateVehicle ENUM ('enabled', 'disabled') DEFAULT 'enabled',
        model varchar(30),
        brand varchar(30),
        primary key (license_plate),
        fk_nit VARCHAR(30) NOT NULL,
        FOREIGN KEY (fk_nit) REFERENCES Vehicle_Company (nit),
        INDEX idx_stateVehicle (stateVehicle)
    );