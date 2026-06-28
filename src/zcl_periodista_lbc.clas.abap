CLASS zcl_periodista_lbc DEFINITION
  PUBLIC
  INHERITING FROM zcl_acreditado_lbc
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    DATA:
      medio       TYPE string,
      tipo_prensa TYPE string,
      zona_mixta  TYPE abap_bool.

    METHODS:

      constructor IMPORTING
                    i_nombre      TYPE string
                    i_pais        TYPE string
                    i_num_acred   TYPE string
                    i_fecha_cad   TYPE d
                    i_medio       TYPE string
                    i_tipo_prensa TYPE string
                    i_zona_mixta  TYPE abap_bool,

      describir_pase REDEFINITION.

ENDCLASS.
CLASS zcl_periodista_lbc IMPLEMENTATION.

  METHOD constructor.

    super->constructor(
      i_nombre    = i_nombre
      i_pais      = i_pais
      i_num_acred = i_num_acred
      i_fecha_cad = i_fecha_cad ).

    medio = i_medio.
    tipo_prensa = i_tipo_prensa.
    zona_mixta = i_zona_mixta.

  ENDMETHOD.

  METHOD describir_pase.

    IF zona_mixta = abap_true.

      rv_texto =
        |Periodista: { nombre } - { pais } - Sala de prensa y zona mixta|.

    ELSE.

      rv_texto =
        |Periodista: { nombre } - { pais } - Solo sala de prensa|.

    ENDIF.

  ENDMETHOD.

ENDCLASS.
