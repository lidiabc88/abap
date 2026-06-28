CLASS zcl_experiencia_lbc DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    DATA: nombre   TYPE string,
          duracion TYPE i,
          num_part TYPE i.

    METHODS:

      constructor IMPORTING i_nombre   TYPE string
                            i_precio   TYPE zde_decimal_lbc
                            i_duracion TYPE i
                            i_num_part TYPE i,

      calcular_precio RETURNING VALUE(r_total) TYPE zde_decimal_lbc,

      get_precio_base EXPORTING o_precio TYPE zde_decimal_lbc.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA:
    precio   TYPE zde_decimal_lbc.

ENDCLASS.

CLASS zcl_experiencia_lbc IMPLEMENTATION.

  METHOD constructor. " Solo tiene parametros de IMPORTING
    " Atributo <- paramentro
    nombre   = i_nombre.
    precio   = i_precio.
    duracion = i_duracion.
    num_part = i_num_part.

  ENDMETHOD.

  METHOD calcular_precio.

    r_total = precio * num_part.

    IF num_part > 8.
      r_total = r_total * '0.9'.
    ENDIF.

  ENDMETHOD.

  METHOD get_precio_base.

    " Paramentro <- atributo
    o_precio = precio.

  ENDMETHOD.

ENDCLASS.
