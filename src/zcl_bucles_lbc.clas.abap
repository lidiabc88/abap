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

*    "-------------------------------------------------------------------
*    " IF
*
*    DATA lv_nombre TYPE string VALUE 'Daniel'.
*
*    IF lv_nombre = 'Daniel'.
*      out->write( 'Hola, Daniel' ).
*    ENDIF.
*    out->write( 'El programa ha terminado' ).
*
*
*    "-------------------------------------------------------------------
*    " IF + ELSE
*
*    IF lv_nombre = 'Daniel'.
*      out->write( 'Hola, Daniel' ).
*    ELSE.
*      out->write( 'No eres Daniel' ).
*    ENDIF.
*
*
*    "-------------------------------------------------------------------
*    " IF + ELSEIF + ELSE
*
*    IF lv_nombre = 'Daniel'.
*      out->write( 'Hola, Daniel' ).
*    ELSEIF lv_nombre = 'Maria'.
*      out->write( 'Hola, Maria' ).
*    ELSEIF lv_nombre = 'Pedro'.
*      out->write( 'Hola, Pedro' ).
*    ELSE.
*      out->write( 'No te conozco' ).
*    ENDIF.

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "CASE
*    data lv_edad type i.
*    CASE lv_edad.
*
*      WHEN 12.
*        out->write( lv_edad ).
*
*      WHEN 18.
*        out->write( lv_edad ).
*
*      WHEN 45.
*        out->write( lv_edad ).
*
*      WHEN OTHERS.
*        out->write( 'Otra edad' ).
*
*    ENDCASE.
*
*        out->write( 'Fin de programa' ).
*

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "PROGRAMA NUMERO ALEATORIO
*  data(lv_random) = cl_abap_random_int=>create( seed = cl_abap_random=>seed(  )
*
*                                                 min = 1
*
*                                                 max = 100 )->get_next(  ).

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "EJERCICIO: CREAR PROGRAMA DESCUENTOS RANDOM A MENORES 12 AÑOS DE 5€, ADOLESCENTES (13/18) DE 10€ , ADULTOS (18/65) DESCUENTO DE 20€ MAYORES DE 65 DE 10 EUROS

    DATA lv_edad TYPE i.

    lv_edad = cl_abap_random_int=>create(  seed = cl_abap_random=>seed( )
                                              min  = 1
                                              max  = 100 )->get_next( ).


    out->write( |Edad generada: { lv_edad }| ).

    IF lv_edad <= 12.

      out->write( 'Tienes un descuento de 5€' ).

    ELSEIF lv_edad >= 13 AND lv_edad <= 18.

      out->write( 'Tienes un descuento de 10€' ).

    ELSEIF lv_edad >= 19 AND lv_edad <= 65.

      out->write( 'Tienes un descuento de 20€' ).

    ELSE.

      out->write( 'Tienes un descuento de 10€' ).

    ENDIF.

     out->write( 'Fin de programa' ).

  ENDMETHOD.

ENDCLASS.
