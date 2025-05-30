connect scott/tiger;
set termout off
DROP TABLE EMP;
DROP TABLE DEPT;
DROP TABLE BONUS;
DROP TABLE SALGRADE;
DROP TABLE DUMMY;
DROP TABLE ITEM;
DROP TABLE PRICE;
DROP TABLE PRODUCT;
DROP TABLE ORD;
DROP TABLE CUSTOMER;
DROP VIEW SALES;
DROP SEQUENCE ORDID;
DROP SEQUENCE CUSTID;
DROP SEQUENCE PRODID;
CREATE TABLE DEPT (
 DEPTNO              NUMBER(2) NOT NULL,
 DNAME               VARCHAR2(14),
 LOC                 VARCHAR2(13),
 CONSTRAINT DEPT_PRIMARY_KEY PRIMARY KEY (DEPTNO));
INSERT INTO DEPT VALUES (10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES (30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES (40,'OPERATIONS','BOSTON');
CREATE TABLE EMP (
 EMPNO               NUMBER(4) NOT NULL,
 ENAME               VARCHAR2(10),
 JOB                 VARCHAR2(9),
 MGR                 NUMBER(4) CONSTRAINT EMP_MGR_FK REFERENCES EMP (EMPNO),
 HIREDATE            DATE,
 SAL                 NUMBER(7,2),
 COMM                NUMBER(7,2),
 DEPTNO              NUMBER(2) NOT NULL,
 CONSTRAINT EMP_DEPTNO_FK FOREIGN KEY (DEPTNO) REFERENCES DEPT (DEPTNO),
 CONSTRAINT EMP_EMPNO_PK PRIMARY KEY (EMPNO));
INSERT INTO EMP VALUES (7839,'KING','PRESIDENT',NULL,TO_DATE('17-NOV-1981','DD-MON-YYYY'),5000,NULL,10);
INSERT INTO EMP VALUES (7698,'BLAKE','MANAGER',7839,TO_DATE('1-MAY-1981','DD-MON-YYYY'),2850,NULL,30);
INSERT INTO EMP VALUES (7782,'CLARK','MANAGER',7839,TO_DATE('9-JUN-1981','DD-MON-YYYY'),2450,NULL,10);
INSERT INTO EMP VALUES (7566,'JONES','MANAGER',7839,TO_DATE('2-APR-1981','DD-MON-YYYY'),2975,NULL,20);
INSERT INTO EMP VALUES (7654,'MARTIN','SALESMAN',7698,TO_DATE('28-SEP-1981','DD-MON-YYYY'),1250,1400,30);
INSERT INTO EMP VALUES (7499,'ALLEN','SALESMAN',7698,TO_DATE('20-FEB-1981','DD-MON-YYYY'),1600,300,30);
INSERT INTO EMP VALUES (7844,'TURNER','SALESMAN',7698,TO_DATE('8-SEP-1981','DD-MON-YYYY'),1500,0,30);
INSERT INTO EMP VALUES (7900,'JAMES','CLERK',7698,TO_DATE('3-DEC-1981','DD-MON-YYYY'),950,NULL,30);
INSERT INTO EMP VALUES (7521,'WARD','SALESMAN',7698,TO_DATE('22-FEB-1981','DD-MON-YYYY'),1250,500,30);
INSERT INTO EMP VALUES (7902,'FORD','ANALYST',7566,TO_DATE('3-DEC-1981','DD-MON-YYYY'),3000,NULL,20);
INSERT INTO EMP VALUES (7369,'SMITH','CLERK',7902,TO_DATE('17-DEC-1980','DD-MON-YYYY'),800,NULL,20);
INSERT INTO EMP VALUES (7788,'SCOTT','ANALYST',7566,TO_DATE('09-DEC-1982','DD-MON-YYYY'),3000,NULL,20);
INSERT INTO EMP VALUES (7876,'ADAMS','CLERK',7788,TO_DATE('12-JAN-1983','DD-MON-YYYY'),1100,NULL,20);
INSERT INTO EMP VALUES (7934,'MILLER','CLERK',7782,TO_DATE('23-JAN-1982','DD-MON-YYYY'),1300,NULL,10);

CREATE TABLE BONUS (
 ENAME               VARCHAR2(10),
 JOB                 VARCHAR2(9),
 SAL                 NUMBER,
 COMM                NUMBER);
CREATE TABLE SALGRADE (
 GRADE               NUMBER,
 LOSAL               NUMBER,
 HISAL               NUMBER);
INSERT INTO SALGRADE VALUES (1,700,1200);
INSERT INTO SALGRADE VALUES (2,1201,1400);
INSERT INTO SALGRADE VALUES (3,1401,2000);
INSERT INTO SALGRADE VALUES (4,2001,3000);
INSERT INTO SALGRADE VALUES (5,3001,9999);
CREATE TABLE DUMMY (
 DUMMY               NUMBER );
INSERT INTO DUMMY VALUES (0);
CREATE TABLE CUSTOMER (
 CUSTID              NUMBER (6) NOT NULL,
 NAME                VARCHAR2 (45),
 ADDRESS             VARCHAR2 (40),
 CITY                VARCHAR2 (30),
 STATE               VARCHAR2 (2),
 ZIP                 VARCHAR2 (9),
 AREA                NUMBER (3),
 PHONE               VARCHAR2 (9),
 REPID               NUMBER (4) NOT NULL,
 CREDITLIMIT         NUMBER (9,2),
 COMMENTS            LONG,
 CONSTRAINT CUSTOMER_CUSTID_PK PRIMARY KEY (CUSTID),
 CONSTRAINT CUSTOMER_CUSTID_CK CHECK (CUSTID > 0));
CREATE TABLE ORD  (
 ORDID               NUMBER (4) NOT NULL,
 ORDERDATE           DATE,
 COMMPLAN            VARCHAR2 (1),
 CUSTID              NUMBER (6) NOT NULL,
 SHIPDATE            DATE,
 TOTAL               NUMBER (8,2) CONSTRAINT ORD_TOTAL_CK CHECK (TOTAL >= 0),
 CONSTRAINT ORD_CUSTID_FK FOREIGN KEY (CUSTID) REFERENCES CUSTOMER (CUSTID),
 CONSTRAINT ORD_ORDID_PK PRIMARY KEY (ORDID));
CREATE TABLE ITEM  (
 ORDID               NUMBER (4) NOT NULL,
 ITEMID              NUMBER (4) NOT NULL,
 PRODID              NUMBER (6),
 ACTUALPRICE         NUMBER (8,2),
 QTY                 NUMBER (8),
 ITEMTOT             NUMBER (8,2),
 CONSTRAINT ITEM_ORDID_FK FOREIGN KEY (ORDID) REFERENCES ORD (ORDID),
 CONSTRAINT ITEM_ORDID_ITEMID_PK PRIMARY KEY (ORDID,ITEMID));
CREATE TABLE PRODUCT (
 PRODID              NUMBER (6) CONSTRAINT PRODID_PK PRIMARY KEY,
 DESCRIP             VARCHAR2 (30));
CREATE TABLE PRICE (
 PRODID              NUMBER (6) NOT NULL,
 STDPRICE            NUMBER (8,2),
 MINPRICE            NUMBER (8,2),
 STARTDATE           DATE,
 ENDDATE             DATE);
INSERT INTO CUSTOMER (ZIP, STATE, REPID, PHONE, NAME, CUSTID, CREDITLIMIT,
  CITY, AREA, ADDRESS, COMMENTS)
VALUES ('96711', 'CA', '7844', '598-6609',
 'JOCKSPORTS',
 '100', '5000', 'BELMONT', '415', '345 VIEWRIDGE',
 'Very friendly people to work with -- sales rep likes to be called Mike.');
INSERT INTO CUSTOMER (ZIP, STATE, REPID, PHONE, NAME, CUSTID, CREDITLIMIT,
  CITY, AREA, ADDRESS, COMMENTS)
VALUES ('94061', 'CA', '7521', '368-1223',
 'TKB SPORT SHOP',
 '101', '10000', 'REDWOOD CITY', '415', '490 BOLI RD.',
 'Rep called 5/8 about change in order - contact shipping.');
INSERT INTO CUSTOMER (ZIP, STATE, REPID, PHONE, NAME, CUSTID, CREDITLIMIT,
  CITY, AREA, ADDRESS, COMMENTS)
VALUES ('95133', 'CA', '7654', '644-3341',
 'VOLLYRITE',
 '102', '7000', 'BURLINGAME', '415', '9722 HAMILTON',
 'Company doing heavy promotion beginning 10/89. Prepare for large orders during
 winter.');
INSERT INTO CUSTOMER (ZIP, STATE, REPID, PHONE, NAME, CUSTID, CREDITLIMIT,
  CITY, AREA, ADDRESS, COMMENTS)
VALUES ('97544', 'CA', '7521', '677-9312',
 'JUST TENNIS',
 '103', '3000', 'BURLINGAME', '415', 'HILLVIEW MALL',
 'Contact rep about new line of tennis rackets.');
INSERT INTO CUSTOMER (ZIP, STATE, REPID, PHONE, NAME, CUSTID, CREDITLIMIT,
  CITY, AREA, ADDRESS, COMMENTS)
VALUES ('93301', 'CA', '7499', '996-2323',
 'EVERY MOUNTAIN',
 '104', '10000', 'CUPERTINO', '408', '574 SUYYYYY RD.',
 'Customer with high market share (23%) due to aggressive advertising.');
INSERT INTO CUSTOMER (ZIP, STATE, REPID, PHONE, NAME, CUSTID, CREDITLIMIT,
  CITY, AREA, ADDRESS, COMMENTS)
VALUES ('91003', 'CA', '7844', '376-9966',
 'K + T SPORTS',
 '105', '5000', 'SANTA CLARA', '408', '3476 EL PASEO',
 'Tends to order large amounts of merchandise at once. Accounting is considering
 raising their credit limit. Usually pays on time.');
INSERT INTO CUSTOMER (ZIP, STATE, REPID, PHONE, NAME, CUSTID, CREDITLIMIT,
  CITY, AREA, ADDRESS, COMMENTS)
VALUES ('94301', 'CA', '7521', '364-9777',
 'SHAPE UP',
 '106', '6000', 'PALO ALTO', '415', '908 SEQUOIA',
 'Support intensive. Orders small amounts (< 800) of merchandise at a time.');
INSERT INTO CUSTOMER (ZIP, STATE, REPID, PHONE, NAME, CUSTID, CREDITLIMIT,
  CITY, AREA, ADDRESS, COMMENTS)
VALUES ('93301', 'CA', '7499', '967-4398',
 'WOMENS SPORTS',
 '107', '10000', 'SUNNYVALE', '408', 'VALCO VILLAGE',
 'First sporting goods store geared exclusively towards women. Unusual promotion
al style and very willing to take chances towards new products!');
INSERT INTO CUSTOMER (ZIP, STATE, REPID, PHONE, NAME, CUSTID, CREDITLIMIT,
  CITY, AREA, ADDRESS, COMMENTS)
VALUES ('55649', 'MN', '7844', '566-9123',
 'NORTH WOODS HEALTH AND FITNESS SUPPLY CENTER',
 '108', '8000', 'HIBBING', '612', '98 LONE PINE WAY', '');
INSERT INTO ORD (TOTAL, SHIPDATE, ORDID, ORDERDATE, CUSTID, COMMPLAN)
 VALUES ('101.4', TO_DATE('08-JAN-1987','DD-MON-YYYY'), '610', TO_DATE('07-JAN-1987','DD-MON-YYYY'), '101', 'A');
INSERT INTO ORD (TOTAL, SHIPDATE, ORDID, ORDERDATE, CUSTID, COMMPLAN)
 VALUES ('45', TO_DATE('11-JAN-1987','DD-MON-YYYY'), '611', TO_DATE('11-JAN-1987','DD-MON-YYYY'), '102', 'B');
INSERT INTO ORD (TOTAL, SHIPDATE, ORDID, ORDERDATE, CUSTID, COMMPLAN)
 VALUES ('5860', TO_DATE('20-JAN-1987','DD-MON-YYYY'), '612', TO_DATE('15-JAN-1987','DD-MON-YYYY'), '104', 'C');
INSERT INTO ORD (TOTAL, SHIPDATE, ORDID, ORDERDATE, CUSTID, COMMPLAN)
 VALUES ('2.4', TO_DATE('30-MAY-1986','DD-MON-YYYY'), '601', TO_DATE('01-MAY-1986','DD-MON-YYYY'), '106', 'A');
INSERT INTO ORD (TOTAL, SHIPDATE, ORDID, ORDERDATE, CUSTID, COMMPLAN)
 VALUES ('56', TO_DATE('20-JUN-1986','DD-MON-YYYY'), '602', TO_DATE('05-JUN-1986','DD-MON-YYYY'), '102', 'B');
INSERT INTO ORD (TOTAL, SHIPDATE, ORDID, ORDERDATE, CUSTID, COMMPLAN)
 VALUES ('698', TO_DATE('30-JUN-1986','DD-MON-YYYY'), '604', TO_DATE('15-JUN-1986','DD-MON-YYYY'), '106', 'A');
INSERT INTO ORD (TOTAL, SHIPDATE, ORDID, ORDERDATE, CUSTID, COMMPLAN)
 VALUES ('8324',TO_DATE( '30-JUL-1986','DD-MON-YYYY'), '605', TO_DATE('14-JUL-1986','DD-MON-YYYY'), '106', 'A');
INSERT INTO ORD (TOTAL, SHIPDATE, ORDID, ORDERDATE, CUSTID, COMMPLAN)
 VALUES ('3.4', TO_DATE('30-JUL-1986','DD-MON-YYYY'), '606', TO_DATE('14-JUL-1986','DD-MON-YYYY'), '100', 'A');
INSERT INTO ORD (TOTAL, SHIPDATE, ORDID, ORDERDATE, CUSTID, COMMPLAN)
 VALUES ('97.5', TO_DATE('15-AUG-1986','DD-MON-YYYY'), '609', TO_DATE('01-AUG-1986','DD-MON-YYYY'), '100', 'B');
INSERT INTO ORD (TOTAL, SHIPDATE, ORDID, ORDERDATE, CUSTID, COMMPLAN)
 VALUES ('5.6', TO_DATE('18-JUL-1986','DD-MON-YYYY'), '607', TO_DATE('18-JUL-1986','DD-MON-YYYY'), '104', 'C');
INSERT INTO ORD (TOTAL, SHIPDATE, ORDID, ORDERDATE, CUSTID, COMMPLAN)
 VALUES ('35.2', TO_DATE('25-JUL-1986','DD-MON-YYYY'), '608', TO_DATE('25-JUL-1986','DD-MON-YYYY'), '104', 'C');
INSERT INTO ORD (TOTAL, SHIPDATE, ORDID, ORDERDATE, CUSTID, COMMPLAN)
 VALUES ('224', TO_DATE('05-JUN-1986','DD-MON-YYYY'), '603', TO_DATE('05-JUN-1986','DD-MON-YYYY'), '102', '');
INSERT INTO ORD (TOTAL, SHIPDATE, ORDID, ORDERDATE, CUSTID, COMMPLAN)
 VALUES ('4450', TO_DATE('12-MAR-1987','DD-MON-YYYY'), '620', TO_DATE('12-MAR-1987','DD-MON-YYYY'), '100', '');
INSERT INTO ORD (TOTAL, SHIPDATE, ORDID, ORDERDATE, CUSTID, COMMPLAN)
 VALUES ('6400', TO_DATE('01-FEB-1987','DD-MON-YYYY'), '613', TO_DATE('01-FEB-1987','DD-MON-YYYY'), '108', '');
INSERT INTO ORD (TOTAL, SHIPDATE, ORDID, ORDERDATE, CUSTID, COMMPLAN)
 VALUES ('23940', TO_DATE('05-FEB-1987','DD-MON-YYYY'), '614', TO_DATE('01-FEB-1987','DD-MON-YYYY'), '102', '');
INSERT INTO ORD (TOTAL, SHIPDATE, ORDID, ORDERDATE, CUSTID, COMMPLAN)
 VALUES ('764', TO_DATE('10-FEB-1987','DD-MON-YYYY'), '616', TO_DATE('03-FEB-1987','DD-MON-YYYY'), '103', '');
INSERT INTO ORD (TOTAL, SHIPDATE, ORDID, ORDERDATE, CUSTID, COMMPLAN)
 VALUES ('1260', TO_DATE('04-FEB-1987','DD-MON-YYYY'), '619', TO_DATE('22-FEB-1987','DD-MON-YYYY'), '104', '');
INSERT INTO ORD (TOTAL, SHIPDATE, ORDID, ORDERDATE, CUSTID, COMMPLAN)
 VALUES ('46370', TO_DATE('03-MAR-1987','DD-MON-YYYY'), '617', TO_DATE('05-FEB-1987','DD-MON-YYYY'), '105', '');
INSERT INTO ORD (TOTAL, SHIPDATE, ORDID, ORDERDATE, CUSTID, COMMPLAN)
 VALUES ('710', TO_DATE('06-FEB-1987','DD-MON-YYYY'), '615', TO_DATE('01-FEB-1987','DD-MON-YYYY'), '107', '');
INSERT INTO ORD (TOTAL, SHIPDATE, ORDID, ORDERDATE, CUSTID, COMMPLAN)
 VALUES ('3510.5', TO_DATE('06-MAR-1987','DD-MON-YYYY'), '618', TO_DATE('15-FEB-1987','DD-MON-YYYY'), '102', 'A');
INSERT INTO ORD (TOTAL, SHIPDATE, ORDID, ORDERDATE, CUSTID, COMMPLAN)
 VALUES ('730', TO_DATE('01-JAN-1987','DD-MON-YYYY'), '621', TO_DATE('15-MAR-1987','DD-MON-YYYY'), '100', 'A');
INSERT INTO ITEM (QTY, PRODID, ORDID, ITEMTOT, ITEMID, ACTUALPRICE)
 VALUES ('1', '100890', '610', '58', '3', '58');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ( '1', '100861', '611', '45', '1', '45');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ( '100', '100860', '612', '3000', '1', '30');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ( '1', '200376', '601', '2.4', '1', '2.4');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ( '20', '100870', '602', '56', '1', '2.8');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ( '3', '100890', '604', '174', '1', '58');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ( '2', '100861', '604', '84', '2', '42');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ( '10', '100860', '604', '440', '3', '44');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ( '4', '100860', '603', '224', '2', '56');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ( '1', '100860', '610', '35', '1', '35');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ( '3', '100870', '610', '8.4', '2', '2.8');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ( '200', '200376', '613', '440', '4', '2.2');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ( '444', '100860', '614', '15540', '1', '35');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ( '1000', '100870', '614', '2800', '2', '2.8');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ( '20', '100861', '612', '810', '2', '40.5');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('150', '101863', '612', '1500', '3', '10');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('10', '100860', '620', '350', '1', '35');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('1000', '200376', '620', '2400', '2', '2.4');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('500', '102130', '620', '1700', '3', '3.4');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ( '100', '100871', '613', '560', '1', '5.6');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('200', '101860', '613', '4800', '2', '24');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('150', '200380', '613', '600', '3', '4');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('100', '102130', '619', '340', '3', '3.4');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('50', '100860', '617', '1750', '1', '35');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('100', '100861', '617', '4500', '2', '45');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('1000', '100871', '614', '5600', '3', '5.6');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('10', '100861', '616', '450', '1', '45');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('50', '100870', '616', '140', '2', '2.8');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('2', '100890', '616', '116', '3', '58');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('10', '102130', '616', '34', '4', '3.4');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('10', '200376' , '616', '24', '5', '2.4');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('100', '200380', '619', '400', '1', '4');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('100', '200376', '619', '240', '2', '2.4');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('4', '100861', '615', '180', '1', '45');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('1', '100871', '607', '5.6', '1', '5.6');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('100', '100870', '615', '280', '2', '2.8');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('500', '100870', '617', '1400', '3', '2.8');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('500', '100871', '617', '2800', '4', '5.6');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('500', '100890', '617', '29000', '5', '58');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('100', '101860', '617', '2400', '6', '24');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('200', '101863', '617', '2500', '7', '12.5');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('100', '102130', '617', '340', '8', '3.4');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('200', '200376', '617', '480', '9', '2.4');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('300', '200380', '617', '1200', '10', '4');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('5', '100870', '609', '12.5', '2', '2.5');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('1', '100890', '609', '50', '3', '50');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('23', '100860', '618', '805', '1', '35');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('50', '100861', '618', '2255.5', '2', '45.11');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('10', '100870', '618', '450', '3', '45');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('10', '100861', '621', '450', '1', '45');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('100', '100870', '621', '280', '2', '2.8');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('50', '100871', '615', '250', '3', '5');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('1', '101860', '608', '24', '1', '24');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('2', '100871', '608', '11.2', '2', '5.6');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('1', '100861', '609', '35', '1', '35');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('1', '102130', '606', '3.4', '1', '3.4');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('100', '100861', '605', '4500', '1', '45');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('500', '100870', '605', '1400', '2', '2.8');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('5', '100890', '605', '290', '3', '58');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('50', '101860', '605', '1200', '4', '24');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('100', '101863', '605', '900', '5', '9');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('10', '102130', '605', '34', '6', '3.4');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('100', '100871', '612', '550', '4', '5.5');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('50', '100871', '619', '280', '4', '5.6');
INSERT INTO PRICE (STDPRICE, STARTDATE, PRODID, MINPRICE, ENDDATE)
 VALUES ('4.8', TO_DATE('01-JAN-1985','DD-MON-YYYY'), '100871', '3.2', TO_DATE('01-DEC-1985','DD-MON-YYYY'));
INSERT INTO PRICE (STDPRICE, STARTDATE, PRODID, MINPRICE, ENDDATE)
 VALUES ('58', TO_DATE('01-JAN-1985','DD-MON-YYYY'), '100890', '46.4', '');
INSERT INTO PRICE (STDPRICE, STARTDATE, PRODID, MINPRICE, ENDDATE)
 VALUES ('54', TO_DATE('01-JUN-1984','DD-MON-YYYY'), '100890', '40.5', TO_DATE('31-MAY-1984','DD-MON-YYYY'));
INSERT INTO PRICE (STDPRICE, STARTDATE, PRODID, MINPRICE, ENDDATE)
 VALUES ('35', TO_DATE('01-JUN-1986','DD-MON-YYYY'), '100860', '28', '');
INSERT INTO PRICE (STDPRICE, STARTDATE, PRODID, MINPRICE, ENDDATE)
 VALUES ('32', TO_DATE('01-JAN-1986','DD-MON-YYYY'), '100860', '25.6', TO_DATE('31-MAY-1986','DD-MON-YYYY'));
INSERT INTO PRICE (STDPRICE, STARTDATE, PRODID, MINPRICE, ENDDATE)
 VALUES ('30', TO_DATE('01-JAN-1985','DD-MON-YYYY'), '100860', '24', TO_DATE('31-DEC-1985','DD-MON-YYYY'));
INSERT INTO PRICE (STDPRICE, STARTDATE, PRODID, MINPRICE, ENDDATE)
 VALUES ('45', TO_DATE('01-JUN-1986','DD-MON-YYYY'), '100861', '36', '');
INSERT INTO PRICE (STDPRICE, STARTDATE, PRODID, MINPRICE, ENDDATE)
 VALUES ('42', TO_DATE('01-JAN-1986','DD-MON-YYYY'), '100861', '33.6', TO_DATE('31-MAY-1986','DD-MON-YYYY'));
INSERT INTO PRICE (STDPRICE, STARTDATE, PRODID, MINPRICE, ENDDATE)
 VALUES ('39', TO_DATE('01-JAN-1985','DD-MON-YYYY'), '100861', '31.2', TO_DATE('31-DEC-1985','DD-MON-YYYY'));
INSERT INTO PRICE (STDPRICE, STARTDATE, PRODID, MINPRICE, ENDDATE)
 VALUES ('2.8', TO_DATE('01-JAN-1986','DD-MON-YYYY'), '100870', '2.4', '');
INSERT INTO PRICE (STDPRICE, STARTDATE, PRODID, MINPRICE, ENDDATE)
 VALUES ('2.4', TO_DATE('01-JAN-1985','DD-MON-YYYY'), '100870', '1.9', TO_DATE('01-DEC-1985','DD-MON-YYYY'));
INSERT INTO PRICE (STDPRICE, STARTDATE, PRODID, MINPRICE, ENDDATE)
 VALUES ('5.6', TO_DATE('01-JAN-1986','DD-MON-YYYY'), '100871', '4.8', '');
INSERT INTO PRICE (STDPRICE, STARTDATE, PRODID, MINPRICE, ENDDATE)
 VALUES ('24', TO_DATE('15-FEB-1985','DD-MON-YYYY'), '101860', '18', '');
INSERT INTO PRICE (STDPRICE, STARTDATE, PRODID, MINPRICE, ENDDATE)
 VALUES ('12.5', TO_DATE('15-FEB-1985','DD-MON-YYYY'), '101863', '9.4', '');
INSERT INTO PRICE (STDPRICE, STARTDATE, PRODID, MINPRICE, ENDDATE)
 VALUES ('3.4',TO_DATE( '18-AUG-1985','DD-MON-YYYY'), '102130', '2.8', '');
INSERT INTO PRICE (STDPRICE, STARTDATE, PRODID, MINPRICE, ENDDATE)
 VALUES ('2.4', TO_DATE('15-NOV-1986','DD-MON-YYYY'), '200376', '1.75', '');
INSERT INTO PRICE (STDPRICE, STARTDATE, PRODID, MINPRICE, ENDDATE)
 VALUES ('4', TO_DATE('15-NOV-1986','DD-MON-YYYY'), '200380', '3.2', '');
CREATE INDEX PRICE_INDEX ON PRICE(PRODID, STARTDATE);
INSERT INTO PRODUCT (PRODID, DESCRIP)
 VALUES ('100860', 'ACE TENNIS RACKET I');
INSERT INTO PRODUCT (PRODID, DESCRIP)
 VALUES ('100861', 'ACE TENNIS RACKET II');
INSERT INTO PRODUCT (PRODID, DESCRIP)
 VALUES ('100870', 'ACE TENNIS BALLS-3 PACK');
INSERT INTO PRODUCT (PRODID, DESCRIP)
 VALUES ('100871', 'ACE TENNIS BALLS-6 PACK');
INSERT INTO PRODUCT (PRODID, DESCRIP)
 VALUES ('100890', 'ACE TENNIS NET');
INSERT INTO PRODUCT (PRODID, DESCRIP)
 VALUES ('101860', 'SP TENNIS RACKET');
INSERT INTO PRODUCT (PRODID, DESCRIP)
 VALUES ('101863', 'SP JUNIOR RACKET');
INSERT INTO PRODUCT (PRODID, DESCRIP)
 VALUES ('102130', 'RH: "GUIDE TO TENNIS"');
INSERT INTO PRODUCT (PRODID, DESCRIP)
 VALUES ('200376', 'SB ENERGY BAR-6 PACK');
INSERT INTO PRODUCT (PRODID, DESCRIP)
 VALUES ('200380', 'SB VITA SNACK-6 PACK');
CREATE SEQUENCE ORDID
INCREMENT BY 1
START WITH 622
NOCACHE;
CREATE SEQUENCE PRODID
INCREMENT BY 1
START WITH 200381
NOCACHE;
CREATE SEQUENCE CUSTID
INCREMENT BY 1
START WITH 109
NOCACHE;
CREATE VIEW SALES AS
SELECT REPID, ORD.CUSTID, CUSTOMER.NAME CUSTNAME, PRODUCT.PRODID,
DESCRIP PRODNAME, SUM(ITEMTOT) AMOUNT
FROM ORD, ITEM, CUSTOMER, PRODUCT
WHERE ORD.ORDID = ITEM.ORDID
AND ORD.CUSTID = CUSTOMER.CUSTID
AND ITEM.PRODID = PRODUCT.PRODID
GROUP BY REPID, ORD.CUSTID, NAME, PRODUCT.PRODID, DESCRIP;

