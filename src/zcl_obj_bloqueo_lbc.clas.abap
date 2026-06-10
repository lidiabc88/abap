CLASS zcl_obj_bloqueo_lbc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_obj_bloqueo_lbc IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  out->write( 'El usuario ha empezado el programa'  ).

  try.

  data(lo_lock_object) = cl_abap_lock_object_factory=>get_instance(  exporting iv_name = 'EZINV_ARR' ).

  CATCH cx_abap_lock_failure.
        out->write( 'El objeto de instancia no se ha creado' ).
        return.

  ENDTRY.

  data lt_parameter type if_abap_lock_object=>tt_parameter.

  lt_parameter = value #( (  name = 'ID'
                             value = ref #( '00000001' )    ) ).


  try.
    lo_lock_object->enqueue(

        " it_table_mode =
        it_parameter = lt_parameter
        "_scope =
        "_wait =
        ).

        catch cx_abap_foreign_lock cx_abap_lock_failure.
          out->write( 'El objeto ya esta siendo tratado por otro usuario' ) .
           return.

  out->write(  'El objeto ya esta disponible' ).


    if sy-subrc = 0.
      out->write( 'La base de datos ha sido actualizada' ).
    endif.

    try.
    lo_lock_object->dequeue(
        " it_table_mode =
        it_parameter = lt_parameter
        ).

      catch cx_abap_lock_failure.
        out->write( 'El objeto de instancia no se ha creado' ).
        return.
    endtry.

        lo_lock_object->dequeue( it_parameter = lt_parameter ).
        out->write( 'El objeto no ha sido liberado' ).

    ENDTRY.
    out->write( 'El obejto ha sido liberado' ).



  ENDMETHOD.
ENDCLASS.
