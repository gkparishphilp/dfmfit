$( document ).ready(function() {
  var modal_triggered = false;
  return $( window ).scroll(function() {
    var height = $(window).scrollTop();
    if ((height > 500) && !( modal_triggered )) {
      modal_triggered = true;
      return $('#promo').modal();
    }
  });
}); //modal trigger
