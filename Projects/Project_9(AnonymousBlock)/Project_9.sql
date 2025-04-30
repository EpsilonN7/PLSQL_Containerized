DECLARE
n_grade1 NUMBER:=85;
n_grade2 NUMBER:=73;
n_grade3 NUMBER:=98;
n_grade4 NUMBER:=67;
n_avgGrade NUMBER(3,1);
BEGIN
n_avgGrade:=(n_grade1+n_grade2+n_grade3+n_grade4)/4;
dbms_output.put_line('The average grade is '||n_avgGrade);
END;