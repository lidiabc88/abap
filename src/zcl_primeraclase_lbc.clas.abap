CLASS zcl_primeraclase_lbc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_primeraclase_lbc IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FORMAS DE DECLARAR VARIABLES
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    " Forma 1 -> una variable por línea

*    DATA lv_perro TYPE string.
*    DATA lv_gato TYPE string.
*    DATA lv_raton TYPE string.

    " Forma 2 -> varias variables juntas

*    DATA:
*      lv_perro TYPE string,
*      lv_gato TYPE string,
*      lv_raton TYPE string.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" DECLARACIÓN DE VARIABLES
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    DATA:
      lv_string TYPE string,
      lv_int TYPE i,
      lv_fecha TYPE d,
      lv_dec TYPE p LENGTH 8 DECIMALS 2 VALUE '300.99',
      lv_car TYPE c LENGTH 10 VALUE 'experis'.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TIPOS DE DATOS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    " STRING -> texto de longitud variable

    lv_string = '20260512'.

    " I -> números enteros

    lv_int = 10.

    " D -> fecha en formato YYYYMMDD

    lv_fecha = '20260512'.

    " P -> números decimales

    " C -> texto de longitud fija

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MOSTRAR VARIABLES
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    out->write( lv_string ).
    out->write( lv_int ).
    out->write( lv_fecha ).
    out->write( lv_dec ).
    out->write( lv_car ).

  ENDMETHOD.

ENDCLASS.
