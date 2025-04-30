DROP USER user1;
DROP USER user2;
DROP USER user3;
DROP USER user4:
DROP USER user5;
DROP USER user6;
DROP USER user7;
DROP USER user8;
DROP USER user9;
DROP USER user10;
DROP ROLE EmployeeRole;
DROP GROUP EmployeeGroup;

CREATE ROLE EmployeeRole;
GRANT
	CREATE TABLE, CREATE INDEX, CREATE VIEW, CREATE SEQUENCE
ON employees
TO EmployeeRole;
	
CREATE GROUP EmployeeGroup;
ALTER GROUP EmployeeGroup ADD ROLE EmployeeRole;

CREATE user1 IDENTIFIED BY password;
ALTER USER user1 ADD MEMBER EmployeeGroup;
CREATE user2 IDENTIFIED BY password;
ALTER USER user2 ADD MEMBER EmployeeGroup;
CREATE user3 IDENTIFIED BY password;
ALTER USER user3 ADD MEMBER EmployeeGroup;
CREATE user4 IDENTIFIED BY password;
ALTER USER user4 ADD MEMBER EmployeeGroup;
CREATE user5 IDENTIFIED BY password;
ALTER USER user5 ADD MEMBER EmployeeGroup;
CREATE user6 IDENTIFIED BY password;
ALTER USER user6 ADD MEMBER EmployeeGroup;
CREATE user7 IDENTIFIED BY password;
ALTER USER user7 ADD MEMBER EmployeeGroup;
CREATE user8 IDENTIFIED BY password;
ALTER USER user8 ADD MEMBER EmployeeGroup;
CREATE user9 IDENTIFIED BY password;
ALTER USER user9 ADD MEMBER EmployeeGroup;
CREATE user10 IDENTIFIED BY password;
ALTER USER user10 ADD MEMBER EmployeeGroup;