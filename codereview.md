
#Feature to bring back dates that a property is available. Takes into account already booked dates.

#/views/bookings/new.erb

```
<script type="text/javascript">

var unavailable_array = <%= Booking.confirmed_booking_dates(@space.id) %>

var date_from = new Date('<%= @space.date_from %>')
var date_to = new Date('<%= @space.date_to %>')

</script>
```
The form:
```
<div id="datepicker" required> </div>
<input class="btn btn-default" type="submit" id="booking" value="Make Booking">

```

--------------------



#/models/booking.rb

```
def self.confirmed_booking_dates (space_id)
    confirmed = Booking.all(:confirmed => 'confirmed')
    current_space = confirmed.all(:space_id => space_id)
    unavailable_dates = current_space.each {|item| item}.map {|key, value| key.date}
end
```

--------------------



#/public/js/bookingDatepicker.js

```
$(function() {
  $( "#datepicker" ).datepicker({
    dateFormat: 'yy/mm/dd',
    minDate: date_from,
    maxDate: date_to,
    inline: true,
    altField: "#date_rental",
    beforeShowDay: function(date){
        var string = jQuery.datepicker.formatDate('yy/mm/dd', date);
        return [ unavailable_array.indexOf(string) === -1 ]
    }
  });
});
```
--------------------
