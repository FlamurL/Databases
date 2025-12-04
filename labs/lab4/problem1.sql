CREATE TABLE DEPARTMENT (
  	dept_id VARCHAR(50) PRIMARY KEY,
  	name VARCHAR(50)
  );
  
CREATE TABLE DOCTOR (
  	doctor_id VARCHAR(50) PRIMARY KEY,
  	dept_id VARCHAR(50),
  	full_name VARCHAR(50),
  	contact VARCHAR(50),
  	FOREIGN KEY (dept_id) REFERENCES DEPARTMENT(dept_id) ON UPDATE CASCADE ON DELETE CASCADE
  );

CREATE TABLE SURGEON (
  	doctor_id VARCHAR(50) PRIMARY KEY,
  	speciality VARCHAR(50) NOT NULL,
  	surgical_license VARCHAR(50) UNIQUE,
  	FOREIGN KEY (doctor_id) REFERENCES DOCTOR(doctor_id) ON UPDATE CASCADE ON DELETE CASCADE
  );

CREATE TABLE NURSE (
  	doctor_id VARCHAR(50) PRIMARY KEY,
  	shift VARCHAR(50) DEFAULT 'DAY' CHECK (shift IN ('DAY', 'NIGHT', 'ROTATION')),
  	FOREIGN KEY (doctor_id) REFERENCES DOCTOR(doctor_id) ON UPDATE CASCADE ON DELETE CASCADE
  );

CREATE TABLE PATIENT (
  	patient_id VARCHAR(50) PRIMARY KEY,
  	full_name VARCHAR(50),
  	contact VARCHAR(50),
  	address VARCHAR(50) DEFAULT 'Not provided'
  );

CREATE TABLE EMERGENCY_CONTACT (
  	patient_id VARCHAR(50),
  	em_contact_id VARCHAR(50),
  	full_name VARCHAR(50),
  	contact VARCHAR(50),
   	relation VARCHAR(50) CHECK (relation IN ('PARENT', 'SIBLING', 'FRIEND', 'SPOUSE', 'OTHER')),
  	PRIMARY KEY (patient_id, em_contact_id),
  	FOREIGN KEY (patient_id) REFERENCES PATIENT(patient_id) ON UPDATE CASCADE ON DELETE CASCADE
  );

CREATE TABLE SURGERY (
  	surgeon_id VARCHAR(50),
  	nurse_id VARCHAR(50),
  	patient_id VARCHAR(50),
  	time TIME,
  	procedure NVARCHAR(500) NOT NULL,
  	PRIMARY KEY (surgeon_id, nurse_id, patient_id),
  	FOREIGN KEY (surgeon_id) REFERENCES SURGEON(doctor_id) ON UPDATE CASCADE ON DELETE CASCADE,
  	FOREIGN KEY (nurse_id) REFERENCES NURSE(doctor_id) ON UPDATE CASCADE ON DELETE CASCADE,
  	FOREIGN KEY (patient_id) REFERENCES PATIENT(patient_id) ON DELETE SET NULL ON UPDATE CASCADE
  );

CREATE TABLE CHECK_UP (
  	nurse_id VARCHAR(50),
  	patient_id VARCHAR(50),
  	check_date DATETIME,
  	diagnosis VARCHAR(255),
  	CHECK (check_date >= '2025-01-01' AND check_date < '2026-01-01'),
  	PRIMARY KEY (nurse_id, patient_id, check_date),
  	FOREIGN KEY (nurse_id) REFERENCES NURSE(doctor_id) ON DELETE SET DEFAULT ON UPDATE CASCADE,
  	FOREIGN KEY (patient_id) REFERENCES PATIENT(patient_id) ON UPDATE CASCADE ON DELETE CASCADE
  );
  
CREATE TABLE PRESCRIPTIONS (
  	nurse_id VARCHAR(50),
  	patient_id VARCHAR(50),
  	check_date DATETIME,
  	prescription VARCHAR(255),
  	dosage VARCHAR(50),
  	CHECK ((prescription LIKE '%fluid%' AND dosage LIKE '%ml') OR
			(prescription LIKE '%tablet%' AND dosage LIKE '%mg')),
  	PRIMARY KEY (nurse_id, patient_id, check_date, prescription),
  	FOREIGN KEY (nurse_id, patient_id, check_date) REFERENCES CHECK_UP(nurse_id, patient_id, check_date) ON UPDATE CASCADE ON DELETE CASCADE
  );
  
