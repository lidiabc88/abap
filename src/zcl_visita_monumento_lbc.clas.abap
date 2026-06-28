CLASS zcl_visita_monumento_lbc DEFINITION
  PUBLIC
  INHERITING FROM zcl_experiencia_lbc
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    DATA:
      monumento TYPE string,
      reserva   TYPE abap_bool.

    METHODS:
      constructor IMPORTING i_nombre    TYPE string
                            i_precio    TYPE zde_decimal_lbc
                            i_duracion  TYPE i
                            i_num_part  TYPE i
                            i_monumento TYPE string
                            i_reserva   type abap_bool.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_visita_monumento_lbc IMPLEMENTATION.

  METHOD constructor.
    " Llamando al constructor del padre
    " paramentro padre <- parametro hijo
    super->constructor( i_nombre = i_nombre
                        i_precio = i_precio
                        i_duracion = i_duracion
                        i_num_part = i_num_part ).

    " Atributo <- paramentro
    monumento = i_monumento.
    reserva = i_reserva.

  ENDMETHOD.

ENDCLASS.
