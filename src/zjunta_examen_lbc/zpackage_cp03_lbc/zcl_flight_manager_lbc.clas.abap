CLASS zcl_flight_manager_lbc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_flight_manager_lbc.

    METHODS constructor
      IMPORTING
        it_flights TYPE zif_flight_manager_lbc=>ty_flights OPTIONAL.

  PRIVATE SECTION.
    DATA mt_flights TYPE zif_flight_manager_lbc=>ty_flights.

ENDCLASS.



CLASS zcl_flight_manager_lbc IMPLEMENTATION.

  METHOD constructor.
    me->mt_flights = it_flights.
  ENDMETHOD.

  METHOD zif_flight_manager_lbc~add_flight.
    IF is_flight-precio <= 0.
      RAISE EXCEPTION NEW zcx_flight_error_lbc(
        iv_message = |El precio del vuelo { is_flight-aerolinea }{ is_flight-num_vuelo } debe ser positivo.|
      ).
    ENDIF.

    IF line_exists( me->mt_flights[ aerolinea = is_flight-aerolinea
                                    num_vuelo = is_flight-num_vuelo ] ).
      RAISE EXCEPTION NEW zcx_flight_error_lbc(
        iv_message = |El vuelo { is_flight-aerolinea }{ is_flight-num_vuelo } ya existe en el sistema.|
      ).
    ENDIF.

    APPEND is_flight TO me->mt_flights.
  ENDMETHOD.

  METHOD zif_flight_manager_lbc~get_flights_by_airline.
    rt_flights = VALUE #( FOR wa IN me->mt_flights
                          WHERE ( aerolinea = iv_aerolinea ) ( wa ) ).
  ENDMETHOD.

  METHOD zif_flight_manager_lbc~get_cheapest_flight.
    IF me->mt_flights IS INITIAL.
      RETURN.
    ENDIF.

    rs_flight = REDUCE #(
      INIT  ls_min = me->mt_flights[ 1 ]
      FOR   wa IN me->mt_flights FROM 2
      NEXT  ls_min = COND #( WHEN wa-precio < ls_min-precio THEN wa ELSE ls_min )
    ).
  ENDMETHOD.

  METHOD zif_flight_manager_lbc~get_total_revenue.
    rv_total = REDUCE #(
      INIT  lv_sum TYPE zif_flight_manager_lbc=>ty_total
      FOR   wa IN me->mt_flights
      NEXT  lv_sum = lv_sum + wa-precio
    ).
  ENDMETHOD.

ENDCLASS.
