'use strict';

$(function() {
  $( "#datepicker_from" ).datepicker({
    dateFormat: 'yy/mm/dd',
    inline: true,
    altField: "#date_from"
  });
  $( "#datepicker_to" ).datepicker({
    dateFormat: 'yy/mm/dd',
    inline: true,
    altField: "#date_to"
  });

});

$("#date_from").change(function(){
  $("#datepicker_from").datepicker('setDate', $(this).val());
});

$("#date_to").change(function(){
  $("#datepicker_to").datepicker('setDate', $(this).val());
});
