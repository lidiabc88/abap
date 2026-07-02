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


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"CREAR UNA BD
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " key con los campos clave que no se repiten, como un DNI
    " not null se suele poner casi siempre en key y es para decir que el campo es OBLIGATORIO
    " lo que va después del : puedes darle a cnt + espacio y buscar.
    "                         ej. si es fecha -> abap.dats que es la palabra clave
    " acaba en ;
    " IMPORTANTE: antes de activar es imprescindible que esté bien escrito o sino luego es fatidico cambiarlo


    "modify - > modificar
    "delete - > borrar
            "delete lt_empleado FROM 2 to 4
            "delete lt_empleado index 2.
            "delete lt_empleados WHERE nombre is INITIAL
            "DELETE  ADJACENT DUPLICATES FROM lt_empleados COMPARING nombre -> para campos duplicados


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EJERCICIO: Crear una nueva base de datos y meterle mínimo 3 registros/filas.
" En una nueva clase, extraer toda la info
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    SELECT FROM zbd_empleado_lbc  "esta es la BD que he creado
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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mostrar la tabla por consola
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


    out->write( 'TODOS LOS EMPLEADOS DE LA BASE DE DATOS' ).
    out->write( |  | ).
    out->write( lt_empleados ).


 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tamaño total de la BD
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    DATA lv_total TYPE i.

    lv_total = lines( lt_empleados ).

    out->write( |  | ).
    out->write( 'TAMAÑO TOTAL DE LA BASE DE DATOS' ).
    out->write( |  | ).
    out->write( |Total de registros: { lv_total }| ).


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Buscar el registro @julia
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    READ TABLE lt_empleados INTO DATA(ls_empleado)
      WITH KEY correo = 'julia@com'.


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mostrar el resgistro y su index (posicion)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    IF sy-subrc = 0.

      DATA lv_index TYPE i.

      lv_index = sy-tabix.

      out->write( |  | ).
      out->write( 'REGISTRO ENCONTRADO CON CORREO JULIA@COM' ).
      out->write( |  | ).

      out->write( ls_empleado ).

      out->write( |  | ).
      out->write( 'POSICION DEL REGISTRO EN LA TABLA INTERNA' ).
      out->write( |  | ).

      out->write( |Index encontrado: { lv_index }| ).

    ELSE.

      out->write( |  | ).
      out->write( 'REGISTRO NO ENCONTRADO' ).
      out->write( |  | ).

      out->write( 'No existe ningun empleado con correo julia@com' ).

    ENDIF.

  ENDMETHOD.

ENDCLASS.
