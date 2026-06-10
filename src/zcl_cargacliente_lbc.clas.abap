CLASS zcl_cargacliente_lbc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_cargacliente_lbc IMPLEMENTATION.

METHOD if_oo_adt_classrun~main.

  "DELETE FROM zbd_cliente_lbc.   para ejercicios bien pero NO SE HACE NUNCA EN UN TRABAJO

  INSERT zbd_cliente_lbc FROM TABLE @(
    VALUE #(

      (
        client      = sy-mandt  "te escribe automaticamente el número cliente en lugar de hacerlo a mano -> 100
        id_empleado = '0001'
        nombre      = 'Paca'
        apellidos   = 'Garcia'
        telefono    = '600111111'
        correo      = 'paca@correo.com'
        direccion   = 'Calle Sol 10'
      )

      (
        client      = sy-mandt
        id_empleado = '0002'
        nombre      = 'Manolo'
        apellidos   = 'Lopez'
        telefono    = '600222222'
        correo      = 'manolo@correo.com'
        direccion   = 'Calle Luna 15'
      )

      (
        client      = sy-mandt
        id_empleado = '0003'
        nombre      = 'Marta'
        apellidos   = 'Ruiz'
        telefono    = '600333333'
        correo      = 'marta@correo.com'
        direccion   = 'Avenida Europa 5'
      )

      (
        client      = sy-mandt
        id_empleado = '0004'
        nombre      = 'Pedro'
        apellidos   = 'Martin'
        telefono    = '600444444'
        correo      = 'pedro@correo.com'
        direccion   = 'Calle Granada 8'
      )

      (
        client      = sy-mandt
        id_empleado = '0005'
        nombre      = 'Sara'
        apellidos   = 'Jimenez'
        telefono    = '600555555'
        correo      = 'sara@correo.com'
        direccion   = 'Plaza Mayor 3'
      )

      (
        client      = sy-mandt
        id_empleado = '0006'
        nombre      = 'Carlos'
        apellidos   = 'Diaz'
        telefono    = '600666666'
        correo      = 'carlos@correo.com'
        direccion   = 'Calle Real 25'
      )

    )
  ).

  COMMIT WORK.

  out->write( 'Clientes cargados correctamente' ).

ENDMETHOD.
ENDCLASS.
