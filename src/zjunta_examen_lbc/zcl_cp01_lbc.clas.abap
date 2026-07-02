CLASS zcl_cp01_lbc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_cp01_lbc IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    TYPES: BEGIN OF ty_vuelo,
             aerolinea TYPE c LENGTH 2,
             vuelo     TYPE n LENGTH 4,
             origen    TYPE c LENGTH 3,
             destino   TYPE c LENGTH 3,
             precio    TYPE p LENGTH 8 DECIMALS 2,
             plazas    TYPE i,
           END OF ty_vuelo.

    DATA lt_vuelos TYPE TABLE OF ty_vuelo.

    lt_vuelos = VALUE #( (

  aerolinea = 'LH'
  vuelo = '0400'
  origen = 'FRA'
  destino = 'JFK'
  precio = '899.00'
  plazas = 15 )

  (

  aerolinea = 'AA'
  vuelo = '0017'
  origen = 'JFK'
  destino = 'SFO'
  precio = '450.50'
  plazas = 0 )

  (

  aerolinea = 'IB'
  vuelo = '3740'
  origen = 'MAD'
  destino = 'BCN'
  precio = '120.00'
  plazas = 42 )

  (

  aerolinea = 'LH'
  vuelo = '0455'
  origen = 'FRA'
  destino = 'MAD'
  precio = '310.75'
  plazas = 8 )

  (

  aerolinea = 'AA'
  vuelo = '0064'
  origen = 'SFO'
  destino = 'JFK'
  precio = '510.00'
  plazas = 3 )

  (

  aerolinea = 'IB'
  vuelo = '3950'
  origen = 'BCN'
  destino = 'LHR'
  precio = '275.30'
  plazas = 0 )

  (

  aerolinea = 'LH'
  vuelo = '2030'
  origen = 'MUC'
  destino = 'FRA'
  precio = '95.00'
  plazas = 60 )

  (

  aerolinea = 'SQ'
  vuelo = '0026'
  origen = 'SIN'
  destino = 'FRA'
  precio = '1250.00'
  plazas = 5 ) ).

    DATA lv_categoria TYPE string.

    DATA:
      lv_codigo   TYPE string,
      lv_destino  TYPE string,
      lv_longitud TYPE i,
      lv_max      TYPE p LENGTH 8 DECIMALS 2,
      lv_min      TYPE p LENGTH 8 DECIMALS 2,
      lv_media    TYPE p LENGTH 8 DECIMALS 2,
      lv_total    TYPE p LENGTH 8 DECIMALS 2.

    LOOP AT lt_vuelos INTO DATA(ls_vuelo).

      lv_categoria = COND #(
        WHEN ls_vuelo-precio < 150 THEN 'Económico'
        WHEN ls_vuelo-precio <= 500 THEN 'Estándar'
        WHEN ls_vuelo-precio <= 1000 THEN 'Premium'
        ELSE 'First Class'
      ).

      out->write(
           |{ ls_vuelo-aerolinea } { ls_vuelo-vuelo } - { lv_categoria }|
           ).

    ENDLOOP.

    out->write( '--- Tarea 1.2 ---' ).

    LOOP AT lt_vuelos INTO ls_vuelo.

      IF ls_vuelo-plazas > 0
      AND ( ls_vuelo-origen = 'FRA'
         OR ls_vuelo-destino = 'FRA' )
      AND NOT ( ls_vuelo-precio > 1000 ).

        out->write(
          |{ ls_vuelo-aerolinea } { ls_vuelo-vuelo } { ls_vuelo-origen } -> { ls_vuelo-destino } Precio: { ls_vuelo-precio }|
        ).

      ENDIF.

    ENDLOOP.

    out->write( '--- Tarea 1.3 ---' ).

    LOOP AT lt_vuelos INTO ls_vuelo.

      IF ls_vuelo-plazas > 0
      AND ( ls_vuelo-origen = 'FRA'
         OR ls_vuelo-destino = 'FRA' )
      AND NOT ( ls_vuelo-precio > 1000 ).

        lv_codigo = |{ ls_vuelo-aerolinea }-{ ls_vuelo-vuelo }|.

        lv_destino = to_lower( ls_vuelo-destino ).

        lv_longitud = strlen( lv_codigo ).

        out->write(
                |{ lv_codigo } \| { lv_destino } \| { lv_longitud }|
                ).

      ENDIF.

    ENDLOOP.


lv_max = REDUCE #(
  INIT max = 0
  FOR ls_v IN lt_vuelos
  NEXT max = COND #( WHEN ls_v-precio > max THEN ls_v-precio ELSE max )
).

lv_min = REDUCE #(
  INIT min = 999999
  FOR ls_v IN lt_vuelos
  NEXT min = COND #( WHEN ls_v-precio < min THEN ls_v-precio ELSE min )
).

lv_total = REDUCE #(
  INIT sum = 0
  FOR ls_v IN lt_vuelos
  NEXT sum = sum + ls_v-precio
).

lv_media = lv_total / lines( lt_vuelos ).
lv_media = round( val = lv_media dec = 2 ).

    out->write( '--- Tarea 1.4 ---' ).

    out->write( |Precio máximo: { lv_max }| ).
    out->write( |Precio mínimo: { lv_min }| ).
    out->write( |Precio medio: { lv_media }| ).
    out->write( |Total precios: { lv_total }| ).





  ENDMETHOD.
ENDCLASS.
