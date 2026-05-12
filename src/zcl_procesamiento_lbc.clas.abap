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


*  DATA lv_var type string VALUE 'Hola, este es el curso de ABAP'.
*
*  "to_upper transforma a mayúsculas
*  out->write( |{ lv_var }  ) mayusculas -> { to_upper( lv_var ) } | ).
*
*   "to_lower transforma a minúsculas
*  out->write( |{ lv_var }  ) minusculas -> { to_lower( lv_var ) } | ).
*
*  "reverse
*  out->write( |{ lv_var }  ) encriptamiento -> { reverse( lv_var ) } | ).
*
*  "shift_left
*  out->write( |{ lv_var }  ) shift_left -> { shift_left( lv_var ) } | ).
*
*  "shift_right
*  out->write( |{ lv_var }  ) shift_right -> { shift_right( lv_var ) } | ).
*
*  "substring
*  out->write( |{ lv_var }  ) substring -> { substring( val = lv_var off = 9 len = 6 ) } | ).
*
*  "substring_from
*  out->write( |{ lv_var }  ) substring_from -> { substring_from( val = lv_var sub = 'el' ) } | ).
*
*  "substring_before  , también puedes poner after
*  out->write( |{ lv_var }  ) substring_before -> { substring_before( val = lv_var sub = 'el' ) } | ).
*
*  "condense
*  out->write( |{ lv_var }  ) condense -> { condense( lv_var ) } | ).

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"FUNCIONES DE CONTENIDO
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

data: lv_text type string,
      lv_pattern type string,
      lv_pattern2 type string.

      lv_text = 'the employees number is: 123-456-7890'.
      lv_pattern = `\d{3}-\d{3}-\d{4}`.

      lv_pattern2 = `\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{ 2, }\b`.

DATA(lv_number) = match( val = lv_text pcre = lv_pattern occ = 1 ). "occ es la posicion, en este caso 'el primero correo que encuentres'

out->write( lv_number ).



  ENDMETHOD.
ENDCLASS.
