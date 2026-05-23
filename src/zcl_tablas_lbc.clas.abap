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
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EJEMPLOS CON AEROPUERTO: /DMO/AIRPORT
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
**
**    DATA ls_aeropuerto TYPE /dmo/airport.
**
**    DATA lt_aeropuerto TYPE TABLE OF /dmo/airport.
**
**    DATA lt_filtracion TYPE TABLE OF /dmo/airport.
**
**    DATA lv_aeropuerto_find TYPE i.
**
**    "insertamos los aeropuertos
**
**    ls_aeropuerto-airport_id = 'BNK'.
**    ls_aeropuerto-name = 'Aeropuerto de Bangkok'.
**    ls_aeropuerto-city = 'Bangkok'.
**    ls_aeropuerto-country = 'TH'.
**
**    INSERT ls_aeropuerto INTO TABLE lt_aeropuerto.
**
**
**
**    ls_aeropuerto-airport_id = 'MLG'.
**    ls_aeropuerto-name = 'Aeropuerto de Malaga'.
**    ls_aeropuerto-city = 'Malaga'.
**    ls_aeropuerto-country = 'ES'. "
**
**    INSERT ls_aeropuerto INTO TABLE lt_aeropuerto.
**
**
**
**    ls_aeropuerto-airport_id = 'PRS'.
**    ls_aeropuerto-name = 'Aeropuerto de Paris'.
**    ls_aeropuerto-city = 'Paris'.
**    ls_aeropuerto-country = 'FR'.
**
**    INSERT ls_aeropuerto INTO TABLE lt_aeropuerto.
**
**
**
**    ls_aeropuerto-airport_id = 'MCH'.
**    ls_aeropuerto-name = 'Aeropuerto de Munich'.
**    ls_aeropuerto-city = 'Munich'.
**    ls_aeropuerto-country = 'DE'.
**
**    INSERT ls_aeropuerto INTO TABLE lt_aeropuerto.
**
**     out->write( lt_aeropuerto ).

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FILTRAR CIUDADES QUE EMPIECEN POR M
" FORMA 1 -> FIND

*
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


" FORMA 2 -> WHERE CP

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


" FORMA 3 -> POSICIÓN


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

*    LOOP AT lt_aeropuerto INTO ls_aeropuerto.
*
*      IF ls_aeropuerto-country = 'DE'.
*
*        INSERT ls_aeropuerto
*        INTO TABLE lt_filtracion.
*
*      ENDIF.
*
*    ENDLOOP.
*
*    out->write( 'Filtracion' ).
*
*    out->write( lt_filtracion ).
*
*


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
  "WITH KEY": permite buscar registros usando un campo concreto en lugar de usar INDEX/posición.
"

" Ejemplo:
"       READ TABLE lt_tabla INTO ls_tabla WITH KEY id = '100'.    " Devuelve la PRIMERA coincidencia encontrada.


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
"SORT:  COMANDO que ordena una tabla interna manualmente.
"       La tabla NO nace ordenada.
"       Se ordena después usando SORT.

"
"   SORT lt_clientes BY nombre.

" También:
"   SORT lt_clientes BY edad DESCENDING.




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "  TIPOS DE TABLAS  "
"        1. Standard
"        2. Sorted
"        3. Hahsed



" 1. STANDARD TABLE: tabla interna más usada en ABAP.

"       Características:
"       - Permite duplicados
"       - Permite INDEX
"       - No mantiene orden automático
"       - Las búsquedas son más lentas que SORTED y HASHED

"       Ideal para:
"       - Recorrer registros con LOOP
"       - Insertar muchos datos
"       - Uso general

"   Ejemplo:
"       DATA lt_tabla TYPE STANDARD TABLE OF ty_datos.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 2. SORTED TABLE mantiene los datos ordenados automáticamente según la KEY definida.

"        Ventajas:
"       - Búsquedas más rápidas
"       - No hace falta usar SORT manualmente

"       Desventaja:
"       - Insertar registros es más lento que STANDARD TABLE

"   Ejemplo:
"       DATA lt_tabla TYPE SORTED TABLE OF ty_datos WITH NON-UNIQUE KEY id.


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 3. HASHED TABLE: usa una clave HASH para acceder muy rápido a los registros.
"               Es la tabla MÁS rápida para búsquedas exactas con KEY.

"       Características:
"       - No tiene índice
"       - No permite duplicados en la KEY
"       - La KEY debe ser UNIQUE
"       - Muy eficiente para READ TABLE WITH KEY

"       Ideal para:
"       - Validaciones
"       - Comprobaciones de existencia
"       - Búsquedas rápidas

"   Ejemplo:

"   DATA lt_hash TYPE HASHED TABLE OF ty_datos WITH UNIQUE KEY id.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


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
*    SELECT FROM /dmo/flight
*    FIELDS *
*    WHERE carrier_id = 'LM'
*    INTO TABLE @DATA(lt_vuelos).
*
*    SELECT carrier_id,
*           connection_id,
*           flight_date
*    FROM @lt_vuelos AS lt
*    INTO TABLE @DATA(lt_copia).
*
*    out->write( lt_vuelos ).
*    out->write( lt_copia ).



  ENDMETHOD.
ENDCLASS.
