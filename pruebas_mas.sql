DECLARE

userNum1 NUMBER(3) := &n1;
userNum2 NUMBER(3) := &n2;
i NUMBER(3) := 0;

BEGIN
    IF userNum1 > userNum2 THEN
        DBMS_OUTPUT.PUT_LINE('introduce el n�mero bien, alcahuete');
    END IF;

    FOR i IN userNum1..userNum2 LOOP
        IF MOD (i, 2) = 0 THEN
            DBMS_OUTPUT.PUT_LINE(i || ' es un n�mero par');
        ELSE
            DBMS_OUTPUT.PUT_LINE(i || ' es un n�mero impar');
        END IF;     
    END LOOP;
END;