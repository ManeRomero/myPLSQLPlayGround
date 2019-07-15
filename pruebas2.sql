DECLARE
userNum NUMBER(1) := &userNum;
maxNum NUMBER(2) := 10;
minNum NUMBER(3) := 0;

BEGIN
    WHILE minNum <= maxNum LOOP
        DBMS_OUTPUT.PUT_LINE(userNum || ' * ' || minNum || ' = ' || userNum * minNum);
        minNum := minNum + 1;
    END LOOP;
    
    FOR minNum IN 0..maxNum LOOP
        DBMS_OUTPUT.PUT_LINE('for: ' || userNum || ' * ' || minNum || ' = ' || userNum * minNum);
    END LOOP;
END;

