@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'cds 7'
@Metadata.ignorePropagatedAnnotations: true
define view entity Zcds_7_LBC as select from /dmo/flight
{
    key carrier_id as AerolineaID, 
    key connection_id as ConnectionID,
    key flight_date as FlightData,
    @Semantics.amount.currencyCode: 'moneda'
    @EndUserText.label: 'precio'
    price as Precio,
    currency_code as moneda,
    'USD' as manual, 
    '20300101' as fecha,
    cast('20022000' as abap.dats) as FechaC, //el ultimo as alias
    1.2 as flotante
    //fltp_to_des( 3.2 as abap.dec( 4,2 ) ) as Numerodecimal
    
   
}
// no se acaba con punto ni nada
// para comentar usamos //
