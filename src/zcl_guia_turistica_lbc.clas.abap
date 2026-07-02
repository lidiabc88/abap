CLASS zcl_guia_turistica_lbc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

ENDCLASS.



CLASS zcl_guia_turistica_lbc IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    " Tabla de referencias a la interfaz.
    " Gracias al polimorfismo podemos guardar objetos de distintas clases
    " (bodega, marisquería, hipódromo...) siempre que implementen la interfaz.
    DATA negocios TYPE TABLE OF REF TO zif_negocio_sanlucar_lbc.

    APPEND NEW zcl_bodega_sanlucar_lbc( )      TO negocios.
    APPEND NEW zcl_marisqueria_sanlucar_lbc( ) TO negocios.
    APPEND NEW zcl_hipodromo_sanlucar_lbc( )   TO negocios.

    LOOP AT negocios INTO DATA(negocio).

      out->write(
        |[{ negocio->get_tipo( ) }] { negocio->get_nombre( ) } — { negocio->get_descripcion( ) } (Precio: { negocio->calcular_precio( ) DECIMALS = 2 } €)| ).

    ENDLOOP.

  ENDMETHOD.

ENDCLASS.

*-----------------------------------------------------------------------
* APUNTE
*-----------------------------------------------------------------------
*
* Si las clases tuvieran un CONSTRUCTOR, el programa cambiaría
* ligeramente.
*
* En lugar de crear el objeto directamente con:
*
*   APPEND NEW zcl_bodega_sanlucar_lbc( ) TO negocios.
*
* habría que pasar los datos al constructor:
*
*   DATA lo_negocio TYPE REF TO zif_negocio_sanlucar_lbc.
*   DATA lt_negocios TYPE TABLE OF REF TO zif_negocio_sanlucar_lbc.
*
*   lo_negocio = NEW zcl_bodega_sanlucar_lbc(
*                    i_nombre      = 'Bodega Hidalgo'
*                    i_descripcion = 'La mejor manzanilla' ).
*
*   APPEND lo_negocio TO lt_negocios.
*
*   lo_negocio = NEW zcl_marisqueria_sanlucar_lbc(
*                    i_nombre      = 'Casa Bigote'
*                    i_descripcion = 'Langostinos de Sanlúcar' ).
*
*   APPEND lo_negocio TO lt_negocios.
*
*   LOOP AT lt_negocios INTO lo_negocio.
*
*     out->write(
*       |[{ lo_negocio->get_tipo( ) }] |
*       && |{ lo_negocio->get_nombre( ) } - |
*       && |{ lo_negocio->get_descripcion( ) } |
*       && |(Precio: { lo_negocio->calcular_precio( ) } €)| ).
*
*   ENDLOOP.
*
*-----------------------------------------------------------------------
* DIFERENCIA ENTRE AMBAS VERSIONES
*-----------------------------------------------------------------------
*
* Versión actual:
*   - Objetos con valores fijos.
*   - No necesita constructor.
*   - Más sencilla.
*
* Versión con constructor:
*   - Los datos se reciben al crear el objeto.
*   - Permite crear infinitas bodegas, marisquerías o hipódromos
*     distintos reutilizando la misma clase.
*   - Es la solución más flexible y escalable.
*-----------------------------------------------------------------------
