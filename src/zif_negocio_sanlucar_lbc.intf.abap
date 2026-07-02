INTERFACE zif_negocio_sanlucar_lbc
  PUBLIC.

  METHODS get_nombre
    RETURNING VALUE(r_nombre) TYPE string.

  METHODS get_tipo
    RETURNING VALUE(r_tipo) TYPE string.

  METHODS get_descripcion
    RETURNING VALUE(r_descripcion) TYPE string.

  METHODS calcular_precio
    RETURNING VALUE(r_precio) TYPE decfloat16.

ENDINTERFACE.
