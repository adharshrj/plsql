CREATE TABLE myemp (
  Eno NUMBER(4),
  Ename VARCHAR2(30) NOT NULL,
  Deptno NUMBER(4) NOT NULL,
  Esal NUMBER(8,2),
  PRIMARY KEY (Eno)
) ;

INSERT INTO myemp VALUES (0101, 'Babu', 10, 2000.0);
INSERT INTO myemp VALUES (0102, 'Somu', 20, 10000.0);
INSERT INTO myemp VALUES (0103, 'Ramu', 40, 7000.0);
INSERT INTO myemp VALUES (0104, 'Gobu', 60, 1500.0);
INSERT INTO myemp VALUES (0105, 'Anbu', 40, 22000.0);

select*from myemp;
drop table myemp;
drop table empcommnul;

ALTER TABLE myemp ADD experience NUMBER(4) DEFAULT 0 NOT NULL;

UPDATE myemp SET Esal=NULL WHERE Esal>5000.0 AND Esal<10000.0; 

ALTER TABLE myemp ADD comm NUMBER(4);

UPDATE myemp SET comm=20 WHERE eno=0101;
UPDATE myemp SET comm=30 WHERE eno=0103;
UPDATE myemp SET comm=50 WHERE eno=0105;

CREATE TABLE empcommnul AS (SELECT Eno,Ename,deptno,Esal,comm FROM myemp WHERE Esal = NULL AND comm=NULL);
insert into empcommnul select Eno,Ename,deptno,Esal,comm from myemp where comm is null;
select*from empcommnul;

DECLARE 
ex_1 EXCEPTION;
v number;
BEGIN
	FOR v IN (SELECT * FROM myemp)LOOP
     if v.salary = 500 THEN
     RAISE ex_1;
     END IF;
    END LOOP;
EXCEPTION
	WHEN ex_1 THEN DBMS_OUTPUT.PUT_LINE('Custom exception 1');
    WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE('ERROR');
END;

SET SERVEROUTPUT ON;
CREATE OR REPLACE TRIGGER new_tr
  BEFORE INSERT OR UPDATE ON myemp
          FOR EACH ROW
DECLARE
      k  INTEGER;
BEGIN
   :NEW.emp_name := UPPER(:NEW.emp_name);
END;

CREATE TABLE ebill (
  cno NUMBER(10),
  cname VARCHAR2(30) NOT NULL,
  nounits NUMBER(4) NOT NULL,
  bamt NUMBER(8,2),
  PRIMARY KEY (cno)
) ;

INSERT INTO ebill VALUES (0101, 'Babu', 10, 0);
INSERT INTO ebill VALUES (0102, 'Somu', 2, 0);
INSERT INTO ebill VALUES (0103, 'Ramu', 40 ,0);
INSERT INTO ebill VALUES (0104, 'Gobu', 60, 0);
INSERT INTO ebill VALUES (0105, 'Anbu', 40, 0);

DECLARE
  c_cno ebill.cno%TYPE;
  c_cname ebill.came%TYPE;
  c_nounits ebill.nounits%TYPE;
  c_bamt ebill.bamt%TYPE;
  CURSOR emp_c IS
    SELECT cno, cname, nounits, bamt FROM ebill;
BEGIN
  OPEN ebill_c;
  LOOP
    FETCH ebill_c INTO  c_cno, c_cname, c_nounits, c_bamt;
    EXIT WHEN ebill_c%NOTFOUND;
    if (c_nounits>200) THEN
    dbms_output.Put_line(c_bamt=(c_nounits-200)*1.5+150 || 'Greater than 200');
    else if (c_nounits>100) THEN
    dbms_output.Put_line(c_bamt=(c_nounits-100)*1.5+50 || 'Greater than 100');
    else
    dbms_output.Put_line(c_bamt=c_nounits*0.5 || 'Less than 100');
    END IF;
    END LOOP;
    CLOSE ebill_c;
    EXCEPTION 
    WHEN CURSOR_ALREADY_OPEN THEN DBMS_OUTPUT.PUT_LINE('This cursor is already open');
END;

CREATE OR REPLACE PROCEDURE show1
IS
SELECT * FROM ;
COMMIT;
END;
