SET SERVEROUTPUT ON;
DECLARE
    num1 NUMBER := 20;
    num2 NUMBER := 30;
BEGIN
    CASE num1
        when 20 then dbms_output.put_line(POWER(num1,2));
    END CASE;
    CASE num2
        when 30 then dbms_output.put_line(POWER(num2,3));
    END CASE;
END;

