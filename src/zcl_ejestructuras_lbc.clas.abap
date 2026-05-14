CLASS zcl_ejestructuras_lbc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_ejestructuras_lbc IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


TYPES: BEGIN OF ty_flights,
         iduser     TYPE c LENGTH 40,
         aircode    TYPE /dmo/carrier_id,
         flightnum  TYPE /dmo/connection_id,
         key        TYPE land1,
         seat       TYPE /dmo/plane_seats_occupied,
         flightdate TYPE /dmo/flight_date,
       END OF ty_flights.

TYPES: BEGIN OF ty_airline,
         carrid    TYPE /dmo/carrier_id,
         connid    TYPE /dmo/connection_id,
         countryfr TYPE land1,
         cityfrom  TYPE /dmo/city,
         airpfrom  TYPE /dmo/airport_id,
         countryto TYPE land1,
       END OF ty_airline.

data: ls_flight TYPE ty_flights,
      ls_airline type ty_airline.

  ENDMETHOD.
ENDCLASS.
