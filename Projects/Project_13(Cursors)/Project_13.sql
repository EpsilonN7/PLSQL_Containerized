REM Caleb Pfingston
REM 4\14\2025
REM CTS 1383
REM
REM This script retireves records from the employee table and checks the difference
REM between the hire_date and the current date.

SET SERVEROUTPUT ON;

-- declare variables
DECLARE
-- declare cursor
CURSOR c_emp IS
    SELECT employee_id, first_name, last_name, hire_date
    FROM employees
    WHERE employee_id BETWEEN 0 AND 118;

n_emp_id employees.employee_id%TYPE;
v_first_name employees.first_name%TYPE;
v_last_name employees.last_name%TYPE;
d_hire_date employees.hire_date%TYPE;
n_month_dif NUMBER;
n_num_months VARCHAR2(2);
n_num_years VARCHAR2(2);
i_interval INTERVAL YEAR TO MONTH;

BEGIN
    -- retrieve records from the employees table
    FOR i IN c_emp LOOP
        n_emp_id := i.employee_id;
        v_first_name := i.first_name;
        v_last_name := i.last_name;
        d_hire_date := i.hire_date;
        -- calculate the difference between the hire date and the current date
        SELECT TRUNC(MONTHS_BETWEEN(SYSDATE, d_hire_date)) INTO n_month_dif FROM dual;

        -- convert the difference to years and months, and change interval values to characters using TO_CHAR
        i_interval := NUMTOYMINTERVAL(n_month_dif, 'MONTH');
        n_num_years := TO_CHAR(EXTRACT(YEAR FROM i_interval));
        n_num_months := TO_CHAR(EXTRACT(MONTH FROM i_interval));

        -- output the results
        DBMS_OUTPUT.PUT_LINE('For employee ' || v_first_name || ' ' || v_last_name || 
        ', their hire date was ' || n_num_years || ' years and ' || n_num_months || ' months ago.');

    END LOOP;

    -- Handle exceptions
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('No data found for the given employee ID.');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM(SQLCODE));
END;