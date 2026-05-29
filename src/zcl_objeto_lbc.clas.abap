CLASS zcl_objeto_lbc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_objeto_lbc IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


    DATA(lo_bd) = NEW zcl_fabrica_lbc( ).

"DELETE FROM zdb_alumnos_lbc.
  IF lo_bd IS BOUND.
     " lo_bd->r_masivos(  ).

    lo_bd->r_individual(  ).

   ENDIF.


  ENDMETHOD.


ENDCLASS.
