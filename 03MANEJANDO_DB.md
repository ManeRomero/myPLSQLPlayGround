# MANEJANDO BASE DE DATOS

## Primeros pasos

DECLARE
    total_filas NUMBER(3); <<declaramos una variable que recoja números>>
BEGIN
    SELECT count(*) INTO total_filas FROM [NOMBRE_TABLA_BD]; <<count: instrucción SQL>>
    DBMS_OUTPUT.PUT_LINE('Total filas: ' || total_filas); 
END;

## Más ejemplos

nombre_cliente [NOMBRE_TABLA].[NOMBRE_CAMPO]%TYPE; <<devuelve el tipo de un campo a la variable declarada nombre_cliente>>

SELECT [NOMBRE_CAMPO]
    INTO nombre_cliente
    FROM [NOMBRE_TABLA]
    WHERE [NOMBRE_CAMPO_id?otros] = [valor_de_búsqueda]

### Otra herramienta disponible es %ROWTYPE
Si tenemos una tabla con registros y queremos obtener todos los datos,

# CURSORES IMPLÍCITOS
Cuando tenemos más de un registro/fila...

## APERTURA DE CURSOR
DECLARE
CURSOR [nombre_cursor] IS SELECT [NOMBRE_CAMPO], [NOMBRE_CAMPO] FROM [NOMBRE_TABLA]

con esta orden conseguimos los campos indicados en todas las filas, CURSOR nos ayuda en el tratamiento de datos provenientes de más de una fila. Ahora lo que tenemos que hacer es OPEN Y CLOSE, e iterar sobre un conjunto de registros/filas

OPEN [nombre_cursor]
    LOOP
        FETCH [nombre_cursor] INTO [nombre_de_variable_con_%ROWTYPE] <<fetch coge un dato y lo mete a nombre_>>
        EXIT WHEN [nombre_cursor]%NOTFOUND;
    END LOOP;
CLOSE [nombre_cursor]

El problema es que aquí abarcamos todos los campos de un registro. Si queremos seleccionar sólo unos cuantos campos, deberemos hacer lo siguiente:

CURSOR [nombre_cursor] IS SELECT [nombre_campo_deseado] FROM [nombre_tabla]

y luego el quid de la cuestión radica en realizar el INTO con %ROWTYPE apuntando a este [nombre_cursor]




