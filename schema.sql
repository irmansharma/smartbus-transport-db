CREATE DATABASE smartbus_db;
USE smartbus_db;

CREATE TABLE buses (
    bus_id INT AUTO_INCREMENT PRIMARY KEY,
    model VARCHAR(50),
    capacity INT
);

CREATE TABLE drivers (
    driver_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    license_number VARCHAR(20) UNIQUE,
    phone VARCHAR(15)
);

CREATE TABLE routes (
    route_id INT AUTO_INCREMENT PRIMARY KEY,
    origin VARCHAR(100),
    destination VARCHAR(100),
    total_distance_km DECIMAL(5,2)
);

CREATE TABLE stops (
    stop_id INT AUTO_INCREMENT PRIMARY KEY,
    stop_name VARCHAR(100),
    location VARCHAR(100)
);

CREATE TABLE bus_stop_map (
    route_id INT,
    stop_id INT,
    stop_order INT,
    PRIMARY KEY (route_id, stop_order),
    FOREIGN KEY (route_id) REFERENCES routes(route_id),
    FOREIGN KEY (stop_id) REFERENCES stops(stop_id)
);

CREATE TABLE schedules (
    schedule_id INT AUTO_INCREMENT PRIMARY KEY,
    bus_id INT,
    route_id INT,
    driver_id INT,
    departure_time DATETIME,
    arrival_time DATETIME,
    FOREIGN KEY (bus_id) REFERENCES buses(bus_id),
    FOREIGN KEY (route_id) REFERENCES routes(route_id),
    FOREIGN KEY (driver_id) REFERENCES drivers(driver_id)
);

CREATE TABLE passengers (
    passenger_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15)
);

CREATE TABLE tickets (
    ticket_id INT AUTO_INCREMENT PRIMARY KEY,
    passenger_id INT,
    schedule_id INT,
    seat_number INT,
    booking_time DATETIME,
    FOREIGN KEY (passenger_id) REFERENCES passengers(passenger_id),
    FOREIGN KEY (schedule_id) REFERENCES schedules(schedule_id)
);

INSERT INTO buses (model, capacity) VALUES
('Tata Starbus Ultra', 50),
('Ashok Leyland Falcon', 48),
('Volvo 9400', 55),
('Eicher Skyline Pro', 40),
('BharatBenz Staffliner', 45),
('Force Traveller XL', 30),
('Scania Metrolink HD', 54),
('Mahindra Cruzio Grande', 42),
('Isuzu City Bus', 35),
('JBM EcoLife Electric', 38);


INSERT INTO drivers (name, license_number, phone) VALUES
('Ravi Sharma', 'DL-12345', '9876543210'),
('Amit Patel', 'GJ-67890', '9123456789'),
('Neeraj Verma', 'MH-11223', '9988776655'),
('Suresh Iyer', 'KA-33445', '9090909090'),
('Deepak Singh', 'UP-55667', '9811122233'),
('Rajesh Thakur', 'HR-77889', '7000077777'),
('Karan Mehta', 'RJ-88990', '8222233333'),
('Shyam Lal', 'TN-99112', '7666655555'),
('Iqbal Khan', 'JK-66110', '9444499999'),
('Bhola Yadav', 'BR-12121', '9555544444');


INSERT INTO routes (origin, destination, total_distance_km) VALUES
('Chandigarh', 'Delhi', 260.5),
('Delhi', 'Agra', 233.8),
('Mumbai', 'Pune', 149.2),
('Bangalore', 'Chennai', 347.9),
('Jaipur', 'Jodhpur', 338.0),
('Hyderabad', 'Vijayawada', 275.3),
('Lucknow', 'Kanpur', 82.5),
('Indore', 'Bhopal', 195.0),
('Ahmedabad', 'Surat', 265.7),
('Kolkata', 'Durgapur', 175.4);


INSERT INTO stops (stop_name, location) VALUES
('ISBT Chandigarh', 'Sector 43'),
('Kashmere Gate', 'Delhi'),
('Agra Fort Stop', 'Agra Central'),
('Pune Station', 'Pune'),
('Mumbai Central', 'Mumbai'),
('Majestic Bus Stand', 'Bangalore'),
('Chennai Central', 'Chennai'),
('Sindhi Camp', 'Jaipur'),
('Ratanada Stop', 'Jodhpur'),
('MGBS', 'Hyderabad'),
('Benz Circle', 'Vijayawada'),
('Alambagh', 'Lucknow'),
('Jhakarkati Bus Stand', 'Kanpur'),
('Sarwate Bus Stand', 'Indore'),
('Habibganj', 'Bhopal'),
('Paldi', 'Ahmedabad'),
('Udhna Darwaja', 'Surat'),
('Esplanade', 'Kolkata'),
('City Centre', 'Durgapur'),
('Maninagar', 'Ahmedabad');



INSERT INTO bus_stop_map (route_id, stop_id, stop_order) VALUES
-- Chandigarh → Delhi
(1, 1, 1),  -- ISBT Chandigarh
(1, 2, 2),  -- Kashmere Gate (Delhi)

-- Delhi → Agra
(2, 2, 1),  -- Kashmere Gate
(2, 3, 2),  -- Agra Fort Stop

-- Mumbai → Pune
(3, 5, 1),  -- Mumbai Central
(3, 4, 2),  -- Pune Station

-- Bangalore → Chennai
(4, 6, 1),  -- Majestic Bus Stand
(4, 7, 2),  -- Chennai Central

-- Jaipur → Jodhpur
(5, 8, 1),  -- Sindhi Camp
(5, 9, 2),  -- Ratanada Stop

-- Hyderabad → Vijayawada
(6, 10, 1), -- MGBS
(6, 11, 2), -- Benz Circle

-- Lucknow → Kanpur
(7, 12, 1), -- Alambagh
(7, 13, 2), -- Jhakarkati Bus Stand

-- Indore → Bhopal
(8, 14, 1), -- Sarwate Bus Stand
(8, 15, 2), -- Habibganj

-- Ahmedabad → Surat
(9, 20, 1), -- Maninagar
(9, 16, 2), -- Paldi
(9, 17, 3), -- Udhna Darwaja

-- Kolkata → Durgapur
(10, 18, 1), -- Esplanade
(10, 19, 2); -- City Centre


INSERT INTO schedules (bus_id, route_id, driver_id, departure_time, arrival_time) VALUES
(1, 1, 1, '2025-06-25 06:00:00', '2025-06-25 11:00:00'),
(2, 2, 2, '2025-06-25 08:30:00', '2025-06-25 13:00:00'),
(3, 3, 3, '2025-06-25 07:00:00', '2025-06-25 09:30:00'),
(4, 4, 4, '2025-06-25 09:00:00', '2025-06-25 15:00:00'),
(5, 5, 5, '2025-06-25 06:15:00', '2025-06-25 12:00:00'),
(6, 6, 6, '2025-06-25 10:00:00', '2025-06-25 16:00:00'),
(7, 7, 7, '2025-06-25 05:00:00', '2025-06-25 07:00:00'),
(8, 8, 8, '2025-06-25 14:00:00', '2025-06-25 18:00:00'),
(9, 9, 9, '2025-06-25 06:30:00', '2025-06-25 11:00:00'),
(10, 10, 10, '2025-06-25 08:00:00', '2025-06-25 12:30:00'),
(1, 1, 3, '2025-06-26 06:00:00', '2025-06-26 11:00:00'),
(2, 2, 4, '2025-06-26 08:30:00', '2025-06-26 13:00:00');




INSERT INTO passengers (name, email, phone) VALUES
('Anjali Kapoor', 'anjali.kapoor@example.com', '9876501234'),
('Rahul Joshi', 'rahul.joshi@example.com', '9123456780'),
('Sneha Reddy', 'sneha.reddy@example.com', '9988774455'),
('Vikram Singh', 'vikram.singh@example.com', '9090901234'),
('Meera Nair', 'meera.nair@example.com', '9811102233'),
('Karan Malhotra', 'karan.malhotra@example.com', '7000071122'),
('Pooja Sharma', 'pooja.sharma@example.com', '8222203333'),
('Sahil Gupta', 'sahil.gupta@example.com', '7666615555'),
('Nisha Patel', 'nisha.patel@example.com', '9444409999'),
('Aditya Desai', 'aditya.desai@example.com', '9555504444'),
('Rina DSouza', 'rina.dsouza@example.com', '9876512345'),
('Manish Kumar', 'manish.kumar@example.com', '9123456799'),
('Divya Joshi', 'divya.joshi@example.com', '9988774466'),
('Amitabh Verma', 'amitabh.verma@example.com', '9090905678'),
('Sheetal Iyer', 'sheetal.iyer@example.com', '9811102244'),
('Rohit Mehta', 'rohit.mehta@example.com', '7000073344'),
('Neha Lal', 'neha.lal@example.com', '8222205555'),
('Suresh Khan', 'suresh.khan@example.com', '7666619999'),
('Alka Yadav', 'alka.yadav@example.com', '9444408888'),
('Rajesh Singh', 'rajesh.singh@example.com', '9555507777'),
('Tina Agarwal', 'tina.agarwal@example.com', '9876523456'),
('Deepak Rao', 'deepak.rao@example.com', '9123467890'),
('Sonal Gupta', 'sonal.gupta@example.com', '9988775577'),
('Ajay Patel', 'ajay.patel@example.com', '9090906789'),
('Maya Nair', 'maya.nair@example.com', '9811122244'),
('Vikas Malhotra', 'vikas.malhotra@example.com', '7000074455'),
('Priya Sharma', 'priya.sharma@example.com', '8222206666'),
('Sunil Gupta', 'sunil.gupta@example.com', '7666622222'),
('Kavita Desai', 'kavita.desai@example.com', '9444411111'),
('Rajiv D Souza', 'rajiv.dsouza@example.com', '9555533333');



INSERT INTO tickets (passenger_id, schedule_id, seat_number, booking_time) VALUES
(1, 1, 5, '2025-06-20 10:00:00'),
(2, 1, 6, '2025-06-20 10:05:00'),
(3, 2, 10, '2025-06-21 11:00:00'),
(4, 3, 3, '2025-06-22 09:30:00'),
(5, 4, 20, '2025-06-22 10:30:00'),
(6, 5, 12, '2025-06-22 11:00:00'),
(7, 6, 7, '2025-06-23 08:00:00'),
(8, 7, 15, '2025-06-23 08:30:00'),
(9, 8, 21, '2025-06-23 09:00:00'),
(10, 9, 5, '2025-06-24 12:00:00'),
(11, 10, 11, '2025-06-24 13:00:00'),
(12, 11, 4, '2025-06-24 14:00:00'),
(13, 12, 8, '2025-06-24 15:00:00'),
(14, 1, 9, '2025-06-24 16:00:00'),
(15, 2, 13, '2025-06-25 07:00:00'),
(16, 3, 14, '2025-06-25 08:00:00'),
(17, 4, 2, '2025-06-25 09:00:00'),
(18, 5, 18, '2025-06-25 10:00:00'),
(19, 6, 25, '2025-06-25 11:00:00'),
(20, 7, 7, '2025-06-25 12:00:00'),
(21, 8, 9, '2025-06-25 13:00:00'),
(22, 9, 11, '2025-06-25 14:00:00'),
(23, 10, 15, '2025-06-25 15:00:00'),
(24, 11, 19, '2025-06-25 16:00:00'),
(25, 12, 3, '2025-06-25 17:00:00'),
(26, 1, 1, '2025-06-26 08:00:00'),
(27, 2, 4, '2025-06-26 09:00:00'),
(28, 3, 8, '2025-06-26 10:00:00'),
(29, 4, 6, '2025-06-26 11:00:00'),
(30, 5, 10, '2025-06-26 12:00:00'),
(1, 6, 14, '2025-06-26 13:00:00'),
(2, 7, 3, '2025-06-26 14:00:00'),
(3, 8, 5, '2025-06-26 15:00:00'),
(4, 9, 7, '2025-06-26 16:00:00'),
(5, 10, 2, '2025-06-26 17:00:00'),
(6, 11, 12, '2025-06-27 08:00:00'),
(7, 12, 9, '2025-06-27 09:00:00'),
(8, 1, 18, '2025-06-27 10:00:00'),
(9, 2, 20, '2025-06-27 11:00:00'),
(10, 3, 15, '2025-06-27 12:00:00'),
(11, 4, 11, '2025-06-27 13:00:00'),
(12, 5, 13, '2025-06-27 14:00:00'),
(13, 6, 8, '2025-06-27 15:00:00'),
(14, 7, 6, '2025-06-27 16:00:00'),
(15, 8, 7, '2025-06-27 17:00:00'),
(16, 9, 10, '2025-06-28 08:00:00'),
(17, 10, 4, '2025-06-28 09:00:00'),
(18, 11, 2, '2025-06-28 10:00:00'),
(19, 12, 1, '2025-06-28 11:00:00');

