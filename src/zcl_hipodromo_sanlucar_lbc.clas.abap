CLASS zcl_hipodromo_sanlucar_lbc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_negocio_sanlucar_lbc.

ENDCLASS.

CLASS zcl_hipodromo_sanlucar_lbc IMPLEMENTATION.

  METHOD zif_negocio_sanlucar_lbc~get_nombre.
    r_nombre = 'Carreras de Caballos de la Playa'.
  ENDMETHOD.

  METHOD zif_negocio_sanlucar_lbc~get_tipo.
    r_tipo = 'Hipódromo'.
  ENDMETHOD.

  METHOD zif_negocio_sanlucar_lbc~get_descripcion.
    r_descripcion = 'Las carreras más antiguas de España, en la orilla del mar'.
  ENDMETHOD.

  METHOD zif_negocio_sanlucar_lbc~calcular_precio.
    r_precio = '5.00'.
  ENDMETHOD.

ENDCLASS.

*-----------------------------------------------------------------------
* APUNTE
*-----------------------------------------------------------------------
*
* Esta versión sirve cuando únicamente existe un hipódromo.
*
* Si en el futuro hubiera varios hipódromos NO crearíamos una clase
* distinta para cada uno, sino que utilizaríamos un constructor.
*
* La idea sería:
*
* CLASS zcl_hipodromo_sanlucar_lbc DEFINITION.
*
*   PUBLIC SECTION.
*
*     INTERFACES zif_negocio_sanlucar_lbc.
*
*     CONSTANTS tipo TYPE string VALUE 'Hipódromo'.
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
*   r_precio = '5.00'.
* ENDMETHOD.
*
*-----------------------------------------------------------------------
