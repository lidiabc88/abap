CLASS zcl_procesamiento_lbc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_procesamiento_lbc IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FUNCIONES DE PROCESAMIENTO DE STRINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

*    DATA lv_var TYPE string VALUE 'Hola, este es el curso de ABAP'.

""""""""""""""""""""
" TO_UPPER
""""""""""""""""""""

    " Convierte el texto a mayúsculas

*    out->write( |{ lv_var } mayusculas -> { to_upper( lv_var ) }| ).

""""""""""""""""""""
" TO_LOWER
""""""""""""""""""""

    " Convierte el texto a minúsculas

*    out->write( |{ lv_var } minusculas -> { to_lower( lv_var ) }| ).

""""""""""""""""""""
" REVERSE
""""""""""""""""""""

    " Invierte el texto

*    out->write( |{ lv_var } reverse -> { reverse( lv_var ) }| ).

""""""""""""""""""""
" SHIFT_LEFT
""""""""""""""""""""

    " Desplaza el texto hacia la izquierda

*    out->write( |{ lv_var } shift_left -> { shift_left( lv_var ) }| ).

""""""""""""""""""""
" SHIFT_RIGHT
""""""""""""""""""""

    " Desplaza el texto hacia la derecha

*    out->write( |{ lv_var } shift_right -> { shift_right( lv_var ) }| ).

""""""""""""""""""""
" SUBSTRING
""""""""""""""""""""

    " OFF = posición inicial
    " LEN = longitud

*    out->write( |{ lv_var } substring -> { substring( val = lv_var off = 9 len = 6 ) }| ).

""""""""""""""""""""
" SUBSTRING_FROM
""""""""""""""""""""

    " Devuelve el texto desde una palabra

*    out->write( |{ lv_var } substring_from -> { substring_from( val = lv_var sub = 'el' ) }| ).

""""""""""""""""""""
" SUBSTRING_BEFORE
""""""""""""""""""""

    " Devuelve el texto antes de la palabra

*    out->write( |{ lv_var } substring_before -> { substring_before( val = lv_var sub = 'el' ) }| ).

""""""""""""""""""""
" CONDENSE
""""""""""""""""""""

    " Elimina espacios innecesarios

*    out->write( |{ lv_var } condense -> { condense( lv_var ) }| ).

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FUNCIONES DE CONTENIDO Y REGEX
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    DATA:
      lv_text TYPE string,
      lv_pattern TYPE string,
      lv_pattern2 TYPE string.

""""""""""""""""""""
" TEXTO DE PRUEBA
""""""""""""""""""""

    lv_text = 'the employees number is: 123-456-7890'.

""""""""""""""""""""
" REGEX TELEFONO
""""""""""""""""""""

    " \d = número
    " {3} = exactamente 3 números

    lv_pattern = `\d{3}-\d{3}-\d{4}`.

""""""""""""""""""""
" REGEX EMAIL
""""""""""""""""""""

    lv_pattern2 = `\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}\b`.

""""""""""""""""""""
" MATCH
""""""""""""""""""""

    " OCC = ocurrencia encontrada
    " 1 = primera coincidencia

    DATA(lv_number) = match( val = lv_text pcre = lv_pattern occ = 1 ).

""""""""""""""""""""
" MOSTRAR RESULTADO
""""""""""""""""""""

    out->write( lv_number ).

  ENDMETHOD.

ENDCLASS.
