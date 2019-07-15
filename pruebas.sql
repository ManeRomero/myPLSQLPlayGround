DECLARE
    greeting VARCHAR2(100) := 'yEEEE qué pasa';
    winki VARCHAR2(100) := ' Winki';
    numerito number(3, 1) := 20.5;
    multiplicador number(6,2) := &NUMERO;
    saludito VARCHAR2(100) := '&saludito';
BEGIN
    DBMS_OUTPUT.PUT_LINE(greeting || winki);
    DBMS_OUTPUT.PUT_LINE(numerito);
    DBMS_OUTPUT.PUT_LINE(numerito * multiplicador);
    DBMS_OUTPUT.PUT_LINE('Saludo ' || saludito);
END;