$(function() {
  $(".scrollable").scrollable();

  $('#new_trip').easyAccordion();

  $('#new_trip a.next').click(function() {
    $(this).parent().next('dt').activateSlide();
    return false;
  });

  $('#new_trip a.prev').click(function() {
    $(this).parent().prevAll('dt').eq(1).click();
    return false;
  });

});
