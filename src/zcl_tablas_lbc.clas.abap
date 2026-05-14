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

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Hay dos tipos de tablas: internas y bases de datos
    " para las tablas internas se usa: LOOP AT
    " para las bases de datos se usa: SELECT

    " hay tablas de bases de datos hechas a las que podemos hacer referencia con /dmo/xxx{
    " y cogerá los datos de esa tabla
    " la estructura es data ls_empleado type /dmo/airport

    "para navegar por esas tablas debe ser desde la cuenta trial con cnt y pulsar encima con el cursor


*  types: BEGIN OF ty_persona,
*
*       nombre   TYPE string,
*
*       edad     TYPE i,
*
*       telefono TYPE  string, "el telefono es string
*
*       email type string,
*
*   END OF TY_persona.
*
*
*
*
*
*  DATA lt_cliente type table of ty_persona.
*
*  data lt_empleado type TABLE of ty_persona.
*
*  data ls_cliente type ty_persona.



* ls_cliente-nombre = 'Toñi'.

* ls_cliente-edad = 33.

* ls_cliente-telefono = '+34958265471'.

* ls_cliente-email = 'toniar1969@gmail.com'.

*

* insert ls_cliente into table lt_empleado.



*ls_cliente-nombre = 'dani'.
*
*ls_cliente-edad = 33.
*
*ls_cliente-telefono = '+34958265471'.
*
*ls_cliente-email = 'toniar1969@gmail.com'.
*
*
*
*insert ls_cliente into table lt_cliente.
*
*
*
*ls_cliente-nombre = 'Paco'.
*
*ls_cliente-edad = 33.
*
*ls_cliente-telefono = '+34958265471'.
*
*ls_cliente-email = 'toniar1969@gmail.com'.
*
*
*
*insert ls_cliente into table lt_cliente.
*

*
*ls_cliente-nombre = 'Laura'.
*
*ls_cliente-edad = 43.
*
*ls_cliente-telefono = '+34958265471'.
*
*ls_cliente-email = 'toniar1969@gmail.com'.
*
*
*
*insert ls_cliente into lt_cliente index 2. " el index fuerza una posicion contreta en el regustro de una tabla
*
*
*
*ls_cliente-nombre = 'raul'.
*
*ls_cliente-edad = 23.
*
*ls_cliente-telefono = '+34958265471'.
*
*ls_cliente-email = 'toniar1969@gmail.com'.
*
*
*
*insert ls_cliente into lt_cliente index 2.

    "out->write( lt_cliente ) .





*    loop at lt_cliente into ls_cliente.
*
*            out->write( ls_cliente ).
*
*        if ls_cliente-edad = 33.
*
*            out->write( 'ahora estoy dentro del if' ).
*
*            out->write( ls_cliente ).
*
*        endif.
*
*    endloop.







    """""""""""""""""""""""""""""""""


*
*   types: BEGIN OF ty_persona2,
*
*       animal   TYPE string,
*
*       edad     TYPE i,
*
*       telefono TYPE  string, "el telefono es string
*
*       email type string,
*
*   END OF TY_persona2.
*
*
*
*  data lt_animal type table of ty_persona2.
*
*  data ls_animal type ty_persona2.
*
*
*
*
*
*" con esta forma no necesitamos de una estructura para introducir datos en una tabla
*
*insert value #( animal = 'perro' edad = 12 telefono = '3333' email = 'alsdfjas' ) into table lt_animal.
*
*insert value #( animal = 'gato' edad = 12 telefono = '3333' email = 'alsdfjas' ) into table lt_animal.
*
*insert value #( animal = 'loro' edad = 12 telefono = '3333' email = 'alsdfjas' ) into  lt_animal index 2.


*
*
*    loop at lt_animal into ls_animal.
*
*
*
*        if ls_animal-animal = 'perro'.
*
*       " out->write( | nombre del animal: {  ls_animal-animal }  edad {  ls_animal-edad }| ).
*
*        endif.
*
*    endloop.

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    "Otro ejemplo de tablas en clase

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    TYPES:BEGIN OF ty_empleado,
            nombre   TYPE string,
            edad     TYPE /dmo/carrier_id,
            telefono TYPE string,
            correo   TYPE string,

          END OF ty_empleado.

    DATA ls_empleado TYPE ty_empleado.
    DATA lt_empleado TYPE TABLE OF ty_empleado. "es estandar
*      data lt_empleado2 type STANDARD TABLE OF ty_empleado. "podemos elegir si es estandar
*      data lt_empleado3 TYPE table of ty_empleado. "standar declarada de otra manera
*      data lt_empleado_sorted type sorted TABLE OF ty_empleado with NON-UNIQUE key correo. "puede tener tambien UNIQUE
*      data lt_empleado_hash type HASHED TABLE OF ty_empleado with UNIQUE key correo. "

    "INTO TABLE LO ENVIA EN EL SIGUIENTE CAMPO QUE ENCUENTRA
    "INDEX te lo pone en la posicion que le dices, ejemplos abajo:

    ls_empleado-nombre = 'Daniel'.
    ls_empleado-edad = 30.
    ls_empleado-telefono = '+346121314'.
    ls_empleado-correo = 'daniel@gmail.com'.

    INSERT ls_empleado INTO lt_empleado INDEX 2.

    ls_empleado-nombre = 'Paco'.
    ls_empleado-edad = 33.
    ls_empleado-telefono = '+34958265471'.
    ls_empleado-correo = 'toniar1969@gmail.com'.


    INSERT ls_empleado INTO lt_empleado INDEX 3.

    ls_empleado-nombre = 'Lidia'.
    ls_empleado-edad = 37.
    ls_empleado-telefono = '+34666999222'.
    ls_empleado-correo = 'lidia9@gmail.com'.

    INSERT ls_empleado INTO lt_empleado INDEX 4.

    ls_empleado-nombre = 'Juan'.
    ls_empleado-edad = 22.
    ls_empleado-telefono = '+346112255'.
    ls_empleado-correo = 'juan@gmail.com'.

    INSERT ls_empleado INTO lt_empleado INDEX 1. "a juan lo manda a la fila 2


    LOOP AT lt_empleado INTO ls_empleado. "

      out->write( |nombre-> { ls_empleado-nombre }, edad-> { ls_empleado-edad } | ).

    ENDLOOP.

    IF ls_empleado-nombre = 'Fernando'. "para buscar la fila de Fernando

      out->write( ls_empleado ).
    ENDIF.


    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "Si queremos encontrar todas personas que tengan 23 y que nos salga su nombre, telefono y correo

    IF ls_empleado-edad = '23'.
      out->write( |nombre-> { ls_empleado-nombre }, telefono-> { ls_empleado-telefono }, correo-> { ls_empleado-correo } | ).

    ENDIF.


    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Ejercicio: inventarse datos de 4 registros de la bd de aeropueto
    " Si dudas de los datos le puedes dar cnt + espacio y te dice los campos

    DATA ls_aeropuerto TYPE /dmo/airport.
    DATA lt_aeropuerto TYPE TABLE OF /dmo/airport.

    "la forma moderna seria:
    " ls_aeropuerto = value #
    " airport_id = 'MDD'
    " name = 'Aeropuerto de Madrid'
    " city = 'Madrid'


    ls_aeropuerto-airport_id = 'BNK'.
    ls_aeropuerto-name = 'Aeropuerto de Bangkok'.
    ls_aeropuerto-city = 'Bangkok'.
    ls_aeropuerto-country = 'TH'.

    INSERT ls_aeropuerto INTO TABLE lt_aeropuerto.

    ls_aeropuerto-airport_id = 'MLG'.
    ls_aeropuerto-name = 'Aeropuerto de Málaga'.
    ls_aeropuerto-city = 'Málaga'.
    ls_aeropuerto-country = 'SP'.

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


    out->write( 'TABLA' ).
    out->write( lt_aeropuerto ).

    DATA lv_aeropuerto_find TYPE i.

    out->write( 'Filtración' ).


    "Si queremos encontrar todos los aeropuertos que empiecen por "M":
    "forma 1 de hacerlo:

    LOOP AT lt_aeropuerto INTO ls_aeropuerto.

      lv_aeropuerto_find = find( val = ls_aeropuerto-city sub = 'M' ).

      IF lv_aeropuerto_find = 0.

        out->write( ls_aeropuerto ).

      ENDIF.

    ENDLOOP.

    "forma 2 de hacerlo:

*    LOOP at lt_aeropuerto INTO ls_aeropuerto WHERE city CP 'M*'.

    "CP significa Contains PAttern (contiene patrón)
    "M* significa que son palabras que empiean por M

*        out->write( ls_aeropuerto ).
*        out->write( lt_aeropuerto ).

    "forma 3 de hacerlo:

*    LOOP at lt_aeropuerto INTO ls_aeropuerto
*        if ls_aeropuerto-city(1) = 'm'. "que la M esté en la posiciín 1 por eso pone (1)
*            out->write( 'Se ha encontrado un registro cuya ciudad empieza por M:' ).
*            out->write( ls_aeropuerto ).

*    endloop.


  ENDMETHOD.
ENDCLASS.
