REM Caleb Pfingston
REM 10\31\2023
REM CTS 1383
REM
REM This script adds records to the emp table and tests the usage
REM of the triggers for triggering based on dml operations.

REM Create Trigger
CREATE OR REPLACE TRIGGER emp_insert_t1
AFTER INSERT ON employees
FOR EACH ROW
BEGIN
  DBMS_OUTPUT.PUT_LINE('Record entered for employee ' || :new.first_name || 
                        ' with employee number ' || :new.employee_id || 
                        ' and Salary ' || :new.salary || '.');
END;

REM Insert records into the employees table
BEGIN
  INSERT INTO employees (employee_id, first_name, last_name, email, hire_date, job_id, salary)
  VALUES (207, 'Dan', 'Kuzo', 'dkuzo', sysdate, 'FI_ACCOUNT', 15000);

  INSERT INTO employees (employee_id, first_name, last_name, email, hire_date, job_id, salary)
  VALUES (208, 'Wyatt', 'Klein', 'wklein', sysdate, 'FI_ACCOUNT', 6000);

  INSERT INTO employees (employee_id, first_name, last_name, email, hire_date, job_id, salary)
  VALUES (209, 'Brad', 'Bitton', 'bbitton', sysdate, 'FI_ACCOUNT', 24000);

  INSERT INTO employees (employee_id, first_name, last_name, email, hire_date, job_id, salary)
  VALUES (210, 'Lisa', 'Silver', 'lsilver', sysdate, 'FI_ACCOUNT', 10000);

  INSERT INTO employees (employee_id, first_name, last_name, email, hire_date, job_id, salary)
  VALUES (211, 'Trevor', 'Badger', 'tbadger', sysdate, 'FI_ACCOUNT', 9800);

  INSERT INTO employees (employee_id, first_name, last_name, email, hire_date, job_id, salary)
  VALUES (212, 'Camden', 'White', 'cwhite', sysdate, 'FI_ACCOUNT', 12000);

  INSERT INTO employees (employee_id, first_name, last_name, email, hire_date, job_id, salary)
  VALUES (213, 'Megan', 'Mistral', 'mmistral', sysdate, 'FI_ACCOUNT', 15000);

  INSERT INTO employees (employee_id, first_name, last_name, email, hire_date, job_id, salary)
  VALUES (214, 'Misty', 'Kick', 'mkick', sysdate, 'FI_ACCOUNT', 6000);

  INSERT INTO employees (employee_id, first_name, last_name, email, hire_date, job_id, salary)
  VALUES (215, 'Silvia', 'Litiger', 'slitiger', sysdate, 'FI_ACCOUNT', 24000);

  INSERT INTO employees (employee_id, first_name, last_name, email, hire_date, job_id, salary)
  VALUES (216, 'Shae', 'Mani', 'smani', sysdate, 'FI_ACCOUNT', 10000);

  EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
      DBMS_OUTPUT.PUT_LINE('Duplicate employee number found. No record added.');
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLCODE || ' - ' || SQLERRM);
END;
