-- SACA LO QUE HA GASTADO CADA USUARIO EN COMPRAS
SELECT sum(QUANTITY * UNIT_PRICE) AS USER_EXPENDS, DEMO_CUSTOMERS.CUSTOMER_ID,
DEMO_CUSTOMERS.CUST_FIRST_NAME
FROM DEMO_ORDER_ITEMS
LEFT JOIN DEMO_ORDERS
ON DEMO_ORDER_ITEMS.ORDER_ID = DEMO_ORDERS.ORDER_ID
LEFT JOIN DEMO_CUSTOMERS
ON DEMO_CUSTOMERS.CUSTOMER_ID = DEMO_ORDERS.CUSTOMER_ID
GROUP BY DEMO_CUSTOMERS.CUSTOMER_ID, DEMO_CUSTOMERS.CUST_FIRST_NAME;

CREATE TABLE DEMO_LOGS (
    log_date DATE,
    message VARCHAR2(100)
);

SELECT * FROM DEMO_LOGS;

/

CREATE OR REPLACE TRIGGER log_states_insert
AFTER INSERT ON DEMO_STATES
REFERENCING OLD AS viejo NEW AS nuevo
FOR EACH ROW
DECLARE
    fecha_actual DATE := SYSDATE;
    msg DEMO_LOGS.MESSAGE%TYPE := 'registro insertado en state: ' || :nuevo.STATE_NAME ;
BEGIN
    INSERT INTO DEMO_LOGS(LOG_DATE, message) VALUES (fecha_actual, msg);
END;

CREATE OR REPLACE TRIGGER log_states_delete
AFTER DELETE ON DEMO_STATES
REFERENCING OLD AS viejo NEW AS nuevo
FOR EACH ROW
DECLARE
    fecha_actual DATE := SYSDATE;
    msg_borrado DEMO_LOGS.MESSAGE%TYPE := 'registro eliminado en state: ' || :viejo.STATE_NAME ;
BEGIN
    INSERT INTO DEMO_LOGS(LOG_DATE, MESSAGE) VALUES (fecha_actual, msg_borrado);
END;

-- REFERENCIACIÓN DE DEMO_ORDERS Y DEMO_ORDERS_ITEMS
CREATE OR REPLACE TRIGGER referencia_items
AFTER UPDATE ON DEMO_ORDER_ITEMS
REFERENCING OLD AS viejo NEW AS nuevo
FOR EACH ROW
DECLARE
    calc_diferencia NUMBER := (:nuevo.QUANTITY * :nuevo.UNIT_PRICE) - (:viejo.QUANTITY * :viejo.UNIT_PRICE);   
BEGIN
    UPDATE DEMO_ORDERS SET ORDER_TOTAL = ORDER_TOTAL + calc_diferencia WHERE ORDER_ID = :viejo.ORDER_ID;
END;