
CREATE TABLE Doctor (
    DoctorID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Specialty VARCHAR(255),
    LicenseNumber VARCHAR(20) UNIQUE,
    Phone VARCHAR(20),
    Email VARCHAR(255)
);

CREATE TABLE Patient (
    PatientID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    DateOfBirth DATE,
    Phone VARCHAR(20),
    Email VARCHAR(255)
);


CREATE TABLE Disease (
    DiseaseID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Description TEXT,
    Treatment TEXT
);


CREATE TABLE Visit (
    VisitID INT PRIMARY KEY,
    DoctorID INT,
    PatientID INT,
    DateOfVisit DATE,
    Diagnosis TEXT,
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID),
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);


CREATE TABLE Diagnosis (
    DiagnosisID INT PRIMARY KEY,
    VisitID INT,
    DiseaseID INT,
    FOREIGN KEY (VisitID) REFERENCES Visit(VisitID),
    FOREIGN KEY (DiseaseID) REFERENCES Disease(DiseaseID)
);


INSERT INTO Doctor (DoctorID, Name, Specialty, LicenseNumber, Phone, Email)
VALUES (1, 'Dr. John Smith', 'Cardiologist', '12345', '123-456-7890', 'john.smith@example.com');

INSERT INTO Patient (PatientID, Name, DateOfBirth, Phone, Email)
VALUES (1, 'Alice Johnson', '1990-05-15', '987-654-3210', 'alice.johnson@example.com');

INSERT INTO Disease (DiseaseID, Name, Description, Treatment)
VALUES (1, 'Hypertension', 'High blood pressure condition', 'Medication and lifestyle changes');

INSERT INTO Visit (VisitID, DoctorID, PatientID, DateOfVisit, Diagnosis)
VALUES (1, 1, 1, '2023-01-15', 'Patient presented with elevated blood pressure.');

INSERT INTO Diagnosis (DiagnosisID, VisitID, DiseaseID)
VALUES (1, 1, 1);  
