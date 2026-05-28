CLASS zcl_poo_lbc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    data lv_nombre type string.
    METHODS: ladrar RETURNING VALUE(rv_accion) TYPE string.
    METHODS: lanzar_pelota RETURNING VALUE(rv_accion) TYPE string.
    METHODS: dormir RETURNING VALUE(rv_accion) TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_poo_lbc IMPLEMENTATION.

  METHOD ladrar.

    rv_accion = |{ lv_nombre } dice: Guau, guau |.

  ENDMETHOD.

  METHOD lanzar_pelota.

    rv_accion = |{ lv_nombre } corre a por la pelota |.

  ENDMETHOD.

  METHOD dormir.
    rv_accion = |{ lv_nombre } duerme |.
  ENDMETHOD.

ENDCLASS.
