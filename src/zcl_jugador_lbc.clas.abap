CLASS zcl_jugador_lbc DEFINITION
  PUBLIC
  INHERITING FROM zcl_acreditado_lbc
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    DATA:
      dorsal    TYPE i,
      posicion  TYPE string,
      convocado TYPE abap_bool.

    METHODS:

      constructor IMPORTING
                    i_nombre    TYPE string
                    i_pais      TYPE string
                    i_num_acred TYPE string
                    i_fecha_cad TYPE d
                    i_dorsal    TYPE i
                    i_posicion  TYPE string
                    i_convocado TYPE abap_bool,

      describir_pase REDEFINITION.

ENDCLASS.
CLASS zcl_jugador_lbc IMPLEMENTATION.

  METHOD constructor.

    super->constructor(
      i_nombre    = i_nombre
      i_pais      = i_pais
      i_num_acred = i_num_acred
      i_fecha_cad = i_fecha_cad ).

    dorsal = i_dorsal.
    posicion = i_posicion.
    convocado = i_convocado.

  ENDMETHOD.

  METHOD describir_pase.

    rv_texto =
      |Jugador: { nombre } - { pais } - Acceso a campo y vestuarios|.

  ENDMETHOD.

ENDCLASS.
