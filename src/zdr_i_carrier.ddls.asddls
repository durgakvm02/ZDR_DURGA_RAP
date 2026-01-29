@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CARRIER DETAILS'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZDR_I_CARRIER as select from /dmo/carrier
{
    key carrier_id    as CarrierId,
      @Semantics.text: true
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      name          as Name,
      currency_code as CurrencyCode
}
