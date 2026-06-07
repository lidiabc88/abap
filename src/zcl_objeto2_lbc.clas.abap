CLASS zcl_objeto2_lbc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
    "evitar siempre que se pueda poner componentes públicos

  PUBLIC SECTION.       "todos los atributos y metodos son públicos y accesibles

    "atributos
    CLASS-DATA lv_moneda type c LENGTH 3. " esto es un atributo estatico ( tiene un class-delante del data)
    DATA: lv_region type string.

    "metodo 1
     METHODS set_cliente
        "parametros de entrada
       IMPORTING iv_cliente type string
                 iv_localizacion type string
       "prametros de salida
       EXPORTING ev_status TYPE string

       "parametros de cambio
       Changing cv_proceso type string.

    "metodo 2
     METHODS get_cliente
        EXPORTING ev_cliente type string.

     "metodo 3
     CLASS-METHODS  set_cntr_type
      IMPORTING iv_cntr_type type string.

    "metodo 4
     CLASS-METHODS  get_cntr_type
      exporting ev_cntr_type type string.




  PROTECTED SECTION.    "solo es accesible para esta clase y las clases hijas

    CLASS-DATA lv_fecha TYPE sydate.

  PRIVATE SECTION.      "es accesible solo para esta clase y las clases friends

    data lv_cliente type string.
   CLASS-DATA cntr_type type string.

ENDCLASS.




CLASS zcl_objeto2_lbc IMPLEMENTATION.

  METHOD set_cliente.
    lv_cliente = iv_cliente.
    ev_status = 'ok'.
    cv_proceso = 'Started'.

  ENDMETHOD.



  METHOD get_cliente.
    ev_cliente = lv_cliente.

  ENDMETHOD.

  METHOD get_cntr_type.
    ev_cntr_type = cntr_type.

  ENDMETHOD.

  METHOD set_cntr_type.
    cntr_type = iv_cntr_type.

  ENDMETHOD.

ENDCLASS.
