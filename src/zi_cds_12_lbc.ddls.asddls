@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'asociacion'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_CDS_12_LBC 
as select from /dmo/travel as Travel

association[1..1] to /dmo/customer as _Customer on _Customer.customer_id = $projection.CustomerID   //se puede sustituir $projec.... por Travel.customer_id


{
    key Travel.travel_id                                             as TravelID,
    Travel.customer_id                                               as CustomerID,
    concat_with_space( _Customer.first_name, _Customer.last_name, 2) as CustomerName
    
 
    
    
}
