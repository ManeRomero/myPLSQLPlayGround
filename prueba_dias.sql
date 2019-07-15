DECLARE
    fecha DATE := '&fecha';
    userDay VARCHAR2(10) := (TO_CHAR(fecha, 'D'));
BEGIN
    DBMS_OUTPUT.PUT_LINE (userDay);
    IF userDay > 5 THEN
        DBMS_OUTPUT.PUT_LINE('SÍ es fin de semana - ' || TO_CHAR(fecha, 'Day'));
    ELSE
        DBMS_OUTPUT.PUT_LINE('No es fin de semana - ' || TO_CHAR(fecha, 'Day'));    
    END IF;
END;