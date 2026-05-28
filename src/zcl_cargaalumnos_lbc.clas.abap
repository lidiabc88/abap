CLASS zcl_cargaalumnos_lbc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_cargaalumnos_lbc IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "EJERCICIO: CREAR BD CON DOS COLUMNAS:

  " 1. CAMPO ID (QUE ES EL CAMPO CLAVE KEY SE CREA AUTOMÁTICAMENTE CON CADA RESGISTRO QUE SE INTRODUZCA
  " COMPRUEBA EL NUM. DE REGISTROS DE LA BD Y ASIGNAR AL NUEVO RESGISTO DE ESE TAMAÑO +1


    DELETE FROM zdb_alumnos_lbc.   " borramos los registros anteriores para no duplicar datos

    DATA lt_nombres TYPE STANDARD TABLE OF string.  " Creamos una tabla interna de nombres

                                                     " Metemos los nombres de los alumnos en la tabla interna
    APPEND 'Sergio' TO lt_nombres.
    APPEND 'Alejandro' TO lt_nombres.
    APPEND 'Lidia' TO lt_nombres.
    APPEND 'Samuel' TO lt_nombres.
    APPEND 'Sarah' TO lt_nombres.
    APPEND 'Jose' TO lt_nombres.
    APPEND 'Luis' TO lt_nombres.
    APPEND 'Loli' TO lt_nombres.
    APPEND 'Rebeca' TO lt_nombres.
    APPEND 'Gonzalo' TO lt_nombres.
    APPEND 'Miguel' TO lt_nombres.
    APPEND 'Antonio' TO lt_nombres.
    APPEND 'Toñi' TO lt_nombres.
    APPEND 'David' TO lt_nombres.
    APPEND 'Adrián' TO lt_nombres.
    APPEND 'Rafa' TO lt_nombres.
    APPEND 'Cristian' TO lt_nombres.
    APPEND 'Alberto' TO lt_nombres.
    APPEND 'Juan' TO lt_nombres.

    DATA lv_total TYPE i.
    DATA lv_id TYPE n LENGTH 4.


    LOOP AT lt_nombres INTO DATA(lv_nombre).        " Recorremos la tabla interna de nombres


      SELECT FROM zdb_alumnos_lbc                   " Contamos cuantos registros hay actualmente en la base de datos
        FIELDS COUNT( * )
        INTO @lv_total.


      lv_total = lv_total + 1.                  " El nuevo ID será el total de registros + 1
      lv_id = lv_total.


      INSERT zdb_alumnos_lbc FROM @(                " Insertamos el alumno en la base de datos
        VALUE #(
          client    = sy-mandt          "mandt o cliente se suele llamar
          id_alumno = lv_id
          nombre    = lv_nombre
        )
      ).

    ENDLOOP.

    COMMIT WORK.            "confirma por si mandamos  datos raros


    SELECT FROM zdb_alumnos_lbc         " Mostramos la tabla para comprobar que se han insertado los alumnos
      FIELDS client,
             id_alumno,
             nombre
      INTO TABLE @DATA(lt_alumnos).


    out->write( |  | ).
    out->write( 'ALUMNOS INSERTADOS EN LA BASE DE DATOS' ).
    out->write( |  | ).
    out->write( lt_alumnos ).


" 2. USANDO LA FUNCION RANDOM, EXTRAER UN REGISTRO DE ESA BD


        DATA(lv_numero_alumnos) = lines( lt_alumnos ).      " Contamos cuantos alumnos hay


        DATA(lo_random) = cl_abap_random_int=>create(         " Creamos numero random
             seed = cl_abap_random=>seed( )
             min  = 1
             max  = lv_numero_alumnos ).


        DATA(lv_random) = lo_random->get_next( ).       " Generamos numero aleatorio


        READ TABLE lt_alumnos INTO DATA(ls_alumno_random) INDEX lv_random.      " Leemos esa posicion de la tabla

        out->write( |  | ).
        out->write( 'ALUMNO GANADOR:' ).
        out->write( |  | ).

        out->write( ls_alumno_random ).


  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " EJERCICIO EXTRA. CON ESO, AHORA AÑADIR NUEVOS USUARIOS EN LA BD Y QUE GENERE EL ID DE FORMA AUTOMATICA
  " NO DE GOLPE COMO ARRIBA. EL NUEVO NOMBRE QUE SUBAMOS SE ALMACENA EN UNA VARIABLE NORMAL

DATA lv_nuevo_nombre TYPE string.

lv_nuevo_nombre = 'Daniel'.

" Contamos registros actuales de la BD
    SELECT FROM zdb_alumnos_lbc
    FIELDS COUNT( * )
    INTO @lv_total.

    lv_total = lv_total + 1.        " Nuevo ID = total + 1

    lv_id = lv_total.


    INSERT zdb_alumnos_lbc FROM @(      " Insertamos nuevo alumno
    VALUE #(
    client     = sy-mandt
    id_alumno  = lv_id
    nombre     = lv_nuevo_nombre
  )
).

out->write( | | ).
out->write( 'NUEVO ALUMNO INSERTADO:' ).
out->write( | | ).

SELECT SINGLE
  FROM zdb_alumnos_lbc
  FIELDS *
  WHERE id_alumno = @lv_id
  INTO @DATA(ls_nuevo_alumno).

out->write( ls_nuevo_alumno ).

 ENDMETHOD.
  ENDCLASS.
