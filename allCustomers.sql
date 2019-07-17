BEGIN
    listar_clientes();
END;

/

CREATE OR REPLACE PROCEDURE listar_clientes IS
    CURSOR cursor_cliente IS SELECT 
        CUSTOMER_ID ,
        ORDER_TOTAL
    FROM DEMO_ORDERS;
    fila_cliente cursor_cliente%ROWTYPE;
    
BEGIN
    OPEN cursor_cliente;
        LOOP
            FETCH cursor_cliente INTO fila_cliente;
            EXIT WHEN cursor_cliente%NOTFOUND;
            check_mejor_cliente(fila_cliente.ORDER_TOTAL, fila_cliente.CUSTOMER_ID);         
        END LOOP;
    CLOSE cursor_cliente;    
END;

/

CREATE OR REPLACE PROCEDURE check_mejor_cliente (gasto NUMBER, user_id NUMBER) IS
    gasto_max NUMBER := 0;
    mejor_cliente NUMBER := 0;
BEGIN
    
    IF (gasto > gasto_max) THEN
        gasto_max := gasto;
        mejor_cliente := user_id;
    END IF;

    consolelog((gasto_max || '� HA GASTADO EL MEJOR CLIENTE ' || mejor_cliente));
    consolelog('EL MEJOR CLIENTE POR AHORA ES ID: ' || mejor_cliente);
END;