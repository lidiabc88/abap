CLASS zcl_cargar_lbc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_cargar_lbc IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DELETE FROM zbd_empleado_lbc.

    INSERT zbd_empleado_lbc FROM TABLE @(
      VALUE #(
        (
          client        = '100'
          id_empleado   = '0001'
          nombre        = 'Lidia'
          apellidos     = 'Barnes'
          edad          = 37
          telefono      = '7777777'
          correo        = 'lidia@com'
          ciudad        = 'Granada'
          departamento  = 'Desarrollo'
          salario       = '1500.00'
          fecha_alta    = '20260525'
        )
        (
          client        = '100'
          id_empleado   = '0002'
          nombre        = 'Julia'
          apellidos     = 'Garcia'
          edad          = 43
          telefono      = '6666666'
          correo        = 'julia@com'
          ciudad        = 'Madrid'
          departamento  = 'Ventas'
          salario       = '1800.00'
          fecha_alta    = '20260525'
        )
        (
          client        = '100'
          id_empleado   = '0003'
          nombre        = 'Alejandra'
          apellidos     = 'Lopez'
          edad          = 44
          telefono      = '5555555'
          correo        = 'alejandra@com'
          ciudad        = 'Valencia'
          departamento  = 'Marketing'
          salario       = '1700.00'
          fecha_alta    = '20260525'
        )
      )
    ).

    COMMIT WORK.

    out->write( 'Datos insertados correctamente en zbd_empleado_lbc' ).

  ENDMETHOD.

ENDCLASS.
