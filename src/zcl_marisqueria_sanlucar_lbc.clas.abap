CLASS zcl_marisqueria_sanlucar_lbc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_negocio_sanlucar_lbc.

ENDCLASS.

CLASS zcl_marisqueria_sanlucar_lbc IMPLEMENTATION.

  METHOD zif_negocio_sanlucar_lbc~get_nombre.
    r_nombre = 'Casa Bigote'.
  ENDMETHOD.

  METHOD zif_negocio_sanlucar_lbc~get_tipo.
    r_tipo = 'Marisquería'.
  ENDMETHOD.

  METHOD zif_negocio_sanlucar_lbc~get_descripcion.
    r_descripcion = 'Langostinos de Sanlúcar y tortillitas de camarones'.
  ENDMETHOD.

  METHOD zif_negocio_sanlucar_lbc~calcular_precio.
    r_precio = '25.00'.
  ENDMETHOD.

ENDCLASS.

*-----------------------------------------------------------------------
* APUNTE
*-----------------------------------------------------------------------
*
* Esta versión sirve cuando únicamente existe una marisquería.
*
* Si en el futuro hubiera varias marisquerías NO crearíamos una clase
* distinta para cada una, sino que utilizaríamos un constructor.
*
* La idea sería:
*
* CLASS zcl_marisqueria_sanlucar_lbc DEFINITION.
*
*   PUBLIC SECTION.
*
*     INTERFACES zif_negocio_sanlucar_lbc.
*
*     CONSTANTS tipo TYPE string VALUE 'Marisquería'.
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
*-----------------------------------------------------------------------
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
*   r_precio = '25.00'.
* ENDMETHOD.
*
*-----------------------------------------------------------------------
