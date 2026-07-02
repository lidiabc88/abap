INTERFACE zif_flight_manager_lbc PUBLIC.

  TYPES:
    ty_aerolinea TYPE c LENGTH 2,
    ty_num_vuelo TYPE n LENGTH 4,
    ty_codigo    TYPE c LENGTH 3,
    ty_precio    TYPE p LENGTH 8 DECIMALS 2,
    ty_total     TYPE p LENGTH 12 DECIMALS 2.

  TYPES:
    BEGIN OF ty_flight,
      aerolinea TYPE ty_aerolinea,
      num_vuelo TYPE ty_num_vuelo,
      origen    TYPE ty_codigo,
      destino   TYPE ty_codigo,
      precio    TYPE ty_precio,
      plazas    TYPE i,
    END OF ty_flight.

  TYPES ty_flights TYPE STANDARD TABLE OF ty_flight WITH EMPTY KEY.

  METHODS add_flight
    IMPORTING
      is_flight TYPE ty_flight
    RAISING
      zcx_flight_error_lbc.

  METHODS get_flights_by_airline
    IMPORTING
      iv_aerolinea TYPE ty_aerolinea
    RETURNING
      VALUE(rt_flights) TYPE ty_flights.

  METHODS get_cheapest_flight
    RETURNING
      VALUE(rs_flight) TYPE ty_flight.

  METHODS get_total_revenue
    RETURNING
      VALUE(rv_total) TYPE ty_total.

ENDINTERFACE.
