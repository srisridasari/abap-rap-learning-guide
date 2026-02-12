@EndUserText.label : 'Travel Database Table'
@AbapCatalog.enhancement.category : #NOT_EXTENSIBLE
@AbapCatalog.tableCategory : #TRANSPARENT
@AbapCatalog.deliveryClass : #A
@AbapCatalog.dataMaintenance : #RESTRICTED
define table ztravel_xxx {
  key client            : abap.clnt not null;
  key travel_id         : abap.numc(8) not null;
  agency_id             : abap.numc(6);
  customer_id           : abap.numc(6);
  begin_date            : abap.dats;
  end_date              : abap.dats;
  @Semantics.amount.currencyCode : 'ztravel_xxx.currency_code'
  booking_fee           : abap.curr(16,2);
  @Semantics.amount.currencyCode : 'ztravel_xxx.currency_code'
  total_price           : abap.curr(16,2);
  currency_code         : abap.cuky;
  description           : abap.char(1024);
  overall_status        : abap.char(1);
  created_by            : syuname;
  created_at            : timestampl;
  last_changed_by       : syuname;
  last_changed_at       : timestampl;
  local_last_changed_at : timestampl;
}
