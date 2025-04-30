DROP VIEW 
	CustomerView;

CREATE VIEW 
	CustomerView AS
SELECT 
	custid, name, address, city, state, zip, area, phone, repid, creditlimit, comments
FROM CUSTOMER;

INSERT INTO CustomerView				
	(custid, name, address, city, state, zip, area, phone, repid, creditlimit, comments)
VALUES 
	(109, 'Wayz', '4584 Megan Way', 'Titusville', 'FL', '32780', 321, '643-8575', 7624, 8000, 'Their app works well, but they are kind of rude.');
INSERT INTO CustomerView
	(custid, name, address, city, state, zip, area, phone, repid, creditlimit, comments)
VALUES 
	(110, 'CarGuys', '8274 Ricker', 'Titusville', 'FL', '32780', 321, '867-9087', 7956, 9000, 'Provide proof of purchase soon.');
INSERT INTO CustomerView
	(custid, name, address, city, state, zip, area, phone, repid, creditlimit, comments)
VALUES 
	(111, 'TimeToDine', '3426 Cheney', 'Titusville', 'FL', '32780', 321, '907-7659', 7756, 7000, 'Provide consulting for debt.');
INSERT INTO CustomerView
	(custid, name, address, city, state, zip, area, phone, repid, creditlimit, comments)
VALUES 
	(112, 'GroovyBins', '7884 Fareway', 'Titusville', 'FL', '32780', 321, '874-6543', 7324, 10000, 'Setup meeting for account details.');
INSERT INTO CustomerView
	(custid, name, address, city, state, zip, area, phone, repid, creditlimit, comments)
VALUES 
	(113, 'CrystalServices', '8887 Walter', 'Albuquerque', 'NM', '87119', 575, '647-8876', 7777, 5000, 'He is the one who knocks.');