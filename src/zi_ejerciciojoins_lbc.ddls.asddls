@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ejercicio joins'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_EJERCICIOJOINS_LBC
as select from /dmo/travel as viaje
    inner join /dmo/booking as reserva
      on reserva.travel_id = viaje.travel_id
{
  key viaje.travel_id    as TravelID,
  key reserva.booking_id as BookingID,

      reserva.flight_date as FlightDate,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      reserva.flight_price as FlightPrice,

      viaje.agency_id as AgencyID,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      viaje.booking_fee as BookingFee,

      reserva.currency_code as CurrencyCode

}
