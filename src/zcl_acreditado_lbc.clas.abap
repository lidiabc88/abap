CLASS zcl_acreditado_lbc DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    DATA:
      nombre    TYPE string,
      pais      TYPE string,
      fecha_cad TYPE d.

    METHODS:

      constructor IMPORTING
                    i_nombre    TYPE string
                    i_pais      TYPE string
                    i_num_acred TYPE string
                    i_fecha_cad TYPE d,

      describir_pase
        RETURNING VALUE(rv_texto) TYPE string,

      get_num_acreditacion
        EXPORTING o_numero TYPE string.

  PROTECTED SECTION.

  PRIVATE SECTION.

    DATA num_acreditacion TYPE string.

ENDCLASS.
CLASS zcl_acreditado_lbc IMPLEMENTATION.

  METHOD constructor.

    nombre = i_nombre.
    pais = i_pais.
    fecha_cad = i_fecha_cad.

    num_acreditacion = i_num_acred.

  ENDMETHOD.

  METHOD describir_pase.

    rv_texto = |Acreditado: { nombre }|.

  ENDMETHOD.

  METHOD get_num_acreditacion.

    o_numero = num_acreditacion.

  ENDMETHOD.

ENDCLASS.
