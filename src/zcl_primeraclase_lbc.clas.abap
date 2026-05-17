CLASS zcl_primeraclase_lbc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_PRIMERACLASE_LBC IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


*Las dos formas de escribir :

*data lv_perro TYPE string.
*data lv_gato TYPE string.
*data lv_raton TYPE string.

*o tambien:

*DATA: lv_perro TYPE string,
*      lv_gato TYPE string,
*      lv_raton TYPE string.

*DATA: lv_sofa TYPE string,
*    lv_mesa TYPE string,
*    lv_cama TYPE i.

data: lv_string TYPE string,
      lv_int TYPE i,
      lv_fecha TYPE d,
      lv_dec TYPE p LENGTH  8 decimals 2 value '300.99',
      lv_car type c length 10 value 'experis'.

    lv_fecha = '20260512'.
    lv_string = '20260512'.

lv_int = 7.
lv_int = 10.
    out->write( lv_string ).
    out->write( lv_int ).
    out->write( lv_fecha ).
    out->write( lv_dec ).
    out->write( lv_car ).






  ENDMETHOD.
ENDCLASS.
