DECLARE
    CURSOR iterator IS SELECT 
BEGIN
    
END;
-- VOY A INTENTAR 
-- C�DIGO COMO DIOS MANDA, DELEGADO POR PARTE DE VERO -- github.com/vmhgarcia2

--        DECLARE
--            CURSOR misUsuarios
--                is select CUSTOMER_ID
--                from DEMO_CUSTOMERS;
--            usuarios misUsuarios%ROWTYPE;
--            CURSOR misTickets (id number)
--                is select 
--                    count(ORDER_TOTAL) AS NUM_COMPRAS, 
--                    CASE WHEN SUM(ORDER_TOTAL)>0 THEN SUM(ORDER_TOTAL) ELSE 0 END as TOTAL
--                    from DEMO_ORDERS
--                    where CUSTOMER_ID = id;
--            tickets misTickets%ROWTYPE;
--        BEGIN
--            for usuario in misUsuarios loop
--                OPEN misTickets(usuario.CUSTOMER_ID);
--                    LOOP
--                        FETCH misTickets INTO tickets;
--                        EXIT WHEN misTickets%NOTFOUND;
--                        DBMS_OUTPUT.PUT_LINE('Usuario: ' || usuario.CUSTOMER_ID || '. N�mero de compras: ' || tickets.NUM_COMPRAS || '. Total compras: ' || tickets.TOTAL);                     
--                    END LOOP;         
--                CLOSE misTickets;
--            end loop;
--            
--        END;