@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'joins'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_JOINS_LBC // join une dos tablas: travel y booking
as select from /dmo/travel as viaje
    inner join /dmo/booking as reserva on reserva.travel_id = viaje.travel_id // el final con el = significa (une los registros cuando tengan el mismo TravelID
    

{
    key viaje.travel_id as TravelID,    //coge los registros y los muestra en TravelID
    key reserva.booking_id as BookingID,
        viaje.agency_id as AgencyID,
        viaje.begin_date as BeginDate,
        viaje.end_date as EndDate,
        reserva.booking_date as BookingDate, 
        @Semantics.amount.currencyCode: 'CurrencyCode'
        viaje.total_price as TotalPrice,
        @Semantics.amount.currencyCode: 'CurrencyCode'
        reserva.flight_price as BookingPrice,
        reserva.currency_code as CurrencyCode
}
