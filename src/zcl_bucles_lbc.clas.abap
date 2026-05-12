CLASS zcl_bucles_lbc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_bucles_lbc IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    "-------------------------------------------------------------------
    " IF

    DATA lv_nombre TYPE string VALUE 'Daniel'.

    IF lv_nombre = 'Daniel'.
      out->write( 'Hola, Daniel' ).
    ENDIF.
    out->write( 'El programa ha terminado' ).


    "-------------------------------------------------------------------
    " IF + ELSE

    IF lv_nombre = 'Daniel'.
      out->write( 'Hola, Daniel' ).
    ELSE.
      out->write( 'No eres Daniel' ).
    ENDIF.


    "-------------------------------------------------------------------
    " IF + ELSEIF + ELSE

    IF lv_nombre = 'Daniel'.
      out->write( 'Hola, Daniel' ).
    ELSEIF lv_nombre = 'Maria'.
      out->write( 'Hola, Maria' ).
    ELSEIF lv_nombre = 'Pedro'.
      out->write( 'Hola, Pedro' ).
    ELSE.
      out->write( 'No te conozco' ).
    ENDIF.


  ENDMETHOD.
ENDCLASS.
