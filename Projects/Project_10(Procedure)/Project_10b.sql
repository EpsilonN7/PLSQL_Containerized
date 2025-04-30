DECLARE
v_fname employees.first_name%TYPE;
v_dept_num employees.department_id%TYPE;

BEGIN
FOR i IN 100..206
loop
    display_employees(i, v_fname, v_dept_num);
    dbms_output.put_line('Employee Number: '||i||
                         ' - Employee Name: '||v_fname||
                         ' - Department Number: '||v_dept_num);
end loop;

EXCEPTION
WHEN OTHERS THEN
    dbms_output.put_line('query unsuccessful :-/');
    dbms_output.put_line(SQLCODE);
    dbms_output.put_line(SQLERRM);

END;
