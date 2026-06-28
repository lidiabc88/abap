CLASS LHC_ZR_RECETAS_LBC DEFINITION INHERITING FROM CL_ABAP_BEHAVIOR_HANDLER.
  PRIVATE SECTION.
    METHODS:
      GET_GLOBAL_AUTHORIZATIONS FOR GLOBAL AUTHORIZATION
        IMPORTING
           REQUEST requested_authorizations FOR ZrRecetasLbc
        RESULT result,

      setPublicada FOR DETERMINE ON MODIFY
        IMPORTING keys FOR ZrRecetasLbc~setPublicada,

      validateTiempo FOR VALIDATE ON SAVE
        IMPORTING keys FOR ZrRecetasLbc~validateTiempo.
ENDCLASS.

CLASS LHC_ZR_RECETAS_LBC IMPLEMENTATION.

  METHOD GET_GLOBAL_AUTHORIZATIONS.
  ENDMETHOD.

  METHOD setPublicada.

    MODIFY ENTITIES OF zr_recetas_lbc IN LOCAL MODE
      ENTITY ZrRecetasLbc
        UPDATE FIELDS ( Publicada )
        WITH VALUE #( FOR key IN keys ( %tky      = key-%tky
                                         Publicada = abap_true ) )
      REPORTED DATA(reported_det).

    reported-zrrecetaslbc = CORRESPONDING #( DEEP reported_det-zrrecetaslbc ).

  ENDMETHOD.

  METHOD validateTiempo.

    READ ENTITIES OF zr_recetas_lbc IN LOCAL MODE
      ENTITY ZrRecetasLbc
        FIELDS ( TiempoPrep )
        WITH CORRESPONDING #( keys )
      RESULT DATA(recetas).

    LOOP AT recetas INTO DATA(receta).

      IF receta-TiempoPrep < 1 OR receta-TiempoPrep > 600.

        APPEND VALUE #( %tky = receta-%tky )
          TO failed-zrrecetaslbc.

        APPEND VALUE #( %tky          = receta-%tky
                         %state_area   = 'VALIDATE_TIEMPO'
                         %msg          = new_message(
                                            id       = 'Z_RECETAS_MSG'
                                            number   = '001'
                                            severity = if_abap_behv_message=>severity-error
                                            v1       = |{ receta-TiempoPrep }| )
                         %element-TiempoPrep = if_abap_behv=>mk-on )
          TO reported-zrrecetaslbc.

      ENDIF.

    ENDLOOP.

  ENDMETHOD.

ENDCLASS.
