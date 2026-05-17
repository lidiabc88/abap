CLASS zcl_ejestructuras_lbc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_EJESTRUCTURAS_LBC IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EJERCICIO 1: DECLARACIÓN DE ESTRUCTURAS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    " Estructura TY_FLIGHTS
    TYPES: BEGIN OF ty_flights,
             iduser      TYPE c LENGTH 40,
             aircode     TYPE /dmo/carrier_id,
             flightnum   TYPE /dmo/connection_id,
             country_key TYPE land1,
             seat        TYPE /dmo/plane_seats_occupied,
             flightdate  TYPE /dmo/flight_date,
           END OF ty_flights.

    " Estructura TY_AIRLINES
    TYPES: BEGIN OF ty_airlines,
             carrid    TYPE /dmo/carrier_id,
             connid    TYPE /dmo/connection_id,
             countryfr TYPE land1,
             cityfrom  TYPE /dmo/city,
             airportfr TYPE /dmo/airport_id,
             countryto TYPE land1,
           END OF ty_airlines.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EJERCICIO 2: ESTRUCTURA ANIDADA (NESTED)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    TYPES: BEGIN OF ty_nested,
             flights  TYPE ty_flights,
             airlines TYPE ty_airlines,
           END OF ty_nested.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EJERCICIO 3: ESTRUCTURA PROFUNDA (DEEP)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    TYPES tt_flights  TYPE STANDARD TABLE OF ty_flights
                      WITH EMPTY KEY.

    TYPES tt_airlines TYPE STANDARD TABLE OF ty_airlines
                      WITH EMPTY KEY.

    TYPES: BEGIN OF ty_deep,
             flights_table  TYPE tt_flights,
             airlines_table TYPE tt_airlines,
           END OF ty_deep.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EJERCICIO 5: ESTRUCTURA INCLUDE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    TYPES: BEGIN OF ty_include_flights.
             INCLUDE TYPE ty_flights.
             INCLUDE TYPE ty_airlines.
    TYPES: END OF ty_include_flights.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" DECLARACIÓN DE VARIABLES
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    DATA ls_flights         TYPE ty_flights.
    DATA ls_airlines        TYPE ty_airlines.
    DATA ls_nested          TYPE ty_nested.
    DATA ls_deep            TYPE ty_deep.
    DATA ls_include_flights TYPE ty_include_flights.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EJERCICIO 4: AÑADIR DATOS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    " Datos FLIGHTS
    ls_flights-iduser      = 'JAG'.
    ls_flights-aircode     = 'LH'.
    ls_flights-flightnum   = '0400'.
    ls_flights-country_key = 'DE'.
    ls_flights-seat        = 180.
    ls_flights-flightdate  = '20260514'.

    " Datos AIRLINES
    ls_airlines-carrid    = 'LH'.
    ls_airlines-connid    = '0400'.
    ls_airlines-countryfr = 'DE'.
    ls_airlines-cityfrom  = 'Frankfurt'.
    ls_airlines-airportfr = 'FRA'.
    ls_airlines-countryto = 'US'.

    " Datos NESTED
    ls_nested-flights  = ls_flights.
    ls_nested-airlines = ls_airlines.

    " Datos DEEP
    APPEND ls_flights  TO ls_deep-flights_table.
    APPEND ls_airlines TO ls_deep-airlines_table.

    " Datos INCLUDE
    ls_include_flights-iduser      = 'JAG'.
    ls_include_flights-aircode     = 'AA'.
    ls_include_flights-flightnum   = '0017'.
    ls_include_flights-country_key = 'US'.
    ls_include_flights-seat        = 220.
    ls_include_flights-flightdate  = '20260515'.

    ls_include_flights-carrid    = 'AA'.
    ls_include_flights-connid    = '0017'.
    ls_include_flights-countryfr = 'US'.
    ls_include_flights-cityfrom  = 'New York'.
    ls_include_flights-airportfr = 'JFK'.
    ls_include_flights-countryto = 'ES'.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MOSTRAR RESULTADOS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    out->write( '--- ESTRUCTURA FLIGHTS ---' ).
    out->write( ls_flights ).

    out->write( '--- ESTRUCTURA AIRLINES ---' ).
    out->write( ls_airlines ).

    out->write( '--- ESTRUCTURA NESTED ---' ).
    out->write( ls_nested ).

    out->write( '--- ESTRUCTURA DEEP ---' ).
    out->write( ls_deep ).

    out->write( '--- ESTRUCTURA INCLUDE ---' ).
    out->write( ls_include_flights ).

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EJERCICIO 6: ELIMINAR DATOS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    CLEAR ls_nested.
    CLEAR ls_deep.

    out->write( '--- NESTED DESPUÉS DE CLEAR ---' ).
    out->write( ls_nested ).

    out->write( '--- DEEP DESPUÉS DE CLEAR ---' ).
    out->write( ls_deep ).

  ENDMETHOD.
ENDCLASS.
