CLASS lhc_travel DEFINITION
  INHERITING FROM cl_abap_behavior_handler
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_travel.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS lhc_travel IMPLEMENTATION.

  METHOD if_travel~validateDates.
    DATA: lt_travels TYPE TABLE OF travel_entity,
          lt_failed_travel TYPE TABLE OF travel_entity,
          lt_reported_travel TYPE TABLE OF travel_entity,
          lv_end_date TYPE d,
          lv_begin_date TYPE d.

    READ ENTITIES lt_travels.
    LOOP AT lt_travels INTO DATA(ls_travel).
      lv_end_date = ls_travel-end_date.
      lv_begin_date = ls_travel-begin_date.

      IF lv_end_date < lv_begin_date.
        APPEND ls_travel TO lt_failed_travel.
        APPEND ls_travel TO lt_reported_travel.
        ls_travel-error_message = 'End date cannot be before begin date'.
      ENDIF.
    ENDLOOP.

    MODIFY ENTITIES lt_failed_travel.
    MODIFY ENTITIES lt_reported_travel.
  ENDMETHOD.

  METHOD if_travel~calculateTotalPrice.
    DATA: lv_booking_fee TYPE p DECIMALS 2,
          lv_total_price TYPE p DECIMALS 2.

    READ ENTITIES lt_travels.
    LOOP AT lt_travels INTO DATA(ls_travel).
      lv_booking_fee = ls_travel-booking_fee.
      lv_total_price = lv_total_price + lv_booking_fee.
      ls_travel-total_price = lv_total_price.
      MODIFY ENTITY ls_travel.
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
