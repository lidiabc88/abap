CLASS zcl_deberes_lbc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_deberes_lbc IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    TYPES: BEGIN OF ty_persona,

             nombre   TYPE string,
             edad     TYPE i,
             telefono TYPE string,
             correo   TYPE string,

           END OF ty_persona.

    DATA ls_persona TYPE ty_persona.

    DATA lt_persona TYPE TABLE OF ty_persona.

    lt_persona = VALUE #(

      ( nombre   = 'Pepa'
        edad     = 32
        telefono = '+34000000'
        correo   = 'pepa@gmail.com' )

      ( nombre   = 'Antonio'
        edad     = 22
        telefono = '+34000001'
        correo   = 'antonio@gmail.com' )

      ( nombre   = 'Lola'
        edad     = 28
        telefono = '+34000002'
        correo   = 'lola@gmail.com' )

    ).

  ENDMETHOD.

ENDCLASS.

