CLASS zcl_bodega_sanlucar_lbc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.

    INTERFACES zif_negocio_sanlucar_lbc.

ENDCLASS.



CLASS zcl_bodega_sanlucar_lbc IMPLEMENTATION.

  METHOD zif_negocio_sanlucar_lbc~get_nombre.
    r_nombre = 'Bodega Hidalgo La Gitana'.
  ENDMETHOD.

  METHOD zif_negocio_sanlucar_lbc~get_tipo.
    r_tipo = 'Bodega'.
  ENDMETHOD.

  METHOD zif_negocio_sanlucar_lbc~get_descripcion.
    r_descripcion = 'Manzanilla en rama desde 1792, frente al Guadalquivir'.
  ENDMETHOD.

  METHOD zif_negocio_sanlucar_lbc~calcular_precio.
    r_precio = '12.00'.
  ENDMETHOD.

ENDCLASS.

*-----------------------------------------------------------------------
* APUNTE
*-----------------------------------------------------------------------
*
* Esta versión sirve cuando únicamente existe una bodega.
*
* Si en el futuro hubiera varias bodegas NO crearíamos una clase distinta
* para cada una, sino que utilizaríamos un constructor.
*
* La idea sería:
*
* CLASS zcl_bodega_sanlucar_lbc DEFINITION.
*
*   PUBLIC SECTION.
*
*     INTERFACES zif_negocio_sanlucar_lbc.
*
*     CONSTANTS tipo TYPE string VALUE 'Bodega'.
*
*     DATA:
*       nombre       TYPE string,
*       descripcion  TYPE string.
*
*     METHODS constructor
*       IMPORTING
*         i_nombre       TYPE string
*         i_descripcion  TYPE string.
*
* ENDCLASS.
*
*---------------------------------------------------------------
*
* IMPLEMENTACIÓN
*
* METHOD constructor.
*   me->nombre = i_nombre.
*   me->descripcion = i_descripcion.
* ENDMETHOD.
*
* METHOD get_nombre.
*   r_nombre = nombre.
* ENDMETHOD.
*
* METHOD get_tipo.
*   r_tipo = tipo.
* ENDMETHOD.
*
* METHOD get_descripcion.
*   r_descripcion = descripcion.
* ENDMETHOD.
*
* METHOD calcular_precio.
*   r_precio = '12.00'.
* ENDMETHOD.
*
*-----------------------------------------------------------------------
