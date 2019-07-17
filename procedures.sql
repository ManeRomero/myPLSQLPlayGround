CREATE OR REPLACE PROCEDURE consoleLog(text VARCHAR2) IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('AQUÍ EL RESULTADO ' || text);
END;

/

CREATE OR REPLACE PROCEDURE sumar (num1 NUMBER, num2 NUMBER) IS
    resultado NUMBER;
BEGIN
    resultado := num1 + num2;
    consoleLog(resultado);
END;

/

BEGIN
    sumar(12, 5);
END;