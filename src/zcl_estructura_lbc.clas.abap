CLASS zcl_estructura_lbc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS ZCL_ESTRUCTURA_LBC IMPLEMENTATION.


METHOD if_oo_adt_classrun~main.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ESTRUCTURA SIMPLE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    DATA lv_var TYPE string VALUE '+340000'.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CREACIÓN DE UN TIPO
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    TYPES: BEGIN OF ty_persona,

             nombre TYPE string,
             edad TYPE i,
             telefono TYPE string,
             email TYPE string,

           END OF ty_persona.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" DECLARACIÓN DE ESTRUCTURAS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    " Estructura vacía sin valores

    DATA ls_persona TYPE ty_persona.

    DATA ls_cliente TYPE ty_persona.

    DATA ls_empleado TYPE ty_persona.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MOSTRAR ESTRUCTURA VACÍA
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    out->write( ls_empleado ).

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ASIGNAR VALORES A UNA ESTRUCTURA
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    ls_cliente-nombre = 'Daniel'.
    ls_cliente-edad = 33.
    ls_cliente-telefono = '+346660001211'.
    ls_cliente-email = 'daniel@blabla.com'.

    ls_empleado-nombre = 'Paco'.
    ls_empleado-edad = 50.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MOSTRAR ESTRUCTURAS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    out->write( ls_empleado ).

    out->write( ls_cliente ).

    out->write( ls_persona ).

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OTRAS FORMAS DE CREAR ESTRUCTURAS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    " Forma 2:
    " DATA(ls_empleado2) = VALUE ty_persona(
    " nombre = 'Daniel'
    " edad = 32
    " telefono = '+34000000' ).

    " Forma 3:
    " ls_empleado = VALUE #(
    " nombre = 'Sara'
    " edad = 32
    " telefono = '+34000000' ).

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VALUE TY_PERSONA
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    " Se crea la estructura y se asigna el tipo
    " en la misma línea

    DATA(ls_persona2) = VALUE ty_persona(

      nombre = 'Daniel'
      edad = 32
      email = 'daniel@correo.com'
      telefono = '6000000'

    ).

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VALUE #
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    " La estructura ya existe previamente,
    " por eso usamos VALUE #

    ls_persona = VALUE #(

      nombre = 'Fernando'
      edad = 32
      email = 'fernando@correo.com'
      telefono = '6000000'

    ).

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EJERCICIO 1 - STOCK DE MUEBLES
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    TYPES: BEGIN OF ty_muebles,

             sofas TYPE i,
             mesas TYPE i,
             sillas TYPE i,
             camas TYPE i,

           END OF ty_muebles.

    DATA ls_muebles TYPE ty_muebles.

    ls_muebles-sofas = 10.
    ls_muebles-mesas = 20.
    ls_muebles-sillas = 30.
    ls_muebles-camas = 40.

    out->write( ls_muebles ).

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ESTRUCTURA ANIDADA
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    " También se pueden crear estructuras directamente

*    DATA: BEGIN OF ls_empleado,
*
*            nombre TYPE string VALUE 'Laura',
*            id TYPE i VALUE 5,
*            email TYPE /dmo/email_address VALUE 'correo@gmail.com',
*
*          END OF ls_empleado.
*
*    out->write( ls_empleado ).

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CREAR DOMINIOS Y DATA ELEMENTS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    " 1. Botón derecho sobre package
    " 2. Crear Domain
    " 3. Crear Data Element
    " 4. Asignar el dominio al Data Element
    " 5. Activar ambos

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EJEMPLO CON DATA ELEMENT
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    TYPES: BEGIN OF ty_empleado,

             nombre TYPE zde_nombre_lbc,
             edad TYPE i,
             telefono TYPE string,
             email TYPE string,

           END OF ty_empleado.

ENDMETHOD.
ENDCLASS.
