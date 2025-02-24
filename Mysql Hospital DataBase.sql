CREATE DATABASE HospitalDB;
USE HospitalDB;
CREATE TABLE Patients (
    PatientID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Age INT NOT NULL,
    Gender ENUM('Male', 'Female') NOT NULL,
    Address VARCHAR(255),
    ContactNumber VARCHAR(15) UNIQUE NOT NULL
);
CREATE TABLE Doctors (
    DoctorID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Specialization VARCHAR(100) NOT NULL,
    ContactNumber VARCHAR(15) UNIQUE NOT NULL
);
CREATE TABLE Appointments (
    AppointmentID INT AUTO_INCREMENT PRIMARY KEY,
    PatientID INT NOT NULL,
    DoctorID INT NOT NULL,
    AppointmentDate DATE NOT NULL,
    Diagnosis VARCHAR(255),
    UNIQUE (PatientID, DoctorID, AppointmentDate),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID) ON DELETE CASCADE,
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID) ON DELETE CASCADE
);
CREATE TABLE Prescriptions (
    PrescriptionID INT AUTO_INCREMENT PRIMARY KEY,
    AppointmentID INT NOT NULL,
    MedicationName VARCHAR(100) NOT NULL,
    Dosage VARCHAR(50) NOT NULL,
    FOREIGN KEY (AppointmentID) REFERENCES Appointments(AppointmentID) ON DELETE CASCADE
);
INSERT INTO Patients (Name, Age, Gender, Address, ContactNumber)
VALUES 
    ('John Doe', 30, 'Male', '123 Main St', '9876543210'),
    ('Jane Smith', 45, 'Female', '456 Elm St', '9876543211')
AS new
ON DUPLICATE KEY UPDATE
    Age = new.Age,
    Address = new.Address;
INSERT INTO Doctors (Name, Specialization, ContactNumber)
VALUES 
    ('Dr. Adams', 'Cardiologist', '1234567890'),
    ('Dr. Brown', 'Neurologist', '1234567891')
AS new
ON DUPLICATE KEY UPDATE
    Specialization = new.Specialization;
INSERT INTO Appointments (PatientID, DoctorID, AppointmentDate, Diagnosis)
VALUES 
    (1, 1, '2025-01-28', 'Chest Pain'),
    (2, 2, '2025-01-29', 'Migraine')
AS new
ON DUPLICATE KEY UPDATE
    Diagnosis = new.Diagnosis;
INSERT INTO Prescriptions (AppointmentID, MedicationName, Dosage)
VALUES 
    (1, 'Aspirin', '100 mg'),
    (2, 'Paracetamol', '500 mg');
