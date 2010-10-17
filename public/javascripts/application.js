$(function() {
  $(".scrollable").scrollable();
  $('.daily-view').scrollable({
	items: '.days',
	prev: "#prev-day",
	next: "#next-day",
	});
  $('#new_trip').easyAccordion({slideNum:false});

  $('#new_trip a.next').click(function() {
    $(this).parent().next('dt').activateSlide();
    return false;
  });

  $('#new_trip a.prev').click(function() {
    $(this).parent().prevAll('dt').eq(1).click();
    return false;
  });
  
  $("#trip_destination","#new_trip").placeholder();
  $("#trip_accomodation_name","#new_trip").placeholder();
  $("#trip_start_date","#new_trip").placeholder();
  $("#trip_end_date","#new_trip").placeholder();

  $('#share_it').live('click', function() {
    $('#content').flip({
      onBefore: function() {
        $('#content').load($('#share_it a').attr('href') + ' #content>*');
      },
      direction: 'rl',
      color: '#fff'
    });

    return false;
  });
    
    $("#trip_start_date","#new_trip").datepicker({
													dateFormat: 'yy-mm-dd',
													minDate: -14,
												});
    $("#trip_end_date","#new_trip").datepicker({
													dateFormat: 'yy-mm-dd',
													minDate: -14,
												});
	$("#trip_start_date","#new_trip").change(function(){
		date = new Date($("#trip_start_date","#new_trip").val());
		date.setDate(date.getDate()+2);
		$("#trip_end_date","#new_trip").datepicker( "option", "minDate", date );
	});
	

												
												
				
});

function success(msg) {
  $('#flash').addClass('notice').html(msg).show();

  $('#flash').delay(2000).fadeOut().removeClass('notice');
}

function reset_form(selector) {
  $(selector).find('input:text, textarea').val('');
}
