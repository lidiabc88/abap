@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'cds 2'
@Metadata.ignorePropagatedAnnotations: true
define view entity Zcds_2_LBC as select from /dmo/customer
{
    key customer_id as CustomerID,
    
    case country_code 
    when 'US' then concat( 'United States - ', concat_with_space( last_name, first_name, 5 ))
    when 'DE' then 'Germany'
    when 'ES' then 'Spain'
    else 'código del pais distinto'
    end as Case1,
    
    $session.client as Cliente,                  // el mandante
    $session.system_date as ClientField,        // fecha actual del servidor SAP
    $session.system_language as systemidioma,   //idioma del sistema
    $session.user as UserField,                 //ID del usuario logeado
    $session.user_date as UserDate,             // fecha local del usuario
    $session.user_timezone as userTz            // zona horaria
    
}
