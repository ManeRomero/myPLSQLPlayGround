# SQL - Sequenced Query Language
## PREMISAS Y CONCEPTOS

**Dato** -- porción de información.
**Tipo** -- inherente al dato, indicaciones sobre naturaleza y funcionamiento del mismo.
**Campo** -- identificador para una familia de datos.
**Registro** -- identifica la entidad concreta (fila) en donde almacenamos todos los datos.
**Campo Clave** -- Clave Primaria, identifica inequívocamente y de manera única.
**Tabla** -- Conjunto de Registros.
**Consulta** -- Instrucciones de búsqueda y permutación en campos / registros.
**Vista** -- transformación calculada que nos sirve para obtener datos modelados, es una tabla virtual.
**Informe** -- Un listado ordenado de los campos y registros seleccionados en un formato fácil de leer.
**Scripts / Procedimientos**

## LENGUAJE DLL - lenguaje de definición de estructura

Ésta es la parte en donde tenemos que certificar la estructura de la base de datos, por ejemplo...

CREATE TABLE [nombre_tabla](
    [nombre_campo] INTEGER PRIMARY KEY,
    [nombre_campo] VARCHAR(40),
    [nombre_campo] BOOL,
    [nombre_campo] INTEGER UNIQUE NOT NULL,
)

**3 instrucciones básicas: CREATE - DROP - ALTER**

## LENGUAJE DML - lenguaje de definición de datos

**4 instrucciones elementales: SELECT - INSERT - DELETE - UPDATE**

ej:
SELECT - [nombre_columna] FROM [nombre_tabla] {podrías poner SELECT 'algo' AS SALUDO}
INSERT - [] INTO [nombre_tabla]


###SENTENCIAS ESPECIALES

sumatorio - SELECT SUM(price) AS suma FROM 'travels' WHERE 1
trayendo sólo únicos - SELECT DISTINCT discount FROM 'travels'
seleccionando desde un rango - SELECT * FROM 'travels' WHERE discount BETWEEN 2 and 6
