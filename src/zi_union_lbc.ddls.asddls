@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'cds union'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_union_LBC as select from /dmo/travel
{
    key travel_id as TravelID,
    
    cast( '' as abap.numc(4)) as BookingID
}
    union select from /dmo/booking
    
 {
    key travel_id as TravelID,
    
    booking_id as BookingID
  }
