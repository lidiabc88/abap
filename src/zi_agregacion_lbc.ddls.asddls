@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'funciones de agregacion'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_AGREGACION_LBC as select from /dmo/travel
{
    key travel_id as TravelID, 
        agency_id as AgencyID, 
        
      @Semantics.amount.currencyCode: 'Moneda'
      min( total_price ) as MinTotalPrecio, 
       @Semantics.amount.currencyCode: 'Moneda'
      max( total_price ) as MaxTotalPrecio, 
          @Semantics.amount.currencyCode: 'Moneda'
      sum(total_price ) as sumtotalPrice,
      
      count(distinct total_price ) as CountDistTotalPrice,
      
      count( * ) as CountTotalPrice, 
      
      
      currency_code as Moneda
}
group by 

travel_id ,
agency_id ,
currency_code;
