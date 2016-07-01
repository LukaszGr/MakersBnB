'use strict';

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

$("#date_rental").change(function(){
  $("#datepicker").datepicker('setDate', $(this).val());
});
