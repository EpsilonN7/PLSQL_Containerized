/*
  Caleb Pfingston
  2/22/2025
  CTS 2440
  
  This script is written to query employee names, department number, department name, and location from the DEPT and EMP tables.
*/

SELECT EMP.ename, EMP.deptno, DEPT.dname, DEPT.loc
FROM EMP JOIN DEPT ON EMP.deptno = DEPT.deptno;