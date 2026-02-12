managed implementation in class zbp_i_travel_xxx unique;
strict ( 2 );

define behavior for ZI_TRAVEL_XXX alias Travel
persistent table ztravel_xxx
lock master
authorization master ( instance )
etag master local_last_changed_at
{
  create;
  update;
  delete;

  field ( readonly )
    travel_id,
    created_by,
    created_at,
    last_changed_by,
    last_changed_at,
    local_last_changed_at;

  field ( mandatory )
    agency_id,
    customer_id,
    begin_date,
    end_date;

  determination calculateTotalPrice on modify { field booking_fee; }
  validation validateDates on save { field begin_date, end_date; }

  mapping for ztravel_xxx
  {
    travel_id = travel_id;
    agency_id = agency_id;
    customer_id = customer_id;
    begin_date = begin_date;
    end_date = end_date;
    booking_fee = booking_fee;
    total_price = total_price;
    currency_code = currency_code;
    description = description;
    overall_status = overall_status;
    created_by = created_by;
    created_at = created_at;
    last_changed_by = last_changed_by;
    last_changed_at = last_changed_at;
    local_last_changed_at = local_last_changed_at;
  }
}
