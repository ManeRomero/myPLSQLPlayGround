# FUNCTIONS & PROCEDURES

Hasta ahora hemos creado bloques y pequeñas funcionalidades de manera 'anónima', que no persisten en la BD. Lo que pretendemos es conseguir esto mismo.

## DIFERENCIAS ENTRE ELLAS

Fundamentalmente, **un procedimiento no devuelve un valor, mientras que la función sí**. Ambas se almacenan en la base de datos, las podemos encontrar en la parte de la conexión, a la izquierda, en las carpetas correspondientes de funciones o procedimientos.

### CREANDO UN PROCEDIMIENTO

Como siempre, tenemos la parte de declaración [DECLARE] y la de ejecución [BEGIN-END]

CREATE PROCEDURE [nombre_procedimiento] >>> también puedes indicar REPLACE en lugar de CREATE
([nombre_parámetro] type )
{IS | AS}
BEGIN
    [cuerpo_de_ejecución]
END

ej:
CREATE OR REPLACE PROCEDURE saludo IS
BEGIN
    DBMS_OUTPUT.PUT_LINE("Hola, qué tal?");
END;

En teoría, esto no debe generar nada por sí mismo, ya que, pese a compilar, **no estamos 'invocando' al procedure, y éste per sé no genera cambios**, aunque ya figura en la carpeta PROCEDIMIENTOS, en la parte de conexiones. Vamos a llamarlo, escribiendo esto en el mismo archivo:

BEGIN
    saludo();
END;

Ahora el problema es que la llamada genera problemas por solapamiento de bloques, hemos de separar ambos bloques con '/', quedando resumido así:

CREATE OR....
BEGIN
...     >>>     PROGRAMACIÓN DEL PROCEDURE
END;
/
BEGIN
...     >>>     LLAMADA AL PROCEDURE
END;

#### PROCEDIMIENTO CON (PARÁMETROS)

CREATE OR REPLACE PROCEDURE sumar (num1 NUMBER, num2 NUMBER) IS
    resultado NUMBER;
BEGIN
    resultado := num1 + num2;
    DBMS_OUTPUT.PUT_LINE('AQUÍ EL RESULTADO ' || resultado);
END;
/
BEGIN
    sumar(3, 5);
END;

# FUNCIONES

En el caso de las funciones, hemos de especificar el tipo de valor que se retorna. Por supuesto, **es una función, debe devolver un valor.** La sintaxis es muy parecida

CREATE OR REPLACE FUNCTION f_sumar (num1, num2) RETURN NUMBER IS
    resultado NUMBER;
BEGIN
    return resultado := num1 + num2
END;

Podríamos ahorrarnos la variable haciendo lo siguiente:

CREATE OR REPLACE FUNCTION f_sumar (num1, num2) RETURN NUMBER IS    
BEGIN
    return num1 + num2
END;