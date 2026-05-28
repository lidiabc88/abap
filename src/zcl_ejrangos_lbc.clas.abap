CLASS zcl_ejrangos_lbc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_ejrangos_lbc IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " TAREA 1 - COMPAÑIAS CONCRETAS: AA, LH, SQ
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    DATA lr_companias TYPE RANGE OF /dmo/carrier_id.

    APPEND VALUE #( sign = 'I' option = 'EQ' low = 'AA' ) TO lr_companias.
    APPEND VALUE #( sign = 'I' option = 'EQ' low = 'LH' ) TO lr_companias.
    APPEND VALUE #( sign = 'I' option = 'EQ' low = 'SQ' ) TO lr_companias.


   """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " TAREA 2 - RANGO DE FECHAS ENTRE 01.01.2025 Y 30.06.2026
   """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    DATA lr_fechas TYPE RANGE OF /dmo/flight_date.

    APPEND VALUE #( sign = 'I' option = 'BT' low = '20250101' high = '20260630' ) TO lr_fechas.


    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " TAREA 3 - CONEXIONES QUE EMPIECEN POR 1
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    DATA lr_conexiones TYPE RANGE OF /dmo/connection_id.

    APPEND VALUE #( sign = 'I' option = 'BT' low = '1000' high = '1999' ) TO lr_conexiones.

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
   " TAREA 4 - TODAS LAS COMPAÑIAS EXCEPTO UA
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    DATA lr_excluir_ua TYPE RANGE OF /dmo/carrier_id.

    APPEND VALUE #( sign = 'E' option = 'EQ' low = 'UA' ) TO lr_excluir_ua.


    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " TAREA 5 - PRECIO MAYOR 100 O MENOR/IGUAL 50
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    DATA lr_precios TYPE RANGE OF /dmo/flight_price.

    APPEND VALUE #( sign = 'I' option = 'GT' low = 100 ) TO lr_precios.
    APPEND VALUE #( sign = 'I' option = 'LE' low = 50 ) TO lr_precios.


    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " CONSULTA TAREA 1 - VUELOS DE AA, LH Y SQ
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    SELECT FROM /dmo/flight
      FIELDS carrier_id,
             connection_id,
             flight_date,
             price,
             currency_code,
             seats_max,
             seats_occupied
      WHERE carrier_id IN @lr_companias
      INTO TABLE @DATA(lt_vuelos_companias).

    out->write( |  | ).
    out->write( 'TAREA 1 - VUELOS DE AA, LH Y SQ' ).
    out->write( |  | ).
    out->write( lt_vuelos_companias ).


    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " CONSULTA TAREA 2 - VUELOS ENTRE DOS FECHAS
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    SELECT FROM /dmo/flight
      FIELDS carrier_id,
             connection_id,
             flight_date,
             price,
             currency_code,
             seats_max,
             seats_occupied
      WHERE flight_date IN @lr_fechas
      INTO TABLE @DATA(lt_vuelos_fechas).

   out->write( |  | ).
    out->write( 'TAREA 2 - VUELOS ENTRE 01.01.2025 Y 30.06.2025' ).
   out->write( |  | ).
    out->write( lt_vuelos_fechas ).


    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " CONSULTA TAREA 3 - CONEXIONES QUE EMPIEZAN POR 1
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    SELECT FROM /dmo/flight
      FIELDS carrier_id,
             connection_id,
             flight_date,
             price,
             currency_code,
             seats_max,
             seats_occupied
      WHERE connection_id IN @lr_conexiones
      INTO TABLE @DATA(lt_vuelos_conexiones).

    out->write( |  | ).
    out->write( 'TAREA 3 - CONEXIONES QUE EMPIEZAN POR 1' ).
    out->write( |  | ).
    out->write( lt_vuelos_conexiones ).


    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " CONSULTA TAREA 4 - TODAS LAS COMPAÑIAS EXCEPTO UA
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    SELECT FROM /dmo/flight
      FIELDS carrier_id,
             connection_id,
             flight_date,
             price,
             currency_code,
             seats_max,
             seats_occupied
      WHERE carrier_id IN @lr_excluir_ua
      INTO TABLE @DATA(lt_vuelos_sin_ua).

    out->write( |  | ).
    out->write( 'TAREA 4 - TODAS LAS COMPAÑIAS EXCEPTO UA' ).
    out->write( |  | ).
    out->write( lt_vuelos_sin_ua ).


    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " CONSULTA TAREA 5 - PRECIO MAYOR 100 O MENOR/IGUAL 50
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    SELECT FROM /dmo/flight
      FIELDS carrier_id,
             connection_id,
             flight_date,
             price,
             currency_code,
             seats_max,
             seats_occupied
      WHERE price IN @lr_precios
      INTO TABLE @DATA(lt_vuelos_precios).

    out->write( |  | ).
    out->write( 'TAREA 5 - PRECIO MAYOR 100 O MENOR/IGUAL 50' ).
    out->write( |  | ).
    out->write( lt_vuelos_precios ).


    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " TAREA 6 - CONSULTA COMBINADA
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    SELECT FROM /dmo/flight
      FIELDS carrier_id,
             connection_id,
             flight_date,
             price,
             currency_code,
             seats_max,
             seats_occupied
      WHERE carrier_id IN @lr_companias
        AND flight_date IN @lr_fechas
        AND carrier_id IN @lr_excluir_ua
      INTO TABLE @DATA(lt_vuelos_combinado).

    DATA lv_total TYPE i.

    lv_total = lines( lt_vuelos_combinado ).

    out->write( |  | ).
    out->write( 'TAREA 6 - CONSULTA COMBINADA' ).
    out->write( |  | ).
    out->write( lt_vuelos_combinado ).

    out->write( |  | ).
    out->write( 'TOTAL DE LINEAS DEVUELTAS' ).
    out->write( |  | ).
    out->write( |Total: { lv_total }| ).

    out->write( |  | ).
    out->write( lt_vuelos_combinado ).


  ENDMETHOD.
ENDCLASS.
