SET SERVEROUTPUT ON;
DECLARE
    num1 NUMBER := 20;
BEGIN
    CASE num1
        when 20 then dbms_output.put_line(POWER(num1,2));
    END CASE;
END;

DECLARE
    num1 NUMBER := 20;
BEGIN
    CASE num1
        when 20 then dbms_output.put_line(POWER(num1,3));
    END CASE;
END;
