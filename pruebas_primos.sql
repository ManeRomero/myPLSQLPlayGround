DECLARE

    userNum NUMBER(3) := &n;
    checkPrimo BOOLEAN := true;
    i NUMBER(3) := 2;
    
BEGIN

    WHILE i <= userNum - 1 AND checkPrimo = true LOOP
        IF MOD (userNum, i) = 0 THEN
            DBMS_OUTPUT.PUT_LINE('PASO NUM ' || i);
            DBMS_OUTPUT.PUT_LINE('el n�mero ' || userNum || ' no es primo.');
            checkPrimo := false;
        ELSE
            i := i + 1;
        END IF;
    END LOOP;
    
    IF checkPrimo = true THEN
        DBMS_OUTPUT.PUT_LINE('el n�mero ' || userNum || ' S� es primo.'); 
    END IF;
END;