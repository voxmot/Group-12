DROP DATABASE IF EXISTS dbUCF ; 
CREATE DATABASE IF NOT EXISTS dbUCF; 
USE dbUCF; 

DROP TABLE IF EXISTS Student;
CREATE TABLE Student(
  student_id varchar(8) UNIQUE NOT NULL PRIMARY KEY, 
  first_name varchar(20), 
  last_name varchar(30) 
);
 
 
DROP TABLE IF EXISTS Resource;
CREATE TABLE Resource(
  resource_id INT NOT NULL PRIMARY KEY UNIQUE AUTO_INCREMENT,
  resource_name varchar(20) NOT NULL, 
  student_capacity INT
);
 
CREATE TABLE Building_Resource(
  resource_id INT NOT NULL UNIQUE,
  building_code VARCHAR(5) NOT NULL,
  PRIMARY KEY(building_code, resource_id)
);
 
 
DROP TABLE IF EXISTS Usage_Record;
CREATE TABLE Usage_Record(
 
  id INT UNIQUE AUTO_INCREMENT, 
  PRIMARY KEY(id),
 
  resource_id INT,
  student_id VARCHAR(20),
  usage_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,  
 
  INDEX (student_id),
  FOREIGN KEY (student_id)
    REFERENCES Student(student_id) ON DELETE CASCADE ON UPDATE CASCADE,
 
  INDEX (resource_id),
  FOREIGN KEY (resource_id)
    REFERENCES Resource(resource_id) ON DELETE CASCADE ON UPDATE CASCADE
);
 
            
 
 
 
 
DROP TABLE IF EXISTS Building_Type;
CREATE TABLE Building_Type(
    id INT PRIMARY KEY UNIQUE AUTO_INCREMENT,
    type_name VARCHAR(10) UNIQUE
);
 
 
 
 
 
DROP TABLE IF EXISTS Building;
CREATE TABLE Building(
  building_code VARCHAR(5) UNIQUE PRIMARY KEY, 
  building_type INT NOT NULL,
  building_name VARCHAR(30) NOT NULL, 
  human_capacity INT,
  
  INDEX (building_type),
  FOREIGN KEY (building_type)
    REFERENCES Building_Type(id)
    ON DELETE CASCADE ON UPDATE CASCADE
);
 
# Building Sub-types
DROP TABLE IF EXISTS Academic;
CREATE TABLE Academic(
  building_code VARCHAR(5) UNIQUE PRIMARY KEY,
  coordinator_name VARCHAR(20),
 
  INDEX (building_code),
  FOREIGN KEY (building_code)
    REFERENCES Building(building_code)
);
 
DROP TABLE IF EXISTS Fitness;
CREATE TABLE Fitness(
  building_code VARCHAR(5) UNIQUE PRIMARY KEY,
  organizer_name VARCHAR(20),
  
  INDEX (building_code),
  FOREIGN KEY (building_code)
    REFERENCES Building(building_code)
);
 
DROP TABLE IF EXISTS Health;
CREATE TABLE Health(
  building_code VARCHAR(5) UNIQUE PRIMARY KEY,
  doctor_name VARCHAR(20),
  
  INDEX (building_code),
  FOREIGN KEY (building_code)
    REFERENCES Building(building_code)
);
 
