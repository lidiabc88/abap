CLASS zcl_fabrica_lbc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

 DATA lv_nuevo_nombre type string value 'dani'.

    METHODS:
        r_masivos RETURNING VALUE(rv_accion) TYPE string,

      r_individual RETURNING VALUE(rv_accion) TYPE string,

      e_random RETURNING VALUE(rv_accion) TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_fabrica_lbc IMPLEMENTATION.


  METHOD r_masivos.

 TYPES: BEGIN OF ty_alumno,
                     id_alumno     TYPE i,
                     nombre TYPE string,
                   END OF ty_alumno.


            DATA lt_alumnos TYPE TABLE OF ty_alumno WITH EMPTY KEY.
            DATA lv_id      TYPE i.
*
*            " Lista con los 18 alumnos de clase
            DATA(lt_nombres) = VALUE string_table(
              ( |Alba Gómez, Sergio| )
              ( |Anangono Tutasig, Karen Denisse| )
              ( |Ayala Doñas, Alejandro| )
              ( |Barnes Calancha, Lidia| )
              ( |Bureo Osuna, Jesús| )
              ( |Criado Romero, Samuel| )
              ( |Delgado Martín, Sarah| )
              ( |González de la Torre, José Antonio| )
              ( |Maldonado Hernández, Luis| )
              ( |Moreno Cabrera, María Dolores| )
              ( |Palacios Canales, Rebeca| )
              ( |Portillo Moral, Gonzalo| )
              ( |Prados Donaire, Miguel| )
              ( |Rojas Moreno, Antonio| )
              ( |Ruiz Rodríguez, Antonia| )
              ( |Sillero Fernández, David| )
              ( |Torres Albillo, Adrián| )
              ( |Vela Martínez, Rafael| ) ).


                    LOOP AT lt_nombres INTO DATA(lv_nombre).
                      " nº de registros actuales en la BD
                      SELECT COUNT(*) FROM zdb_alumnos_lbc INTO @DATA(lv_count).
                      " id del nuevo registro = nº de registros + 1
                      lv_id = lv_count + 1.
                      " insertar
                      INSERT zdb_alumnos_lbc FROM @( VALUE #( id_alumno     = lv_id
                                                          nombre = lv_nombre ) ).                                                                               " sentencia SQL ( esto es obligatorio en la sintaxi moderna )
                    ENDLOOP.

                    SELECT id_alumno, nombre FROM zdb_alumnos_lbc ORDER BY id_alumno INTO TABLE @DATA(lt_bd).

                 "  rv_accion = 'se ha cargado con exito le bd '.

  ENDMETHOD.




  METHOD r_individual.


        Data lv_chek type i value 0.
        DATA lv_id      TYPE i.
        " lv_nombre es el nombre que vas a insertar

        SELECT FROM zdb_alumnos_lbc
        FIELDS *
        INTO TABLE @DATA(lv_existe).

       loop at lv_existe into data(ls_nueva).

        if ls_nueva-nombre = lv_nuevo_nombre.
             lv_chek = 1.

        endif.


       ENDLOOP.


          if lv_chek = 0.

          SELECT COUNT(*) FROM zdb_alumnos_lbc INTO @DATA(lv_count2).
              lv_id = lv_count2 + 1.
              INSERT zdb_alumnos_lbc FROM @( VALUE #( id_alumno     = lv_id
                                                  nombre = lv_nuevo_nombre ) ).
          endif.

  ENDMETHOD.




  METHOD e_random.

  DATA lv_total TYPE i.
    SELECT COUNT(*) FROM zdb_alumnos_lbc INTO @lv_total.

        " Generador de enteros aleatorios entre 1 y lv_total (forma cloud-ready)
        DATA(lv_random) = cl_abap_random_int=>create(
         seed = cl_abap_random=>seed( )
          min  = 1
          max  = lv_total ).

        DATA(lv_rand_id) = lv_random->get_next( ).

        SELECT SINGLE * FROM zdb_alumnos_lbc
          WHERE id_alumno = @lv_rand_id
          INTO @DATA(ls_alumno).



       rv_accion = | El numero aleatorio es: { lv_rand_id } el alumno ganador es: { ls_alumno-nombre }    | .

  ENDMETHOD.


ENDCLASS.
