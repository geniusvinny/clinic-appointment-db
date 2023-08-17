-- Create the Clinic table
CREATE TABLE Clinic (
    ClinicID INT PRIMARY KEY,
    ClinicName VARCHAR(255),
    Location VARCHAR(255),
    PhoneNumber VARCHAR(20)
);

-- Create the Health Practitioner table
CREATE TABLE HealthPractitioner (
    PractitionerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Role VARCHAR(50),
    ClinicID INT,
    CalendarID INT,
    FOREIGN KEY (ClinicID) REFERENCES Clinic(ClinicID),
    FOREIGN KEY (CalendarID) REFERENCES Calendar(CalendarID)
);

-- Create the Patient table
CREATE TABLE Patient (
    PatientID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    ContactNumber VARCHAR(20),
    Email VARCHAR(100),
    ElectronicRecordsSystemID VARCHAR(50)
);

-- Create the Appointment table
CREATE TABLE Appointment (
    AppointmentID INT PRIMARY KEY,
    PatientID INT,
    PractitionerID INT,
    ClinicID INT,
    AppointmentDateTime DATETIME,
    Status VARCHAR(50),
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (PractitionerID) REFERENCES HealthPractitioner(PractitionerID),
    FOREIGN KEY (ClinicID) REFERENCES Clinic(ClinicID)
);

-- Create the Calendar table
CREATE TABLE Calendar (
    CalendarID INT PRIMARY KEY,
    CalendarType VARCHAR(50),
    CalendarData TEXT
);
