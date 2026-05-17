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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" IF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

*    DATA lv_nombre TYPE string VALUE 'Daniel'.
*
*    IF lv_nombre = 'Daniel'.
*
*      out->write( 'Hola, Daniel' ).
*
*    ENDIF.
*
*    out->write( 'Fin del programa' ).

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" IF + ELSE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

*    DATA lv_nombre TYPE string VALUE 'Daniel'.
*
*    IF lv_nombre = 'Daniel'.
*
*      out->write( 'Hola, Daniel' ).
*
*    ELSE.
*
*      out->write( 'No eres Daniel' ).
*
*    ENDIF.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" IF + ELSEIF + ELSE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

*    DATA lv_nombre TYPE string VALUE 'Daniel'.
*
*    IF lv_nombre = 'Daniel'.
*
*      out->write( 'Hola, Daniel' ).
*
*    ELSEIF lv_nombre = 'Maria'.
*
*      out->write( 'Hola, Maria' ).
*
*    ELSEIF lv_nombre = 'Pedro'.
*
*      out->write( 'Hola, Pedro' ).
*
*    ELSE.
*
*      out->write( 'No te conozco' ).
*
*    ENDIF.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CASE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

*    DATA lv_edad TYPE i.
*
*    CASE lv_edad.
*
*      WHEN 12.
*
*        out->write( lv_edad ).
*
*      WHEN 18.
*
*        out->write( lv_edad ).
*
*      WHEN 45.
*
*        out->write( lv_edad ).
*
*      WHEN OTHERS.
*
*        out->write( 'Otra edad' ).
*
*    ENDCASE.
*
*    out->write( 'Fin del programa' ).

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NÚMEROS ALEATORIOS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    " seed = genera una semilla aleatoria
    " min = valor mínimo
    " max = valor máximo

*    DATA(lv_random) =
*    cl_abap_random_int=>create(
*
*      seed = cl_abap_random=>seed( )
*      min = 1
*      max = 100
*
*    )->get_next( ).

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EJERCICIO DESCUENTOS POR EDAD
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    " Menores o iguales a 12 años -> 5€
    " Entre 13 y 18 años -> 10€
    " Entre 19 y 65 años -> 20€
    " Mayores de 65 años -> 10€

    DATA lv_edad TYPE i.

""""""""""""""""""""
" GENERAR EDAD ALEATORIA
""""""""""""""""""""

    lv_edad =
    cl_abap_random_int=>create(

      seed = cl_abap_random=>seed( )
      min = 1
      max = 100

    )->get_next( ).

""""""""""""""""""""
" MOSTRAR EDAD
""""""""""""""""""""

    out->write( |Edad generada: { lv_edad }| ).

""""""""""""""""""""
" COMPROBAR DESCUENTO
""""""""""""""""""""

    IF lv_edad <= 12.

      out->write( 'Tienes un descuento de 5€' ).

    ELSEIF lv_edad >= 13 AND lv_edad <= 18.

      out->write( 'Tienes un descuento de 10€' ).

    ELSEIF lv_edad >= 19 AND lv_edad <= 65.

      out->write( 'Tienes un descuento de 20€' ).

    ELSE.

      out->write( 'Tienes un descuento de 10€' ).

    ENDIF.

""""""""""""""""""""
" FIN DEL PROGRAMA
""""""""""""""""""""

    out->write( 'Fin del programa' ).

  ENDMETHOD.

ENDCLASS.
