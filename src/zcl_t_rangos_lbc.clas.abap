CLASS zcl_t_rangos_lbc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_t_rangos_lbc IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  " sing - > dice si la condicion es incluir (I) o excluir (E)
  "         I = lo quiero
  "         E = no lo quiero

  " option -> Dice el tipo de comparación
    "EQ = Igual que
    "NE = No igual que
    "GT = Mayor que
    "LT = Menor que
    "GE = Mayor o igual que
    "LE = Menor o igual que
    "CP = Contiene el patrón
    "NP = No contiene el patrón
    "BT = Entre
    "NB = No entre

    " Imaginar una lista de coches y quieres los rojos y tambien los azules pero no lo amarillos

    "sing       option  low       high
    "I          EQ      rojo
    "I          EQ      azul
    "E          EQ      amarillo

  DATA lr_asientos TYPE RANGE OF /dmo/plane_seats_occupied.



  " quiero vuelos que incluyan asientos entre 50 y 100
  APPEND value #( sign = 'I' option = 'BT' low = 50 high = 100 ) to lr_asientos.


 " quiero vuelos con 150 asientos
  APPEND value #( sign = 'I' option = 'EQ' low = 150 ) to lr_asientos.

   out->write( lr_asientos ).

   " pero NO quiero vuelos con menos de 10
   APPEND value  #( sign = 'E' option = 'LT' low = 10 ) to lr_asientos.

   DATA lt_vuelos type TABLE OF /dmo/flight.

   SELECT * FROM /dmo/flight
   WHERE seats_occupied IN @lr_asientos
   INTO TABLE @lt_vuelos.

   LOOP AT lt_vuelos INTO DATA(ls_vuelos).

   out->write( ls_vuelos ).

   ENDLOOP.

  ENDMETHOD.
ENDCLASS.
