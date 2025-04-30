/*
 Caleb Pfingston
 2/12/2025
 CTS 2440
 This script is for creating a table caleb StudentRecord
*/

DROP TABLE StudentRecord;
CREATE TABLE StudentRecord
(
	StudentID NUMBER(10) NOT NULL,
	FirstName CHAR(20) NOT NULL,
	LastName CHAR(40) NOT NULL,
	dateOfBirth DATE NOT NULL,
	Photo BFILE
);