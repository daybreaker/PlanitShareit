$(function() {
  $(".scrollable").scrollable();
  $('.daily-view').scrollable({
	items: '.days',
	prev: "#prev-day",
	next: "#next-day",
	});
  $('#new_trip').easyAccordion();

  $('#new_trip a.next').click(function() {
    $(this).parent().next('dt').activateSlide();
    return false;
  });

  $('#new_trip a.prev').click(function() {
    $(this).parent().prevAll('dt').eq(1).click();
    return false;
  });

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
  
  var cal_options = {
	dateFormat: 'yy-mm-dd',
  }
  
  $("#trip_start_date","#new_trip").datepicker(cal_options);
  $("#trip_end_date","#new_trip").datepicker(cal_options);
});

function success(msg) {
  $('#flash').addClass('notice').html(msg).show();

  $('#flash').delay(2000).fadeOut().removeClass('notice');
}

function reset_form(selector) {
  $(selector).find('input:text, textarea').val('');
}
