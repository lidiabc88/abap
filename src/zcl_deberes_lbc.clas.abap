CLASS zcl_deberes_lbc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_deberes_lbc IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

" 10% personas 1 a 12 años, descuento del 5% a personas entre 12 a 18,
" precio normal a 18 a 65, descuento 5% a mayores de 65.

*    DATA lv_edad TYPE i.
*
*""""""""""""""""""""
*" GENERAR EDAD ALEATORIA
*""""""""""""""""""""
*
*    lv_edad =
*    cl_abap_random_int=>create(
*
*      seed = cl_abap_random=>seed( )
*      min = 1
*      max = 100
*
*    )->get_next( ).
*
*""""""""""""""""""""
*" MOSTRAR EDAD
*""""""""""""""""""""
*
*    out->write( |Edad generada: { lv_edad }| ).
*
*""""""""""""""""""""
*" COMPROBAR DESCUENTO
*""""""""""""""""""""
*
*    IF lv_edad <= 12.
*
*      out->write( 'Tienes un descuento del 10%' ).
*
*    ELSEIF lv_edad >= 13 AND lv_edad <= 18.
*
*      out->write( 'Tienes un descuento de 5%' ).
*
*    ELSEIF lv_edad >= 19 AND lv_edad <= 65.
*
*      out->write( 'Lo siento, no tienes ningún descuento.' ).
*
*    ELSE.
*
*      out->write( 'Tienes un descuento del 5%' ).
*
*    ENDIF.
*
*""""""""""""""""""""
*" FIN DEL PROGRAMA
*""""""""""""""""""""
*
*    out->write( 'Fin del programa' ).


  ENDMETHOD.
ENDCLASS.
