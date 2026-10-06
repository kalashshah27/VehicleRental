-- VEHICLE RENTAL PROJECT - FRESH DATABASE

CREATE DATABASE IF NOT EXISTS vehicle_rental;
USE vehicle_rental;

DROP TABLE IF EXISTS bookings;
DROP TABLE IF EXISTS vehicles;

CREATE TABLE vehicles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    vehicle_name VARCHAR(100) NOT NULL,
    vehicle_type VARCHAR(50) NOT NULL,
    vehicle_number VARCHAR(30) NOT NULL,
    price_per_day INT NOT NULL,
    image VARCHAR(500) NOT NULL,
    status VARCHAR(20) DEFAULT 'Available'
);

CREATE TABLE bookings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    vehicle_id INT NOT NULL,
    customer_name VARCHAR(100) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    email VARCHAR(100) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_amount INT NOT NULL,
    booking_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (vehicle_id) REFERENCES vehicles(id)
);

INSERT INTO vehicles
(vehicle_name, vehicle_type, vehicle_number, price_per_day, image, status)
VALUES
('Audi','Car','GJ01AU1001',3000,'images/audi.jpg','Available'),
('BMW','Car','GJ01BM1002',3500,'images/bmw.jpg','Available'),
('Thar','Car','GJ01TH1003',2800,'images/thar.jpg','Available'),
('Hyundai i20','Car','GJ01IY1004',1800,'images/i20.jpg','Available'),
('Tata Curvv','Car','GJ01CV1005',2200,'images/curvv.jpg','Available'),
('Maruti Baleno','Car','GJ01BA1006',1600,'images/baleno.jpg','Available'),
('KTM','Bike','GJ01KT2001',1200,'images/ktm.jpg','Available'),
('Royal Enfield','Bike','GJ01RE2002',1000,'images/royal_enfield.jpg','Available'),
('Splendor','Bike','GJ01SP2003',600,'images/splendor.jpg','Available'),
('Yamaha R15','Bike','GJ01YR2004',1100,'images/yamaha_r15.jpg','Available'),
('Honda Activa','Scooter','GJ01AC3001',500,'images/activa.jpg','Available'),
('Jupiter','Scooter','GJ01JP3002',500,'images/jupiter.jpg','Available'),
('Chetak','Scooter','GJ01CH3003',700,'images/chetak.jpg','Available'),
('Avenis','Scooter','GJ01AV3004',600,'images/avenis.jpg','Available');
