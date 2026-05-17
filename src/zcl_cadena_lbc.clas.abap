CLASS zcl_cadena_lbc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_cadena_lbc IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VARIABLES
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    DATA lv_var TYPE string VALUE 'experis experis'.

    DATA lv_num TYPE i.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" STRLEN
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    " Devuelve la longitud de una cadena

*    DATA(lv_num2) = strlen( 'Daniel' ).
*
*    out->write( lv_num2 ).

    " Resultado -> 6

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COUNT
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    " Cuenta cuántas veces aparece un texto

*    lv_num = count( val = lv_var sub = 'ex' ).
*
*    out->write( lv_num ).

    " Resultado -> 2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COUNT_ANY_OF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    " Cuenta coincidencias de cualquiera
    " de los caracteres indicados

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COUNT_ANY_NOT_OF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    " Cuenta caracteres diferentes
    " a los indicados

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FIND
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    " Devuelve la posición de la primera coincidencia

*    lv_num = find( val = lv_var sub = 'is' ).
*
*    out->write( lv_num ).

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FIND_ANY_OF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    " Busca cualquiera de los caracteres indicados

*    lv_num = find_any_of( val = lv_var sub = 'is' ).
*
*    out->write( lv_num ).

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FIND_ANY_NOT_OF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    " Devuelve la primera posición de un carácter
    " distinto a los indicados

*    lv_num = find_any_not_of( val = lv_var sub = 'is' ).
*
*    out->write( lv_num ).

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FUNCIONES DE PROCESAMIENTO
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  ENDMETHOD.

ENDCLASS.
