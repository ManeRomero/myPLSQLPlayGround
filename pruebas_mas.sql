DECLARE

userNum1 NUMBER(3) := &userNum1;
userNum2 NUMBER(3) := &userNum2;
i NUMBER(3) := 0;

BEGIN
    FOR i IN userNum1..userNum2 LOOP
        IF MOD (i, 2) = 0 THEN
            DBMS_OUTPUT.PUT_LINE(i || ' es un número par');
        ELSE
            DBMS_OUTPUT.PUT_LINE(i || ' es un número impar');
        END IF;     
    END LOOP;
END;