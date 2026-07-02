CLASS zcl_objeto2_2_lbc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.



CLASS zcl_objeto2_2_lbc IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA lo_contrato TYPE REF TO zcl_objeto2_lbc.
    DATA lv_proceso TYPE string.
    DATA lv_status TYPE string.
    DATA lv_cliente TYPE string.
    DATA lv_cntr_type TYPE string.

    lo_contrato = NEW zcl_objeto2_lbc( ).

    IF lo_contrato IS BOUND.

      lo_contrato->set_cliente(
        EXPORTING
          iv_cliente      = 'Experis'
          iv_localizacion = 'calle x'
        IMPORTING
          ev_status       = lv_status
        CHANGING
          cv_proceso      = lv_proceso ).

      lo_contrato->get_cliente(
        IMPORTING
          ev_cliente = lv_cliente ).

      lo_contrato->lv_region = 'EU'.

    ENDIF.

    zcl_objeto2_lbc=>set_cntr_type(
      EXPORTING
        iv_cntr_type = 'construccion' ).

    zcl_objeto2_lbc=>get_cntr_type(
      IMPORTING
        ev_cntr_type = lv_cntr_type ).

    out->write(
      |Cliente: { lv_cliente } - Status: { lv_status } - Proceso: { lv_proceso } - Región: { lo_contrato->lv_region } - Tipo: { lv_cntr_type }| ).

  ENDMETHOD.

ENDCLASS.
