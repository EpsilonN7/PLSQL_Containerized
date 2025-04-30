REM Caleb Pfingston
REM 4\29\2025
REM CTS 1383
REM
REM This script create a package named ABC
REM The ABC package displays information from the emp table.
REM 

-- Create Package Specification
CREATE OR REPLACE PACKAGE ABC
IS
  PROCEDURE DisplayEmpTop10SalariesInReverse;
END ABC;

-- Create Package Body
CREATE OR REPLACE PACKAGE BODY ABC
IS
  -- Private Cursor to retrieve top 10 salaries
  CURSOR c_Top10_Sal IS
    SELECT ename, sal
    FROM (SELECT ename, sal
          FROM emp
          ORDER BY sal DESC)
    WHERE ROWNUM <= 10;

  -- Variable array types
  TYPE NameArray IS VARRAY(10) OF emp.ename%TYPE;
  TYPE SalaryArray IS VARRAY(10) OF emp.sal%TYPE;

  -- Variables to store names and salaries
  Names NameArray;
  Salaries SalaryArray;

  -- Private procedure to build VARRAYs
  PROCEDURE BuildVarrays IS
  BEGIN
    Names := NameArray();
    Salaries := SalaryArray();
    FOR emp_record IN c_Top10_Sal LOOP
      Names.EXTEND;
      Salaries.EXTEND;
      Names(Names.COUNT) := emp_record.ename;
      Salaries(Salaries.COUNT) := emp_record.sal;
    END LOOP;
  END BuildVarrays;

  -- Public procedure to display top 10 salaries in reverse order
  PROCEDURE DisplayEmpTop10SalariesInReverse IS
  BEGIN
    BuildVarrays;
    FOR i IN REVERSE Names.FIRST .. Names.LAST LOOP
      DBMS_OUTPUT.PUT_LINE('Name: ' || Names(i) || ', Salary: ' || Salaries(i));
    END LOOP;
    --Handle Errors
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No data found for the given data in varrays.');
        WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM(SQLCODE));

  END DisplayEmpTop10SalariesInReverse;

END ABC; -- End of package body