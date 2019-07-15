# PL-SQL (Procedural Language/Structured Query Language)

## COMENZANDO

Crearemos un contenedor de Docker, tras instalar éste. Son una especie de máquinas virtuales. También debemos instalar una extensión indicada para Docker, llamada del mismo nombre.

A continuación, deberíamos clonar lo siguiente:
### git clone https://github.com/wnameless/docker-oracle-xe-11g.git

>> rutear a la carpeta creada e introducir el siguiente comando:
cd docker-oracle-xe-11g (o la carpeta donde hagamos el git clone)
docker build -t wnameless/docker-oracle-xe-11g .

Tras los reinicios pertinentes, debemos ir a la parte izquierda en vsCode y seleccionar el ámbito de docker, que se habrá activado con la instalación de la extensión en el primer paso, seleccionamos una imagen para ejecutar, con botón derecho [run], en este caso, wnameless/[latest]

ingresamos la url [localhost:8080/apex/apex_admin]  >> acceso por defecto: ADMIN - admin. Nos pedirá que cambiemos la contraseña, obraremos en consecuencia.

## DENTRO DE ORACLE APPLICATION EXPRESS

1. creamos un Espacio de Trabajo, con el botón naranja en la parte derecha 'CREATE WORKSPACE'. Tira para adelante con todos los apartados, por ahora, pondremos todas las contraseñas idénticas para minimizar posibles problemas.

2. una vez hemos creado el workspace, volvemos a localhost:8080/apex, donde nos tendremos que logear de nuevo. Volverá a pedirnos un dichoso nuevo cambio de contraseña, introducimos la misma, one fucking more time.

3. Abrimos el SQL Workshop / SQL Commands. Vamos a probar cositas.

4. Podemos darnos de alta en la plataforma ORACLE, y descargar su SQLDeveloper: 
https://www.oracle.com/es/database/technologies/appdev/sql-developer.html >>> ahí tenemos que crear una nueva conexión, en donde crearemos otra vez un usuario y contraseña..

## VAMOS A PROGRAMAR
<<no hay llaves ¿cómo acaba y empieza un bloque??>>

BEGIN

END;

para mostrar por pantalla:
DBMS_OUTPUT.PUT_LINE('[TEXTO_DESEADO]');

## UTILIZANDO VARIABLES
Las variables no se ponen sin más, hemos de utilizar el bloque DECLARE, de la siguiente forma:

DECLARE
    [nombre_variable] [tipo_de_datos]() := [valor];
    ej: numerito number(2) := 20;

##TIPO DE DATOS
STRING >> [NOMBRE_VAR] VARCHAR2(longitud_cadena)

NUMBER >> [nombre_variable] (precisión, escala);
    ej: numerito number(12, 2) >> aquí indicaríamos un número de máximo 12 cifras, reservando dos para decimales.

    en el tipo number podemos especificar los siguientes atributos:
    CONSTANT - NOT NULL

BOOLEAN >>
DATE >> fecha DATE := SYSDATE; >> devuelve fecha actual de sistema



<<CÓMO PEDIMOS UN NÚMERO AL USUARIO?>>
[NOMBRE_VAR] tipo() := &NUMERO; el símbolo '&' sirve de enlace para esta referenciación.
                       '&STRING' >> con comillas simples y & para strings




