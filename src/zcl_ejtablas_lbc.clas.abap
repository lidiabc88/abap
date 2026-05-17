CLASS zcl_ejtablas_lbc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_EJTABLAS_LBC IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" INSERT INITIAL LINE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" INSERT INITIAL LINE INTO TABLE lt_tabla
" inserta una línea vacía en la tabla

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" INSERT LINES OF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" INSERT LINES OF lt_tabla1 INTO TABLE lt_tabla2
" copia todos los registros de una tabla a otra

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LIKE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" DATA lt_tabla2 LIKE lt_tabla1
" hereda la estructura y tipos de la tabla original
" pero NO copia los datos

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COPIAR UNA SOLA LÍNEA
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" INSERT LINES OF lt_tabla1 FROM 1 TO 1
" INTO TABLE lt_tabla2

" copia únicamente la línea 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COPIAR VARIAS LÍNEAS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" INSERT LINES OF lt_tabla1 FROM 2 TO 4
" INTO TABLE lt_tabla2

" copia desde la línea 2 hasta la 4

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" APPEND
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" APPEND añade siempre el registro
" al FINAL de la tabla

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" INSERT
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" INSERT añade el registro en la primera posición libre
" o en una posición concreta usando INDEX

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LIKE VS LINE OF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" LIKE copia la estructura/tipo de una tabla

" LINE OF crea una estructura con el tipo
" de línea de una tabla interna

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RANDOM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Genera números aleatorios

" seed = semilla aleatoria
" min = número mínimo
" max = número máximo

*DATA(lv_random) = cl_abap_random_int=>create(
*
*                  seed = cl_abap_random=>seed( )
*                  min = 1
*                  max = 100 ).
*
*DATA(lv_numero) = lv_random->get_next( ).
*
*out->write( lv_numero ).






  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "EJERCICIO PRÁCTICO
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
    out->write( |Ejercicio 3 - INSERT INITAL LINE| ).

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



  ENDMETHOD.
ENDCLASS.
