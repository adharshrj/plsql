/*DAY 1 2/8/21*/ 
/* Create a table with name depart for the following specification. */
CREATE DATABASE `plsql`;
USE `plsql`;
CREATE TABLE IF NOT EXISTS `DEPART` (
  `DEPART_ID` int(4) NOT NULL,
  `DEPART_NAME` varchar(30) NOT NULL,
  `MANAGER_ID` int(6)  NOT NULL,
  UNIQUE (MANAGER_ID),
  PRIMARY KEY (`DEPART_ID`)
) ;

/* Create a table with name employees for the following specification. */
USE `plsql`;
CREATE TABLE IF NOT EXISTS `EMPLOYEES` (
  `EMP_ID` int(4),
  `EMP_NAME` varchar(20),
  `EMAIL` char(25),
  `PHONE_NUMBER` varchar(10),
  `DEPT_ID` int(4),
  PRIMARY KEY (`EMP_ID`)
) ;

/*Using Alter command add a new column in employees table with name salary and with datatype 
and precision as Number(8,2)*/
USE `plsql`;
ALTER TABLE `EMPLOYEES`
ADD `SALARY` float(8,2);

/* Using Alter command add a new table constraint in employees table with name for key for 
DEPT_ID column in employees table which refers the primary key of depart table (consider the 
usage of both foreign key and references constraints)*/
USE `plsql`;
ALTER TABLE `EMPLOYEES`
ADD CONSTRAINT DEPT_ID FOREIGN KEY (DEPT_ID) REFERENCES DEPART(DEPART_ID);

/*Using Alter command drop the constraint in employees table with name for key and modify the 
column DEPT_ID with column constraint references for the primary key in depart table.*/
USE `plsql`;
ALTER TABLE `EMPLOYEES`
DROP CONSTRAINT DEPT_ID;

/* Using Alter command drop the column in employees table with name EMAIL*/
USE `plsql`;
ALTER TABLE `EMPLOYEES`
DROP `EMAIL`;

/*After adding salary column (Q.3), add a column constraint to the EMPLOYEES table which 
restricts the addition of those employees who have salaries less than 10000.*/
USE `plsql`;
ALTER TABLE `EMPLOYEES` ADD CONSTRAINT `SAL_CHECK` CHECK (salary >= 10000); 

/*Using Alter command, rename table employees as empl;*/
USE `plsql`;
ALTER TABLE `EMPLOYEES` RENAME `EMPL`;

/*Create a new table with name depart1 as same as depart in structure*/
USE `plsql`;
CREATE TABLE `DEPART1` LIKE `DEPART`;

/* After creation, drop table depart1 using drop command.*/
USE `plsql`;
DROP TABLE `DEPART1`;