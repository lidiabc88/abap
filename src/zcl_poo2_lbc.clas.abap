CLASS zcl_poo2_lbc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_poo2_lbc IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  data(lo_perro) = new zcl_poo_lbc(  ).
  data(lo_perro2) = new zcl_poo_lbc(  ).
  data(lo_perro3) = new zcl_poo_lbc(  ).


  if lo_perro3 is bound.

     lo_perro3->lv_nombre = 'Lola'.

    Out->write( lo_perro3->lanzar_pelota(  ) ).
    Out->write( lo_perro3->ladrar(  ) ).
    Out->write( lo_perro3->dormir(  ) ).

    endif.

  if lo_perro2 is bound.

    lo_perro2->lv_nombre = 'Paco'.


    Out->write( lo_perro2->lanzar_pelota(  ) ).
    Out->write( lo_perro2->ladrar(  ) ).

  endif.



  if lo_perro is bound.

    lo_perro->lv_nombre = 'Dante'.

    Out->write( lo_perro->ladrar(  ) ).

  endif.



  ENDMETHOD.
ENDCLASS.
