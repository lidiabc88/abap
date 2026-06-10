CLASS zcl_main_lbc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

ENDCLASS.



CLASS zcl_main_lbc IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    "PRUEBA ACTUAL:
    "Acción 5 = mostrar solo las 2 primeras filas

    DATA lt_accion TYPE i VALUE 5.

    DATA(lo_empleado) = NEW zcl_creadora_lbc(
      iv_nombre          = 'Natalia'
      iv_apellido        = 'Ruiz'
      iv_telefono        = '666555777'
      iv_experiencia     = 4
      iv_certificaciones = 2
    ).

    CASE lt_accion.

      WHEN 1.

        DATA(lv_mensaje_alta) = lo_empleado->alta_empleado( ).
        out->write( lv_mensaje_alta ).

      WHEN 2.

        DATA(lv_mensaje_mod_ok) = lo_empleado->modificacion(
          iv_id_empleado     = 1
          iv_nombre          = 'Laura'
          iv_apellido        = 'Garcia'
          iv_telefono        = '611222333'
          iv_experiencia     = 6
          iv_certificaciones = 3
        ).

        out->write( lv_mensaje_mod_ok ).

      WHEN 3.

        DATA(lv_mensaje_mod_error) = lo_empleado->modificacion(
          iv_id_empleado     = 999
          iv_nombre          = 'Carlos'
          iv_apellido        = 'Lopez'
          iv_telefono        = '699888777'
          iv_experiencia     = 10
          iv_certificaciones = 5
        ).

        out->write( lv_mensaje_mod_error ).

      WHEN 4.

        DATA(lt_tabla) = lo_empleado->traer_lt(
          iv_id_empleado = 0
        ).

        out->write( lt_tabla ).

      WHEN 5.

        DATA(lt_dos_filas) = lo_empleado->traer_n_filas(
          iv_n_filas = 2
        ).

        out->write( lt_dos_filas ).

      WHEN OTHERS.

        out->write( 'Acción no válida' ).

    ENDCASE.

  ENDMETHOD.

ENDCLASS.
