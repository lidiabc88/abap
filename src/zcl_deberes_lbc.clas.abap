CLASS zcl_deberes_lbc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_deberes_lbc IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " 1: Crear una una nueva tabla
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  TYPES: BEGIN OF ty_tabla,
        nombre type string,
        edad type i,
        correo type string,

     END OF ty_tabla.

  DATA ls_tabla type ty_tabla.
  DATA lt_tabla type table of ty_tabla.

 lt_tabla = VALUE #(
          ( nombre = 'Lidia' edad = 37 correo = 'lidia@gmail.com' )
          ( nombre = 'Toñi' edad = 32 correo = 'toñi@gmail.com' )
          ( nombre = 'Jose' edad = 30 correo = 'jose@gmail.com' )
          ( nombre = 'Paco' edad = 40 correo = 'paco@gmail.com' )
          ).

    out->write( |  | ).
    out->write( |EJERCICIO 1: Mi tabla| ).
    out->write( |  | ).
    out->write( |  | ).
    out->write( lt_tabla ).


  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " 2: Crear otra tabla que copie los tipos de la tabla
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    DATA lt_tabla1 LIKE lt_tabla.
    DATA lt_tabla2 like lt_tabla.

    out->write( |  | ).
    out->write( |EJERCICIO 2: mi nueva tabla| ).
    out->write( lt_tabla2 ).






  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " 3: Insertar los registros de la tabla 1 en la 2
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    out->write( |  | ).
    out->write( |EJERCICIO 3: copiar los registros| ).

    INSERT LINES of lt_tabla INTO TABLE lt_tabla2.

    out->write( lt_tabla2 ).


  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " 4: Meter un espacio en blanco en la línea 2
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    out->write( |  | ).
    out->write( |EJERCICIO 4: insertar una linea en blanco en la fila 2| ).

   INSERT INITIAL LINE INTO lt_tabla2 INDEX 2.

    out->write( lt_tabla2 ).

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "5: Con APPEND añadir una nueva línea a lt_tabla2
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    out->write( |  | ).
    out->write( |EJERCICIO 5: insertar un registro APPEND| ).

    APPEND VALUE #( nombre = 'Luis' edad = 50 correo = 'luis@gmail.com' ) to lt_tabla2.

    out->write( lt_tabla2 ).

 """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " 6: Detectar el tamaño máx de registros y con ese número asignárselo a la función random
  " para ejecutarla 2 veces, y extraer dos números que serán el mín y máx de las líneas que tendremos
  " que extraer de lt_tabla2 para posteriormente pegarlas o añadirlas con el INSERT INDEX en
  " las primeras filas de la tabla lt_tabla1
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

      out->write( |  | ).
      out->write( |EJERCICIO 6:| ).

    DATA(lv_registros) = lines( lt_tabla2 ).

    out->write( lv_registros ).


    DATA lv_contador TYPE i VALUE 0.

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
    out->write( | TABLA: tabla final | ).
    out->write( lt_tabla1 ).



  ENDMETHOD.
ENDCLASS.
