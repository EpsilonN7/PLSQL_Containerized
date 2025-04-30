DROP PROCEDURE display_employees;

CREATE OR REPLACE PROCEDURE display_employees
    (p_emp_num employees.employee_id%TYPE,
     p_emp_name OUT employees.first_name%TYPE,
     p_dept_id OUT employees.department_id%TYPE)
IS

BEGIN
    SELECT first_name, department_id
    INTO p_emp_name, p_dept_id
    FROM employees
    WHERE employee_id = p_emp_num;

EXCEPTION
    WHEN OTHERS THEN
    dbms_output.put_line(SQLCODE);
    dbms_output.put_line(SQLERRM);
END;
