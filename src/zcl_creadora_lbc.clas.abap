CLASS zcl_creadora_lbc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.

    TYPES tty_emp TYPE STANDARD TABLE OF ztab_eje_obj_lbc WITH EMPTY KEY. "el tipo tabla que hereda los campos de la base de datos

    METHODS constructor
      IMPORTING
        iv_nombre          TYPE zde_nombre_lbc
        iv_apellido        TYPE zde_nombre_lbc
        iv_telefono        TYPE zde_tele_lbc
        iv_experiencia     TYPE i               "este lo ponemos tipo i porque no lo hemos creado en data element
        iv_certificaciones TYPE i.

    METHODS calcular_sueldo.

    METHODS ex_id_empleado.     "obtiene el siguiente id que corresponda

    METHODS alta_empleado       "inserta un empleado en la bd
      RETURNING VALUE(rv_mensaje) TYPE string.

    METHODS modificacion        "modifica el empleado existente
      IMPORTING
        iv_id_empleado     TYPE i
        iv_nombre          TYPE zde_nombre_lbc
        iv_apellido        TYPE zde_nombre_lbc
        iv_telefono        TYPE zde_tele_lbc
        iv_experiencia     TYPE i
        iv_certificaciones TYPE i
      RETURNING VALUE(rv_mensaje) TYPE string.

    METHODS traer_lt            "devuelve un empleado concreto o todos
      IMPORTING iv_id_empleado TYPE i
      RETURNING VALUE(rv_tabla) TYPE tty_emp.

    METHODS traer_n_filas       "devuelve las primeras N filas de la tabla
      IMPORTING iv_n_filas TYPE i
      RETURNING VALUE(rv_tabla) TYPE tty_emp.

  PRIVATE SECTION.

    DATA lt_registro TYPE tty_emp.      "tabla interna que almacena datos recuperados
    DATA ls_prueba TYPE ztab_eje_obj_lbc.   "estructura de trabajo para inserciones o modificaciones
    DATA experiencia TYPE i.
    DATA id_empleado TYPE i.
    DATA certificaciones TYPE i.

ENDCLASS.



CLASS zcl_creadora_lbc IMPLEMENTATION.

  METHOD constructor.
                                        "Guarda los datos recibidos en la estructura interna
    me->ls_prueba-nombre = iv_nombre.
    me->ls_prueba-apellido = iv_apellido.
    me->ls_prueba-telefono = iv_telefono.
    me->ls_prueba-currency_code = 'EUR'.        "moneda fija para todos los empleados

    me->experiencia = iv_experiencia.
    me->certificaciones = iv_certificaciones.

  ENDMETHOD.


  METHOD calcular_sueldo.

    me->ls_prueba-sueldo = ( me->certificaciones * 50 + me->experiencia * 100 ) + 1000.

  ENDMETHOD.


  METHOD ex_id_empleado.        "busca el ID mas alto existente

    SELECT MAX( id_empleado )
      FROM ztab_eje_obj_lbc
      INTO @DATA(lv_max_id).

    IF sy-subrc = 0 AND lv_max_id IS NOT INITIAL.       "si existe algún registro...
      me->ls_prueba-id_empleado = lv_max_id + 1.        "asigna el siguiente ID
    ELSE.
      me->ls_prueba-id_empleado = 1.    "si no hay registro empieza por el 1
    ENDIF.

  ENDMETHOD.


  METHOD alta_empleado.

    me->calcular_sueldo( ). "calcula el sueldo antes de guardar

    IF me->id_empleado IS NOT INITIAL.              "si existe un ID previamente asignado
      me->ls_prueba-id_empleado = me->id_empleado.
    ELSE.
      me->ex_id_empleado( ).        "si el alta nueva genera un ID
    ENDIF.

    MODIFY ztab_eje_obj_lbc FROM @me->ls_prueba.    "inserta o actualiza el registro en la BD

    IF sy-subrc = 0.        "comprobación
      COMMIT WORK.
      rv_mensaje = 'Subida correcta'.
    ELSE.
      rv_mensaje = 'Error en la Subida'.
    ENDIF.

  ENDMETHOD.


  METHOD modificacion.

    me->id_empleado = iv_id_empleado.       "guarda la ID recibida

    me->ls_prueba-nombre = iv_nombre.       "actualiza los datos
    me->ls_prueba-apellido = iv_apellido.
    me->ls_prueba-telefono = iv_telefono.
    me->ls_prueba-currency_code = 'EUR'.

    me->experiencia = iv_experiencia.
    me->certificaciones = iv_certificaciones.

    SELECT SINGLE @abap_true            "comprueba si existe el empleado
      FROM ztab_eje_obj_lbc
      WHERE id_empleado = @me->id_empleado
      INTO @DATA(lv_existe).

    IF sy-subrc = 0.
      rv_mensaje = me->alta_empleado( ).        "di existe reutiliza el metodo de alta
    ELSE.                                       "si no, mensaje de error
      rv_mensaje = 'El ID no existe en la base de datos, no se ha podido hacer la modificación.'.
    ENDIF.

  ENDMETHOD.


  METHOD traer_lt.

    CLEAR me->lt_registro.      "limpia la tabla interna

    IF iv_id_empleado = 0.      "si recibe un ID = 0 , devuelve todos

      SELECT *
        FROM ztab_eje_obj_lbc
        ORDER BY id_empleado
        INTO TABLE @me->lt_registro.

    ELSE.

      SELECT *                         "si recibe un ID devuelve solo ese empleado
        FROM ztab_eje_obj_lbc
        WHERE id_empleado = @iv_id_empleado
        ORDER BY id_empleado
        INTO TABLE @me->lt_registro.

    ENDIF.

    rv_tabla = me->lt_registro.

  ENDMETHOD.


  METHOD traer_n_filas.

    CLEAR me->lt_registro.      "limpia la tabla de nuevo

    SELECT *
      FROM ztab_eje_obj_lbc
      ORDER BY id_empleado
      INTO TABLE @me->lt_registro
      UP TO @iv_n_filas ROWS.

    rv_tabla = me->lt_registro.

  ENDMETHOD.

ENDCLASS.
