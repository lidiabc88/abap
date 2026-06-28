CLASS zcl_mundial_lbc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .

ENDCLASS.
CLASS zcl_mundial_lbc IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA(lo_jugador) =
      NEW zcl_jugador_lbc(
        i_nombre    = 'Lamine Yamal'
        i_pais      = 'España'
        i_num_acred = 'J0001'
        i_fecha_cad = '20261231'
        i_dorsal    = 19
        i_posicion  = 'Extremo'
        i_convocado = abap_true ).

    out->write( lo_jugador->describir_pase( ) ).

    DATA(lo_periodista) =
      NEW zcl_periodista_lbc(
        i_nombre      = 'Lidia Barnes'
        i_pais        = 'España'
        i_num_acred   = 'P0001'
        i_fecha_cad   = '20261231'
        i_medio       = 'Cadena SER'
        i_tipo_prensa = 'Radio'
        i_zona_mixta  = abap_true ).

    out->write( lo_periodista->describir_pase( ) ).

  ENDMETHOD.

ENDCLASS.
