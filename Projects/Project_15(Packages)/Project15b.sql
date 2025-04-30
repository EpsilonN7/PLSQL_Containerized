REM Caleb Pfingston
REM 4\29\2025
REM CTS 1383
REM
REM This script create an anonymous block that calls the procudere
REM Named DisplayEmpTop10SalariesInReverse from the ABC package.
REM 

SET SERVEROUTPUT ON;

BEGIN
  -- Call the procedure from the ABC package
  ABC.DisplayEmpTop10SalariesInReverse;
END;
