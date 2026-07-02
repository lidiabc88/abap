CLASS zcl_select_lbc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_select_lbc IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " EJERCICIO: ENCONTRAR EN LA BD A LOS MAYORES DE 18 Y EN NOMBRE, BORRARLES
  " LA ÚLTIMA LETRA Y AÑADIR S. EJEMPLO: LIDIA -> LIDIS
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  " 1. Seleccionamos a los mayores de 18

    SELECT FROM zbd_empleado_der  "es la db de DANI
    FIELDS *
    WHERE edad > 18
    INTO TABLE @DATA(lt_empleados).

    " 2. Modificamos en memoria

        LOOP AT lt_empleados INTO DATA(ls_empleado).

        DATA(lv_longitud) = strlen( ls_empleado-nombre ).

        IF lv_longitud > 0.                                                 "Cogemos el caract 0 hasta el penúltimo, y añadimos S

            ls_empleado-nombre = substring( val = ls_empleado-nombre        "la cadena de caracteres que se examina
                                            off = 0                         "la posicion de inicio  desde donde se quiere extraer la subcadena
                                            len = lv_longitud - 1 ) && 'S'. "con la longitud calculada (-1) porque queremos que quite eso

        ENDIF.
        MODIFY lt_empleados FROM ls_empleado. "almecenamos todo en la bd

        ENDLOOP.

        " 3. Guardamos los cambios en la  BD

        MODIFY zbd_empleado_der FROM TABLE @lt_empleados.  "se suben los datos



  ENDMETHOD.
ENDCLASS.
