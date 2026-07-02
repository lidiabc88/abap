CLASS zcl_cargaproductos_lbc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_cargaproductos_lbc IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DELETE FROM zproductos.

    INSERT zproductos FROM TABLE @(
      VALUE #(

        (
          client     = sy-mandt
          id_producto = '00000001'
          nombre     = 'Pan'
          precio     = 1
          categoria  = 'Alimentacion'
        )

        (
          client     = sy-mandt
          id_producto = '00000002'
          nombre     = 'Leche'
          precio     = 2
          categoria  = 'Alimentacion'
        )

        (
          client     = sy-mandt
          id_producto = '00000003'
          nombre     = 'Television'
          precio     = 450
          categoria  = 'Electronica'
        )

        (
          client     = sy-mandt
          id_producto = '00000004'
          nombre     = 'Raton'
          precio     = 25
          categoria  = 'Electronica'
        )

        (
          client     = sy-mandt
          id_producto = '00000005'
          nombre     = 'Chocolate'
          precio     = 3
          categoria  = 'Alimentacion'
        )

      )
    ).

    COMMIT WORK.

    out->write( 'Productos cargados correctamente' ).

  ENDMETHOD.
ENDCLASS.
