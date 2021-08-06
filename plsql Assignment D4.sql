/*Write a simple PL/SQL (Anonymous block) program to generate
multiplication table for a given number*/
SET SERVEROUTPUT ON;
DECLARE
i NUMBER(2);
n NUMBER(2);
BEGIN
n:=&n;
FOR i IN 1..10 LOOP
dbms_output.put_line( n || ' * ' || i || ' = ' || n*i);
END LOOP;
END;

/*Write a PL/SQL code to print first 50 whole numbers. Also insert the list in
temp table which is created with only one column of number datatype.*/
SET SERVEROUTPUT ON;
CREATE GLOBAL TEMPORARY TABLE tb80
(
numb1 NUMBER(4)
)
ON COMMIT PRESERVE ROWS;
DECLARE
  n number:= 50;
  i number:=1;
  m number:=0;
BEGIN
    
    FOR i IN 1..n-1 LOOP
	   m:=m+1;
	   dbms_output.put(m||'  ');
       INSERT INTO tb80 VALUES(m);
    END LOOP;
    dbms_output.new_line; 
 END;
 /

 SELECT * FROM tb80;
 
 /*Using cursor display the details of all those employees in employee table
whose sum of sal and comm is more than 3000*/
 CREATE TABLE EMPL (
  EMP_ID NUMBER(4),
  EMP_NAME VARCHAR2(20),
  EMAIL VARCHAR2(25),
  PHONE_NUMBER VARCHAR2(10),
  COMM NUMBER(8,2),
  SALARY NUMBER(8,2),
  PRIMARY KEY (EMP_ID)
) ;

INSERT INTO EMPL VALUES (0101, 'Babu', 'babu101@gmail.com', 9448341201, 10, 12000.0);
INSERT INTO EMPL VALUES (0102, 'Somu', 'somu102@gmail.com', 9448534120, 20, NULL);
INSERT INTO EMPL VALUES (0103, 'Ramu', 'ramu103@gmail.com', 9448886634, NULL, 15000.0);
INSERT INTO EMPL VALUES (0104, 'Gobu', 'gobu104@gmail.com', 9447783412, 50, 11500.0);
INSERT INTO EMPL VALUES (0105, 'Anbu', 'Anbu105@gmail.com', 9848341200, 40, 22000.0);
INSERT INTO EMPL VALUES (0106, 'Babnu', 'babnu106@gmail.com', 9448341201, NULL, NULL);
INSERT INTO EMPL VALUES (0107, 'Bsabu', 'bsabu107@gmail.com', NULL, 50, 12000.0);
INSERT INTO EMPL VALUES (0108, 'Batbu', 'batbu108@gmail.com', 9448341201, 30, NULL);

SELECT * FROM EMPL;

DECLARE
  c_empid empl.emp_id%TYPE :=&ce;
  c_empname empl.emp_name%TYPE;
  c_comm empl.comm%TYPE;
  c_salary empl.salary%TYPE;
  CURSOR emp_c IS
    SELECT emp_id, emp_name, NVL(comm, 0), NVL(salary, 0) FROM empl;
BEGIN
  OPEN emp_c;
  LOOP
    FETCH emp_c INTO  c_empid, c_empname, c_comm, c_salary;
    EXIT WHEN emp_c%NOTFOUND;
     IF ((c_salary + c_comm) > 3000) THEN
      dbms_output.Put_line(c_empid
      || '  ' || (c_salary + c_comm)
      ||  ' salary + comm is greater than 3000' );
    ELSE
      dbms_output.Put_line(c_empid
      || ' ' || (c_salary + c_comm)
      || ' NULL VALUES FOUND');
    END IF;
    END LOOP;
    CLOSE emp_c;
    EXCEPTION 
    WHEN CURSOR_ALREADY_OPEN THEN DBMS_OUTPUT.PUT_LINE('This cursor is already open');
END;


/*Create a trigger for the employee table, which makes the entry in ENAME
column in uppercase*/
SET SERVEROUTPUT ON;
CREATE OR REPLACE TRIGGER emp_upd
  BEFORE INSERT OR UPDATE ON empl
          FOR EACH ROW
DECLARE
      k  INTEGER;
BEGIN
   :NEW.emp_name := UPPER(:NEW.emp_name);
END;
SELECT * FROM EMPL;
INSERT INTO EMPL VALUES (0112, 'asfhg', 'batbu108@gmail.com', 9448341201, 30, NULL);
DROP TABLE EMPL;

/*Write a function in PL/SQL to check whether the given string is a palindrome
or not.*/
DECLARE
	s VARCHAR2(10) := '&k';
	l VARCHAR2(20);
	t VARCHAR2(10);
BEGIN
	FOR i IN REVERSE 1..Length(s) LOOP
		l := Substr(s, i, 1);

		t := t
			||l;
	END LOOP;

	IF t = s THEN
	dbms_output.Put_line(t ||' is a palindrome');
	ELSE
	dbms_output.Put_line(t ||' is not a palindrome');
	END IF;
END;

/*Write a PL/SQL block to fire any two built in exceptions in ORACLE by
assuming your own data in a table*/
DECLARE
nsal empl.salary%TYPE;
BEGIN
	SELECT salary INTO nsal from empl WHERE emp_id=&emp_id;
EXCEPTION
	WHEN NO_DATA_FOUND THEN DBMS_OUTPUT.PUT_LINE('Employee not Found');
    WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE('ERROR');
END;

DECLARE
v number(2);
BEGIN
	SELECT salary INTO v FROM empl WHERE emp_id=&emp_id;  
EXCEPTION
	WHEN VALUE_ERROR THEN DBMS_OUTPUT.PUT_LINE('Cannot convert data');
    WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE('ERROR');
END;

/*Write a PL/SQL block to fire any one user defined exception by assuming
your own data in a table.*/
DECLARE 
ex_1 EXCEPTION;
v number;
BEGIN
	FOR v IN (SELECT * FROM empl)LOOP
     if v.salary = 12000 THEN
     RAISE ex_1;
     END IF;
    END LOOP;
EXCEPTION
	WHEN ex_1 THEN DBMS_OUTPUT.PUT_LINE('Custom exception 1');
    WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE('ERROR');
END;

/*Write a named procedure to delete records available in your table.*/
CREATE OR REPLACE PROCEDURE del1(x in NUMBER)
IS
BEGIN
DELETE FROM EMPL WHERE EMP_ID=x;

COMMIT;
END;

SELECT* FROM EMPL;
