CLASS zcl_estructura_lbc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_estructura_lbc IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  data lv_var type string VALUE '+34 '.

  TYPES : BEGIN OF ty_persona,
          nombre   type string,
          edad     type i,
          telefono type string,
          email    TYPE string,
        END of TY_persona.

  data ls_persona type ty_persona. " creacion de una estructura con su asignacion de tipo, no se le han asignado aun valores
  data ls_cliente  type ty_persona.
  data ls_empleado type ty_persona.

  out->write( ls_empleado ).

  ls_cliente-nombre = 'Daniel'.
  ls_cliente-edad = 33.
  ls_cliente-telefono = '+346660001211'.
  ls_cliente-email = 'daniel@blabla.com'.

  ls_empleado-nombre = 'Paco'.
  ls_empleado-edad = 50.

  out->write( ls_empleado ).
  out->write( ls_cliente ).
  out->write( ls_persona ).

" esta estructura se crea de golpe en la linea 48 y en esa misma linea con el value ty_persoana ( que se creo en la linea 22 ) se le asigna el tipo y luego le damos valores
data(ls_persona2) = value ty_persona(
nombre = 'daniel'
edad = 32
email = 'daniel @.com'
telefono = '6000000' ).

" esta estructura se ha declarado/creado en la linea 29 al igual que se le ha asignado su tipo , por eso no ponemos el data y ponemos #  y luego le damos valores
ls_persona = value #(
nombre = 'Fernado'
edad = 32
email = 'daniel @.com'
telefono = '6000000' ).
""""""""""""""""""""""""""""""""""""""""""""""""""""""




  ENDMETHOD.
ENDCLASS.
