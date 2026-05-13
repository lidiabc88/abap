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

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "Estructura simple

  data lv_var type string VALUE '+340000 '.

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


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" también lo podemos simplificar en:
" forma 2:
" data (ls_empleado2) = value ty_empleado ( nombre= 'daniel' edad = 32 telefono = = '+34000000').
" forma 3 mezclada:
" ls_empleado = value # ( nombre= 'sara' edad = 32 telefono = = '+34000000').


" esta estructura se crea de golpe en la linea ? y en esa misma linea con el value ty_persoana ( que se creo en la linea 22 ) se le asigna el tipo y luego le damos valores
data(ls_persona2) = value ty_persona(
nombre = 'daniel'
edad = 32
email = 'daniel @.com'
telefono = '6000000' ).

" esta estructura se ha declarado/creado en la linea ? al igual que se le ha asignado su tipo , por eso no ponemos el data y ponemos #  y luego le damos valores
ls_persona = value #(
nombre = 'Fernado'
edad = 32
email = 'daniel @.com'
telefono = '6000000' ).

""""""""""""""""""""""""""""""""""""""""""""""""""""""
"EJERCICIO 1: stock muebles

  TYPES : BEGIN OF ty_muebles,
          Sofas   type i,
          Mesas   type i,
          Sillas type i,
          Camas type i,
          END OF ty_muebles.

data: ls_muebles TYPE ty_muebles.

    ls_muebles-Sofas = 10.
    ls_muebles-Mesas = 20.
    ls_muebles-Sillas = 30.
    ls_muebles-Camas = 40.

    out->write( ls_muebles ).


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Estructura anidada

*data: BEGIN OF ls_empleado,
*      nombre TYPE string value 'laura'.
*      id type i value 5 ,
*      email type /dmo/email_address value 'kdsjfhlsfu'.
*
*      END OF ls_empleado
*
*      out->write( ls_empleado )



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"EJERCICIO CREAR UN DOMINIO Y DATA ELEMENT PARA:
"botón derecho, crear dominio, nombre: ZDO_nombreId_iniciales , datos: int8 19, activar.
"Luego creas el Data element igual (en other element), nombre:ZDE_ID_iniciales
"en type pones despues ZDE_taltal y se pone

  TYPES : BEGIN OF ty_empleado,
          nombre   type ZDE_NOMBRE_LBC , "se quedaría así como ejemplo en lugar de lo que pone abajo
          edad     type i,
          telefono type string,
          email    TYPE string,

        END of TY_empleado.



  ENDMETHOD.
ENDCLASS.
