CLASS zcl_tablas2_lbc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_tablas2_lbc IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " READ TABLE:
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*
*    select from /dmo/airport
*    FIELDS *                        "traeme todas las filas
*    where country = 'DE'            "puedes usar EQ o = ,si no pongo WHERE sacaría TODO
*    into table @data(lt_flight).

*  if sy-subrc = 0.       "comprueba que funcione
*
*        out->write( lt_flight ).
*        out->write( | | ).
*
*    read table lt_flight into data(ls_flight) index 1.   "traer una linea concreta con los registros de la tabla de la BD
*
*        out->write( ls_flight ). "me traerá el primer registro de el filtrado anterior
*        out->write( | | ).
*
*    read table lt_flight into data(ls_flight2) index 2 TRANSPORTING airport_id city. "trae solo id y city y lo mete en el registro 2
*
*        out->write( ls_flight2 ). "me traerá el primer registro de el filtrado anterior
*        out->write( | | ).
*
*  ENDIF.

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "WITH KEY
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "FORMA ANTIGUA:

*  if sy-subrc = 0.
*
*    read table lt_flight into data(ls_flight) with key city = 'Berlin'. "me traerá solo la primera que encuentra que contenga Berlin
*
*    endif.
*
  "FORMA NUEVA:

*   if sy-subrc = 0.
*
*    data(ls_flight) = lt_flight[ city = 'Berlin' ]-airport_id.
*
*    out->write( ls_flight ).
*    endif.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"SORT
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

*    DATA lt_flight_sort TYPE SORTED TABLE OF /dmo/airport WITH NON-UNIQUE key airport_id.
*
*    SELECT from /dmo/airport
*    FIELDS *
*    into table @lt_flight_sort.
*
*    read table lt_flight_sort into data(ls_flight) with table key airport_id = 'LAS'.
*
*    out->write( ls_flight ).
*
*    data(ls_flight2) = lt_flight_sort[ key primary_key airport_id = 'LAS' ].
*
*    out->write( ls_flight2 ).


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"EJERCICIO:
"Para la tabla de DB /dmo/airport
" 1. extraer todos los registros del campo country = UK
" 2. extraer unicamente el nombre (del campo nombre) que está asociado a LGW del campo airport_id
" 3. extraer con la tabla sorted todos los registros donde country sea igual a IT
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 1.

  SELECT FROM /dmo/airport
  FIELDS *
  WHERE country = 'UK'
  INTO TABLE @DATA(lt_flights1).

  out->write( | | ).
  out->write( 'EJERCICIO 1:' ).
  out->write( lt_flights1 ).


" 2.

  SELECT FROM /dmo/airport
  FIELDS name
  WHERE airport_id = 'LGW'
  INTO TABLE @DATA(lt_flights2).

  IF sy-subrc = 0.
    out->write( 'EJERCICIO 2:' ).
    out->write( lt_flights2 ).
    out->write( ' ' ).
  ENDIF.


" 3.
   DATA lt_flights_sorted TYPE SORTED TABLE OF /dmo/airport WITH NON-UNIQUE KEY airport_id.

  SELECT FROM /dmo/airport
  FIELDS *
  WHERE country = 'IT'
  INTO TABLE @lt_flights_sorted.

  IF sy-subrc = 0.
    out->write( 'EJERCICIO 3:' ).
    out->write( lt_flights_sorted ).
    out->write( ' ' ).
  ENDIF.


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" READ TABLE / COMPROBAR EXISTENCIA
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*    DATA lt_flight_standar TYPE STANDARD TABLE OF /dmo/flight.
*
*    READ TABLE lt_flight_standar WITH KEY connection_id = '8403' TRANSPORTING NO FIELDS.
*
*    if sy-subrc = 0.
*
*    out->write( 'El vuelo existe en la BD' ).
*
*    else.
*
*    out->write( 'El vuelo no existe en la BD' ).
*
*    endif.
*
*    if sy-subrc = 0.
*
*    data(lv_index) = line_index( lt_flight_standar[ connection_id = '0322' ] ).
*
*    out->write( lv_index ).
*
*    endif.


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LOOP AT CON WHERE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

*    select from /dmo/airport
*    fields *
*    into table @data(lt_flight_standar).
*
*    LOOP AT lt_flight_standar into data(ls_vuelo) where connection_id = '0015'.
*
*    out->write( ls_vuelo ).
*
*    ENDLOOP.


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" SELECT DESDE TABLA INTERNA
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    SELECT FROM /dmo/flight
    FIELDS *
    WHERE carrier_id = 'LM'
    INTO TABLE @DATA(lt_vuelos).

    SELECT carrier_id,
           connection_id,
           flight_date
    FROM @lt_vuelos AS lt
    INTO TABLE @DATA(lt_copia).

    out->write( lt_vuelos ).
    out->write( lt_copia ).



  ENDMETHOD.
ENDCLASS.
