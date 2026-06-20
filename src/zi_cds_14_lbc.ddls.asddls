@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'asociacion'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_CDS_14_LBC 
as select from /dmo/travel as Travel

//cada viaje tiene exactamnt un cliente, minimo 1 (siempre hay cliente, no puede faltar) y max 1 (no puede haber dos)
// es una relacion OBLIGATORIA Y UNICA
association[1..1] to /dmo/customer as _Customer on _Customer.customer_id = $projection.CustomerId

// = anterior, cada viaje pertenece a exactamente una agencia (solo una)
association[1..1] to /dmo/agency as _Agency on _Agency.agency_id = $projection.AgencyId

//cada viaje puede tener desde 0 hasta muchas reservas. el 0 significa que podría no haber una reserva aun
//que puede acumular tantas como haga falta
association[0..*] to /dmo/booking as _Booking on _Booking.travel_id = $projection.TravelId

//un viaje (travel) apunta a un cliente y una agencia -> son padres o datos maestros, por eso [1..1] el viaje no tiene sentido sin ellos
//la reserva (booking) son los hijos que cuelgan del viaje. un viaje agrupa varias reservas por eso 0..*
{

key Travel.travel_id    as TravelId,
    Travel.customer_id  as CustomerId,
    Travel.agency_id    as AgencyId,
    _Customer,
    _Agency,
    _Booking
    
}
