CLASS zcl_lbc_connections DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
  PUBLIC SECTION.

    METHODS:
      get_connections
        IMPORTING i_departure          TYPE /dmo/airport_from_id
        RETURNING VALUE(r_connections) TYPE zcert_connections.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lbc_connections IMPLEMENTATION.

  METHOD get_connections.

    " Vuelos directos
    SELECT FROM /dmo/connection
        FIELDS carrier_id,
               airport_from_id,
               airport_to_id,
               '-' AS airport_via_id
        WHERE airport_from_id = @i_departure
        INTO TABLE @r_connections.


    " Vuelos indirectos
    SELECT FROM /dmo/connection AS c1
     INNER JOIN /dmo/connection AS c2
          " Obliga a que sea la misma aerolinea
      ON  c1~carrier_id = c2~carrier_id AND
          " La llegada del primer vuelo es la salida del segundo
          c1~airport_to_id = c2~airport_from_id
        FIELDS c1~carrier_id,
               c1~airport_from_id,
               c2~airport_to_id,
               c1~airport_to_id AS airport_via_id
          WHERE c1~airport_from_id = @i_departure AND
                " La salida del primer vuelo no es la llegada del segundo
                c1~airport_from_id <> c2~airport_to_id
                  APPENDING TABLE @r_connections.

  ENDMETHOD.

ENDCLASS.
