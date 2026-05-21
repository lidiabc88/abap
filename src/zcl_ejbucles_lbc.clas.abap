CLASS zcl_ejbucles_lbc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_ejbucles_lbc IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " EJERCICIO: implementar un método de una clase ABAP Cloud llamado calcular_coste_envio.
            "  El método recibe los datos de un pedido y devuelve el coste final más un código de estado.

"Parámetros de entrada (IMPORTING):
"                                   lv_peso — peso en kg, tipo decimal (por ejemplo p LENGTH 8 DECIMALS 2)
"                                   lv_zona — zona de destino, tipo char1 (valores esperados: 'A', 'B', 'C')
"                                   lv_tipo_cliente — tipo char10 ('PREMIUM' o 'NORMAL')
"                                   lv_urgente — tipo abap_bool
"                                   lv_peligroso — tipo abap_bool

"Parámetros de salida (EXPORTING / RETURNING):
"                                   lv_coste — coste final, decimal con 2 decimales
"                                   el_codigo — tipo char20 (código de resultado: 'OK', un código de error, o un aviso)



                       """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                       " IMPORTANTE: léelas enteras antes de empezar
                       """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 1. Validaciones de entrada

"       Si lv_peso es 0 o negativo → ev_codigo = 'PESO_INVALIDO', lv_coste = 0 y termina.
"       Si lv_zona no es 'A', 'B' ni 'C' → lv_codigo = 'ZONA_INVALIDA', lv_coste = 0 y termina.


" 2. Tarifa base según el peso (¡cuidado con los límites!)

"       Hasta 5 kg incluidos → 5 €
"       Más de 5 y hasta 20 incluidos → 12 €
"       Más de 20 y hasta 50 incluidos → 25 €
"       Más de 50 kg → 25 € + 1 € por cada kg (o fracción) que supere los 50


" 3. Recargo por zona:  Zona 'A' → +0 € · Zona 'B' → +8 € · Zona 'C' → +15 €


" 4. Urgencia
"       Si lv_urgente = abap_true y la zona es 'A' o 'B' → el coste acumulado hasta aquí se multiplica por 1,5.
"       Si lv_urgente = abap_true y la zona es 'C' → la urgencia no está disponible: en lugar de multiplicar,
"       se suma un recargo fijo de +30 € y ev_codigo debe quedar como 'URGENCIA_LIMITADA'.


" 5. Descuento de cliente PREMIUM
"       Si lv_tipo_cliente = 'PREMIUM' → descuento del 20 % sobre el coste acumulado.
"       Pero este descuento NO se aplica si:
"               el envío es peligroso (lv_peligroso = abap_true), o
"               el coste acumulado antes del descuento supera los 200 €.


" 6. Producto peligroso
"       Si lv_peligroso = abap_true → recargo del 40 % sobre el coste acumulado.
"       Si lv_peligroso = abap_true y la zona es 'C' → envío prohibido: lv_codigo = 'PELIGROSO_ZONA_C', lv_coste = 0.

" 7. Coste mínimo
"       El coste final nunca puede ser inferior a 10 € (salvo los casos de error, que son 0).

" 8. Redondeo final a 2 decimales.


"Las trampas (que es lo divertido)
*Sin dártelas resueltas, aquí están los puntos donde casi todo el mundo falla:
*
*Los límites de los tramos. Un paquete de exactamente 5 kg ¿va a 5 € o a 12 €?
*Si escribes lv_peso < 5 en lugar de <= 5, ya tienes un bug. Lo mismo en 20 y 50.
*La regla 6 está mal colocada a propósito. La prohibición PELIGROSO_ZONA_C aparece en el punto 6,
*pero si la programas ahí habrás calculado tarifa, recargos, urgencia y descuento para nada.
* ¿Dónde debería ir realmente esa comprobación? (Pista: junto a las validaciones del punto 1.)
*El descuento PREMIUM tiene doble excepción y una de ellas (> 200 €) depende de un valor que aún no es el final.
* Tienes que decidir bien en qué momento "congelas" ese importe.
*Urgencia en zona C no es un multiplicador, es un recargo fijo y además cambia el código de salida.
*El coste mínimo de 10 € se aplica al final de todo. Un envío barato (base 5, zona A) acaba costando 10, no 5.
*Restricción del ejercicio
*Solo puedes usar IF / ELSEIF / ELSE. Nada de CASE, nada de LOOP, nada de tablas internas.
*El reto es estructurar bien los condicionales anidados y secuenciales sin perderte.
*
*Pistas de ABAP Cloud (porque no es ABAP clásico)
*Compara los booleanos de forma explícita: IF lv_urgente = abap_true. — no uses el atajo IF lv_urgente.
*aunque funcione; en ABAP Cloud se valora el código claro y limpio.
*Declara variables con declaración inline donde puedas: DATA(lv_coste) = ....
*Para "1 € por cada kg o fracción que supere los 50" te vendrá bien la función ceil( ).
*En ABAP clásico verías a menudo MOVE o variables globales; aquí trabajas dentro de un método de una clase,
*todo con variables locales y parámetros tipados. Es el mismo IF, pero el contexto es estricto: sin sentencias obsoletas.

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 "-------------------------------------------------------------
    " DECLARACIÓN DE VARIABLES
    "-------------------------------------------------------------
    " p = número decimal
    " LENGTH = longitud total
    " DECIMALS = cantidad de decimales
    "-------------------------------------------------------------

    DATA lv_peso         TYPE p LENGTH 8 DECIMALS 2 VALUE 55.
    DATA lv_peso_extra   TYPE p LENGTH 8 DECIMALS 2 VALUE 0.

    DATA lv_zona         TYPE c LENGTH 1 VALUE 'B'.

    DATA lv_tipo_cliente TYPE c LENGTH 10 VALUE 'PREMIUM'.

    DATA lv_urgente      TYPE abap_boolean VALUE abap_true.
    DATA lv_peligroso    TYPE abap_boolean VALUE abap_false.

    DATA lv_coste        TYPE p LENGTH 8 DECIMALS 2 VALUE 0.

    DATA lv_codigo       TYPE c LENGTH 20 VALUE 'OK'.



    "-------------------------------------------------------------
    " VALIDACIONES INICIALES
    "-------------------------------------------------------------
    " Estas comprobaciones deben ir al principio para evitar
    " cálculos innecesarios.
    "-------------------------------------------------------------

    " Peso inválido
    IF lv_peso <= 0.

      lv_codigo = 'PESO_INVALIDO'.
      lv_coste = 0.


    " Zona inválida
    ELSEIF lv_zona <> 'A'
       AND lv_zona <> 'B'
       AND lv_zona <> 'C'.

      lv_codigo = 'ZONA_INVALIDA'.
      lv_coste = 0.


    " Producto peligroso prohibido en zona C

    ELSEIF lv_peligroso = abap_true
       AND lv_zona = 'C'.

      lv_codigo = 'PELIGROSO_ZONA_C'.
      lv_coste = 0.


    ELSE.

      "-----------------------------------------------------------
      " TARIFA BASE SEGÚN EL PESO
      "-----------------------------------------------------------
      " IMPORTANTE:
      " usar <= porque los límites son INCLUIDOS
      "-----------------------------------------------------------

      IF lv_peso <= 5.

        lv_coste = 5.

      ELSEIF lv_peso <= 20.

        lv_coste = 12.

      ELSEIF lv_peso <= 50.

        lv_coste = 25.

      ELSE.

        "---------------------------------------------------------
        " Más de 50 kg:
        " 25 € + 1 € por cada kg o fracción
        "
        " ceil( ) redondea hacia arriba
        " Ejemplo:
        " 55.20 - 50 = 5.20
        " ceil( 5.20 ) = 6
        "---------------------------------------------------------

        lv_peso_extra = ceil( lv_peso - 50 ).

        lv_coste = 25 + lv_peso_extra.

      ENDIF.



      "-----------------------------------------------------------
      " RECARGO POR ZONA
      "-----------------------------------------------------------

      IF lv_zona = 'B'.

        lv_coste = lv_coste + 8.

      ELSEIF lv_zona = 'C'.

        lv_coste = lv_coste + 15.

      ENDIF.



      "-----------------------------------------------------------
      " URGENCIA
      "-----------------------------------------------------------
      " Zona A/B -> multiplicador x1.5
      " Zona C   -> +30 y código especial
      "-----------------------------------------------------------

      IF lv_urgente = abap_true
         AND ( lv_zona = 'A'
            OR lv_zona = 'B' ).

        lv_coste = lv_coste * '1.5'.


      ELSEIF lv_urgente = abap_true
         AND lv_zona = 'C'.

        lv_coste = lv_coste + 30.

        lv_codigo = 'URGENCIA_LIMITADA'.

      ENDIF.



      "-----------------------------------------------------------
      " PRODUCTO PELIGROSO
      "-----------------------------------------------------------
      " Recargo del 40 %
      "-----------------------------------------------------------

      IF lv_peligroso = abap_true.

        lv_coste = lv_coste * '1.4'.

      ENDIF.



      "-----------------------------------------------------------
      " DESCUENTO PREMIUM
      "-----------------------------------------------------------
      " Se aplica SOLO SI:
      "
      " - es PREMIUM
      " - NO es peligroso
      " - el coste acumulado NO supera 200
      "
      " OJO:
      " el coste acumulado es el importe ANTES del descuento
      "-----------------------------------------------------------

      IF lv_tipo_cliente = 'PREMIUM'
         AND lv_peligroso = abap_false
         AND lv_coste <= 200.

        lv_coste = lv_coste * '0.8'.

      ENDIF.



      "-----------------------------------------------------------
      " COSTE MÍNIMO
      "-----------------------------------------------------------
      " Nunca puede ser inferior a 10 €
      "-----------------------------------------------------------

      IF lv_coste < 10.

        lv_coste = 10.

      ENDIF.



      "-----------------------------------------------------------
      " REDONDEO FINAL
      "-----------------------------------------------------------

      lv_coste = round(
          val = lv_coste
          dec = 2 ).

    ENDIF.



    "-------------------------------------------------------------
    " SALIDA
    "-------------------------------------------------------------

    out->write( |Estado del envío: { lv_codigo }| ).

    out->write( |Coste total: { lv_coste } €| ).

  ENDMETHOD.

ENDCLASS.
