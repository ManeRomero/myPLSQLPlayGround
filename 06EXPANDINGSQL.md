# EXPANDIENDO SQL: TRIGGERS

Se relacionan a sucesos de modificación en la BD, operaciones de consulta y modificación. Existe una limitación que nos puede llevar de cabeza: lo que hagamos dentro de los triggers no puede trabajar sobre la tabla que ha desencadenado esta acción. Inserciones, Actualizaciones y Borrados.

## SINTAXIS

CREATE OR REPLACE TRIGGER [nombre_trigger]
{BEFORE | AFTER | INSTEAD OF}  >>>  establece el momento de desencadenado
{INSERT [OR] | UPDATE [OR]| DELETE}  >>> establece el desencadenante
[OF nombre_columna] >> nombre campo al que le afecta (opcional)
ON [nombre_tabla]
[REFERENCING OLD AS [nombre_variable_previo_registro] NEW AS [variable_registro_nuevo]] >>
[FOR EACH ROW]  >>  indicando esta sentencia, ejecutarás el trigger en cada paso. REFERENCING depende de esta característica, ya que si no se incluye el FOR EACH ROW, no puede considerar cuál es 'previo' y cuál es 'nuevo registro'.
[WHEN (condición)]  >>  establece una condición añadida más al disparador

DECLARE
...
EXCEPTION   >>  manejo de errores
END;




