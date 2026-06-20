@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ejercicio conexiones'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_CONNECTION_lbc
as select from /dmo/connection as Connection

association [1..1] to /dmo/carrier as _Carrier on _Carrier.carrier_id = $projection.CarrierId  // Cada conexión pertenece exactamente a una compañía aérea.
association [1..1] to /dmo/airport as _DepartureAirport on _DepartureAirport.airport_id = $projection.AirportFromId   // Cada conexión sale de un aeropuerto.
association [0..*] to /dmo/flight as _Flights on  _Flights.carrier_id    = $projection.CarrierId and _Flights.connection_id = $projection.ConnectionId
// Una conexión puede tener desde cero, 1 o muchos vuelos programados. La relación necesita dos campos: carrier_id + connection_id.

{
  key Connection.carrier_id      as CarrierId,
  key Connection.connection_id   as ConnectionId,
      Connection.airport_from_id as AirportFromId,
      Connection.airport_to_id   as AirportToId,
      Connection.departure_time  as DepartureTime,
      @Semantics.quantity.unitOfMeasure: 'DistanceUnit'
      Connection.distance        as Distance,
      Connection.distance_unit   as DistanceUnit,
      _Carrier,             // Exponemos las asociaciones para poder navegar a los datos relacionados.
      _DepartureAirport,
      _Flights
}
