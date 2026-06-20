@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Path Expression'
@Metadata.ignorePropagatedAnnotations: true

define view entity ZI_FILTRO_LBC

as select from /dmo/travel

// Asociación con la vista estándar que contiene los textos de las monedas
association [0..*] to I_CurrencyText as _Currency on _Currency.Currency = $projection.Currency

{
    
    key travel_id as TravelID,                   // Identificador del viaje
    @Semantics.amount.currencyCode: 'Currency'  // Importe del viaje asociado a una moneda
    total_price as Price,
    currency_code as Currency,                 // Código de moneda (EUR, USD, GBP...)

    // Path Expression:
    // obtenemos directamente el nombre de la moneda desde la asociación
    _Currency.CurrencyName
}
