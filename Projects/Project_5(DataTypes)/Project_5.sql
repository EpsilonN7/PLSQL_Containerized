SELECT EMPNO, ENAME, SAL, COMM, TO_CHAR(COMM, '9999.99') AS COMM_2_DECIMAL, TO_CHAR(COMM, '9999') AS COMM_NO_DECIMAL, CAST (COMM AS NUMBER(7,0)) AS COMM_INTEGER
FROM EMP;

SELECT EMPNO, ENAME, SAL, HIREDATE, TO_CHAR(HIREDATE, 'DD-MON-YYYY HH24:MI:SS') AS HIRE_DATE_24H, TO_CHAR(HIREDATE, 'DD-MON-YYYY HH:MI:SS AM'), CAST(HIREDATE AS VARCHAR(10)), HIREDATE + 90 AS END_OF_PROBATION
FROM EMP;

DROP TABLE StudentRecord;
CREATE TABLE StudentRecord
(
	FirstName CHAR(20) NOT NULL,
	LastName CHAR(40) NOT NULL,
	HomeworkAvg NUMBER(5, 2),
	AttendenceAvg NUMBER(5, 2),
	ExamAvg NUMBER(5, 2),
	StudentID INT PRIMARY KEY NOT NULL,
	CONSTRAINT chk_name CHECK (TRIM(FirstName) <> TRIM(LastName))
);
INSERT INTO StudentRecord (FirstName, LastName, HomeworkAvg, AttendenceAvg, ExamAvg, StudentID)
	VALUES ('Caleb', 'Pfingston', '85.08', '99.05', '80.21', '00535682');
INSERT INTO StudentRecord (FirstName, LastName, HomeworkAvg, AttendenceAvg, ExamAvg, StudentID)
	VALUES ('Kyra', 'Pfingston', '96.09', '75.07', '78.09', '00768945');
INSERT INTO StudentRecord (FirstName, LastName, HomeworkAvg, AttendenceAvg, ExamAvg, StudentID)
	VALUES ('Joshua', 'Graham', '67.07', '89.76', '70.00', '00111345');
INSERT INTO StudentRecord (FirstName, LastName, HomeworkAvg, AttendenceAvg, ExamAvg, StudentID)
	VALUES ('Felicity', 'Thomas', '97.65', '76.00', '92.07', '00957435');
INSERT INTO StudentRecord (FirstName, LastName, HomeworkAvg, AttendenceAvg, ExamAvg, StudentID)
	VALUES ('Dan', 'Taper', '88.88', '90.87', '85.78', '00856745');
INSERT INTO StudentRecord (FirstName, LastName, HomeworkAvg, AttendenceAvg, ExamAvg, StudentID)
	VALUES ('Meeko', 'Abuela', '97.65', '77.66', '85.76', '00720978');
INSERT INTO StudentRecord (FirstName, LastName, HomeworkAvg, AttendenceAvg, ExamAvg, StudentID)
	VALUES ('Raphael', 'Vazquez', '99.00', '99.67', '99.65', '00376856');
INSERT INTO StudentRecord (FirstName, LastName, HomeworkAvg, AttendenceAvg, ExamAvg, StudentID)
	VALUES ('loren', 'Carpenter', '54.67', '89.07', '67.98', '00012465');
INSERT INTO StudentRecord (FirstName, LastName, HomeworkAvg, AttendenceAvg, ExamAvg, StudentID)
	VALUES ('Trevor', 'Dunn', '54.67', '20.00', '84.90', '00647583');
INSERT INTO StudentRecord (FirstName, LastName, HomeworkAvg, AttendenceAvg, ExamAvg, StudentID)
	VALUES ('Christopher', 'Gibson', '72.87', '50.00', '96.00', '00735621');