DROP FUNCTION fib_func;

create or replace FUNCTION fib_func
    (f_fib NUMBER)
RETURN NUMBER
IS

n_num1 NUMBER := 0;
n_num2 NUMBER := 1;
fib_num NUMBER := 0;
BEGIN
IF
    f_fib < 0 THEN
        RETURN NULL;
ELSIF
    f_fib = 0 THEN
        RETURN n_num1;
ELSIF
    f_fib = 1 THEN
        RETURN n_num2;
ELSE
    FOR i IN 2..f_fib
    loop
        fib_num := n_num1 + n_num2;
             n_num1 := n_num2;
            n_num2 := fib_num;
    end loop;
        RETURN fib_num;
END IF;

EXCEPTION
WHEN OTHERS THEN
dbms_output.put_line(SQLCODE);
dbms_output.put_line(SQLERRM);
RETURN NULL;

END;