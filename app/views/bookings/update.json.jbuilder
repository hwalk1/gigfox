json.booking json.partial!("pages/booking.html.erb", booking: @booking)
json.status @booking.status
