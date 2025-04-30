Rem File:	creuser.sql
Rem Description:	Creates  oracle user "Scott" account, 
Rem Remarks:	- All user objects are stored in the default tablespace,
Rem			data01.
Rem		- To increase/decrease the number of accounts, modify the
Rem			script.
Rem
Rem Copyright (c) 1999 by Oracle Corporation 
Rem
Rem
Rem




CREATE USER scott IDENTIFIED BY tiger
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP
QUOTA UNLIMITED ON USERS;

GRANT CONNECT , RESOURCE, CREATE VIEW TO scott;

