CREATE TABLE Trips (
    trip_id INT PRIMARY KEY,
    pickup_datetime DATETIME,
    dropoff_datetime DATETIME,
    pickup_longitude DECIMAL(10, 6),
    pickup_latitude DECIMAL(10, 6),
    dropoff_longitude DECIMAL(10, 6),
    dropoff_latitude DECIMAL(10, 6),
    passenger_count INT,
    trip_distance DECIMAL(10, 2),
    fare_amount DECIMAL(10, 2),
    tip_amount DECIMAL(10, 2),
    total_amount DECIMAL(10, 2),
    payment_type VARCHAR(50),
    trip_duration INT
);


CREATE TABLE Vehicles (
    vehicle_id INT PRIMARY KEY,
    vendor_id VARCHAR(50),
    license_plate VARCHAR(50),
    vehicle_type VARCHAR(50),
    model VARCHAR(100),
    year INT
);


CREATE TABLE Drivers (
    driver_id INT PRIMARY KEY,
    driver_name VARCHAR(100),
    driver_license VARCHAR(50),
    driver_address VARCHAR(255),
    driver_phone VARCHAR(20),
    driver_rating DECIMAL(3, 2)
);
