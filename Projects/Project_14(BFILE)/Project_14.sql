REM Caleb Pfingston
REM 4\22\2025
REM CTS 1383
REM
REM This script creates an application that will upload student information to a table called StudentRecord.
REM The application will allow the user to enter the student ID, first name, last name, date of birth, and photo.

--Create a table to store student information
DROP TABLE StudentRecord;
CREATE TABLE StudentRecord
(
	StudentID NUMBER(10) NOT NULL,
	FirstName CHAR(20) NOT NULL,
	LastName CHAR(40) NOT NULL,
	dateOfBirth DATE NOT NULL,
	Photo BFILE
);

--Create a directory for the BFILE to point to
CREATE OR REPLACE DIRECTORY StudentPhotos AS 'C:\Temp';

--Create procedure for inserting student information into the StudentRecord table
CREATE OR REPLACE PROCEDURE InsertStudentRecord
(p_studentID NUMBER, p_firstName CHAR, p_lastName CHAR, p_dateOfBirth DATE, p_photo BFILE)
IS
BEGIN
EXECUTE IMMEDIATE 'INSERT INTO StudentRecord (StudentID, FirstName, LastName, dateOfBirth, Photo) VALUES (:1, :2, :3, :4, :5)'
USING p_studentID, p_firstName, p_lastName, p_dateOfBirth, p_photo;
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('Insert Failed: Duplicate Student ID.');
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('Insert Failed: Invalid value provided.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Insert Failed: ' || SQLERRM(SQLCODE));
END;

--Insert sample data into the StudentRecord table
-- The photos should be in the directory specified above
BEGIN
    InsertStudentRecord(1, 'Sam', 'Kaiser', TO_DATE('1970-04-20', 'YYYY-MM-DD'), BFILENAME('StudentPhotos', 'pict1.jpg'));
    InsertStudentRecord(2, 'Juan', 'Vazquez', TO_DATE('1982-10-23', 'YYYY-MM-DD'), BFILENAME('StudentPhotos', 'pict2.jpg'));
    InsertStudentRecord(3, 'Dan', 'Kuzo', TO_DATE('1999-12-01', 'YYYY-MM-DD'), BFILENAME('StudentPhotos', 'pict3.jpg'));
    InsertStudentRecord(4, 'Jen', 'Madden', TO_DATE('2001-08-10', 'YYYY-MM-DD'), BFILENAME('StudentPhotos', 'pict4.jpg'));
    InsertStudentRecord(5, 'Lisa', 'Straub', TO_DATE('1965-09-10', 'YYYY-MM-DD'), BFILENAME('StudentPhotos', 'pict5.jpg'));

EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('Insert Failed: Duplicate Student ID.');
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('Insert Failed: Invalid value provided.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Insert Failed: ' || SQLERRM(SQLCODE));
    
    COMMIT;
END;
