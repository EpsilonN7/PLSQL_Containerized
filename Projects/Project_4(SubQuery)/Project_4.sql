/*
  Caleb Pfingston
  2/22/2025
  CTS 2440
  
  This script is written to query employee names, department number, department name, and location from the DEPT and EMP tables.
*/

SELECT c.NAME, c.CITY, c.STATE, c.CUSTID
FROM CUSTOMER c
WHERE c.CUSTID IN (SELECT DISTINCT CUSTID FROM ORD);

SELECT c.NAME, c.CUSTID, SUM(o.TOTAL) AS total_order_amount
FROM CUSTOMER c
JOIN ORD o ON c.CUSTID = o.CUSTID
GROUP BY c.NAME, c.CUSTID
ORDER BY total_order_amount DESC;