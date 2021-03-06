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

/*DAY 2 3/8/21*/ 
/*Insert the following 5 rows in depart table using Insert command*/
USE `plsql`;
INSERT INTO `DEPART` VALUES (10, 'purchase', 123);
INSERT INTO `DEPART` VALUES (20, 'inventory', 345);
INSERT INTO `DEPART` VALUES (30, 'sales', 567);
INSERT INTO `DEPART` VALUES (40, 'materials', 789);
INSERT INTO `DEPART` VALUES (50, 'production', 911);

/*Insert the following 5 rows in employee table using Insert command*/
USE `plsql`;
INSERT INTO `EMPL` VALUES (0101, 'Babu', 'babu101@gmail.com', 9448341201, 10, 12000.0);
INSERT INTO `EMPL` VALUES (0102, 'Somu', 'somu102@gmail.com', 9448534120, 20, 10000.0);
INSERT INTO `EMPL` VALUES (0103, 'Ramu', 'ramu103@gmail.com', 9448886634, 40, 15000.0);
INSERT INTO `EMPL` VALUES (0104, 'Gobu', 'gobu104@gmail.com', 9447783412, 50, 11500.0);
INSERT INTO `EMPL` VALUES (0105, 'Anbu', 'Anbu105@gmail.com', 9848341200, 40, 22000.0);

/*(a)Select all employees working in materials department*/
SELECT * FROM `EMPL` WHERE `DEPT_ID` = 40;

/*(b)Select the department number and employees??? names who are working in sales*/
SELECT * FROM `EMPL` WHERE `DEPT_ID`=30;

/*(c)Select the names of the employees who are working in materials department earning salary
more than 15000*/
SELECT * FROM `EMPL` WHERE `SALARY`>15000 AND `DEPT_ID`=40;

/*(d) select all employee???s name, salary and 5% of their salary as BONUS.*/
SELECT `EMP_NAME`, 5/100*`SALARY`BONUS FROM `EMPL`;

/*(e) select all employees details whose name starts with letter ???R???;*/
SELECT * FROM `EMPL` WHERE `EMP_NAME` LIKE 'R%';

SELECT `DEPT_ID` AND `EMP_NAME` FROM `EMPL` WHERE `DEPT_ID`=30;


USE `plsql`;
ALTER TABLE `EMPL`
DROP CONSTRAINT `SAL_CHECK`;

/*(a)Update all employee records in sales department with 10% raise in salary*/
SET sql_safe_updates=0;
USE `plsql`;
UPDATE `EMPL` SET `SALARY` = `SALARY` + `SALARY` * 10/100 WHERE `DEPT_ID` =30;

/*(b)Update all employees??? salary with 3% reduction in inventory department.*/
SET sql_safe_updates=0;
UPDATE `EMPL` SET `SALARY` = `SALARY` - `SALARY` * 3/100 WHERE `DEPT_ID` =20;

/*5. After doing Q.3 and Q.4, create a table with name updatedemp by selecting columns Emp_ID,
Emp_name, email associated with employees table and with dept_id values greater than 20.*/
USE `plsql`;
SET sql_safe_updates=0;
CREATE TABLE IF NOT EXISTS `UPDATEDEMP` SELECT * FROM `EMPL` WHERE `DEPT_ID`>20;

/*6. Delete all employees who are drawing salary less than 12000*/
USE `plsql`;
SET sql_safe_updates=0;
DELETE FROM `EMPL` WHERE `SALARY`<12000;



/*7. Create a new table with name view tab by selecting all values
from updatedemp
8. Create a view with name my tab with EMP_ID, EMP_NAME, DEPT_ID
with salary values greater than or equal to 10000.*/
CREATE VIEW `MYTAB` AS SELECT * FROM `EMPL` WHERE `SALARY` IS NOT NULL;
SELECT * FROM `MYTAB`;
CREATE OR REPLACE VIEW `MYTAB` AS SELECT * FROM `EMPL` WHERE `SALARY` >10000;
SELECT * FROM `MYTAB`;
/*9. Display all rows in employees in ascending order of salary.*/

USE `plsql`;
SELECT * FROM `EMPL` WHERE `SALARY` IS NOT NULL ORDER BY `SALARY` ASC;

/*10. Display all rows in employees in descending order of their names*/
USE `plsql`;
SELECT * FROM `EMPL` WHERE `SALARY` IS NOT NULL ORDER BY `EMP_NAME` DESC;

SHOW databases;
USE `plsql`;SHOW tables;

USE `plsql`;
CREATE TABLE `EMPL2` LIKE `EMPL`;
INSERT INTO `EMPL2` VALUES (0101, 'Babu', 'babu101@gmail.com', 9448341201, 10, 12000.0),(0102, 'Somu', 'somu102@gmail.com', 9448534120, 20, 10000.0);

/*DAY 3 4/8/21*/
/*create a student table with the following details (Assume 
your own datatypes for the data.*/
 USE `plsql`;
CREATE TABLE IF NOT EXISTS `STUDENT` (
  `STU_ID` int(4) NOT NULL,
  `STU_NAME` varchar(30) NOT NULL,
  `SEX` varchar(10) NOT NULL,
  `TOTAL_MARKS` int(6)  NOT NULL,
  PRIMARY KEY (`STU_ID`)
) ;

USE `plsql`;
INSERT INTO `STUDENT` VALUES (10, 'Anu', 'Female',553);
INSERT INTO `STUDENT` VALUES (20, 'Anbu', 'Male',345);
INSERT INTO `STUDENT` VALUES (30, 'Malini', 'Female',567);
INSERT INTO `STUDENT` VALUES (40, 'Sankar', 'Male',590);
INSERT INTO `STUDENT` VALUES (50, 'Varshan', 'Male',587);

/*Select the maximum marks of a student in the table*/
USE `plsql`;
SELECT MAX(`TOTAL_MARKS`) FROM `STUDENT`;

/*Select the number of male and female students in the table.*/
USE `plsql`;
SELECT COUNT(`SEX`) FROM `STUDENT` GROUP BY `SEX`;


/*Select the average marks scored by male and female group of students in the table*/
USE `plsql`;
SELECT AVG(`TOTAL_MARKS`)  FROM `STUDENT` GROUP BY `SEX`;

/* select all students who scored marks greater than the average mark of the students in the 
table*/
USE `plsql`;
SELECT AVG(`TOTAL_MARKS`) FROM `STUDENT`;
SELECT * FROM `STUDENT` WHERE `TOTAL_MARKS` > (SELECT AVG(`TOTAL_MARKS`) FROM `STUDENT`) GROUP BY `STU_NAME`;

/*Select the group of students who scored greater average marks than the average marks of 
the entire students in the table*/
USE `plsql`;
SELECT `STU_NAME`, AVG(`TOTAL_MARKS`) AS AVGM FROM `STUDENT` GROUP BY `STU_NAME` HAVING AVGM > (SELECT AVG(`TOTAL_MARKS`) FROM `STUDENT`);

/*select all student details whose name value consists of exactly three characters.*/
SELECT * FROM `STUDENT` WHERE `STU_NAME` LIKE '___';

/*Display all students in ascending order of their sex and descending order of their marks.*/
SELECT * FROM `STUDENT` WHERE `TOTAL_MARKS`>0 ORDER BY `SEX` ASC, `TOTAL_MARKS` DESC;

/*Find the difference in marks between maximum and minimum in the class*/
SELECT MAX(`TOTAL_MARKS`)-MIN(`TOTAL_MARKS`) FROM `STUDENT`;

/*Create a view object for student table with name ???mytab??? by 
assuming your own condition for the selection and demonstrate 
the role of ???with check option??? for the created view.*/
CREATE OR REPLACE VIEW `NEW_STUD` AS SELECT `STU_ID`,`STU_NAME`,`SEX`,`TOTAL_MARKS` FROM `STUDENT` WHERE `TOTAL_MARKS`>0 AND `TOTAL_MARKS`<600 WITH CHECK OPTION; 
SELECT * FROM `NEW_STUD`;
INSERT INTO `NEW_STUD`(`STU_ID`,`STU_NAME`,`SEX`,`TOTAL_MARKS`) VALUES (79, 'Anum', 'Female',0),(70,'MAn','Male',604);

/*Perform 3 insertions with student table and then set a 
savepoint s1. Again, perform any two deletion. Now check the 
execution effect of ROLLBACK to s1, commit followed by another 
Rollback.*/
START TRANSACTION;

SELECT*FROM `STUDENT`;
SET sql_safe_updates=0;
INSERT INTO `STUDENT` VALUES (99, 'Anum', 'Female',0),(90,'MAn','Male',604),(100,'MaAn','Male',684);

SAVEPOINT s1;
DELETE FROM `STUDENT` WHERE `STU_ID` > 98;
SELECT*FROM `STUDENT`;

ROLLBACK TO SAVEPOINT s1;
COMMIT;
ROLLBACK TO SAVEPOINT s1;

