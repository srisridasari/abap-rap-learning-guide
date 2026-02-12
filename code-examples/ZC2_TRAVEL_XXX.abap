@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel Consumption View'
@Metadata.allowExtensions: true
define root view entity ZC_TRAVEL_XXX provider contract transactional_query as projection on ZI_TRAVEL_XXX
with fields
    travel_id as TravelID,
    agency_id as AgencyID,
    customer_id as CustomerID,
    begin_date as BeginDate,
    end_date as EndDate,
    booking_fee as BookingFee,
    total_price as TotalPrice,
    currency_code as CurrencyCode,
    description as Description,
    overall_status as Status,
    created_by as CreatedBy,
    created_at as CreatedAt,
    last_changed_by as LastChangedBy,
    last_changed_at as LastChangedAt;
