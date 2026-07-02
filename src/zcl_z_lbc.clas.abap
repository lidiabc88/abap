CLASS zcl_z_lbc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_z_lbc IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
*
*  TYPES:BEGIN OF ty_producto,
*        nombre type string,
*        precio type i,
*        END OF ty_producto.
*
*    lt_productos = VALUE #(
*    ( nombre = 'pan'       precio = 1 )
*    ( nombre = 'leche'     precio = 2 )
*    ( nombre = 'cafe'      precio = 5 )
*    ( nombre = 'chocolate' precio = 3 )
*    ( nombre = 'arroz'     precio = 2 )
*    ).
*
*    DATA:
*     lt_productos TYPE TABLE OF ty_producto,
*     lt_resultado TYPE TABLE OF ty_producto,
*     ls_producto  TYPE ty_producto.
*
*      LOOP AT lt_producto into ls_producto.
*
*      if ls_producto-precio >= 2.
*      append ls_producto to lt_resultado.
*      endif.
*      endloop.

* /////////////////////////////////////

*TYPES: BEGIN OF ty_alumno,
*         nombre TYPE string,
*         nota   TYPE i,
*       END OF ty_alumno.
*
*DATA:
*  lt_alumno     TYPE TABLE OF ty_alumno,
*  lt_aprobados  TYPE TABLE OF ty_alumno,
*  ls_alumno     TYPE ty_alumno.
*
*ls_alumno-nombre = 'Ana'.
*ls_alumno-nota   = 4.
*APPEND ls_alumno TO lt_alumno.
*
*ls_alumno-nombre = 'Luis'.
*ls_alumno-nota   = 8.
*APPEND ls_alumno TO lt_alumno.
*
*ls_alumno-nombre = 'Marta'.
*ls_alumno-nota   = 5.
*APPEND ls_alumno TO lt_alumno.
*
*ls_alumno-nombre = 'Pedro'.
*ls_alumno-nota   = 3.
*APPEND ls_alumno TO lt_alumno.
*
*ls_alumno-nombre = 'Sofía'.
*ls_alumno-nota   = 9.
*APPEND ls_alumno TO lt_alumno.


*
*  TYPES: BEGIN OF ty_alumno,
*         nombre TYPE string,
*         nota   TYPE i,
*       END OF ty_alumno.
*
*DATA:
*  lt_alumno   TYPE TABLE OF ty_alumno,
*  ls_alumno   TYPE ty_alumno,
*  lv_resultado TYPE i.
*
*LOOP AT lt_alumno INTO ls_alumno.
*
*  IF ls_alumno-nota >= 5.
*    lv_resultado = lv_resultado + 1.
*  ENDIF.
*
*ENDLOOP.


* TYPES: BEGIN OF ty_libro,
*        titulo type string,
*        autor type string,
*        END OF ty_libro.
*
*   data: lt_libro type table of ty_libro,
*         ls_libro type ty_libro.
*
*         READ TABLE lt_libro INTO ls_libro
*         WITH KEY titulo = 'Clean Code'.
*         if sy-subrc = 0.
*
*        out->write( ls_libro-autor ).
*endif.

*
*  TYPES: BEGIN OF ty_alumno,
*         ID TYPE i,
*         nombre TYPE string,
*         nota   TYPE i,
*       END OF ty_alumno.
*
*
*DATA: lt_alumno type TABLE of ty_alumno,
*      ls_alumno type ty_alumno,
*      lv_resultado type i,
*      ls_alumno_loop TYPE ty_alumno.
*
*      lt_alumno = VALUE #(
*      ( ID = 1 nombre = 'Juan' nota = 5 )
*      ( ID = 2 nombre = 'Maria' nota = 9 )
*      ( ID = 3 nombre = 'Paco' nota = 3 )
*      ( ID = 4 nombre = 'Loli' nota = 7 )
*      ).
*
*      READ TABLE lt_alumno
*      into ls_alumno
*      WITH KEY ID = 3.
*
*      if sy-subrc = 0.
*       LOOP AT lt_alumno into ls_alumno_loop.
*       lv_resultado = lv_resultado + 1.
*        IF ls_alumno_loop-nota >= ls_alumno-nota.
*       out->write( lv_resultado ).
*endif.
*ENDLOOP.
*endif.

*
*    TYPES: BEGIN OF ty_cliente,
*             id      TYPE i,
*             nombre  TYPE string,
*             compras TYPE i,
*
*           END OF ty_cliente.
*
* data: lt_cliente type TABLE of ty_cliente,
*       ls_cliente type ty_cliente,
*       ls_gastadores type ty_cliente,
*       lv_contador type i.
*
*       lt_cliente = VALUE #(
*
*       ( ID = 1 NOMBRE = 'Laura' compras = 1200 )
*       ( ID = 2 NOMBRE = 'Carlos' compras = 800 )
*       ( ID = 3 NOMBRE = 'Elena' compras = 1500 )
*       ( ID = 4 NOMBRE = 'Migue' compras = 900 )
*        ).
*
*     read table lt_cliente
*     into ls_cliente
*     with key nombre = 'Carlos'.
*
*     if sy-subrc = 0.
*
*     loop at lt_cliente into ls_gastadores.
*     if ls_gastadores-compras >= ls_cliente-compras.
*
*     endif.
*     endloop.
*     endif.

*
*
*
*
*      TYPES: BEGIN OF ty_alumno,
*             id      TYPE i,
*             nombre  TYPE string,
*             nota TYPE i,
*
*           END OF ty_alumno.
*
* data: lt_alumno type table of ty_alumno,
*       ls_alumno type ty_alumno,
*       ls_actual type ty_alumno,
*       lv_contador type i.
*
*       lt_alumno = VALUE #(
*
*       ( ID = 1 NOMBRE = 'ana' nota = 6 )
*       ( ID = 2 NOMBRE = 'luis' nota = 9 )
*       ( ID = 3 NOMBRE = 'marta' nota = 4 )
*       ( ID = 4 NOMBRE = 'pedro' nota = 7 )
*       ( ID = 5 NOMBRE = 'sofia' nota = 8 )
*        ).
*
*     read table lt_alumno into ls_alumno
*     with key id = 2.
*
*     if sy-subrc = 0.
*
*     loop at lt_alumno into ls_actual.
*     if ls_actual-nota >= ls_alumno-nota.
*     lv_contador = lv_contador + 1.
*     endif.
*
*     ENDLOOP.
*     out->write( lv_contador ).
*
*     ENDIF.

*
*     select *
*     from zproductos
*     into table @DATA(lt_productos).
*
*     DATA lv_contador TYPE i VALUE 0.
*
*     LOOP AT lt_productos into data(ls_productos).
*
*     if ls_productos-precio >= 10.
*     lv_contador = lv_contador + 1.
*     ENDIF.
*     ENDLOOP.
*
*    out->write( lv_contador ).
























  ENDMETHOD.
ENDCLASS.
