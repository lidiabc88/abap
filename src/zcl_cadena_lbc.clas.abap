CLASS zcl_cadena_lbc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_CADENA_LBC IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


data lv_vr TYPE string value 'experis experis' .
data lv_nume TYPE i.

"STRLEN
 " data(lv_num) = strlen( 'Daniel' ).

*out->write( lv_num ). "Devolverá el numero de la cadena de caracteres, en este caso Daniel tiene 6 letras

"COUNT
"    lv_num = count( val = lv_var sub = 'ex' ).

*out->write( lv_num ). "Devolverá el numero veces que se cumple ciertos criterios en una tabla

"COUNT_ANY_OF
"COUNT_ANY_NOT_OF

"FIND
 " lv_num = find( val = lv_var sub = 'is' ). "Devuelve la primera vez que vemos is

"FIND_ANY_OF
 "   lv_num = find_any( val = lv_var sub = 'is' ). "Devuelve la primera ocurrencia de cualquiera de los caracteres

"FIND_ANY_NOT_OF
  "  lv_num = find_any_not_of( val = lv_var sub = 'is' ). "Devuelve primera aparicion de cualquier caracter individual

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"FUNCIONES DE PROCESAMIENTO


  ENDMETHOD.
ENDCLASS.
