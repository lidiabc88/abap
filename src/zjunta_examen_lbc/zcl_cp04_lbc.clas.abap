CLASS zcl_cp04_lbc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_cp04_lbc IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


    TYPES: BEGIN OF ty_resumen,
             aerolinea TYPE c LENGTH 2,
             total_res TYPE i,
             suma      TYPE p LENGTH 8 DECIMALS 2,
             media     TYPE p LENGTH 8 DECIMALS 2,
           END OF ty_resumen.

    DATA lt_resumen TYPE TABLE OF ty_resumen.

    DATA lt_reservas TYPE ztt_bookings_lbc.

    lt_reservas = VALUE ztt_bookings_lbc(
( id_reserva = 1 aerolinea = 'LH' num_vuelo = '0400' pasajero = 'Ana García' fecha = '20260515' precio = '899.00' estado = 'A' )
( id_reserva = 2 aerolinea = 'IB' num_vuelo = '3740' pasajero = 'Carlos López' fecha = '20260515' precio = '120.00' estado = 'A' )
( id_reserva = 3 aerolinea = 'AA' num_vuelo = '0017' pasajero = 'John Smith' fecha = '20260520' precio = '450.50' estado = 'A' )
( id_reserva = 4 aerolinea = 'LH' num_vuelo = '0455' pasajero = 'María Pérez' fecha = '20260520' precio = '310.75' estado = 'A' )
( id_reserva = 5 aerolinea = 'IB' num_vuelo = '3740' pasajero = 'Pedro Ruiz' fecha = '20260515' precio = '120.00' estado = 'C' )
( id_reserva = 6 aerolinea = 'SQ' num_vuelo = '0026' pasajero = 'Lisa Tan' fecha = '20260601' precio = '1250.00' estado = 'A' )
( id_reserva = 7 aerolinea = 'LH' num_vuelo = '0400' pasajero = 'Hans Müller' fecha = '20260515' precio = '899.00' estado = 'A' )
( id_reserva = 8 aerolinea = 'AA' num_vuelo = '0064' pasajero = 'Sarah Jones' fecha = '20260525' precio = '510.00' estado = 'A' )
).

    APPEND VALUE #(
      id_reserva = 9
      aerolinea  = 'IB'
      num_vuelo  = '3950'
      pasajero   = 'Elena Martín'
      fecha      = '20260601'
      precio     = '275.30'
      estado     = 'A'
    ) TO lt_reservas.

    APPEND VALUE #(
      id_reserva = 10
      aerolinea  = 'LH'
      num_vuelo  = '2030'
      pasajero   = 'Franz Weber'
      fecha      = '20260610'
      precio     = '95.00'
      estado     = 'A'
    ) TO lt_reservas.

    out->write( '--- Tarea 2.1: Reservas tras altas ---' ).

    LOOP AT lt_reservas INTO DATA(ls_reserva).
      out->write(
   |{ ls_reserva-id_reserva } { ls_reserva-aerolinea } { ls_reserva-num_vuelo } { ls_reserva-pasajero } { ls_reserva-precio } { ls_reserva-estado }|
      ).
    ENDLOOP.

    READ TABLE lt_reservas INTO ls_reserva
      WITH KEY id_reserva = 3.

    IF sy-subrc = 0.
      ls_reserva-precio = 480.
      MODIFY lt_reservas FROM ls_reserva INDEX sy-tabix.
    ENDIF.

    LOOP AT lt_reservas INTO ls_reserva.
      IF ls_reserva-aerolinea = 'LH'.
        ls_reserva-precio = ls_reserva-precio * '0.9'.
        MODIFY lt_reservas FROM ls_reserva INDEX sy-tabix.
      ENDIF.
    ENDLOOP.

    out->write( '--- Tarea 2.2: Reservas modificadas ---' ).

    LOOP AT lt_reservas INTO ls_reserva.
      out->write(
        |{ ls_reserva-id_reserva } { ls_reserva-aerolinea } { ls_reserva-precio }|
      ).
    ENDLOOP.

    READ TABLE lt_reservas INTO ls_reserva
      WITH KEY id_reserva = 4.

    IF sy-subrc = 0.
      ls_reserva-estado = 'C'.
      MODIFY lt_reservas FROM ls_reserva
        TRANSPORTING estado
        WHERE id_reserva = 4.
    ENDIF.

    DELETE lt_reservas WHERE estado = 'C'.

    DATA lv_deleted TYPE i.
    lv_deleted = sy-dbcnt.

    out->write( '--- Tarea 2.3 ---' ).
    out->write( |Registros eliminados: { lv_deleted }| ).

    LOOP AT lt_reservas INTO ls_reserva.
      out->write(
        |{ ls_reserva-id_reserva } { ls_reserva-aerolinea } { ls_reserva-estado }|
      ).
    ENDLOOP.

    out->write( '--- Tarea 2.4 ---' ).

    READ TABLE lt_reservas WITH KEY pasajero = 'Lisa Tan'
      TRANSPORTING NO FIELDS.

    IF sy-subrc = 0.
      out->write( 'Lisa Tan existe en la tabla' ).
    ELSE.
      out->write( 'Lisa Tan NO existe' ).
    ENDIF.

    READ TABLE lt_reservas REFERENCE INTO DATA(lr_reserva)
      WITH KEY id_reserva = 6.

    IF sy-subrc = 0.
      out->write(
        |Ref ID 6: { lr_reserva->pasajero } { lr_reserva->precio }|
      ).
    ENDIF.

    DATA(lv_pasajero) = VALUE #( lt_reservas[ id_reserva = 1 ]-pasajero DEFAULT '' ).

    out->write( |Pasajero ID 1: { lv_pasajero }| ).

    DATA lt_activas TYPE ztt_bookings_lbc.

    LOOP AT lt_reservas INTO DATA(ls_reserva_tmp).
      IF ls_reserva_tmp-estado = 'A'.
        APPEND ls_reserva_tmp TO lt_activas.
      ENDIF.
    ENDLOOP.

    LOOP AT lt_activas INTO DATA(ls_reserva_grp)
      GROUP BY ( aerolinea = ls_reserva_grp-aerolinea )
      INTO DATA(lv_group).

      DATA lv_count TYPE i.
      DATA lv_sum   TYPE p LENGTH 8 DECIMALS 2.
      lv_count = 0.
      lv_sum   = 0.

      LOOP AT GROUP lv_group INTO DATA(ls_group_item).
        lv_count = lv_count + 1.
        lv_sum = lv_sum + ls_group_item-precio.
      ENDLOOP.

      APPEND VALUE ty_resumen(
        aerolinea = lv_group-aerolinea
        total_res = lv_count
        suma      = lv_sum
        media     = lv_sum / lv_count
      ) TO lt_resumen.

    ENDLOOP.

    out->write( '--- Tarea 2.5 ---' ).

    LOOP AT lt_resumen INTO DATA(ls_resumen).
      out->write(
        |{ ls_resumen-aerolinea } \| { ls_resumen-total_res } \| { ls_resumen-suma } \| { ls_resumen-media }|
      ).
    ENDLOOP.

  ENDMETHOD.
ENDCLASS.
