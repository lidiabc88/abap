CLASS zcl_enum_lbc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_enum_lbc IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    types: BEGIN OF ENUM ty_color,
           rojo,
           verde,
           azul,
           amarillo,
           END OF enum ty_color.

  data lv_color type ty_color.

  lv_color = amarillo.

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      types: BEGIN OF ENUM ty_vuelos,
           nacional,
           internacional,
           charter,
           END OF enum ty_vuelos.

      data lv_vuelo TYPE ty_vuelos.
      lv_vuelo = internacional.


      case lv_vuelo.
        when nacional.
            out->write( 'Nacional' ).
        when internacional.
            out->write( 'Internacional' ).
        when charter.
            out->write( 'Charter' ).
      endcase.


  ENDMETHOD.
ENDCLASS.
