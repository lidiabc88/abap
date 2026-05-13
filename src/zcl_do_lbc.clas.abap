CLASS zcl_do_lbc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_do_lbc IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "DO

    DATA lv_num TYPE i VALUE 0.

    DO 5 TIMES.
      lv_num = lv_num + 1.
      out->write( lv_num ).
    ENDDO.

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "WHILE

    DATA lv_num2 TYPE i VALUE 0.

    WHILE lv_num2 < 10.
      lv_num2 += 1.
      out->write( lv_num2 ).
    ENDWHILE.

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "FOR (con EXIT)

    DATA lv_num3 TYPE i VALUE 0.

    WHILE lv_num3 < 10.
      lv_num3 += 1.
      out->write( lv_num3 ).

      IF lv_num3 = 3.
        EXIT.
      ENDIF.
    ENDWHILE.

    out->write( 'Fin de programa' ).

  ENDMETHOD.
ENDCLASS.
