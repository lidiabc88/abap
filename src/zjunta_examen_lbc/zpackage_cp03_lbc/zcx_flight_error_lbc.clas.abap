CLASS zcx_flight_error_lbc DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    DATA mv_message TYPE string READ-ONLY.

    METHODS constructor
      IMPORTING
        iv_message TYPE string OPTIONAL
        !previous  LIKE previous OPTIONAL.

    METHODS get_text REDEFINITION.

ENDCLASS.

CLASS zcx_flight_error_lbc IMPLEMENTATION.

  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    super->constructor( previous = previous ).

    me->mv_message = iv_message.
  ENDMETHOD.

  METHOD get_text.
     if me->mv_message IS NOT INITIAL.
      result = me->mv_message.
    else.
      result = super->get_text( ).
    endif.
  ENDMETHOD.

ENDCLASS.
