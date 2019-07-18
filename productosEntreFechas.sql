DECLARE
fecha1 DATE := to_date('01/06/18', 'DD/MM/YY');
fecha2 DATE := to_date('01/07/18', 'DD/MM/YY');

BEGIN
            DBMS_OUTPUT.PUT_LINE(giveProducts(fecha1, fecha2));

    IF (fecha1 < fecha2) THEN
        DBMS_OUTPUT.PUT_LINE(giveProducts(fecha1, fecha2));
    ELSE
        DBMS_OUTPUT.PUT_LINE('LA FECHA ESTÁ MAL');
    END IF;
    
    DBMS_OUTPUT.PUT_LINE(fecha1 || fecha2);
END;

/

CREATE OR REPLACE FUNCTION giveProducts (desde DATE, hasta DATE)
RETURN NUMBER 
IS
    total NUMBER(10);
    
    CURSOR cursor_items IS 
        SELECT ORDER_TIMESTAMP, ORDER_ID
        FROM DEMO_ORDERS
        WHERE ORDER_TIMESTAMP BETWEEN desde and hasta;
    
    fila_items cursor_items%ROWTYPE;    

BEGIN
    total := 0;
    OPEN cursor_items;
        LOOP
            FETCH cursor_items INTO fila_items;
            DBMS_OUTPUT.PUT_LINE(fila_items.ORDER_ID);
        END LOOP;
    CLOSE cursor_items;
    return total;
END;