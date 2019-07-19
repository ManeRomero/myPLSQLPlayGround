# EXCEPTIONS

Las excepciones se manejan con otro bloque de código, que es el **EXCEPTION**:

DECLARE
...
BEGIN
...
EXCEPTION
    WHEN exception1 THEN
    ...
    WHEN exception2 THEN
    ...
    WHEN NO_DATA_FOUND THEN
        BDMS_OUTPUT.PUT_LINE('hubo un error');
END;

## LANZAR TU PROPIA EXCEPCIÓN
DECLARE
[nombre_futura_excepción] EXCEPTION;
...
RAISE [nombre_excepción]    >>  éste nombre luego nos servirá para seleccionar dicha expeción en el bloque EXCEPTION

EXCEPTION
    WHEN [nombre_excepción]
        DBMS_OUTPUT.PUT_LINE('......');

en el momento de captar el error, **sale del bloque de código para buscar el bloque EXCEPTION**, y mostrar o ejecutar lo que se ha dispuesto para manejar ese error.

### EN RESUMEN

1. Declaramos variable tipo extensión
2. Cuando veamos conveniente, lanzamos con RAISE la excepción
3. Disponemos el bloque de excepciones con WHEN - [nombre_excepción] - THEN