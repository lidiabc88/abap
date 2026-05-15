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

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " 1: Crear una una nueva tabla e introducirle datos de la manera moderna
  " lt_tabla1 los siguientes datos

*    lt_empleado = value #(
*    ( nombre = 'Ana' edad = 24 correo = 'ana@gmail.com')
*    ( nombre = 'Nerea' edad = 24 correo = 'nerea@gmail.com')
*    ( nombre = 'Francisco' edad = 24 correo = 'francisco@gmail.com')
*    ( nombre = 'Carlos' edad = 24 correo = 'carlos@gmail.com')
*    ).
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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


  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " 2: Crear otra tabla que copie los tipos de la tabla1
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    out->write( |  | ).
    out->write( |Ejercicio 2:LIKE| ).

    DATA lt_tabla1 LIKE lt_empleado.
    DATA lt_tabla2 LIKE lt_empleado.

    out->write( |  | ).
    out->write( | TABLA 2 | ).
    out->write( lt_tabla2 ).


  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " 3: En lt_tabla2 introducir en la línea 2 una línea en blanco
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    out->write( |  | ).
    out->write( |Ejercicio 3: INSERT INITAL LINE| ).

    INSERT INITIAL LINE INTO lt_tabla2 INDEX 2.

    out->write( |  | ).
    out->write( | TABLA 2 | ).
    out->write( lt_tabla2 ).

    INSERT LINES OF lt_empleado INTO TABLE lt_tabla2.


  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " 4: Con APPEND añadir una nueva línea a lt_tabla2
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    out->write( |  | ).
    out->write( |Ejercicio 4: APPEND| ).

    APPEND VALUE #( nombre = 'Lidia' edad = 37 correo = 'lidia@gmail.com' ) TO lt_tabla2.

    out->write( |  | ).
    out->write( | TABLA 2 | ).
    out->write( lt_tabla2 ).


  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "5: Volcar el contenido de la tabla 1 en la 2
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  INSERT LINES OF lt_tabla1 INTO TABLE lt_tabla2.

  out->write( |  | ).
  out->write( | TABLA 2 después de volcar tabla1 | ).
  out->write( lt_tabla2 ).


  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " 6: Detectar el tamaño máx de registros y con ese número asignárselo a la función random
  " para ejecutarla 2 veces, y extraer dos números que serán el mín y máx de las líneas que tendremos
  " que extraer de lt_tabla2 para posteriormente pegarlas o añadirlas con el INSERT INDEX en
  " las primeras filas de la tabla lt_tabla1
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    out->write( |  | ).
    out->write( |Ejercicio 6: RANDOM| ).

    DATA(lv_registros) = lines( lt_tabla2 ).
    DATA lv_contador TYPE i VALUE 0.

    "random: función que al llamarla 2 veces los valores serán diferentes

    DATA(lv_random) = cl_abap_random_int=>create(
                    seed = cl_abap_random=>seed( )
                    min  = 1
                    max  = lv_registros ).

    DATA(lv_min) = lv_random->get_next( ). "get_next: devuelve el siguiente número aleatorio dentro del rango
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


  ENDMETHOD.
ENDCLASS.
