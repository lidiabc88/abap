CLASS zcl_tablas_lbc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_tablas_lbc IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TIPOS DE TABLAS EN ABAP
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    " Hay dos tipos principales:
    " - Tablas internas
    " - Tablas de base de datos

    " Para tablas internas usamos: LOOP AT

    " Para bases de datos usamos: SELECT

    " Podemos usar tablas estándar de SAP:
    " /DMO/AIRPORT
    " /DMO/FLIGHT
    " etc...

    " CTRL + espacio muestra los campos disponibles

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" DECLARACIÓN DE ESTRUCTURAS Y TABLAS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

*    TYPES: BEGIN OF ty_persona,
*
*             nombre   TYPE string,
*             edad     TYPE i,
*             telefono TYPE string,
*             email    TYPE string,
*
*           END OF ty_persona.
*
*
*    DATA ls_cliente TYPE ty_persona.
*
*    DATA lt_cliente TYPE TABLE OF ty_persona.
*
*    DATA lt_empleado TYPE TABLE OF ty_persona.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" INSERTAR REGISTROS MANUALMENTE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

*    ls_cliente-nombre = 'Toñi'.
*    ls_cliente-edad = 33.
*    ls_cliente-telefono = '+34958265471'.
*    ls_cliente-email = 'toniar1969@gmail.com'.
*
*    INSERT ls_cliente INTO TABLE lt_empleado.


*    ls_cliente-nombre = 'Dani'.
*    ls_cliente-edad = 33.
*    ls_cliente-telefono = '+34958265471'.
*    ls_cliente-email = 'dani@gmail.com'.
*
*    INSERT ls_cliente INTO TABLE lt_cliente.


*    ls_cliente-nombre = 'Paco'.
*    ls_cliente-edad = 33.
*    ls_cliente-telefono = '+34958265471'.
*    ls_cliente-email = 'paco@gmail.com'.
*
*    INSERT ls_cliente INTO TABLE lt_cliente.


*    ls_cliente-nombre = 'Laura'.
*    ls_cliente-edad = 43.
*    ls_cliente-telefono = '+34958265471'.
*    ls_cliente-email = 'laura@gmail.com'.
*
*    INSERT ls_cliente INTO lt_cliente INDEX 2.
*
*    " INDEX fuerza una posición concreta


*    ls_cliente-nombre = 'Raul'.
*    ls_cliente-edad = 23.
*    ls_cliente-telefono = '+34958265471'.
*    ls_cliente-email = 'raul@gmail.com'.
*
*    INSERT ls_cliente INTO lt_cliente INDEX 2.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RECORRER TABLAS INTERNAS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

*    LOOP AT lt_cliente INTO ls_cliente.
*
*      out->write( ls_cliente ).
*
*      IF ls_cliente-edad = 33.
*
*        out->write( 'Ahora estoy dentro del IF' ).
*
*        out->write( ls_cliente ).
*
*      ENDIF.
*
*    ENDLOOP.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" INSERT VALUE #
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

*    TYPES: BEGIN OF ty_persona2,
*
*             animal   TYPE string,
*             edad     TYPE i,
*             telefono TYPE string,
*             email    TYPE string,
*
*           END OF ty_persona2.
*
*
*    DATA lt_animal TYPE TABLE OF ty_persona2.
*
*    DATA ls_animal TYPE ty_persona2.


    " Con esta forma no necesitamos estructura auxiliar

*    INSERT VALUE #(
*      animal = 'Perro'
*      edad = 12
*      telefono = '3333'
*      email = 'perro@gmail.com'
*    ) INTO TABLE lt_animal.


*    INSERT VALUE #(
*      animal = 'Gato'
*      edad = 10
*      telefono = '4444'
*      email = 'gato@gmail.com'
*    ) INTO TABLE lt_animal.


*    INSERT VALUE #(
*      animal = 'Loro'
*      edad = 5
*      telefono = '5555'
*      email = 'loro@gmail.com'
*    ) INTO lt_animal INDEX 2.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TABLAS /DMO/AIRPORT
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    DATA ls_aeropuerto TYPE /dmo/airport.

    DATA lt_aeropuerto TYPE TABLE OF /dmo/airport.

    DATA lt_filtracion TYPE TABLE OF /dmo/airport.

    DATA lv_aeropuerto_find TYPE i.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" INSERTAR AEROPUERTOS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    ls_aeropuerto-airport_id = 'BNK'.
    ls_aeropuerto-name = 'Aeropuerto de Bangkok'.
    ls_aeropuerto-city = 'Bangkok'.
    ls_aeropuerto-country = 'TH'.

    INSERT ls_aeropuerto INTO TABLE lt_aeropuerto.



    ls_aeropuerto-airport_id = 'MLG'.
    ls_aeropuerto-name = 'Aeropuerto de Malaga'.
    ls_aeropuerto-city = 'Malaga'.
    ls_aeropuerto-country = 'ES'. " España

    INSERT ls_aeropuerto INTO TABLE lt_aeropuerto.



    ls_aeropuerto-airport_id = 'PRS'.
    ls_aeropuerto-name = 'Aeropuerto de Paris'.
    ls_aeropuerto-city = 'Paris'.
    ls_aeropuerto-country = 'FR'.

    INSERT ls_aeropuerto INTO TABLE lt_aeropuerto.



    ls_aeropuerto-airport_id = 'MCH'.
    ls_aeropuerto-name = 'Aeropuerto de Munich'.
    ls_aeropuerto-city = 'Munich'.
    ls_aeropuerto-country = 'DE'.

    INSERT ls_aeropuerto INTO TABLE lt_aeropuerto.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MOSTRAR TABLA
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

*    out->write( lt_aeropuerto ).

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FILTRAR CIUDADES QUE EMPIECEN POR M
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""
" FORMA 1 -> FIND
""""""""""""""""""""

*    LOOP AT lt_aeropuerto INTO ls_aeropuerto.
*
*      lv_aeropuerto_find =
*      find( val = ls_aeropuerto-city sub = 'M' ).
*
*      IF lv_aeropuerto_find = 0.
*
*        out->write( ls_aeropuerto ).
*
*      ENDIF.
*
*    ENDLOOP.

""""""""""""""""""""
" FORMA 2 -> WHERE CP
""""""""""""""""""""

*    LOOP AT lt_aeropuerto
*    INTO ls_aeropuerto
*    WHERE city CP 'M*'.
*
*      " CP = Contains Pattern
*      " M* = empieza por M
*
*      out->write( ls_aeropuerto ).
*
*    ENDLOOP.

""""""""""""""""""""
" FORMA 3 -> POSICIÓN
""""""""""""""""""""

*    LOOP AT lt_aeropuerto INTO ls_aeropuerto.
*
*      IF ls_aeropuerto-city(1) = 'M'.
*
*        out->write(
*        'Ciudad encontrada que empieza por M' ).
*
*        out->write( ls_aeropuerto ).
*
*      ENDIF.
*
*    ENDLOOP.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FILTRAR AEROPUERTOS DE ALEMANIA
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    LOOP AT lt_aeropuerto INTO ls_aeropuerto.

      IF ls_aeropuerto-country = 'DE'.

        INSERT ls_aeropuerto
        INTO TABLE lt_filtracion.

      ENDIF.

    ENDLOOP.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MOSTRAR FILTRACIÓN
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    out->write( 'Filtracion' ).

    out->write( lt_filtracion ).

  ENDMETHOD.

ENDCLASS.
