CLASS zcl_bd_lbc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_bd_lbc IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

     " ------------------------------------------------------------
    " 1. EXTRAER TODA LA INFORMACION DE LA BASE DE DATOS
    "    Y VOLCARLA EN UNA TABLA INTERNA
    " ------------------------------------------------------------

    SELECT FROM zbd_empleado_lbc
      FIELDS client,
             id_empleado,
             nombre,
             apellidos,
             edad,
             telefono,
             correo,
             ciudad,
             departamento,
             salario,
             fecha_alta
      INTO TABLE @DATA(lt_empleados).


    " ------------------------------------------------------------
    " 2. MOSTRAR TODA LA TABLA INTERNA POR CONSOLA
    " ------------------------------------------------------------

    out->write( '========================================' ).
    out->write( 'TODOS LOS EMPLEADOS DE LA BASE DE DATOS' ).
    out->write( '========================================' ).
    out->write( lt_empleados ).


    " ------------------------------------------------------------
    " 3. INDICAR EL TAMAÑO TOTAL DE LA BASE DE DATOS
    " ------------------------------------------------------------

    DATA lv_total TYPE i.

    lv_total = lines( lt_empleados ).

    out->write( '========================================' ).
    out->write( 'TAMAÑO TOTAL DE LA BASE DE DATOS' ).
    out->write( '========================================' ).
    out->write( |Total de registros: { lv_total }| ).


    " ------------------------------------------------------------
    " 4. BUSCAR EL REGISTRO DE JULIA@COM
    " ------------------------------------------------------------

    READ TABLE lt_empleados INTO DATA(ls_empleado)
      WITH KEY correo = 'julia@com'.


    " ------------------------------------------------------------
    " 5. MOSTRAR EL REGISTRO Y SU INDEX / POSICION
    " ------------------------------------------------------------

    IF sy-subrc = 0.

      DATA lv_index TYPE i.

      lv_index = sy-tabix.

      out->write( '========================================' ).
      out->write( 'REGISTRO ENCONTRADO CON CORREO JULIA@COM' ).
      out->write( '========================================' ).

      out->write( ls_empleado ).

      out->write( '========================================' ).
      out->write( 'POSICION DEL REGISTRO EN LA TABLA INTERNA' ).
      out->write( '========================================' ).

      out->write( |Index encontrado: { lv_index }| ).

    ELSE.

      out->write( '========================================' ).
      out->write( 'REGISTRO NO ENCONTRADO' ).
      out->write( '========================================' ).

      out->write( 'No existe ningun empleado con correo julia@com' ).

    ENDIF.

  ENDMETHOD.

ENDCLASS.
