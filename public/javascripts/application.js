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

  $('#share_it').click(function() {
    $('#content').flip({
      direction: 'rl'
    });
  });
});

function success(msg,type) {
  $('#flash').addClass(type).html(msg).show();

  $('#flash').delay(2000).fadeOut().removeClass(type);
}

function reset_form(selector) {
  $(selector).find('input:text, textarea').val('');
}
