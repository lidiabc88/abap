@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Ejercicio Luis booking'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZCDS_NEWBOOKING_LBC as select from /dmo/booking
{

  key customer_id as CustomerID,
  key travel_id as TravelID,
  key booking_id as BookingID,
  booking_date as BookingDate,
  @Semantics.amount.currencyCode: 'Currency'
  flight_price as FlightPrice,
  currency_code as Currency,
  @Semantics.amount.currencyCode: 'Currency'
  cast(
        cast(flight_price as abap.dec(15,2)) *
        cast('1.1' as abap.dec(15,2))
        as abap.dec(15,2)
      )             as TotalPrice,
  
  case
    when flight_price < 500 then 'Economy' //Como cumple la primera condicion no hace falta hacer un between.
    when flight_price < 1500 then 'Bussiness'
    else 'FristClass'
  end               as categoria,
  
  case
    when booking_date  > '20260601' then 'Reciente'
    else 'Historica'
  end               as Antiguedad
  
    
}
