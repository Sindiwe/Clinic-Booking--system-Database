CREATE  Database ClinicBookingSystem;
USE ClinicBookingSystem;

-- 1. Patients Table
-- Stores patient personal and contact details
CREATE TABLE Patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    phone VARCHAR(20) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE,
    gender ENUM('Male', 'Female', 'Other') NOT NULL,
    address TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO Patients (first_name, last_name, date_of_birth, phone, email, gender, address) VALUES
('Alice', 'Smith', '1990-05-12', '0723456789', 'alice.smith@example.com', 'Female', '123 Main St, Cityville'),
('John', 'Doe', '1985-08-25', '0734567890', 'john.doe@example.com', 'Male', '456 Oak St, Townsville'),
('Maria', 'Johnson', '1992-12-01', '0745678901', 'maria.johnson@example.com', 'Female', '789 Pine St, Villagetown');

-- 2. Doctors Table
-- Stores doctor profiles, specialties, and contact information
CREATE TABLE Doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    specialty VARCHAR(100) NOT NULL,
    phone VARCHAR(20) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE,
    experience_years INT CHECK (experience_years >= 0),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO Doctors (first_name, last_name, specialty, phone, email, experience_years) VALUES
('Dr. Emily', 'Brown', 'Cardiology', '0812345678', 'emilybrown@gmail.com', 10),
('Dr. Michael', 'Green', 'Pediatrics', '0823456789', 'michael@gmail.com', 8),
('Dr. Sarah', 'White', 'Orthopedics', '0834567890', 'sarahwhite@gmail.com', 12);

-- 3. Appointments Table
-- Manages patient appointments and status tracking
CREATE TABLE Appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATE NOT NULL,
    appointment_time TIME NOT NULL,
    status ENUM('Scheduled', 'Completed', 'Cancelled') DEFAULT 'Scheduled',
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

INSERT INTO Appointments (patient_id, doctor_id, appointment_date, appointment_time, status, notes) VALUES
(1, 1, '2025-05-10', '09:00:00', 'Scheduled', 'Regular checkup'),
(2, 2, '2025-05-11', '10:30:00', 'Scheduled', 'Follow-up for fever'),
(3, 3, '2025-05-12', '11:00:00', 'Scheduled', 'Orthopedic consultation');

-- 4. Payments Table
-- Tracks payment transactions for appointments
CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method ENUM('Cash', 'Credit Card', 'Debit Card', 'Mobile Money') NOT NULL,
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id)
);

INSERT INTO Payments (appointment_id, amount, payment_method) VALUES
(1, 500.00, 'Cash'),
(2, 750.00, 'Credit Card'),
(3, 600.00, 'Mobile Money');

-- 5. Departments Table
-- Organizes medical departments within the clinic
CREATE TABLE Departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO Departments (name, description) VALUES
('Cardiology', 'Heart and cardiovascular care'),
('Pediatrics', 'Child and adolescent health'),
('Orthopedics', 'Bone and joint care');

-- 6. Doctor-Department Relationship
-- Links doctors to departments (many-to-many relationship)
CREATE TABLE Doctor_Department (
    doctor_id INT NOT NULL,
    department_id INT NOT NULL,
    PRIMARY KEY (doctor_id, department_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id),
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

INSERT INTO Doctor_Department (doctor_id, department_id) VALUES
(1, 1),
(2, 2),
(3, 3);

-- 7. Audit Logs Table
-- Records user actions for security and auditing
CREATE TABLE Audit_Logs (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    action TEXT NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO Audit_Logs (user_id, action) VALUES
(1, 'Created patient record for Alice Smith'),
(2, 'Scheduled appointment for John Doe'),
(3, 'Processed payment for Maria Johnson');