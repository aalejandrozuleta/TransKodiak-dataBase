-- Creación de la base de datos
create database Transkodiak;

use Transkodiak;

-- Tabla Vehicle_Company
create table Vehicle_Company (
    nit varchar(30) primary key not null,
    name varchar(50),
    phone varchar(15),
    email varchar(50) unique,
    address varchar(100),
    monthly_fee float,
    transporter_count int,
    vehicle_count int
);

-- Tabla Intermediary
create table Intermediary (
    intermediary_id int primary key auto_increment not null,
    name varchar(50),
    email varchar(50),
    phone varchar(15),
    monthly_fee float,
    address varchar(100)
);

-- Tabla Transporter
create table Transporter (
    transporter_id int primary key auto_increment not null,
    name varchar(50),
    id_number varchar(20),
    email varchar(50),
    phone varchar(15),
    license varchar(30),
    status ENUM('Active', 'Inactive', 'In transit'),
    fk_nit varchar(30) not null,
    foreign key (fk_nit) references Vehicle_Company(nit)
);

-- Tabla Trips
create table Trips (
    trip_id int primary key auto_increment not null ,
    weight int,
    origin varchar(100),
    destination varchar(100),
    payment float,
    description varchar(255),
    fk_transporter_id int not null,
    fk_intermediary_id int not null,
    foreign key (fk_transporter_id) references Transporter(transporter_id),
    foreign key (fk_intermediary_id) references Intermediary(intermediary_id)
);

-- Tabla Vehicle
create table Vehicle (
    license_plate varchar(10) primary key not null,
    description varchar(255),
    capacity float,
    vehicle_type varchar(50),
    load_type varchar(50),
    fk_vehicle_company_id varchar(30) not null,
    foreign key (fk_vehicle_company_id) references Vehicle_Company(nit) on delete cascade
);