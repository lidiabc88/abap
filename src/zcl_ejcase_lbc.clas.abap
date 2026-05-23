CLASS zcl_ejcase_lbc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .

ENDCLASS.



CLASS zcl_ejcase_lbc IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EJERCICIO:
"
" Hay 20 niños en la clase de los cuales:
"
" 4 niños se llaman Daniel:
"
"   - El de 8 años su padre se llama Ricardo
"   - El de 6 -> Pedro
"   - El de 5 -> Fernando
"   - El de 9 -> Luis
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    DATA lv_edad TYPE i.

    CASE lv_edad.

  WHEN 8.
    out->write( 'El padre se llama Ricardo' ).

  WHEN 6.
    out->write( 'El padre se llama Pedro' ).

  WHEN 5.
    out->write( 'El padre se llama Fernando' ).

  WHEN 9.
    out->write( 'El padre se llama Luis' ).

  WHEN OTHERS.
    out->write( 'No sabemos el nombre del padre, aunque el niño es Daniel' ).

ENDCASE.


" Dentro podemos poner los if que queramos

*IF lv_nombre = 'Daniel'.
*
*  CASE lv_edad.
*
*    WHEN 8.
*
*      IF lv_pelo = 'castaño'.
*
*        out->write( 'El padre se llama Ricardo' ).
*
*      ENDIF.
*
*  ENDCASE.
*
*ENDIF.


  ENDMETHOD.
ENDCLASS.
