SET SERVEROUTPUT ON;

DECLARE
n_input NUMBER;
BEGIN
n_input := &in;

FOR i IN 0..n_input
    loop
    dbms_output.put_line(fib_func(i));
    end loop;

EXCEPTION
WHEN OTHERS THEN
dbms_output.put_line(SQLCODE);
dbms_output.put_line(SQLERRM);

END;