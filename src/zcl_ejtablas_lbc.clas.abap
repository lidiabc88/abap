CLASS zcl_ejtablas_lbc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_ejtablas_lbc IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.



  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "EJERCICIO PRÁCTICO 1, TABLA
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

*    1. Crear una nueva tabla e introducir datos de la forma 'moderna'
*    en lt_tabla1
*
*    lt_empleado = value #(
*    ( nombre = 'Ana' edad = 24 correo = 'ana@gmail.com')
*    ( nombre = 'Nerea' edad = 24 correo = 'nerea@gmail.com')
*    ( nombre = 'Francisco' edad = 24 correo = 'francisco@gmail.com')
*    ( nombre = 'Carlos' edad = 24 correo = 'carlos@gmail.com')
*    ).

    out->write( |EJERCICIO PRACTICO| ).

    TYPES: BEGIN OF ty_empleado,
             nombre TYPE string,
             edad   TYPE i,
             correo TYPE string,
           END OF ty_empleado.

    DATA lt_empleado TYPE TABLE OF ty_empleado.

    lt_empleado = VALUE #(
    ( nombre = 'Ana' edad = 24 correo = 'ana@gmail.com' )
    ( nombre = 'Nerea' edad = 56 correo = 'nerea@gmail.com' )
    ( nombre = 'Francisco' edad = 19 correo = 'francisco@gmail.com' )
    ( nombre = 'Carlos' edad = 38 correo = 'carlos@gmail.com' )
    ).


*    2. Crear una segunda tabla que copie los tipos directamemte de la
*    tabla original 'lt_tabla1', a la nueva tabla 'lt_tabla2'

    out->write( |  | ).
    out->write( |Ejercicio 2 - LIKE| ).

    DATA lt_tabla1 LIKE lt_empleado. "Copia la estructura pero NO los datos
    DATA lt_tabla2 LIKE lt_empleado.

    out->write( |  | ).
    out->write( | TABLA 2 | ).
    out->write( lt_tabla2 ).


    "Copiar los registros:
    INSERT LINES OF lt_empleado INTO TABLE lt_tabla2.

*    3. En lt_tabla2 introduce en la línea 2 una línea en blanco
    out->write( |  | ).
    out->write( |Ejercicio 3 - INSERT INITIAL LINE| ).

    INSERT INITIAL LINE INTO lt_tabla2 INDEX 2.

    out->write( |  | ).
    out->write( | TABLA 2 | ).
    out->write( lt_tabla2 ).

*    4. Usando APPEND, añade una nueva línea a la tabla lt_tabla2
    out->write( |  | ).
    out->write( |Ejercicio 4 - APPEND| ).

    APPEND VALUE #( nombre = 'Javier' edad = 31 correo = 'javier@gmail.com' ) TO lt_tabla2.

    out->write( |  | ).
    out->write( | TABLA 2 | ).
    out->write( lt_tabla2 ).

*    5. Detecta el tamaño máximo de registros y asigna ese número a la
*    función 'random' para ejecutarla 2 veces y extraer 2 números que
*    serán el mínimo y máximo de líneas que tendremos que extraer de la
*    tabla lt_tabla2 para posteriormente pegarlas o añadirlas usando INSERT
*    INDEX en las primeras filas de la tabla lt_tabla1
    out->write( |  | ).
    out->write( |Ejercicio 5 - RANDOM| ).

    DATA(lv_registros) = lines( lt_tabla2 ).
    DATA lv_contador TYPE i VALUE 0.

    "random se trata de una función que al llamarla 2 veces
    "los valores serán diferentes

    DATA(lv_random) = cl_abap_random_int=>create(
                    seed = cl_abap_random=>seed( )
                    min  = 1
                    max  = lv_registros ).

    DATA(lv_min) = lv_random->get_next( ).
    DATA(lv_max) = lv_random->get_next( ).

    "Comprobación de mínimo y máximo

    IF lv_min > lv_max.
      DATA(lv_aux) = lv_min.
      lv_min = lv_max.
      lv_max = lv_aux.
    ENDIF.

    "Copiado de filas

    INSERT LINES OF lt_tabla2 FROM lv_min TO lv_max INTO TABLE lt_tabla1.

    out->write( |  | ).
    out->write( | TABLA 1 | ).
    out->write( lt_tabla1 ).


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   EJERCICIO 2:
"       Para la tabla de DB /dmo/airport
"           1. extraer todos los registros del campo country = UK
"           2. extraer unicamente el nombre (del campo nombre) que está asociado a LGW del campo airport_id
"           3. extraer con la tabla sorted todos los registros donde country sea igual a IT
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 1.

  SELECT FROM /dmo/airport
  FIELDS *
  WHERE country = 'UK'
  INTO TABLE @DATA(lt_flights1).

  out->write( | | ).
  out->write( 'EJERCICIO 1:' ).
  out->write( lt_flights1 ).


" 2.

  SELECT FROM /dmo/airport
  FIELDS name
  WHERE airport_id = 'LGW'
  INTO TABLE @DATA(lt_flights2).

  IF sy-subrc = 0.
    out->write( 'EJERCICIO 2:' ).
    out->write( lt_flights2 ).
    out->write( ' ' ).
  ENDIF.


" 3.
   DATA lt_flights_sorted TYPE SORTED TABLE OF /dmo/airport WITH NON-UNIQUE KEY airport_id.

  SELECT FROM /dmo/airport
  FIELDS *
  WHERE country = 'IT'
  INTO TABLE @lt_flights_sorted.

  IF sy-subrc = 0.
    out->write( 'EJERCICIO 3:' ).
    out->write( lt_flights_sorted ).
    out->write( ' ' ).
  ENDIF.



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" HASHED TABLE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

*       TYPES: BEGIN OF ty_usuario,
*                 id     TYPE i,
*                 nombre TYPE string,
*               END OF ty_usuario.
*
*       DATA lt_usuarios TYPE HASHED TABLE OF ty_usuario
*       WITH UNIQUE KEY id.
*
*       INSERT VALUE #(
*       id = 1
*       nombre = 'Luis'
*       ) INTO TABLE lt_usuarios.
*
*       INSERT VALUE #(
*       id = 2
*       nombre = 'Ana'
*       ) INTO TABLE lt_usuarios.
*
*       READ TABLE lt_usuarios INTO DATA(ls_usuario) WITH KEY id = 1.
*
*       IF sy-subrc = 0.
*        out->write( ls_usuario ).
*       ENDIF.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SORTED TABLE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

*    DATA lt_flight_sort TYPE SORTED TABLE OF /dmo/airport WITH NON-UNIQUE key airport_id.
*
*    SELECT from /dmo/airport
*    FIELDS *
*    into table @lt_flight_sort.
*
*    read table lt_flight_sort into data(ls_flight) with table key airport_id = 'LAS'.
*
*    out->write( ls_flight ).
*
*    data(ls_flight2) = lt_flight_sort[ key primary_key airport_id = 'LAS' ].
*
*    out->write( ls_flight2 ).

  ENDMETHOD.
ENDCLASS.
