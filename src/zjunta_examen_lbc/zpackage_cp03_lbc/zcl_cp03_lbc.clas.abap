CLASS zcl_cp03_lbc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

ENDCLASS.



CLASS zcl_cp03_lbc IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA lo_manager TYPE REF TO zif_flight_manager_lbc.
    lo_manager = NEW zcl_flight_manager_lbc( ).

    out->write( 'Añadiendo vuelos...' ).

    TRY.

        lo_manager->add_flight(
          VALUE #(
            aerolinea = 'IB'
            num_vuelo = '1001'
            origen    = 'MAD'
            destino   = 'BCN'
            precio    = '85.50'
            plazas    = 150 ) ).

        lo_manager->add_flight(
          VALUE #(
            aerolinea = 'IB'
            num_vuelo = '1002'
            origen    = 'MAD'
            destino   = 'CDG'
            precio    = '120.00'
            plazas    = 180 ) ).

        lo_manager->add_flight(
          VALUE #(
            aerolinea = 'LH'
            num_vuelo = '2001'
            origen    = 'FRA'
            destino   = 'MAD'
            precio    = '210.00'
            plazas    = 200 ) ).

        lo_manager->add_flight(
          VALUE #(
            aerolinea = 'LH'
            num_vuelo = '2002'
            origen    = 'FRA'
            destino   = 'JFK'
            precio    = '450.00'
            plazas    = 250 ) ).

        lo_manager->add_flight(
          VALUE #(
            aerolinea = 'UX'
            num_vuelo = '3001'
            origen    = 'MAD'
            destino   = 'AGP'
            precio    = '45.00'
            plazas    = 120 ) ).

      CATCH zcx_flight_error_lbc INTO DATA(lx_error).
        out->write( lx_error->get_text( ) ).

    ENDTRY.


    out->write( '' ).
    out->write( 'Intentando añadir un vuelo con precio negativo...' ).

    TRY.

        lo_manager->add_flight(
          VALUE #(
            aerolinea = 'UX'
            num_vuelo = '3002'
            origen    = 'MAD'
            destino   = 'PMI'
            precio    = '-10.00'
            plazas    = 100 ) ).

      CATCH zcx_flight_error_lbc INTO lx_error.
        out->write( lx_error->get_text( ) ).

    ENDTRY.


    out->write( '' ).
    out->write( 'Intentando añadir un vuelo duplicado...' ).

    TRY.

        lo_manager->add_flight(
          VALUE #(
            aerolinea = 'IB'
            num_vuelo = '1001'
            origen    = 'MAD'
            destino   = 'BCN'
            precio    = '90.00'
            plazas    = 150 ) ).

      CATCH zcx_flight_error_lbc INTO lx_error.
        out->write( lx_error->get_text( ) ).

    ENDTRY.


    out->write( '' ).
    out->write( 'Vuelos de la aerolínea IB' ).

    DATA(lt_ib_flights) = lo_manager->get_flights_by_airline(
      iv_aerolinea = 'IB' ).

    out->write( lt_ib_flights ).


    out->write( '' ).
    out->write( 'Vuelo más barato' ).

    DATA(ls_cheapest) = lo_manager->get_cheapest_flight( ).

    out->write( ls_cheapest ).


    out->write( '' ).
    out->write( 'Facturación total' ).

    DATA(lv_total) = lo_manager->get_total_revenue( ).

    out->write( lv_total ).

  ENDMETHOD.

ENDCLASS.
