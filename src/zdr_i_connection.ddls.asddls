@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CONNECTION VIEW CDS DATA MODEL'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZDR_I_CONNECTION as select from /DMO/CONNECTION AS CONNECTION
association [1..*] to ZDR_I_FLIGHT  as _flight  on  $projection.CarrierId    = _flight.CarrierId
                                                    and $projection.ConnectionId = _flight.ConnectionId
  association [1]    to ZDR_I_CARRIER as _Airline on  $projection.CarrierId = _Airline.CarrierId
{
      @UI.facet: [{id : 'Connection',
                   purpose : #STANDARD,
                   type : #IDENTIFICATION_REFERENCE,
                   position : 10,
                   label : 'Connection Detail'},
                   {id : 'Flight',
                   purpose : #STANDARD,
                   type : #LINEITEM_REFERENCE,
                   position : 20,
                   label : 'Flights',
                   targetElement: '_flight'
                   }]
      @UI.lineItem: [{ position : 10, label : 'Airline' }]
      @UI.identification: [{ position : 10 , label : 'Airline'}]
      @ObjectModel.text.association: '_Airline'
      @Search.defaultSearchElement: true
  key carrier_id      as CarrierId,
      @UI.lineItem: [{ position : 20 }]
      @UI.identification: [{ position : 20 }]
      @Search.defaultSearchElement: true
  key connection_id   as ConnectionId,
      @UI.selectionField: [{ position : 10  }]
      @UI.lineItem: [{ position : 30 ,label : 'Depature Airport Id'}]
      @UI.identification: [{ position : 30,label : 'Depature Airport Id' }]
      @Search.defaultSearchElement: true
      @Consumption.valueHelpDefinition: [{ entity : {
                                        name : 'ZDR_I_AIRPORT_VH',
                                        element : 'AirportId'
                                        } }]
      airport_from_id as AirportFromId,
      @UI.lineItem: [{ position : 40 }]
      @UI.selectionField: [{ position : 10  }]
      @UI.identification: [{ position : 40 }]
      @Search.defaultSearchElement: true
      @Consumption.valueHelpDefinition: [{ entity : {
                                        name : 'ZDR_I_AIRPORT_VH',
                                        element : 'AirportId'
                                        } }]
      @EndUserText.label: 'Destination Airport Id'
      airport_to_id   as AirportToId,
      @UI.lineItem: [{ position : 50, label : 'Departure Time' }]
      @UI.identification: [{ position : 50 }]
      departure_time  as DepartureTime,
      @UI.lineItem: [{ position : 60 , label : 'Arrival Time' }]
      @UI.identification: [{ position : 60 }]
      arrival_time    as ArrivalTime,
      @Semantics.quantity.unitOfMeasure: 'Distanceunit'
      @UI.identification: [{ position : 70 }]
      distance        as Distance,
      distance_unit   as DistanceUnit,
      // Association......
      @Search.defaultSearchElement: true
      _flight,
      @Search.defaultSearchElement: true
      _Airline
}
