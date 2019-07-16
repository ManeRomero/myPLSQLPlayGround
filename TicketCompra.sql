DECLARE
    fechaDada VARCHAR2(20) := '14/06/2019' ;
    sumatorio NUMBER := 0;
    sumatorio_segun_fechas NUMBER := 0;
    sumatorio_segun_ticket NUMBER := 0;
    media_segun_ticket NUMBER := 0;
    counter NUMBER := 0;
    media NUMBER := 0;
    idSearch NUMBER := 1;
    countItemsInTicket NUMBER := 0;
    
    CURSOR cursorSuma IS SELECT ORDER_TOTAL FROM DEMO_ORDERS;
    CURSOR cursorDate IS SELECT ORDER_TOTAL, ORDER_TIMESTAMP FROM DEMO_ORDERS;
    CURSOR cursorTicket IS SELECT * FROM DEMO_ORDER_ITEMS;
    
    tipo_filas cursorSuma%ROWTYPE;
    tipo_filas_date cursorDate%ROWTYPE;
    tipo_filas_ticket cursorTicket%ROWTYPE;

BEGIN
    OPEN cursorSuma;
        LOOP
            FETCH cursorSuma INTO tipo_filas;
            EXIT WHEN cursorSuma%NOTFOUND;
            sumatorio := sumatorio + tipo_filas.ORDER_TOTAL;
            counter := counter + 1;
        END LOOP;
    CLOSE cursorSuma;
    media := sumatorio / counter;

    DBMS_OUTPUT.PUT_LINE('MEDIA TOTAL: ' || media);
    DBMS_OUTPUT.PUT_LINE('SUMATORIO: ' || sumatorio);
    
--    OPEN cursorDate;
--        LOOP
--            FETCH cursorDate INTO tipo_filas_date;
--            EXIT WHEN cursorSuma%NOTFOUND;
--            IF tipo_filas_date.ORDER_TIMESTAMP > fechaDada THEN
--                sumatorio_segun_fechas := sumatorio_segun_fechas + tipo_filas_date.ORDER_TOTAL;
--            END IF;
--        END LOOP;
--    CLOSE cursorDate;
    
    OPEN cursorTicket;
        LOOP
            FETCH cursorTicket INTO tipo_filas_ticket;
            EXIT WHEN cursorTicket%NOTFOUND;
            IF idSearch = tipo_filas_ticket.ORDER_ID THEN
                sumatorio_segun_ticket := sumatorio_segun_ticket + tipo_filas_ticket.QUANTITY * tipo_filas_ticket.UNIT_PRICE;
                countitemsinticket := countitemsinticket + tipo_filas_ticket.QUANTITY;
            ELSE
                media_segun_ticket := sumatorio_segun_ticket / countitemsinticket;
                DBMS_OUTPUT.PUT_LINE('SUMATORIO SEGÚN TICKET: ' || media_segun_ticket || ' ID: ' || idSearch || ' CON ESTOS PRODUCTOS: ' || countitemsinticket);
                idSearch := idSearch + 1;
                sumatorio_segun_ticket := tipo_filas_ticket.QUANTITY * tipo_filas_ticket.UNIT_PRICE;
                media_segun_ticket := 0;
                countitemsinticket := tipo_filas_ticket.QUANTITY;
            END IF;
        END LOOP;
    CLOSE cursorTicket;
    
    DBMS_OUTPUT.PUT_LINE('A PARTIR DE UNA FECHA: ' || sumatorio_segun_fechas);
    
--        CURSOR totalProducto 
--        IS SELECT AVG(DEMO_ORDERS.ORDER_TOTAL) AS TOTAL,DEMO_ORDERS.ORDER_ID AS ID, SUM(DEMO_ORDER_ITEMS.QUANTITY) as SUMA
--        FROM DEMO_ORDERS
--        INNER JOIN DEMO_ORDER_ITEMS
--        ON DEMO_ORDERS.ORDER_ID = DEMO_ORDER_ITEMS.ORDER_ID
--        GROUP BY DEMO_ORDERs.ORDER_ID;

END;