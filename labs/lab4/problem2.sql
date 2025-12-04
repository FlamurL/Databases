 
  
  CREATE Table Staff_Member(
id INT PRIMARY KEY,
academic_title VARCHAR(150),
salary FLOAT,
working_hours FLOAT,
institute_id INT,
FOREIGN KEY (institute_id) REFERENCES Institute(id)
ON DELETE CASCADE
ON UPDATE CASCADE,
CONSTRAINT C3 CHECK (academic_title = "BSc" OR academic_title = "MSc" OR academic_title = "PhD")
);

CREATE TABLE Professor (
sm_id INT PRIMARY KEY,
number_of_projects INT,
FOREIGN KEY (sm_id) REFERENCES Staff_Member(id)
ON DELETE CASCADE
ON UPDATE CASCADE,
CHECK (number_of_projects > 1)
);

CREATE TABLE Teach (
professor_id INT,
assistant_id INT,
course_id INT,
PRIMARY KEY(professor_id, assistant_id, course_id),
FOREIGN KEY (professor_id) REFERENCES Professor(sm_id)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (assistant_id) REFERENCES Assistant(sm_id)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (course_id) REFERENCES Course(id)
ON DELETE CASCADE
ON UPDATE CASCADE
);

CREATE TABLE Head (
staff_id INT,
network_id INT,
PRIMARY KEY (staff_id, network_id),
FOREIGN KEY (staff_id) REFERENCES Staff_Member(id)
ON DELETE SET DEFAULT
ON UPDATE CASCADE,
FOREIGN KEY (network_id) REFERENCES Mobility_Network(id)
ON DELETE CASCADE
ON UPDATE CASCADE
);

CREATE TABLE Student (
id INT PRIMARY KEY,
name VARCHAR(150),
surname VARCHAR(150),
email VARCHAR(150),
phone_number VARCHAR(150),
university_id INT,
FOREIGN KEY (university_id) REFERENCES University(id)
ON DELETE CASCADE
ON UPDATE CASCADE,
CONSTRAINT C1 CHECK (phone_number LIKE '+389%')
);

CREATE TABLE Professor_Thesis (
sm_id INT,
thesis VARCHAR(500),
PRIMARY KEY (sm_id, thesis),
FOREIGN KEY (sm_id) REFERENCES Professor(sm_id)
ON DELETE SET DEFAULT
ON UPDATE CASCADE
);
