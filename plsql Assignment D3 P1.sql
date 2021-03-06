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

