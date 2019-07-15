#ESTRUCTURAS

## IF

IF condición THEN;
...
END IF;

## WHILE

WHILE condición LOOP;
...
END LOOP;

## FOR

FOR nombre_variable IN 1..10 LOOP >> este 1..10 HACE ALUSIÓN AL RANGO DE VUELTAS QUE VA A DAR
...
END LOOP;

si ANTES del rango 1..10 ponemos la claúsula REVERSE, conseguiremos un lista decrementable, de 10 a 1.

## LOOP (a secas)

LOOP
...
END LOOP;

'LOOP' nos crea un bucle infinito, del cual saldremos con la sentencia EXIT WHEN

LOOP
    i := i + 1;
    EXIT WHEN i >= 10;
END LOOP;