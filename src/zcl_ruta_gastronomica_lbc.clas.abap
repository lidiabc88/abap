CLASS zcl_ruta_gastronomica_lbc DEFINITION
  PUBLIC
  INHERITING FROM zcl_experiencia_lbc
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    DATA:
      num_tapas TYPE i,
      nocturno  TYPE abap_bool.

    METHODS:
      constructor IMPORTING i_nombre    TYPE string
                            i_precio    TYPE zde_decimal_lbc
                            i_duracion  TYPE i
                            i_num_part  TYPE i
                            i_num_tapas TYPE i
                            i_nocturno  TYPE abap_bool,

      " Se modifica el método original del padre
      calcular_precio REDEFINITION.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_ruta_gastronomica_lbc IMPLEMENTATION.

  METHOD constructor.
    super->constructor( i_nombre   = i_nombre
                         i_precio   = i_precio
                         i_duracion = i_duracion
                         i_num_part = i_num_part ).
    num_tapas = i_num_tapas.
    nocturno = i_nocturno.
  ENDMETHOD.

  METHOD calcular_precio.

    DATA lv_precio_base TYPE zde_decimal_lbc.
    get_precio_base( IMPORTING o_precio = lv_precio_base ).

    r_total = lv_precio_base * num_part.

    IF num_part > 5.
      r_total = r_total * '0.8'.
    ENDIF.

  ENDMETHOD.

ENDCLASS.
