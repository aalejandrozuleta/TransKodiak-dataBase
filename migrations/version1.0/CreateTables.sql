-- Creación de la base de datos
create database Transkodiak;
use Transkodiak;

-- Tabla card
create table
    Card (
        card_number varchar(100) not null primary key,
        expiration_date date not null,
        cvv varchar(100) not null
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
    fk_card_number VARCHAR(100),
    FOREIGN KEY (fk_card_number) REFERENCES Card (card_number),
    INDEX idx_stateCompanyVehicle (stateCompanyVehicle)
);

-- Tabla Intermediary
create table
    Intermediary (
        intermediary_id int primary key auto_increment not null,
        name varchar(50) not null,
        email varchar(50) not null unique,
        phone varchar(15) not unique,
        monthly_fee float not null,
        address varchar(100) not null,
        stateIntermediary ENUM ('enabled', 'disabled') default 'enabled' index,
        fk_card_number varchar(100),
        foreign key (fk_card_number) references Card (card_number)
    );

-- Tabla Transporter
create table
    Transporter (
        transporter_id int primary key auto_increment not null,
        name varchar(50) not null,
        id_number varchar(20) not null unique,
        email varchar(50) unique,
        phone varchar(15),
        license varchar(30) not null,
        status ENUM ('Active', 'Inactive', 'In transit') index default 'Inactive',
        fk_nit varchar(30) not null unsigned,
        foreign key (fk_nit) references Vehicle_Company (nit),
        login_attempts int default 0,
        locked_until datetime,
        stateTransporter ENUM ('enabled', 'disabled') default 'enabled' index,
        fk_card_number varchar(100) not null,
        foreign key (fk_card_number) references Card (card_number)
    );

-- Tabla Trips
create table
    Travel (
        trip_id int primary key auto_increment not null,
        weight int unsigned not null index,
        origin varchar(100) not null index,
        destination varchar(100) not null index,
        payment float unsigned not null,
        description varchar(255),
        departureDate date not null index,
        deliverDate date not null index,
        stateTravel ENUM ('enabled', 'disabled') default 'enabled' index,
        fk_transporter_id int not null unsigned,
        fk_intermediary_id int not null unsigned,
        foreign key (fk_transporter_id) references Transporter (transporter_id),
        foreign key (fk_intermediary_id) references Intermediary (intermediary_id) on delete cascade
    );

-- Tabla Vehicle
create table
    Vehicle (
        license_plate varchar(10) primary key not null,
        description varchar(255),
        capacity float not null index,
        vehicle_type varchar(50) not null index,
        load_type varchar(50) not null index,
        stateVehicle ENUM ('enabled', 'disabled') index,
        fk_vehicle_company_id varchar(30) not null,
        foreign key (fk_vehicle_company_id) references Vehicle_Company (nit) on delete cascade
    );

